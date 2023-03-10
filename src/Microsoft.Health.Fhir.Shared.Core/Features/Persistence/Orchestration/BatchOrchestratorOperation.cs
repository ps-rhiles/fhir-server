﻿// -------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License (MIT). See LICENSE in the repo root for license information.
// -------------------------------------------------------------------------------------------------

using System;
using System.Collections.Concurrent;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using EnsureThat;

namespace Microsoft.Health.Fhir.Core.Features.Persistence.Orchestration
{
    public sealed class BatchOrchestratorOperation<T> : IBatchOrchestratorOperation<T>
        where T : class
    {
        private const int DelayTimeInMilliseconds = 10;

        /// <summary>
        /// List of resource to be sent to the data layer.
        /// </summary>
        private readonly ConcurrentBag<T> _resources;

        /// <summary>
        /// Data layer reference.
        /// </summary>
        private readonly object _dataLayer;

        /// <summary>
        /// Thread safe locking object reference.
        /// </summary>
        private readonly object _lock;

        /// <summary>
        /// Expected number of resources to be persisted.
        /// </summary>
        private int _currentExpectedNumberOfResources;

        /// <summary>
        /// Merge async task, only assigned and executed once.
        /// </summary>
        private Task _mergeAsyncTask;

        public BatchOrchestratorOperation(BatchOrchestratorOperationType type, string label, int expectedNumberOfResources, object dataLayer)
        {
            EnsureArg.IsNotNullOrWhiteSpace(label, nameof(label));
            EnsureArg.IsGt(expectedNumberOfResources, 0, nameof(expectedNumberOfResources));

            Id = Guid.NewGuid();
            Type = type;
            Label = label;
            CreationTime = DateTime.UtcNow;
            Status = BatchOrchestratorOperationStatus.Open;

            OriginalExpectedNumberOfResources = expectedNumberOfResources;
            _currentExpectedNumberOfResources = expectedNumberOfResources;

            _resources = new ConcurrentBag<T>();
            _dataLayer = dataLayer;

            _lock = new object();

            _mergeAsyncTask = null;
        }

        public Guid Id { get; private set; }

        public BatchOrchestratorOperationType Type { get; private set; }

        public string Label { get; private set; }

        /// <summary>
        /// Original expected number of resources when the job was created..
        /// </summary>
        public int OriginalExpectedNumberOfResources { get; private set; }

        /// <summary>
        /// Current expected number of resources. This number can be different thatn the original expected number of resources,
        /// if a conditional validation rejected a resource to be persisted.
        /// </summary>
        public int CurrentExpectedNumberOfResources => _currentExpectedNumberOfResources;

        public DateTime CreationTime { get; private set; }

        public BatchOrchestratorOperationStatus Status { get; private set; }

        public override string ToString()
        {
            return $"[ Job: {Id}, Label: {Label}, OriginalExpectedNumberOfResources: {OriginalExpectedNumberOfResources}, CreationTime: {CreationTime.ToString("o")}, Status: {Status} ]";
        }

        public async Task AppendResourceAsync(T resource, CancellationToken cancellationToken)
        {
            try
            {
                if (!_resources.Any())
                {
                    SetStatusSafe(BatchOrchestratorOperationStatus.WaitingForResources);
                }

                _resources.Add(resource);

                InitializeMergeTaskSafe(cancellationToken);
            }
            catch (Exception)
            {
                SetStatusSafe(BatchOrchestratorOperationStatus.Failed);

                // Add logging.
                throw;
            }

            await _mergeAsyncTask;
        }

        public async Task ReleaseResourceAsync(string reason, CancellationToken cancellationToken)
        {
            try
            {
                if (!_resources.Any())
                {
                    SetStatusSafe(BatchOrchestratorOperationStatus.WaitingForResources);
                }

                Interlocked.Decrement(ref _currentExpectedNumberOfResources);

                InitializeMergeTaskSafe(cancellationToken);
            }
            catch (Exception)
            {
                SetStatusSafe(BatchOrchestratorOperationStatus.Failed);

                // Add logging.
                throw;
            }

            await _mergeAsyncTask;
        }

        private void InitializeMergeTaskSafe(CancellationToken cancellationToken)
        {
            lock (_lock)
            {
                // '_mergeAsyncTask' should be initialize only once per Back Orchestrator Operation.
                if (_mergeAsyncTask == null)
                {
                    _mergeAsyncTask = MergeAsync(cancellationToken);
                }
            }
        }

        private async Task MergeAsync(CancellationToken cancellationToken)
        {
            try
            {
                do
                {
                    cancellationToken.ThrowIfCancellationRequested();

                    await Task.Delay(millisecondsDelay: DelayTimeInMilliseconds, cancellationToken);
                }
                while (_resources.Count != CurrentExpectedNumberOfResources);

                if (CurrentExpectedNumberOfResources == 0)
                {
                    SetStatusSafe(BatchOrchestratorOperationStatus.Canceled);
                }
                else
                {
                    SetStatusSafe(BatchOrchestratorOperationStatus.Processing);

                    cancellationToken.ThrowIfCancellationRequested();

                    SetStatusSafe(BatchOrchestratorOperationStatus.Completed);
                }

                await Task.CompletedTask; // To be removed.
            }
            catch (OperationCanceledException)
            {
                SetStatusSafe(BatchOrchestratorOperationStatus.Canceled);

                // Add logging.
                throw;
            }
            catch (Exception)
            {
                SetStatusSafe(BatchOrchestratorOperationStatus.Failed);

                // Add logging.
                throw;
            }
        }

        private void SetStatusSafe(BatchOrchestratorOperationStatus suggestedStatus)
        {
            lock (_lock)
            {
                if (suggestedStatus == Status)
                {
                    return;
                }
                else if (suggestedStatus == BatchOrchestratorOperationStatus.WaitingForResources && Status == BatchOrchestratorOperationStatus.Open)
                {
                    Status = BatchOrchestratorOperationStatus.WaitingForResources;
                }
                else if (suggestedStatus == BatchOrchestratorOperationStatus.Processing && Status == BatchOrchestratorOperationStatus.WaitingForResources)
                {
                    Status = BatchOrchestratorOperationStatus.Processing;
                }
                else if (suggestedStatus == BatchOrchestratorOperationStatus.Completed && Status == BatchOrchestratorOperationStatus.Processing)
                {
                    Status = BatchOrchestratorOperationStatus.Completed;
                }
                else if (suggestedStatus == BatchOrchestratorOperationStatus.Canceled || suggestedStatus == BatchOrchestratorOperationStatus.Failed)
                {
                    Status = suggestedStatus;
                }
                else
                {
                    throw new BatchOrchestratorException($"Invalid status change. Current status '{Status}'. Suggested status '{suggestedStatus}'.");
                }
            }
        }
    }
}
