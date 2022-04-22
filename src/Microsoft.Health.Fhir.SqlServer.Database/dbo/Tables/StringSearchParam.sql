﻿CREATE TABLE [dbo].[StringSearchParam] (
    [ResourceTypeId]      SMALLINT       NOT NULL,
    [ResourceSurrogateId] BIGINT         NOT NULL,
    [SearchParamId]       SMALLINT       NOT NULL,
    [Text]                NVARCHAR (256) COLLATE Latin1_General_100_CI_AI_SC NOT NULL,
    [TextOverflow]        NVARCHAR (MAX) COLLATE Latin1_General_100_CI_AI_SC NULL,
    [IsHistory]           BIT            NOT NULL,
    [IsMin]               BIT            CONSTRAINT [string_IsMin_Constraint] DEFAULT ((0)) NOT NULL,
    [IsMax]               BIT            CONSTRAINT [string_IsMax_Constraint] DEFAULT ((0)) NOT NULL
) ON [PartitionScheme_ResourceTypeId] ([ResourceTypeId]);


GO
ALTER TABLE [dbo].[StringSearchParam] SET (LOCK_ESCALATION = AUTO);


GO
CREATE CLUSTERED INDEX [IXC_StringSearchParam]
    ON [dbo].[StringSearchParam]([ResourceTypeId] ASC, [ResourceSurrogateId] ASC, [SearchParamId] ASC) WITH (DATA_COMPRESSION = PAGE ON PARTITIONS (1), DATA_COMPRESSION = PAGE ON PARTITIONS (2), DATA_COMPRESSION = PAGE ON PARTITIONS (3), DATA_COMPRESSION = PAGE ON PARTITIONS (4), DATA_COMPRESSION = PAGE ON PARTITIONS (5), DATA_COMPRESSION = PAGE ON PARTITIONS (6), DATA_COMPRESSION = PAGE ON PARTITIONS (7), DATA_COMPRESSION = PAGE ON PARTITIONS (8), DATA_COMPRESSION = PAGE ON PARTITIONS (9), DATA_COMPRESSION = PAGE ON PARTITIONS (10), DATA_COMPRESSION = PAGE ON PARTITIONS (11), DATA_COMPRESSION = PAGE ON PARTITIONS (12), DATA_COMPRESSION = PAGE ON PARTITIONS (13), DATA_COMPRESSION = PAGE ON PARTITIONS (14), DATA_COMPRESSION = PAGE ON PARTITIONS (15), DATA_COMPRESSION = PAGE ON PARTITIONS (16), DATA_COMPRESSION = PAGE ON PARTITIONS (17), DATA_COMPRESSION = PAGE ON PARTITIONS (18), DATA_COMPRESSION = PAGE ON PARTITIONS (19), DATA_COMPRESSION = PAGE ON PARTITIONS (20), DATA_COMPRESSION = PAGE ON PARTITIONS (21), DATA_COMPRESSION = PAGE ON PARTITIONS (22), DATA_COMPRESSION = PAGE ON PARTITIONS (23), DATA_COMPRESSION = PAGE ON PARTITIONS (24), DATA_COMPRESSION = PAGE ON PARTITIONS (25), DATA_COMPRESSION = PAGE ON PARTITIONS (26), DATA_COMPRESSION = PAGE ON PARTITIONS (27), DATA_COMPRESSION = PAGE ON PARTITIONS (28), DATA_COMPRESSION = PAGE ON PARTITIONS (29), DATA_COMPRESSION = PAGE ON PARTITIONS (30), DATA_COMPRESSION = PAGE ON PARTITIONS (31), DATA_COMPRESSION = PAGE ON PARTITIONS (32), DATA_COMPRESSION = PAGE ON PARTITIONS (33), DATA_COMPRESSION = PAGE ON PARTITIONS (34), DATA_COMPRESSION = PAGE ON PARTITIONS (35), DATA_COMPRESSION = PAGE ON PARTITIONS (36), DATA_COMPRESSION = PAGE ON PARTITIONS (37), DATA_COMPRESSION = PAGE ON PARTITIONS (38), DATA_COMPRESSION = PAGE ON PARTITIONS (39), DATA_COMPRESSION = PAGE ON PARTITIONS (40), DATA_COMPRESSION = PAGE ON PARTITIONS (41), DATA_COMPRESSION = PAGE ON PARTITIONS (42), DATA_COMPRESSION = PAGE ON PARTITIONS (43), DATA_COMPRESSION = PAGE ON PARTITIONS (44), DATA_COMPRESSION = PAGE ON PARTITIONS (45), DATA_COMPRESSION = PAGE ON PARTITIONS (46), DATA_COMPRESSION = PAGE ON PARTITIONS (47), DATA_COMPRESSION = PAGE ON PARTITIONS (48), DATA_COMPRESSION = PAGE ON PARTITIONS (49), DATA_COMPRESSION = PAGE ON PARTITIONS (50), DATA_COMPRESSION = PAGE ON PARTITIONS (51), DATA_COMPRESSION = PAGE ON PARTITIONS (52), DATA_COMPRESSION = PAGE ON PARTITIONS (53), DATA_COMPRESSION = PAGE ON PARTITIONS (54), DATA_COMPRESSION = PAGE ON PARTITIONS (55), DATA_COMPRESSION = PAGE ON PARTITIONS (56), DATA_COMPRESSION = PAGE ON PARTITIONS (57), DATA_COMPRESSION = PAGE ON PARTITIONS (58), DATA_COMPRESSION = PAGE ON PARTITIONS (59), DATA_COMPRESSION = PAGE ON PARTITIONS (60), DATA_COMPRESSION = PAGE ON PARTITIONS (61), DATA_COMPRESSION = PAGE ON PARTITIONS (62), DATA_COMPRESSION = PAGE ON PARTITIONS (63), DATA_COMPRESSION = PAGE ON PARTITIONS (64), DATA_COMPRESSION = PAGE ON PARTITIONS (65), DATA_COMPRESSION = PAGE ON PARTITIONS (66), DATA_COMPRESSION = PAGE ON PARTITIONS (67), DATA_COMPRESSION = PAGE ON PARTITIONS (68), DATA_COMPRESSION = PAGE ON PARTITIONS (69), DATA_COMPRESSION = PAGE ON PARTITIONS (70), DATA_COMPRESSION = PAGE ON PARTITIONS (71), DATA_COMPRESSION = PAGE ON PARTITIONS (72), DATA_COMPRESSION = PAGE ON PARTITIONS (73), DATA_COMPRESSION = PAGE ON PARTITIONS (74), DATA_COMPRESSION = PAGE ON PARTITIONS (75), DATA_COMPRESSION = PAGE ON PARTITIONS (76), DATA_COMPRESSION = PAGE ON PARTITIONS (77), DATA_COMPRESSION = PAGE ON PARTITIONS (78), DATA_COMPRESSION = PAGE ON PARTITIONS (79), DATA_COMPRESSION = PAGE ON PARTITIONS (80), DATA_COMPRESSION = PAGE ON PARTITIONS (81), DATA_COMPRESSION = PAGE ON PARTITIONS (82), DATA_COMPRESSION = PAGE ON PARTITIONS (83), DATA_COMPRESSION = PAGE ON PARTITIONS (84), DATA_COMPRESSION = PAGE ON PARTITIONS (85), DATA_COMPRESSION = PAGE ON PARTITIONS (86), DATA_COMPRESSION = PAGE ON PARTITIONS (87), DATA_COMPRESSION = PAGE ON PARTITIONS (88), DATA_COMPRESSION = PAGE ON PARTITIONS (89), DATA_COMPRESSION = PAGE ON PARTITIONS (90), DATA_COMPRESSION = PAGE ON PARTITIONS (91), DATA_COMPRESSION = PAGE ON PARTITIONS (92), DATA_COMPRESSION = PAGE ON PARTITIONS (93), DATA_COMPRESSION = PAGE ON PARTITIONS (94), DATA_COMPRESSION = PAGE ON PARTITIONS (95), DATA_COMPRESSION = PAGE ON PARTITIONS (96), DATA_COMPRESSION = PAGE ON PARTITIONS (97), DATA_COMPRESSION = PAGE ON PARTITIONS (98), DATA_COMPRESSION = PAGE ON PARTITIONS (99), DATA_COMPRESSION = PAGE ON PARTITIONS (100), DATA_COMPRESSION = PAGE ON PARTITIONS (101), DATA_COMPRESSION = PAGE ON PARTITIONS (102), DATA_COMPRESSION = PAGE ON PARTITIONS (103), DATA_COMPRESSION = PAGE ON PARTITIONS (104), DATA_COMPRESSION = PAGE ON PARTITIONS (105), DATA_COMPRESSION = PAGE ON PARTITIONS (106), DATA_COMPRESSION = PAGE ON PARTITIONS (107), DATA_COMPRESSION = PAGE ON PARTITIONS (108), DATA_COMPRESSION = PAGE ON PARTITIONS (109), DATA_COMPRESSION = PAGE ON PARTITIONS (110), DATA_COMPRESSION = PAGE ON PARTITIONS (111), DATA_COMPRESSION = PAGE ON PARTITIONS (112), DATA_COMPRESSION = PAGE ON PARTITIONS (113), DATA_COMPRESSION = PAGE ON PARTITIONS (114), DATA_COMPRESSION = PAGE ON PARTITIONS (115), DATA_COMPRESSION = PAGE ON PARTITIONS (116), DATA_COMPRESSION = PAGE ON PARTITIONS (117), DATA_COMPRESSION = PAGE ON PARTITIONS (118), DATA_COMPRESSION = PAGE ON PARTITIONS (119), DATA_COMPRESSION = PAGE ON PARTITIONS (120), DATA_COMPRESSION = PAGE ON PARTITIONS (121), DATA_COMPRESSION = PAGE ON PARTITIONS (122), DATA_COMPRESSION = PAGE ON PARTITIONS (123), DATA_COMPRESSION = PAGE ON PARTITIONS (124), DATA_COMPRESSION = PAGE ON PARTITIONS (125), DATA_COMPRESSION = PAGE ON PARTITIONS (126), DATA_COMPRESSION = PAGE ON PARTITIONS (127), DATA_COMPRESSION = PAGE ON PARTITIONS (128), DATA_COMPRESSION = PAGE ON PARTITIONS (129), DATA_COMPRESSION = PAGE ON PARTITIONS (130), DATA_COMPRESSION = PAGE ON PARTITIONS (131), DATA_COMPRESSION = PAGE ON PARTITIONS (132), DATA_COMPRESSION = PAGE ON PARTITIONS (133), DATA_COMPRESSION = PAGE ON PARTITIONS (134), DATA_COMPRESSION = PAGE ON PARTITIONS (135), DATA_COMPRESSION = PAGE ON PARTITIONS (136), DATA_COMPRESSION = PAGE ON PARTITIONS (137), DATA_COMPRESSION = PAGE ON PARTITIONS (138), DATA_COMPRESSION = PAGE ON PARTITIONS (139), DATA_COMPRESSION = PAGE ON PARTITIONS (140), DATA_COMPRESSION = PAGE ON PARTITIONS (141), DATA_COMPRESSION = PAGE ON PARTITIONS (142), DATA_COMPRESSION = PAGE ON PARTITIONS (143), DATA_COMPRESSION = PAGE ON PARTITIONS (144), DATA_COMPRESSION = PAGE ON PARTITIONS (145), DATA_COMPRESSION = PAGE ON PARTITIONS (146), DATA_COMPRESSION = PAGE ON PARTITIONS (147), DATA_COMPRESSION = PAGE ON PARTITIONS (148), DATA_COMPRESSION = PAGE ON PARTITIONS (149), DATA_COMPRESSION = PAGE ON PARTITIONS (150), DATA_COMPRESSION = PAGE ON PARTITIONS (151))
    ON [PartitionScheme_ResourceTypeId] ([ResourceTypeId]);


GO
CREATE NONCLUSTERED INDEX [IX_StringSearchParam_SearchParamId_Text]
    ON [dbo].[StringSearchParam]([ResourceTypeId] ASC, [SearchParamId] ASC, [Text] ASC, [ResourceSurrogateId] ASC)
    INCLUDE([TextOverflow], [IsMin], [IsMax]) WHERE ([IsHistory]=(0)) WITH (DATA_COMPRESSION = PAGE ON PARTITIONS (1), DATA_COMPRESSION = PAGE ON PARTITIONS (2), DATA_COMPRESSION = PAGE ON PARTITIONS (3), DATA_COMPRESSION = PAGE ON PARTITIONS (4), DATA_COMPRESSION = PAGE ON PARTITIONS (5), DATA_COMPRESSION = PAGE ON PARTITIONS (6), DATA_COMPRESSION = PAGE ON PARTITIONS (7), DATA_COMPRESSION = PAGE ON PARTITIONS (8), DATA_COMPRESSION = PAGE ON PARTITIONS (9), DATA_COMPRESSION = PAGE ON PARTITIONS (10), DATA_COMPRESSION = PAGE ON PARTITIONS (11), DATA_COMPRESSION = PAGE ON PARTITIONS (12), DATA_COMPRESSION = PAGE ON PARTITIONS (13), DATA_COMPRESSION = PAGE ON PARTITIONS (14), DATA_COMPRESSION = PAGE ON PARTITIONS (15), DATA_COMPRESSION = PAGE ON PARTITIONS (16), DATA_COMPRESSION = PAGE ON PARTITIONS (17), DATA_COMPRESSION = PAGE ON PARTITIONS (18), DATA_COMPRESSION = PAGE ON PARTITIONS (19), DATA_COMPRESSION = PAGE ON PARTITIONS (20), DATA_COMPRESSION = PAGE ON PARTITIONS (21), DATA_COMPRESSION = PAGE ON PARTITIONS (22), DATA_COMPRESSION = PAGE ON PARTITIONS (23), DATA_COMPRESSION = PAGE ON PARTITIONS (24), DATA_COMPRESSION = PAGE ON PARTITIONS (25), DATA_COMPRESSION = PAGE ON PARTITIONS (26), DATA_COMPRESSION = PAGE ON PARTITIONS (27), DATA_COMPRESSION = PAGE ON PARTITIONS (28), DATA_COMPRESSION = PAGE ON PARTITIONS (29), DATA_COMPRESSION = PAGE ON PARTITIONS (30), DATA_COMPRESSION = PAGE ON PARTITIONS (31), DATA_COMPRESSION = PAGE ON PARTITIONS (32), DATA_COMPRESSION = PAGE ON PARTITIONS (33), DATA_COMPRESSION = PAGE ON PARTITIONS (34), DATA_COMPRESSION = PAGE ON PARTITIONS (35), DATA_COMPRESSION = PAGE ON PARTITIONS (36), DATA_COMPRESSION = PAGE ON PARTITIONS (37), DATA_COMPRESSION = PAGE ON PARTITIONS (38), DATA_COMPRESSION = PAGE ON PARTITIONS (39), DATA_COMPRESSION = PAGE ON PARTITIONS (40), DATA_COMPRESSION = PAGE ON PARTITIONS (41), DATA_COMPRESSION = PAGE ON PARTITIONS (42), DATA_COMPRESSION = PAGE ON PARTITIONS (43), DATA_COMPRESSION = PAGE ON PARTITIONS (44), DATA_COMPRESSION = PAGE ON PARTITIONS (45), DATA_COMPRESSION = PAGE ON PARTITIONS (46), DATA_COMPRESSION = PAGE ON PARTITIONS (47), DATA_COMPRESSION = PAGE ON PARTITIONS (48), DATA_COMPRESSION = PAGE ON PARTITIONS (49), DATA_COMPRESSION = PAGE ON PARTITIONS (50), DATA_COMPRESSION = PAGE ON PARTITIONS (51), DATA_COMPRESSION = PAGE ON PARTITIONS (52), DATA_COMPRESSION = PAGE ON PARTITIONS (53), DATA_COMPRESSION = PAGE ON PARTITIONS (54), DATA_COMPRESSION = PAGE ON PARTITIONS (55), DATA_COMPRESSION = PAGE ON PARTITIONS (56), DATA_COMPRESSION = PAGE ON PARTITIONS (57), DATA_COMPRESSION = PAGE ON PARTITIONS (58), DATA_COMPRESSION = PAGE ON PARTITIONS (59), DATA_COMPRESSION = PAGE ON PARTITIONS (60), DATA_COMPRESSION = PAGE ON PARTITIONS (61), DATA_COMPRESSION = PAGE ON PARTITIONS (62), DATA_COMPRESSION = PAGE ON PARTITIONS (63), DATA_COMPRESSION = PAGE ON PARTITIONS (64), DATA_COMPRESSION = PAGE ON PARTITIONS (65), DATA_COMPRESSION = PAGE ON PARTITIONS (66), DATA_COMPRESSION = PAGE ON PARTITIONS (67), DATA_COMPRESSION = PAGE ON PARTITIONS (68), DATA_COMPRESSION = PAGE ON PARTITIONS (69), DATA_COMPRESSION = PAGE ON PARTITIONS (70), DATA_COMPRESSION = PAGE ON PARTITIONS (71), DATA_COMPRESSION = PAGE ON PARTITIONS (72), DATA_COMPRESSION = PAGE ON PARTITIONS (73), DATA_COMPRESSION = PAGE ON PARTITIONS (74), DATA_COMPRESSION = PAGE ON PARTITIONS (75), DATA_COMPRESSION = PAGE ON PARTITIONS (76), DATA_COMPRESSION = PAGE ON PARTITIONS (77), DATA_COMPRESSION = PAGE ON PARTITIONS (78), DATA_COMPRESSION = PAGE ON PARTITIONS (79), DATA_COMPRESSION = PAGE ON PARTITIONS (80), DATA_COMPRESSION = PAGE ON PARTITIONS (81), DATA_COMPRESSION = PAGE ON PARTITIONS (82), DATA_COMPRESSION = PAGE ON PARTITIONS (83), DATA_COMPRESSION = PAGE ON PARTITIONS (84), DATA_COMPRESSION = PAGE ON PARTITIONS (85), DATA_COMPRESSION = PAGE ON PARTITIONS (86), DATA_COMPRESSION = PAGE ON PARTITIONS (87), DATA_COMPRESSION = PAGE ON PARTITIONS (88), DATA_COMPRESSION = PAGE ON PARTITIONS (89), DATA_COMPRESSION = PAGE ON PARTITIONS (90), DATA_COMPRESSION = PAGE ON PARTITIONS (91), DATA_COMPRESSION = PAGE ON PARTITIONS (92), DATA_COMPRESSION = PAGE ON PARTITIONS (93), DATA_COMPRESSION = PAGE ON PARTITIONS (94), DATA_COMPRESSION = PAGE ON PARTITIONS (95), DATA_COMPRESSION = PAGE ON PARTITIONS (96), DATA_COMPRESSION = PAGE ON PARTITIONS (97), DATA_COMPRESSION = PAGE ON PARTITIONS (98), DATA_COMPRESSION = PAGE ON PARTITIONS (99), DATA_COMPRESSION = PAGE ON PARTITIONS (100), DATA_COMPRESSION = PAGE ON PARTITIONS (101), DATA_COMPRESSION = PAGE ON PARTITIONS (102), DATA_COMPRESSION = PAGE ON PARTITIONS (103), DATA_COMPRESSION = PAGE ON PARTITIONS (104), DATA_COMPRESSION = PAGE ON PARTITIONS (105), DATA_COMPRESSION = PAGE ON PARTITIONS (106), DATA_COMPRESSION = PAGE ON PARTITIONS (107), DATA_COMPRESSION = PAGE ON PARTITIONS (108), DATA_COMPRESSION = PAGE ON PARTITIONS (109), DATA_COMPRESSION = PAGE ON PARTITIONS (110), DATA_COMPRESSION = PAGE ON PARTITIONS (111), DATA_COMPRESSION = PAGE ON PARTITIONS (112), DATA_COMPRESSION = PAGE ON PARTITIONS (113), DATA_COMPRESSION = PAGE ON PARTITIONS (114), DATA_COMPRESSION = PAGE ON PARTITIONS (115), DATA_COMPRESSION = PAGE ON PARTITIONS (116), DATA_COMPRESSION = PAGE ON PARTITIONS (117), DATA_COMPRESSION = PAGE ON PARTITIONS (118), DATA_COMPRESSION = PAGE ON PARTITIONS (119), DATA_COMPRESSION = PAGE ON PARTITIONS (120), DATA_COMPRESSION = PAGE ON PARTITIONS (121), DATA_COMPRESSION = PAGE ON PARTITIONS (122), DATA_COMPRESSION = PAGE ON PARTITIONS (123), DATA_COMPRESSION = PAGE ON PARTITIONS (124), DATA_COMPRESSION = PAGE ON PARTITIONS (125), DATA_COMPRESSION = PAGE ON PARTITIONS (126), DATA_COMPRESSION = PAGE ON PARTITIONS (127), DATA_COMPRESSION = PAGE ON PARTITIONS (128), DATA_COMPRESSION = PAGE ON PARTITIONS (129), DATA_COMPRESSION = PAGE ON PARTITIONS (130), DATA_COMPRESSION = PAGE ON PARTITIONS (131), DATA_COMPRESSION = PAGE ON PARTITIONS (132), DATA_COMPRESSION = PAGE ON PARTITIONS (133), DATA_COMPRESSION = PAGE ON PARTITIONS (134), DATA_COMPRESSION = PAGE ON PARTITIONS (135), DATA_COMPRESSION = PAGE ON PARTITIONS (136), DATA_COMPRESSION = PAGE ON PARTITIONS (137), DATA_COMPRESSION = PAGE ON PARTITIONS (138), DATA_COMPRESSION = PAGE ON PARTITIONS (139), DATA_COMPRESSION = PAGE ON PARTITIONS (140), DATA_COMPRESSION = PAGE ON PARTITIONS (141), DATA_COMPRESSION = PAGE ON PARTITIONS (142), DATA_COMPRESSION = PAGE ON PARTITIONS (143), DATA_COMPRESSION = PAGE ON PARTITIONS (144), DATA_COMPRESSION = PAGE ON PARTITIONS (145), DATA_COMPRESSION = PAGE ON PARTITIONS (146), DATA_COMPRESSION = PAGE ON PARTITIONS (147), DATA_COMPRESSION = PAGE ON PARTITIONS (148), DATA_COMPRESSION = PAGE ON PARTITIONS (149), DATA_COMPRESSION = PAGE ON PARTITIONS (150), DATA_COMPRESSION = PAGE ON PARTITIONS (151))
    ON [PartitionScheme_ResourceTypeId] ([ResourceTypeId]);


GO
CREATE NONCLUSTERED INDEX [IX_StringSearchParam_SearchParamId_TextWithOverflow]
    ON [dbo].[StringSearchParam]([ResourceTypeId] ASC, [SearchParamId] ASC, [Text] ASC, [ResourceSurrogateId] ASC)
    INCLUDE([IsMin], [IsMax]) WHERE ([IsHistory]=(0) AND [TextOverflow] IS NOT NULL) WITH (DATA_COMPRESSION = PAGE ON PARTITIONS (1), DATA_COMPRESSION = PAGE ON PARTITIONS (2), DATA_COMPRESSION = PAGE ON PARTITIONS (3), DATA_COMPRESSION = PAGE ON PARTITIONS (4), DATA_COMPRESSION = PAGE ON PARTITIONS (5), DATA_COMPRESSION = PAGE ON PARTITIONS (6), DATA_COMPRESSION = PAGE ON PARTITIONS (7), DATA_COMPRESSION = PAGE ON PARTITIONS (8), DATA_COMPRESSION = PAGE ON PARTITIONS (9), DATA_COMPRESSION = PAGE ON PARTITIONS (10), DATA_COMPRESSION = PAGE ON PARTITIONS (11), DATA_COMPRESSION = PAGE ON PARTITIONS (12), DATA_COMPRESSION = PAGE ON PARTITIONS (13), DATA_COMPRESSION = PAGE ON PARTITIONS (14), DATA_COMPRESSION = PAGE ON PARTITIONS (15), DATA_COMPRESSION = PAGE ON PARTITIONS (16), DATA_COMPRESSION = PAGE ON PARTITIONS (17), DATA_COMPRESSION = PAGE ON PARTITIONS (18), DATA_COMPRESSION = PAGE ON PARTITIONS (19), DATA_COMPRESSION = PAGE ON PARTITIONS (20), DATA_COMPRESSION = PAGE ON PARTITIONS (21), DATA_COMPRESSION = PAGE ON PARTITIONS (22), DATA_COMPRESSION = PAGE ON PARTITIONS (23), DATA_COMPRESSION = PAGE ON PARTITIONS (24), DATA_COMPRESSION = PAGE ON PARTITIONS (25), DATA_COMPRESSION = PAGE ON PARTITIONS (26), DATA_COMPRESSION = PAGE ON PARTITIONS (27), DATA_COMPRESSION = PAGE ON PARTITIONS (28), DATA_COMPRESSION = PAGE ON PARTITIONS (29), DATA_COMPRESSION = PAGE ON PARTITIONS (30), DATA_COMPRESSION = PAGE ON PARTITIONS (31), DATA_COMPRESSION = PAGE ON PARTITIONS (32), DATA_COMPRESSION = PAGE ON PARTITIONS (33), DATA_COMPRESSION = PAGE ON PARTITIONS (34), DATA_COMPRESSION = PAGE ON PARTITIONS (35), DATA_COMPRESSION = PAGE ON PARTITIONS (36), DATA_COMPRESSION = PAGE ON PARTITIONS (37), DATA_COMPRESSION = PAGE ON PARTITIONS (38), DATA_COMPRESSION = PAGE ON PARTITIONS (39), DATA_COMPRESSION = PAGE ON PARTITIONS (40), DATA_COMPRESSION = PAGE ON PARTITIONS (41), DATA_COMPRESSION = PAGE ON PARTITIONS (42), DATA_COMPRESSION = PAGE ON PARTITIONS (43), DATA_COMPRESSION = PAGE ON PARTITIONS (44), DATA_COMPRESSION = PAGE ON PARTITIONS (45), DATA_COMPRESSION = PAGE ON PARTITIONS (46), DATA_COMPRESSION = PAGE ON PARTITIONS (47), DATA_COMPRESSION = PAGE ON PARTITIONS (48), DATA_COMPRESSION = PAGE ON PARTITIONS (49), DATA_COMPRESSION = PAGE ON PARTITIONS (50), DATA_COMPRESSION = PAGE ON PARTITIONS (51), DATA_COMPRESSION = PAGE ON PARTITIONS (52), DATA_COMPRESSION = PAGE ON PARTITIONS (53), DATA_COMPRESSION = PAGE ON PARTITIONS (54), DATA_COMPRESSION = PAGE ON PARTITIONS (55), DATA_COMPRESSION = PAGE ON PARTITIONS (56), DATA_COMPRESSION = PAGE ON PARTITIONS (57), DATA_COMPRESSION = PAGE ON PARTITIONS (58), DATA_COMPRESSION = PAGE ON PARTITIONS (59), DATA_COMPRESSION = PAGE ON PARTITIONS (60), DATA_COMPRESSION = PAGE ON PARTITIONS (61), DATA_COMPRESSION = PAGE ON PARTITIONS (62), DATA_COMPRESSION = PAGE ON PARTITIONS (63), DATA_COMPRESSION = PAGE ON PARTITIONS (64), DATA_COMPRESSION = PAGE ON PARTITIONS (65), DATA_COMPRESSION = PAGE ON PARTITIONS (66), DATA_COMPRESSION = PAGE ON PARTITIONS (67), DATA_COMPRESSION = PAGE ON PARTITIONS (68), DATA_COMPRESSION = PAGE ON PARTITIONS (69), DATA_COMPRESSION = PAGE ON PARTITIONS (70), DATA_COMPRESSION = PAGE ON PARTITIONS (71), DATA_COMPRESSION = PAGE ON PARTITIONS (72), DATA_COMPRESSION = PAGE ON PARTITIONS (73), DATA_COMPRESSION = PAGE ON PARTITIONS (74), DATA_COMPRESSION = PAGE ON PARTITIONS (75), DATA_COMPRESSION = PAGE ON PARTITIONS (76), DATA_COMPRESSION = PAGE ON PARTITIONS (77), DATA_COMPRESSION = PAGE ON PARTITIONS (78), DATA_COMPRESSION = PAGE ON PARTITIONS (79), DATA_COMPRESSION = PAGE ON PARTITIONS (80), DATA_COMPRESSION = PAGE ON PARTITIONS (81), DATA_COMPRESSION = PAGE ON PARTITIONS (82), DATA_COMPRESSION = PAGE ON PARTITIONS (83), DATA_COMPRESSION = PAGE ON PARTITIONS (84), DATA_COMPRESSION = PAGE ON PARTITIONS (85), DATA_COMPRESSION = PAGE ON PARTITIONS (86), DATA_COMPRESSION = PAGE ON PARTITIONS (87), DATA_COMPRESSION = PAGE ON PARTITIONS (88), DATA_COMPRESSION = PAGE ON PARTITIONS (89), DATA_COMPRESSION = PAGE ON PARTITIONS (90), DATA_COMPRESSION = PAGE ON PARTITIONS (91), DATA_COMPRESSION = PAGE ON PARTITIONS (92), DATA_COMPRESSION = PAGE ON PARTITIONS (93), DATA_COMPRESSION = PAGE ON PARTITIONS (94), DATA_COMPRESSION = PAGE ON PARTITIONS (95), DATA_COMPRESSION = PAGE ON PARTITIONS (96), DATA_COMPRESSION = PAGE ON PARTITIONS (97), DATA_COMPRESSION = PAGE ON PARTITIONS (98), DATA_COMPRESSION = PAGE ON PARTITIONS (99), DATA_COMPRESSION = PAGE ON PARTITIONS (100), DATA_COMPRESSION = PAGE ON PARTITIONS (101), DATA_COMPRESSION = PAGE ON PARTITIONS (102), DATA_COMPRESSION = PAGE ON PARTITIONS (103), DATA_COMPRESSION = PAGE ON PARTITIONS (104), DATA_COMPRESSION = PAGE ON PARTITIONS (105), DATA_COMPRESSION = PAGE ON PARTITIONS (106), DATA_COMPRESSION = PAGE ON PARTITIONS (107), DATA_COMPRESSION = PAGE ON PARTITIONS (108), DATA_COMPRESSION = PAGE ON PARTITIONS (109), DATA_COMPRESSION = PAGE ON PARTITIONS (110), DATA_COMPRESSION = PAGE ON PARTITIONS (111), DATA_COMPRESSION = PAGE ON PARTITIONS (112), DATA_COMPRESSION = PAGE ON PARTITIONS (113), DATA_COMPRESSION = PAGE ON PARTITIONS (114), DATA_COMPRESSION = PAGE ON PARTITIONS (115), DATA_COMPRESSION = PAGE ON PARTITIONS (116), DATA_COMPRESSION = PAGE ON PARTITIONS (117), DATA_COMPRESSION = PAGE ON PARTITIONS (118), DATA_COMPRESSION = PAGE ON PARTITIONS (119), DATA_COMPRESSION = PAGE ON PARTITIONS (120), DATA_COMPRESSION = PAGE ON PARTITIONS (121), DATA_COMPRESSION = PAGE ON PARTITIONS (122), DATA_COMPRESSION = PAGE ON PARTITIONS (123), DATA_COMPRESSION = PAGE ON PARTITIONS (124), DATA_COMPRESSION = PAGE ON PARTITIONS (125), DATA_COMPRESSION = PAGE ON PARTITIONS (126), DATA_COMPRESSION = PAGE ON PARTITIONS (127), DATA_COMPRESSION = PAGE ON PARTITIONS (128), DATA_COMPRESSION = PAGE ON PARTITIONS (129), DATA_COMPRESSION = PAGE ON PARTITIONS (130), DATA_COMPRESSION = PAGE ON PARTITIONS (131), DATA_COMPRESSION = PAGE ON PARTITIONS (132), DATA_COMPRESSION = PAGE ON PARTITIONS (133), DATA_COMPRESSION = PAGE ON PARTITIONS (134), DATA_COMPRESSION = PAGE ON PARTITIONS (135), DATA_COMPRESSION = PAGE ON PARTITIONS (136), DATA_COMPRESSION = PAGE ON PARTITIONS (137), DATA_COMPRESSION = PAGE ON PARTITIONS (138), DATA_COMPRESSION = PAGE ON PARTITIONS (139), DATA_COMPRESSION = PAGE ON PARTITIONS (140), DATA_COMPRESSION = PAGE ON PARTITIONS (141), DATA_COMPRESSION = PAGE ON PARTITIONS (142), DATA_COMPRESSION = PAGE ON PARTITIONS (143), DATA_COMPRESSION = PAGE ON PARTITIONS (144), DATA_COMPRESSION = PAGE ON PARTITIONS (145), DATA_COMPRESSION = PAGE ON PARTITIONS (146), DATA_COMPRESSION = PAGE ON PARTITIONS (147), DATA_COMPRESSION = PAGE ON PARTITIONS (148), DATA_COMPRESSION = PAGE ON PARTITIONS (149), DATA_COMPRESSION = PAGE ON PARTITIONS (150), DATA_COMPRESSION = PAGE ON PARTITIONS (151))
    ON [PartitionScheme_ResourceTypeId] ([ResourceTypeId]);

