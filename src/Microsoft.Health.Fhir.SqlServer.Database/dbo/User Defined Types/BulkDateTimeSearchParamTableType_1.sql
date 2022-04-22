﻿CREATE TYPE [dbo].[BulkDateTimeSearchParamTableType_1] AS TABLE (
    [Offset]           INT                NOT NULL,
    [SearchParamId]    SMALLINT           NOT NULL,
    [StartDateTime]    DATETIMEOFFSET (7) NOT NULL,
    [EndDateTime]      DATETIMEOFFSET (7) NOT NULL,
    [IsLongerThanADay] BIT                NOT NULL);

