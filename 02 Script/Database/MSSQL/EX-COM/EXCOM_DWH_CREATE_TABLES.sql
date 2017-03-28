--Create DWH_TNB_FCT_REQ_MOVEMENT_STATUS table

IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'DWH_TNB_FCT_REQ_MOVEMENT_STATUS')
	BEGIN
		DROP TABLE FACT.DWH_TNB_FCT_REQ_MOVEMENT_STATUS
	END

/****** Object:  Table [FACT].[DWH_TNB_FCT_REQ_MOVEMENT_STATUS]    Script Date: 12/21/2016 1:39:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [FACT].[DWH_TNB_FCT_REQ_MOVEMENT_STATUS](
	[REQ_DOC] [float] NOT NULL,
	[REQUEST_STATUS] [varchar](2) NOT NULL,
	[START_DATE_TIME] [datetime] NOT NULL,
	[END_DATE_TIME] [datetime] NOT NULL,
	[PREV_REQUEST_STATUS] [varchar](2) NOT NULL,
	[USER_ID] [varchar](20) NULL,
	[DOC_DATE] [datetime] NULL,
	[BRANCH_CODE] [varchar](10) NULL,
	[DEALER_CODE] [varchar](10) NULL,
	[PRODUCT_CODE] [varchar](10) NULL,
	[JOB_RUN_KEY] [bigint] NOT NULL,
	[SOURCE_SYSTEM_CODE] [varchar](10) NOT NULL,
	[SOURCE_TABLE_NAME] [varchar](20) NOT NULL,
	[DELETED_FLAG] [char](1) NOT NULL,
	[COMMENTS] [varchar](500) NULL,
	[SOURCE_LAST_UPDATE_DATE_TIME] [datetime] NOT NULL,
	[LAST_UPDATE_DATE_TIME] [datetime] NOT NULL,
 CONSTRAINT [PK_DWH_TNB_FCT_REQ_MOVEMENT_STATUS] PRIMARY KEY CLUSTERED 
(
	[REQ_DOC] ASC,
	[REQUEST_STATUS] ASC,
	[START_DATE_TIME] ASC,
	[END_DATE_TIME] ASC,
	[PREV_REQUEST_STATUS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];

ALTER TABLE [FACT].[DWH_TNB_FCT_REQ_MOVEMENT_STATUS] ADD  DEFAULT ('N') FOR [DELETED_FLAG];
ALTER TABLE [FACT].[DWH_TNB_FCT_REQ_MOVEMENT_STATUS] ADD  DEFAULT (getdate()) FOR [LAST_UPDATE_DATE_TIME];

EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Request No.' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'DWH_TNB_FCT_REQ_MOVEMENT_STATUS', @level2type=N'COLUMN',@level2name=N'REQ_DOC'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Request Status' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'DWH_TNB_FCT_REQ_MOVEMENT_STATUS', @level2type=N'COLUMN',@level2name=N'REQUEST_STATUS'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Start Entry/Change Date and Time' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'DWH_TNB_FCT_REQ_MOVEMENT_STATUS', @level2type=N'COLUMN',@level2name=N'START_DATE_TIME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'End Date and Time' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'DWH_TNB_FCT_REQ_MOVEMENT_STATUS', @level2type=N'COLUMN',@level2name=N'END_DATE_TIME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Previous Request Status' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'DWH_TNB_FCT_REQ_MOVEMENT_STATUS', @level2type=N'COLUMN',@level2name=N'PREV_REQUEST_STATUS'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'User ID.' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'DWH_TNB_FCT_REQ_MOVEMENT_STATUS', @level2type=N'COLUMN',@level2name=N'USER_ID'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Date of application' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'DWH_TNB_FCT_REQ_MOVEMENT_STATUS', @level2type=N'COLUMN',@level2name=N'DOC_DATE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Branch Code' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'DWH_TNB_FCT_REQ_MOVEMENT_STATUS', @level2type=N'COLUMN',@level2name=N'BRANCH_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Dealer Code' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'DWH_TNB_FCT_REQ_MOVEMENT_STATUS', @level2type=N'COLUMN',@level2name=N'DEALER_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Product Code' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'DWH_TNB_FCT_REQ_MOVEMENT_STATUS', @level2type=N'COLUMN',@level2name=N'PRODUCT_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'job run key of currently running instance of job' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'DWH_TNB_FCT_REQ_MOVEMENT_STATUS', @level2type=N'COLUMN',@level2name=N'JOB_RUN_KEY'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Code of source system for extraction' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'DWH_TNB_FCT_REQ_MOVEMENT_STATUS', @level2type=N'COLUMN',@level2name=N'SOURCE_SYSTEM_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Source table name extracted' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'DWH_TNB_FCT_REQ_MOVEMENT_STATUS', @level2type=N'COLUMN',@level2name=N'SOURCE_TABLE_NAME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'y-means record marked for deletion. n - means active record' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'DWH_TNB_FCT_REQ_MOVEMENT_STATUS', @level2type=N'COLUMN',@level2name=N'DELETED_FLAG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Comment for any changes to this record.' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'DWH_TNB_FCT_REQ_MOVEMENT_STATUS', @level2type=N'COLUMN',@level2name=N'COMMENTS'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Last update time of source' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'DWH_TNB_FCT_REQ_MOVEMENT_STATUS', @level2type=N'COLUMN',@level2name=N'SOURCE_LAST_UPDATE_DATE_TIME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'record created / last updated date and time' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'DWH_TNB_FCT_REQ_MOVEMENT_STATUS', @level2type=N'COLUMN',@level2name=N'LAST_UPDATE_DATE_TIME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Fact table that store Application status' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'DWH_TNB_FCT_REQ_MOVEMENT_STATUS'

