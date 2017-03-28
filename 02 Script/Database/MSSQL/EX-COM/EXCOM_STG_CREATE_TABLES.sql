USE [GL_TNB_STG]

/****** Object:  Table [STG].[STG_TNB_TRN_NCB_EVENT_LOG]    Script Date: 12/21/2016 8:52:09 AM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [STG].[STG_TNB_TRN_NCB_EVENT_LOG](
	[SID] [int] NULL,
	[IP_ADDRESS] [varchar](50) NULL,
	[SYSTEM_NAME] [varchar](50) NULL,
	[CUSTOMER_ID] [varchar](13) NULL,
	[CUSTOMER_NAME] [varchar](255) NULL,
	[NCRS_USERNAME] [varchar](50) NULL,
	[EVENT_NAME] [varchar](50) NULL,
	[DESCRIPTION] [varchar](500) NULL,
	[IS_CPU_TO_CPU] [varchar](1) NULL,
	[EVENT_BY] [varchar](50) NULL,
	[EVENT_ON] [datetime] NULL,
	[IS_RECEIVE_CONSENT] [varchar](1) NULL,
	[MEMBER_REF] [varchar](50) NULL,
	[RECEIVE_CONSENT_ON] [datetime] NULL,
	[JOB_RUN_KEY] [bigint] NOT NULL,
	[SOURCE_SYSTEM_CODE] [varchar](10) NOT NULL,
	[SOURCE_TABLE_NAME] [varchar](15) NOT NULL,
	[DELETED_FLAG] [char](1) NOT NULL,
	[COMMENTS] [varchar](500) NULL,
	[SOURCE_LAST_UPDATE_DATE_TIME] [datetime] NOT NULL,
	[LAST_UPDATE_DATE_TIME] [datetime] NOT NULL
) ON [PRIMARY]

ALTER TABLE [STG].[STG_TNB_TRN_NCB_EVENT_LOG] ADD  DEFAULT ('N') FOR [DELETED_FLAG]
ALTER TABLE [STG].[STG_TNB_TRN_NCB_EVENT_LOG] ADD  DEFAULT (getdate()) FOR [LAST_UPDATE_DATE_TIME]

EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Security Identifier' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_TRN_NCB_EVENT_LOG', @level2type=N'COLUMN',@level2name=N'SID'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'IP address' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_TRN_NCB_EVENT_LOG', @level2type=N'COLUMN',@level2name=N'IP_ADDRESS'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'System Name' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_TRN_NCB_EVENT_LOG', @level2type=N'COLUMN',@level2name=N'SYSTEM_NAME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Customer ID' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_TRN_NCB_EVENT_LOG', @level2type=N'COLUMN',@level2name=N'CUSTOMER_ID'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Customer Full Name' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_TRN_NCB_EVENT_LOG', @level2type=N'COLUMN',@level2name=N'CUSTOMER_NAME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'NCRS Username' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_TRN_NCB_EVENT_LOG', @level2type=N'COLUMN',@level2name=N'NCRS_USERNAME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Event Name' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_TRN_NCB_EVENT_LOG', @level2type=N'COLUMN',@level2name=N'EVENT_NAME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Event Description' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_TRN_NCB_EVENT_LOG', @level2type=N'COLUMN',@level2name=N'DESCRIPTION'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Event generator' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_TRN_NCB_EVENT_LOG', @level2type=N'COLUMN',@level2name=N'EVENT_BY'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Event Timestamp' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_TRN_NCB_EVENT_LOG', @level2type=N'COLUMN',@level2name=N'EVENT_ON'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'NCB Event Log Table' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_TRN_NCB_EVENT_LOG'

GO

IF EXISTS (SELECT NAME FROM SYS.SYNONYMS WHERE NAME = N'STG_TNB_TRN_NCB_EVENT_LOG')
	BEGIN
		DROP SYNONYM STG_TNB_TRN_NCB_EVENT_LOG 
	END
CREATE SYNONYM STG_TNB_TRN_NCB_EVENT_LOG FOR STG.STG_TNB_TRN_NCB_EVENT_LOG;

USE [GL_TNB_STG]

/****** Object:  Table [STG].[STG_TNB_TRN_APP_IN_LOG]    Script Date: 12/21/2016 8:54:21 AM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [STG].[STG_TNB_TRN_APP_IN_LOG](
	[MLRQ_BRN_DOC] [float] NULL,
	[MLRQ_REQ_DOC] [float] NULL,
	[MLRQ_START_DATE_TIME] [datetime] NULL,
	[MLRQ_STATUS_BEFORE_CHANGE] [varchar](2) NULL,
	[MLRQ_END_DATE_TIME] [datetime] NULL,
	[MLRQ_BY_PROGRAM_ID] [varchar](10) NULL,
	[MLRQ_STATUS] [varchar](2) NULL,
	[MLRQ_USER_ID] [varchar](20) NULL,
	[MLRQ_CR_CODE] [varchar](10) NULL,
	[JOB_RUN_KEY] [bigint] NOT NULL,
	[SOURCE_SYSTEM_CODE] [varchar](10) NOT NULL,
	[SOURCE_TABLE_NAME] [varchar](15) NOT NULL,
	[DELETED_FLAG] [char](1) NOT NULL,
	[COMMENTS] [varchar](500) NULL,
	[SOURCE_LAST_UPDATE_DATE_TIME] [datetime] NOT NULL,
	[LAST_UPDATE_DATE_TIME] [datetime] NOT NULL
) ON [PRIMARY]

ALTER TABLE [STG].[STG_TNB_TRN_APP_IN_LOG] ADD  DEFAULT ('N') FOR [DELETED_FLAG]
ALTER TABLE [STG].[STG_TNB_TRN_APP_IN_LOG] ADD  DEFAULT (getdate()) FOR [LAST_UPDATE_DATE_TIME]

EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Branch Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_TRN_APP_IN_LOG', @level2type=N'COLUMN',@level2name=N'MLRQ_BRN_DOC'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Request No.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_TRN_APP_IN_LOG', @level2type=N'COLUMN',@level2name=N'MLRQ_REQ_DOC'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Start Entry/Change Date and Time' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_TRN_APP_IN_LOG', @level2type=N'COLUMN',@level2name=N'MLRQ_START_DATE_TIME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Status Before Change' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_TRN_APP_IN_LOG', @level2type=N'COLUMN',@level2name=N'MLRQ_STATUS_BEFORE_CHANGE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'End Date and Time' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_TRN_APP_IN_LOG', @level2type=N'COLUMN',@level2name=N'MLRQ_END_DATE_TIME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'By Program ID.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_TRN_APP_IN_LOG', @level2type=N'COLUMN',@level2name=N'MLRQ_BY_PROGRAM_ID'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Record Status' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_TRN_APP_IN_LOG', @level2type=N'COLUMN',@level2name=N'MLRQ_STATUS'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'User ID.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_TRN_APP_IN_LOG', @level2type=N'COLUMN',@level2name=N'MLRQ_USER_ID'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Creditor Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_TRN_APP_IN_LOG', @level2type=N'COLUMN',@level2name=N'MLRQ_CR_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'job run key of currently running instance of job' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_TRN_APP_IN_LOG', @level2type=N'COLUMN',@level2name=N'JOB_RUN_KEY'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Code of source system for extraction' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_TRN_APP_IN_LOG', @level2type=N'COLUMN',@level2name=N'SOURCE_SYSTEM_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Source table name extracted' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_TRN_APP_IN_LOG', @level2type=N'COLUMN',@level2name=N'SOURCE_TABLE_NAME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Flag to show y-means record marked for deletion. n - means active record' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_TRN_APP_IN_LOG', @level2type=N'COLUMN',@level2name=N'DELETED_FLAG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Comment for any changes to this record' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_TRN_APP_IN_LOG', @level2type=N'COLUMN',@level2name=N'COMMENTS'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Last update time of source' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_TRN_APP_IN_LOG', @level2type=N'COLUMN',@level2name=N'SOURCE_LAST_UPDATE_DATE_TIME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Default of record created / last updated date and time' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_TRN_APP_IN_LOG', @level2type=N'COLUMN',@level2name=N'LAST_UPDATE_DATE_TIME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Loan Application In Log Table' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_TRN_APP_IN_LOG'

GO

IF EXISTS (SELECT NAME FROM SYS.SYNONYMS WHERE NAME = N'STG_TNB_TRN_APP_IN_LOG')
	BEGIN
		DROP SYNONYM STG_TNB_TRN_APP_IN_LOG 
	END
CREATE SYNONYM STG_TNB_TRN_APP_IN_LOG FOR STG.STG_TNB_TRN_APP_IN_LOG;

USE [GL_TNB_STG]

/****** Object:  Table [STG].[STG_TNB_MST_CUSTOMER_INFO]    Script Date: 12/21/2016 8:59:09 AM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [STG].[STG_TNB_MST_CUSTOMER_INFO](
	[MINF_STATUS] [varchar](1) NULL,
	[MINF_CUSTOMER_ID] [float] NULL,
	[MINF_INVOLVED_PARTY_TYPE] [varchar](6) NULL,
	[MINF_CUSTOMER_TYPE] [varchar](2) NULL,
	[MINF_TITLE_NAME_THAI] [varchar](50) NULL,
	[MINF_FIRST_NAME_THAI] [varchar](60) NULL,
	[MINF_MIDDLE_NAME_THAI] [varchar](60) NULL,
	[MINF_LAST_NAME_THAI] [varchar](60) NULL,
	[MINF_TITLE_NAME_ENGLISH] [varchar](50) NULL,
	[MINF_FIRST_NAME_ENGLISH] [varchar](60) NULL,
	[MINF_MIDDLE_NAME_ENGLISH] [varchar](60) NULL,
	[MINF_LAST_NAME_ENGLISH] [varchar](60) NULL,
	[MINF_FIRST_NAME_THAI_IDX] [varchar](40) NULL,
	[MINF_LAST_NAME_THAI_IDX] [varchar](40) NULL,
	[MINF_FIRST_NAME_ENGLISH_IDX] [varchar](40) NULL,
	[MINF_LAST_NAME_ENGLISH_IDX] [varchar](40) NULL,
	[MINF_EMAIL_ADDR] [varchar](50) NULL,
	[MINF_MOBILE_TEL] [varchar](20) NULL,
	[MINF_MOBILE_TEL2] [varchar](20) NULL,
	[MINF_MOBILE_TEL3] [varchar](20) NULL,
	[MINF_CONTACT_DATE] [datetime] NULL,
	[MINF_BOT_NO] [varchar](7) NULL,
	[MINF_NATIONALITY] [varchar](2) NULL,
	[MINF_RESIDENCE] [varchar](2) NULL,
	[MINF_AO_CODE] [varchar](10) NULL,
	[MINF_CREDIT_CODE] [varchar](20) NULL,
	[MINF_GROUP_CODE] [varchar](10) NULL,
	[MINF_REMARK] [varchar](30) NULL,
	[MINF_CRT_USER_ID] [varchar](20) NULL,
	[MINF_CRT_DATE_TIME] [datetime] NULL,
	[MINF_MTN_TERMINAL_ID] [varchar](10) NULL,
	[MINF_MTN_PROGRAM_ID] [varchar](20) NULL,
	[MINF_MTN_BRANCH_CODE] [float] NULL,
	[MINF_MTN_USER_ID] [varchar](20) NULL,
	[MINF_MTN_DATE_TIME] [datetime] NULL,
	[MINF_APPROVED_BY] [varchar](20) NULL,
	[MINF_APPROVED_DATE] [datetime] NULL,
	[MINF_RUNNING] [float] NULL,
	[MINF_STATUS_PROCESS] [varchar](1) NULL,
	[MINF_AS400_CUSTOMER_ID] [float] NULL,
	[MINF_KYC_LEVEL] [varchar](1) NULL,
	[MINF_FLAG] [char](1) NULL,
	[MINF_NICK_NAME] [varchar](30) NULL,
	[MINF_ID_CARD] [varchar](15) NULL,
	[MINF_CUST_BRN_ID] [float] NULL,
	[MINF_LETTER_RETURN_FLAG] [varchar](1) NULL,
	[MINF_LETTER_RETURN_REASON] [varchar](1) NULL,
	[MINF_LETTER_RETURN_DATE] [datetime] NULL,
	[MINF_ASSET_AMOUNT] [float] NULL,
	[MINF_TOTAL_STAFF] [float] NULL,
	[JOB_RUN_KEY] [bigint] NOT NULL,
	[SOURCE_SYSTEM_CODE] [varchar](10) NOT NULL,
	[SOURCE_TABLE_NAME] [varchar](15) NOT NULL,
	[DELETED_FLAG] [char](1) NOT NULL,
	[COMMENTS] [varchar](500) NULL,
	[SOURCE_LAST_UPDATE_DATE_TIME] [datetime] NOT NULL,
	[LAST_UPDATE_DATE_TIME] [datetime] NOT NULL
) ON [PRIMARY]

ALTER TABLE [STG].[STG_TNB_MST_CUSTOMER_INFO] ADD  DEFAULT ('N') FOR [DELETED_FLAG]
ALTER TABLE [STG].[STG_TNB_MST_CUSTOMER_INFO] ADD  DEFAULT (getdate()) FOR [LAST_UPDATE_DATE_TIME]

EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'สถานะข้อมูล' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_STATUS'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'รหัสลูกค้า' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_CUSTOMER_ID'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Involved Party Type' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_INVOLVED_PARTY_TYPE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'ประเภทลูกค้า' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_CUSTOMER_TYPE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'คำนำหน้า' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_TITLE_NAME_THAI'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'ชื่อ' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_FIRST_NAME_THAI'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'ชื่อกลาง' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_MIDDLE_NAME_THAI'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'นามสกุล' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_LAST_NAME_THAI'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'คำนำหน้าอังกฤษ' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_TITLE_NAME_ENGLISH'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'ชื่ออังกฤษ' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_FIRST_NAME_ENGLISH'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'ชื่อกลางอังกฤษ' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_MIDDLE_NAME_ENGLISH'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'นามสกุลอังกฤษ' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_LAST_NAME_ENGLISH'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Index ชื่อ' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_FIRST_NAME_THAI_IDX'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Index นามสกุล' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_LAST_NAME_THAI_IDX'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Index ชื่ออังกฤษ' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_FIRST_NAME_ENGLISH_IDX'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Index นามสกุลอังกฤษ' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_LAST_NAME_ENGLISH_IDX'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Email Address.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_EMAIL_ADDR'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'โทร.มือถือ 1' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_MOBILE_TEL'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'โทร.มือถือ 2' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_MOBILE_TEL2'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'โทร.มือถือ 3' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_MOBILE_TEL3'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'วันที่ติดต่อ' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_CONTACT_DATE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'BOT No.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_BOT_NO'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'สัญชาติ' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_NATIONALITY'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'เชื้อชาติ' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_RESIDENCE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'A/O Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_AO_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Credit Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_CREDIT_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'กลุ่มลูกค้า' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_GROUP_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'หมายเหตุ' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_REMARK'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'User ID.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_CRT_USER_ID'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Date Time Create' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_CRT_DATE_TIME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Terminal ID.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_MTN_TERMINAL_ID'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Program ID.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_MTN_PROGRAM_ID'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Branch Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_MTN_BRANCH_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'User ID.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_MTN_USER_ID'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Date Time Update' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_MTN_DATE_TIME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'อนุมัติโดย' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_APPROVED_BY'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'วันที่อนุมัติ' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_APPROVED_DATE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Running No.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_RUNNING'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'สถานะประมวลผล' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_STATUS_PROCESS'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'MINF_AS400_CUSTOMER_ID' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_AS400_CUSTOMER_ID'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'KYC Level' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_KYC_LEVEL'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Flag' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_FLAG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'ชื่อเล่น' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_NICK_NAME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'เลขที่บัตร' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_ID_CARD'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'MINF_CUST_BRN_ID' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_CUST_BRN_ID'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'ไม่ส่งเอกสารให้ลูกค้า เนื่องจากเอกสารตีคืน' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_LETTER_RETURN_FLAG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'เหตุผล' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_LETTER_RETURN_REASON'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'วันที่เอกสารตีคืน' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_LETTER_RETURN_DATE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'MINF_ASSET_AMOUNT' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_ASSET_AMOUNT'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'MINF_TOTAL_STAFF' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'MINF_TOTAL_STAFF'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'job run key of currently running instance of job' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'JOB_RUN_KEY'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Code of source system for extraction' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'SOURCE_SYSTEM_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Source table name extracted' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'SOURCE_TABLE_NAME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Flag to show y-means record marked for deletion. n - means active record' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'DELETED_FLAG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Comment for any changes to this record' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'COMMENTS'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Last update time of source' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'SOURCE_LAST_UPDATE_DATE_TIME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Default of record created / last updated date and time' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO', @level2type=N'COLUMN',@level2name=N'LAST_UPDATE_DATE_TIME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Customer Information Table' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUSTOMER_INFO'

GO

IF EXISTS (SELECT NAME FROM SYS.SYNONYMS WHERE NAME = N'STG_TNB_MST_CUSTOMER_INFO')
	BEGIN
		DROP SYNONYM STG_TNB_MST_CUSTOMER_INFO 
	END
CREATE SYNONYM STG_TNB_MST_CUSTOMER_INFO FOR STG.STG_TNB_MST_CUSTOMER_INFO;

USE [GL_TNB_STG]

/****** Object:  Table [STG].[STG_TNB_MST_LOAN_CUST]    Script Date: 12/21/2016 9:17:42 AM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [STG].[STG_TNB_MST_LOAN_CUST](
	[MLMC_REC_STS] [varchar](1) NULL,
	[MLMC_LN_TYP] [varchar](2) NULL,
	[MLMC_BRN_DOC] [float] NULL,
	[MLMC_REQ_DOC] [float] NULL,
	[MLMC_DOC_NO] [float] NULL,
	[MLMC_CHECK_DIGIT] [float] NULL,
	[MLMC_CIS_NO] [float] NULL,
	[MLMC_CIS_TYPE] [varchar](1) NULL,
	[MLMC_INCOME_AMOUNT] [float] NULL,
	[MLMC_LIABILITY_AMOUNT] [float] NULL,
	[MLMC_RELATION_TYPE] [varchar](2) NULL,
	[MLMC_INCOME_FLAG] [varchar](1) NULL,
	[MLMC_CHECKER_CODE] [varchar](10) NULL,
	[MLMC_NONEED_FLAG] [char](1) NULL,
	[MLMC_SPECIAL_ADDR_FLAG] [char](1) NULL,
	[MLMC_FLAG] [char](1) NULL,
	[MLMC_CONSENT_RECEIVED_FLAG] [char](1) NULL,
	[MLMC_CONSENT_RECEIVED_DATE] [datetime] NULL,
	[MLMC_CONSENT_RECEIVED_USER_ID] [varchar](20) NULL,
	[JOB_RUN_KEY] [bigint] NOT NULL,
	[SOURCE_SYSTEM_CODE] [varchar](10) NOT NULL,
	[SOURCE_TABLE_NAME] [varchar](15) NOT NULL,
	[DELETED_FLAG] [char](1) NOT NULL,
	[SOURCE_LAST_UPDATE_DATE_TIME] [datetime] NOT NULL,
	[LAST_UPDATE_DATE_TIME] [datetime] NOT NULL
) ON [PRIMARY]

ALTER TABLE [STG].[STG_TNB_MST_LOAN_CUST] ADD  DEFAULT ('N') FOR [DELETED_FLAG]
ALTER TABLE [STG].[STG_TNB_MST_LOAN_CUST] ADD  DEFAULT (getdate()) FOR [LAST_UPDATE_DATE_TIME]

EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Record Status' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_LOAN_CUST', @level2type=N'COLUMN',@level2name=N'MLMC_REC_STS'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Loan Type' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_LOAN_CUST', @level2type=N'COLUMN',@level2name=N'MLMC_LN_TYP'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Branch Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_LOAN_CUST', @level2type=N'COLUMN',@level2name=N'MLMC_BRN_DOC'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Request No.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_LOAN_CUST', @level2type=N'COLUMN',@level2name=N'MLMC_REQ_DOC'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Contract No.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_LOAN_CUST', @level2type=N'COLUMN',@level2name=N'MLMC_DOC_NO'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Transfer No.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_LOAN_CUST', @level2type=N'COLUMN',@level2name=N'MLMC_CHECK_DIGIT'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'CIS No.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_LOAN_CUST', @level2type=N'COLUMN',@level2name=N'MLMC_CIS_NO'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'CIS Type (1=Customer, 3=Guarantor)' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_LOAN_CUST', @level2type=N'COLUMN',@level2name=N'MLMC_CIS_TYPE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Toal Income Amount ' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_LOAN_CUST', @level2type=N'COLUMN',@level2name=N'MLMC_INCOME_AMOUNT'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Toal Liability Amount' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_LOAN_CUST', @level2type=N'COLUMN',@level2name=N'MLMC_LIABILITY_AMOUNT'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Relation Type' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_LOAN_CUST', @level2type=N'COLUMN',@level2name=N'MLMC_RELATION_TYPE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Income Flag' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_LOAN_CUST', @level2type=N'COLUMN',@level2name=N'MLMC_INCOME_FLAG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Checker Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_LOAN_CUST', @level2type=N'COLUMN',@level2name=N'MLMC_CHECKER_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'No Need Flag' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_LOAN_CUST', @level2type=N'COLUMN',@level2name=N'MLMC_NONEED_FLAG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Special Address Flag' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_LOAN_CUST', @level2type=N'COLUMN',@level2name=N'MLMC_SPECIAL_ADDR_FLAG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Flag For Process' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_LOAN_CUST', @level2type=N'COLUMN',@level2name=N'MLMC_FLAG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Consent Received Flag' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_LOAN_CUST', @level2type=N'COLUMN',@level2name=N'MLMC_CONSENT_RECEIVED_FLAG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Consent Received Date' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_LOAN_CUST', @level2type=N'COLUMN',@level2name=N'MLMC_CONSENT_RECEIVED_DATE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Consent Received by User ID.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_LOAN_CUST', @level2type=N'COLUMN',@level2name=N'MLMC_CONSENT_RECEIVED_USER_ID'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'job run key of currently running instance of job' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_LOAN_CUST', @level2type=N'COLUMN',@level2name=N'JOB_RUN_KEY'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Code of source system for extraction' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_LOAN_CUST', @level2type=N'COLUMN',@level2name=N'SOURCE_SYSTEM_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Source table name extracted' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_LOAN_CUST', @level2type=N'COLUMN',@level2name=N'SOURCE_TABLE_NAME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Delete flag' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_LOAN_CUST', @level2type=N'COLUMN',@level2name=N'DELETED_FLAG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Last update time of source' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_LOAN_CUST', @level2type=N'COLUMN',@level2name=N'SOURCE_LAST_UPDATE_DATE_TIME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'record created / last updated date and time' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_LOAN_CUST', @level2type=N'COLUMN',@level2name=N'LAST_UPDATE_DATE_TIME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Loan Master Customer' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_LOAN_CUST'

GO

IF EXISTS (SELECT NAME FROM SYS.SYNONYMS WHERE NAME = N'STG_TNB_MST_LOAN_CUST')
	BEGIN
		DROP SYNONYM STG_TNB_MST_LOAN_CUST 
	END
CREATE SYNONYM STG_TNB_MST_LOAN_CUST FOR STG.STG_TNB_MST_LOAN_CUST;

USE [GL_TNB_STG]

/****** Object:  Table [STG].[STG_TNB_MST_BRANCH_FILE]    Script Date: 12/21/2016 9:19:09 AM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [STG].[STG_TNB_MST_BRANCH_FILE](
	[MBRN_STATUS] [varchar](1) NULL,
	[MBRN_COM_CODE] [varchar](5) NULL,
	[MBRN_CODE] [float] NULL,
	[MBRN_FULL_NAME_THAI] [varchar](60) NULL,
	[MBRN_SHORT_NAME_THAI] [varchar](25) NULL,
	[MBRN_FULL_NAME_ENGLISH] [varchar](60) NULL,
	[MBRN_SHORT_NAME_ENGLISH] [varchar](25) NULL,
	[MBRN_ADDR_NO] [varchar](20) NULL,
	[MBRN_ADDR_MOO] [varchar](50) NULL,
	[MBRN_ADDR_BUILDING] [varchar](50) NULL,
	[MBRN_ADDR_SOI] [varchar](50) NULL,
	[MBRN_ADDR_ROAD] [varchar](50) NULL,
	[MBRN_ADDR_TUMPON] [varchar](50) NULL,
	[MBRN_ADDR_AMPUR] [varchar](50) NULL,
	[MBRN_ADDR_CHANGWAT] [varchar](50) NULL,
	[MBRN_ADDR_ZIP_CODE] [varchar](10) NULL,
	[MBRN_TELEPHONE] [varchar](50) NULL,
	[MBRN_FAX_NO] [varchar](30) NULL,
	[MBRN_EMAIL_ADDR] [varchar](50) NULL,
	[MBRN_TAX_ID] [varchar](20) NULL,
	[MBRN_MTN_TERMINAL_ID] [varchar](10) NULL,
	[MBRN_MTN_PROGRAM_ID] [varchar](20) NULL,
	[MBRN_MTN_BRANCH_CODE] [float] NULL,
	[MBRN_MTN_USER_ID] [varchar](20) NULL,
	[MBRN_MTN_DATE_TIME] [datetime] NULL,
	[MBRN_REMITTANCE_GROUP] [varchar](10) NULL,
	[MBRN_INTER_ACC_NO] [varchar](20) NULL,
	[MBRN_INTER_SUBSIDARY] [varchar](10) NULL,
	[MBRN_INTER_SUB_LEDGER] [varchar](10) NULL,
	[MBRN_INTER_ACC_NO_CANCEL] [varchar](20) NULL,
	[MBRN_INTER_SUBSIDARY_CANCEL] [varchar](10) NULL,
	[MBRN_INTER_SUB_LEDGER_CANCEL] [varchar](10) NULL,
	[MBRN_AREA_CODE] [varchar](2) NULL,
	[MBRN_COLLECTOR_HEAD_OF_BRANCH] [varchar](20) NULL,
	[MBRN_COLLECTOR_TEL_EXT] [varchar](20) NULL,
	[JOB_RUN_KEY] [bigint] NOT NULL,
	[SOURCE_SYSTEM_CODE] [varchar](10) NOT NULL,
	[SOURCE_TABLE_NAME] [varchar](15) NOT NULL,
	[DELETED_FLAG] [char](1) NOT NULL,
	[COMMENTS] [varchar](500) NULL,
	[SOURCE_LAST_UPDATE_DATE_TIME] [datetime] NOT NULL,
	[LAST_UPDATE_DATE_TIME] [datetime] NOT NULL
) ON [PRIMARY]

ALTER TABLE [STG].[STG_TNB_MST_BRANCH_FILE] ADD  DEFAULT ('N') FOR [DELETED_FLAG]
ALTER TABLE [STG].[STG_TNB_MST_BRANCH_FILE] ADD  DEFAULT (getdate()) FOR [LAST_UPDATE_DATE_TIME]

GO

IF EXISTS (SELECT NAME FROM SYS.SYNONYMS WHERE NAME = N'STG_TNB_MST_BRANCH_FILE')
	BEGIN
		DROP SYNONYM STG_TNB_MST_BRANCH_FILE 
	END
CREATE SYNONYM STG_TNB_MST_BRANCH_FILE FOR STG.STG_TNB_MST_BRANCH_FILE;