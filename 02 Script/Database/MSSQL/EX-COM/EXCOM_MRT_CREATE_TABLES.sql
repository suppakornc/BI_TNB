USE [GL_TNB_MRT]
GO
--Create MRT_TNB_DIM_REQ_STATUS_GRP table

IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'MRT_TNB_DIM_REQ_STATUS_GRP')
	BEGIN
		DROP TABLE DIM.MRT_TNB_DIM_REQ_STATUS_GRP
	END
GO

USE [GL_TNB_MRT]
GO
/****** Object:  Table [DIM].[MRT_TNB_DIM_REQ_STATUS_GRP]    Script Date: 12/22/2016 9:29:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [DIM].[MRT_TNB_DIM_REQ_STATUS_GRP](
	[SK_REQ_STATUS_GRP_KEY] [bigint] NOT NULL,
	[REQ_STATUS_GRP_CODE] [varchar](10) NOT NULL,
	[REQ_STATUS_GRP_DESC] [varchar](30) NOT NULL,
	[COMMENTS] [varchar](500) NULL,
	[LAST_UPDATE_DATE_TIME] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SK_REQ_STATUS_GRP_KEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];

ALTER TABLE [DIM].[MRT_TNB_DIM_REQ_STATUS_GRP] ADD  DEFAULT (getdate()) FOR [LAST_UPDATE_DATE_TIME];

IF EXISTS (SELECT NAME FROM SYS.SYNONYMS WHERE NAME = N'MRT_TNB_DIM_REQ_STATUS_GRP')
	BEGIN
		DROP SYNONYM MRT_TNB_DIM_REQ_STATUS_GRP 
	END
CREATE SYNONYM MRT_TNB_DIM_REQ_STATUS_GRP FOR DIM.MRT_TNB_DIM_REQ_STATUS_GRP;

EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Surrogate Key of Request Status Group Code' , @level0type=N'SCHEMA',@level0name=N'DIM', @level1type=N'TABLE',@level1name=N'MRT_TNB_DIM_REQ_STATUS_GRP', @level2type=N'COLUMN',@level2name=N'SK_REQ_STATUS_GRP_KEY'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Request Status Group Code' , @level0type=N'SCHEMA',@level0name=N'DIM', @level1type=N'TABLE',@level1name=N'MRT_TNB_DIM_REQ_STATUS_GRP', @level2type=N'COLUMN',@level2name=N'REQ_STATUS_GRP_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Request Status Group Name' , @level0type=N'SCHEMA',@level0name=N'DIM', @level1type=N'TABLE',@level1name=N'MRT_TNB_DIM_REQ_STATUS_GRP', @level2type=N'COLUMN',@level2name=N'REQ_STATUS_GRP_DESC'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Comment for any changes to this record' , @level0type=N'SCHEMA',@level0name=N'DIM', @level1type=N'TABLE',@level1name=N'MRT_TNB_DIM_REQ_STATUS_GRP', @level2type=N'COLUMN',@level2name=N'COMMENTS'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Default of record created / last updated date and time' , @level0type=N'SCHEMA',@level0name=N'DIM', @level1type=N'TABLE',@level1name=N'MRT_TNB_DIM_REQ_STATUS_GRP', @level2type=N'COLUMN',@level2name=N'LAST_UPDATE_DATE_TIME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Table of Request Status Group Code' , @level0type=N'SCHEMA',@level0name=N'DIM', @level1type=N'TABLE',@level1name=N'MRT_TNB_DIM_REQ_STATUS_GRP'

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': MRT_TNB_DIM_REQ_STATUS_GRP TABLE CREATED.'

--Create MRT_TNB_DIM_REQ_STATUS_GRP table

USE [GL_TNB_MRT]
GO

IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'MRT_TNB_FCT_APPROVAL_LEADTIME')
	BEGIN
		DROP TABLE FACT.MRT_TNB_FCT_APPROVAL_LEADTIME
	END

/****** Object:  Table [FACT].[MRT_TNB_FCT_APPROVAL_LEADTIME]    Script Date: 12/22/2016 9:35:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [FACT].[MRT_TNB_FCT_APPROVAL_LEADTIME](
	[SK_DATE_KEY] [bigint] NOT NULL,
	[SK_BRANCH_KEY] [bigint] NOT NULL,
	[SK_DEALER_KEY] [bigint] NOT NULL,
	[SK_PRODUCT_KEY] [bigint] NOT NULL,
	[REQ_STATUS_GRP_CODE] [varchar](10) NOT NULL,
	[TOTAL_DURATION] [float] NULL,
	[TOTAL_REQUEST] [float] NULL,
	[COMMENTS] [varchar](500) NULL,
	[LAST_UPDATE_DATE_TIME] [datetime] NOT NULL
) ON [PRIMARY];

ALTER TABLE [FACT].[MRT_TNB_FCT_APPROVAL_LEADTIME] ADD  DEFAULT (getdate()) FOR [LAST_UPDATE_DATE_TIME];

EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Surrogate Key to increment number of primary key of date column' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_APPROVAL_LEADTIME', @level2type=N'COLUMN',@level2name=N'SK_DATE_KEY'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Surrogate Key to increment number of primary key of branch column' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_APPROVAL_LEADTIME', @level2type=N'COLUMN',@level2name=N'SK_BRANCH_KEY'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Surrogate Key to increment number of primary key of dealer column' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_APPROVAL_LEADTIME', @level2type=N'COLUMN',@level2name=N'SK_DEALER_KEY'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Surrogate Key to increment number of primary key of product column' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_APPROVAL_LEADTIME', @level2type=N'COLUMN',@level2name=N'SK_PRODUCT_KEY'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Request status group code defined by DWH' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_APPROVAL_LEADTIME', @level2type=N'COLUMN',@level2name=N'REQ_STATUS_GRP_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Total duration of each dimensions' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_APPROVAL_LEADTIME', @level2type=N'COLUMN',@level2name=N'TOTAL_DURATION'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Total application request' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_APPROVAL_LEADTIME', @level2type=N'COLUMN',@level2name=N'TOTAL_REQUEST'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Comment for any changes to this record' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_APPROVAL_LEADTIME', @level2type=N'COLUMN',@level2name=N'COMMENTS'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Default of record created / last updated date and time' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_APPROVAL_LEADTIME', @level2type=N'COLUMN',@level2name=N'LAST_UPDATE_DATE_TIME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Table of Duration in each step of approval' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_APPROVAL_LEADTIME'

IF EXISTS (SELECT NAME FROM SYS.SYNONYMS WHERE NAME = N'MRT_TNB_FCT_APPROVAL_LEADTIME')
	BEGIN
		DROP SYNONYM MRT_TNB_FCT_APPROVAL_LEADTIME 
	END
GO

CREATE SYNONYM MRT_TNB_FCT_APPROVAL_LEADTIME FOR FACT.MRT_TNB_FCT_APPROVAL_LEADTIME;

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': MRT_TNB_FCT_APPROVAL_LEADTIME TABLE CREATED.'

--Create MRT_TNB_FCT_BRANCH_AND_DEALER table

USE [GL_TNB_MRT]
GO

IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'MRT_TNB_FCT_BRANCH_AND_DEALER')
	BEGIN
		DROP TABLE FACT.MRT_TNB_FCT_BRANCH_AND_DEALER
	END
GO
/****** Object:  Table [FACT].[MRT_TNB_FCT_BRANCH_AND_DEALER]    Script Date: 12/22/2016 9:37:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [FACT].[MRT_TNB_FCT_BRANCH_AND_DEALER](
	[DATA_YEAR] [int] NOT NULL,
	[DATA_MONTH] [int] NOT NULL,
	[TOTAL_BRANCH] [float] NULL,
	[TOTAL_DEALER] [float] NULL,
	[TOTAL_ACTIVE_DEALER] [float] NULL,
	[TOTAL_APPROVE] [float] NULL,
	[COMMENTS] [varchar](500) NULL,
	[LAST_UPDATE_DATE_TIME] [datetime] NOT NULL
) ON [PRIMARY];

ALTER TABLE [FACT].[MRT_TNB_FCT_BRANCH_AND_DEALER] ADD  DEFAULT (getdate()) FOR [LAST_UPDATE_DATE_TIME];

EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Year of data' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_BRANCH_AND_DEALER', @level2type=N'COLUMN',@level2name=N'DATA_YEAR'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Month of data' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_BRANCH_AND_DEALER', @level2type=N'COLUMN',@level2name=N'DATA_MONTH'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Total number of branch' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_BRANCH_AND_DEALER', @level2type=N'COLUMN',@level2name=N'TOTAL_BRANCH'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Total number of dealer' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_BRANCH_AND_DEALER', @level2type=N'COLUMN',@level2name=N'TOTAL_DEALER'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Total number of active dealer' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_BRANCH_AND_DEALER', @level2type=N'COLUMN',@level2name=N'TOTAL_ACTIVE_DEALER'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Total number of smart dealer approved application' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_BRANCH_AND_DEALER', @level2type=N'COLUMN',@level2name=N'TOTAL_APPROVE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Comment for any changes to this record' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_BRANCH_AND_DEALER', @level2type=N'COLUMN',@level2name=N'COMMENTS'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Default of record created / last updated date and time' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_BRANCH_AND_DEALER', @level2type=N'COLUMN',@level2name=N'LAST_UPDATE_DATE_TIME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Branch and Dealer table' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_BRANCH_AND_DEALER'

IF EXISTS (SELECT NAME FROM SYS.SYNONYMS WHERE NAME = N'MRT_TNB_FCT_BRANCH_AND_DEALER')
	BEGIN
		DROP SYNONYM MRT_TNB_FCT_BRANCH_AND_DEALER 
	END
GO

CREATE SYNONYM MRT_TNB_FCT_BRANCH_AND_DEALER FOR FACT.MRT_TNB_FCT_BRANCH_AND_DEALER;

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': MRT_TNB_FCT_BRANCH_AND_DEALER TABLE CREATED.'
GO

--Create MRT_TNB_FCT_VINTAGE_PERF table

USE [GL_TNB_MRT]
GO

/****** Object:  Table [FACT].[MRT_TNB_FCT_VINTAGE_PERF]    Script Date: 12/22/2016 9:39:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [FACT].[MRT_TNB_FCT_VINTAGE_PERF](
	[SK_DATE_KEY] [bigint] NOT NULL,
	[SK_PRODUCT_KEY] [bigint] NOT NULL,
	[CK_MOB] [bigint] NOT NULL,
	[BOT_A_FINANCE_AMT] [float] NULL,
	[BOT_M_FINANCE_AMT] [float] NULL,
	[BOT_S_FINANCE_AMT] [float] NULL,
	[BOT_D_FINANCE_AMT] [float] NULL,
	[BOT_L_FINANCE_AMT] [float] NULL,
	[BEGIN_FINANCE_AMOUNT] [float] NULL,
	[COMMENTS] [varchar](500) NULL,
	[LAST_UPDATE_DATE_TIME] [datetime] NOT NULL
) ON [PRIMARY];

ALTER TABLE [FACT].[MRT_TNB_FCT_VINTAGE_PERF] ADD  DEFAULT (getdate()) FOR [LAST_UPDATE_DATE_TIME];

EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Surrogate Key to increment number of primary key of date column' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_VINTAGE_PERF', @level2type=N'COLUMN',@level2name=N'SK_DATE_KEY'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Surrogate Key to increment number of primary key of product column' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_VINTAGE_PERF', @level2type=N'COLUMN',@level2name=N'SK_PRODUCT_KEY'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Installment period of each contract start with 0' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_VINTAGE_PERF', @level2type=N'COLUMN',@level2name=N'CK_MOB'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Total finance amount of BOT Class A' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_VINTAGE_PERF', @level2type=N'COLUMN',@level2name=N'BOT_A_FINANCE_AMT'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Total finance amount of BOT Class M' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_VINTAGE_PERF', @level2type=N'COLUMN',@level2name=N'BOT_M_FINANCE_AMT'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Total finance amount of BOT Class S' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_VINTAGE_PERF', @level2type=N'COLUMN',@level2name=N'BOT_S_FINANCE_AMT'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Total finance amount of BOT Class D' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_VINTAGE_PERF', @level2type=N'COLUMN',@level2name=N'BOT_D_FINANCE_AMT'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Total finance amount of BOT Class L' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_VINTAGE_PERF', @level2type=N'COLUMN',@level2name=N'BOT_L_FINANCE_AMT'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Total finance amount' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_VINTAGE_PERF', @level2type=N'COLUMN',@level2name=N'BEGIN_FINANCE_AMOUNT'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Comment for any changes to this record' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_VINTAGE_PERF', @level2type=N'COLUMN',@level2name=N'COMMENTS'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Default of record created / last updated date and time' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_VINTAGE_PERF', @level2type=N'COLUMN',@level2name=N'LAST_UPDATE_DATE_TIME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Table of Vintage Performance' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_VINTAGE_PERF'

IF EXISTS (SELECT NAME FROM SYS.SYNONYMS WHERE NAME = N'MRT_TNB_FCT_VINTAGE_PERF')
	BEGIN
		DROP SYNONYM MRT_TNB_FCT_VINTAGE_PERF 
	END
CREATE SYNONYM MRT_TNB_FCT_VINTAGE_PERF FOR FACT.MRT_TNB_FCT_VINTAGE_PERF;

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': MRT_TNB_FCT_VINTAGE_PERF TABLE CREATED.'

--Create MRT_TNB_FCT_REPOSSESSION table

USE [GL_TNB_MRT]

/****** Object:  Table [FACT].[MRT_TNB_FCT_REPOSSESSION]    Script Date: 12/22/2016 10:10:18 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE TABLE [FACT].[MRT_TNB_FCT_REPOSSESSION](
	[SK_DATE_KEY] [bigint] NOT NULL,
	[SK_PRODUCT_KEY] [bigint] NOT NULL,
	[SK_BRANCH_KEY] [bigint] NOT NULL,
	[SK_DEALER_KEY] [bigint] NOT NULL,
	[TOTAL_REPO_UNIT] [float] NULL,
	[TOTAL_UNIT] [float] NULL,
	[TOTAL_REPO_PAID_PERIOD] [float] NULL,
	[TOTAL_REPO_OVERDUE_PERIOD] [float] NULL,
	[TOTAL_TERM_TO_REPO] [float] NULL,
	[COMMENTS] [varchar](500) NULL,
	[LAST_UPDATE_DATE_TIME] [datetime] NOT NULL
) ON [PRIMARY]

ALTER TABLE [FACT].[MRT_TNB_FCT_REPOSSESSION] ADD  DEFAULT (getdate()) FOR [LAST_UPDATE_DATE_TIME]

EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Surrogate Key to increment number of primary key of date column' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_REPOSSESSION', @level2type=N'COLUMN',@level2name=N'SK_DATE_KEY'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Surrogate Key to increment number of primary key of product column' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_REPOSSESSION', @level2type=N'COLUMN',@level2name=N'SK_PRODUCT_KEY'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Surrogate Key to increment number of primary key of branch column' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_REPOSSESSION', @level2type=N'COLUMN',@level2name=N'SK_BRANCH_KEY'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Surrogate Key to increment number of primary key of dealer column' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_REPOSSESSION', @level2type=N'COLUMN',@level2name=N'SK_DEALER_KEY'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Total units of repossession' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_REPOSSESSION', @level2type=N'COLUMN',@level2name=N'TOTAL_REPO_UNIT'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Total units' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_REPOSSESSION', @level2type=N'COLUMN',@level2name=N'TOTAL_UNIT'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Total pay period of reposession' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_REPOSSESSION', @level2type=N'COLUMN',@level2name=N'TOTAL_REPO_PAID_PERIOD'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Total overdue period of reposession' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_REPOSSESSION', @level2type=N'COLUMN',@level2name=N'TOTAL_REPO_OVERDUE_PERIOD'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Total period of reposession' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_REPOSSESSION', @level2type=N'COLUMN',@level2name=N'TOTAL_TERM_TO_REPO'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Comment for any changes to this record' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_REPOSSESSION', @level2type=N'COLUMN',@level2name=N'COMMENTS'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Default of record created / last updated date and time' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_REPOSSESSION', @level2type=N'COLUMN',@level2name=N'LAST_UPDATE_DATE_TIME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Table of Repossession data' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_REPOSSESSION'

IF EXISTS (SELECT NAME FROM SYS.SYNONYMS WHERE NAME = N'MRT_TNB_FCT_REPOSSESSION')
	BEGIN
		DROP SYNONYM MRT_TNB_FCT_REPOSSESSION 
	END
CREATE SYNONYM MRT_TNB_FCT_REPOSSESSION FOR FACT.MRT_TNB_FCT_REPOSSESSION;

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': MRT_TNB_FCT_REPOSSESSION TABLE CREATED.'

--Create MRT_TNB_FCT_CONTRACT_QUALITY table

USE [GL_TNB_MRT]

/****** Object:  Table [FACT].[MRT_TNB_FCT_CONTRACT_QUALITY]    Script Date: 12/22/2016 10:12:47 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE TABLE [FACT].[MRT_TNB_FCT_CONTRACT_QUALITY](
	[SK_DATE_KEY] [bigint] NOT NULL,
	[SK_PRODUCT_KEY] [bigint] NOT NULL,
	[SK_BRANCH_KEY] [bigint] NOT NULL,
	[SK_DEALER_KEY] [bigint] NOT NULL,
	[SK_BOT_CLASS_KEY] [bigint] NOT NULL,
	[TOTAL_FIRST_DUE_CONTRACT] [float] NULL,
	[TOTAL_OVERDUE_CONTRACT] [float] NULL,
	[TOTAL_OS_PRINCIPAL] [float] NULL,
	[COMMENTS] [varchar](500) NULL,
	[LAST_UPDATE_DATE_TIME] [datetime] NOT NULL
) ON [PRIMARY]

ALTER TABLE [FACT].[MRT_TNB_FCT_CONTRACT_QUALITY] ADD  DEFAULT (getdate()) FOR [LAST_UPDATE_DATE_TIME]

EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Surrogate Key to increment number of primary key of date column' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_CONTRACT_QUALITY', @level2type=N'COLUMN',@level2name=N'SK_DATE_KEY'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Surrogate Key to increment number of primary key of product column' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_CONTRACT_QUALITY', @level2type=N'COLUMN',@level2name=N'SK_PRODUCT_KEY'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Surrogate Key to increment number of primary key of branch column' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_CONTRACT_QUALITY', @level2type=N'COLUMN',@level2name=N'SK_BRANCH_KEY'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Surrogate Key to increment number of primary key of dealer column' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_CONTRACT_QUALITY', @level2type=N'COLUMN',@level2name=N'SK_DEALER_KEY'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Surrogate Key to increment number of primary key of BOT class column' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_CONTRACT_QUALITY', @level2type=N'COLUMN',@level2name=N'SK_BOT_CLASS_KEY'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Total number of 1st due contract' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_CONTRACT_QUALITY', @level2type=N'COLUMN',@level2name=N'TOTAL_FIRST_DUE_CONTRACT'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Total number of overdue contract' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_CONTRACT_QUALITY', @level2type=N'COLUMN',@level2name=N'TOTAL_OVERDUE_CONTRACT'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Total principal balance' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_CONTRACT_QUALITY', @level2type=N'COLUMN',@level2name=N'TOTAL_OS_PRINCIPAL'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Comment for any changes to this record' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_CONTRACT_QUALITY', @level2type=N'COLUMN',@level2name=N'COMMENTS'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Default of record created / last updated date and time' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_CONTRACT_QUALITY', @level2type=N'COLUMN',@level2name=N'LAST_UPDATE_DATE_TIME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Table of Contract Month-End' , @level0type=N'SCHEMA',@level0name=N'FACT', @level1type=N'TABLE',@level1name=N'MRT_TNB_FCT_CONTRACT_QUALITY'

IF EXISTS (SELECT NAME FROM SYS.SYNONYMS WHERE NAME = N'MRT_TNB_FCT_CONTRACT_QUALITY')
	BEGIN
		DROP SYNONYM MRT_TNB_FCT_CONTRACT_QUALITY 
	END
CREATE SYNONYM MRT_TNB_FCT_CONTRACT_QUALITY FOR FACT.MRT_TNB_FCT_CONTRACT_QUALITY;

--Create --Create MRT_TNB_FCT_CONTRACT_QUALITY table
USE [GL_TNB_MRT]

/****** Object:  Table [DIM].[MRT_TNB_DIM_REPORT_TOPICS]    Script Date: 12/22/2016 1:56:59 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE TABLE [DIM].[MRT_TNB_DIM_REPORT_TOPICS](
	[SK_REPORT_TOPICS_KEY] [bigint] NOT NULL,
	[REPORT_GROUP_NAME] [varchar](20) NOT NULL,
	[REPORT_TOPIC_NAME] [varchar](50) NOT NULL,
	[COMMENTS] [varchar](500) NULL,
	[LAST_UPDATE_DATE_TIME] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SK_REPORT_TOPICS_KEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [DIM].[MRT_TNB_DIM_REPORT_TOPICS] ADD  DEFAULT (getdate()) FOR [LAST_UPDATE_DATE_TIME]

EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Surrogate Key of Report Topic Code' , @level0type=N'SCHEMA',@level0name=N'DIM', @level1type=N'TABLE',@level1name=N'MRT_TNB_DIM_REPORT_TOPICS', @level2type=N'COLUMN',@level2name=N'SK_REPORT_TOPICS_KEY'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Report Group Name : "Sale,Credit,Collection,Accounting"' , @level0type=N'SCHEMA',@level0name=N'DIM', @level1type=N'TABLE',@level1name=N'MRT_TNB_DIM_REPORT_TOPICS', @level2type=N'COLUMN',@level2name=N'REPORT_GROUP_NAME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Report Topic Name' , @level0type=N'SCHEMA',@level0name=N'DIM', @level1type=N'TABLE',@level1name=N'MRT_TNB_DIM_REPORT_TOPICS', @level2type=N'COLUMN',@level2name=N'REPORT_TOPIC_NAME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Comment for any changes to this record' , @level0type=N'SCHEMA',@level0name=N'DIM', @level1type=N'TABLE',@level1name=N'MRT_TNB_DIM_REPORT_TOPICS', @level2type=N'COLUMN',@level2name=N'COMMENTS'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Default of record created / last updated date and time' , @level0type=N'SCHEMA',@level0name=N'DIM', @level1type=N'TABLE',@level1name=N'MRT_TNB_DIM_REPORT_TOPICS', @level2type=N'COLUMN',@level2name=N'LAST_UPDATE_DATE_TIME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Table of Report Topic Code' , @level0type=N'SCHEMA',@level0name=N'DIM', @level1type=N'TABLE',@level1name=N'MRT_TNB_DIM_REPORT_TOPICS'

TRUNCATE TABLE [DIM].[MRT_TNB_DIM_REPORT_TOPICS]

INSERT INTO [DIM].[MRT_TNB_DIM_REPORT_TOPICS] (SK_REPORT_TOPICS_KEY,REPORT_GROUP_NAME,REPORT_TOPIC_NAME) VALUES ('1','Sale','New Volumes and Approval')
INSERT INTO [DIM].[MRT_TNB_DIM_REPORT_TOPICS] (SK_REPORT_TOPICS_KEY,REPORT_GROUP_NAME,REPORT_TOPIC_NAME) VALUES ('2','Sale','Branch and Dealer Expansion')
INSERT INTO [DIM].[MRT_TNB_DIM_REPORT_TOPICS] (SK_REPORT_TOPICS_KEY,REPORT_GROUP_NAME,REPORT_TOPIC_NAME) VALUES ('3','Credit','Approval Lead Time')
INSERT INTO [DIM].[MRT_TNB_DIM_REPORT_TOPICS] (SK_REPORT_TOPICS_KEY,REPORT_GROUP_NAME,REPORT_TOPIC_NAME) VALUES ('4','Credit','Approve and Reject')
INSERT INTO [DIM].[MRT_TNB_DIM_REPORT_TOPICS] (SK_REPORT_TOPICS_KEY,REPORT_GROUP_NAME,REPORT_TOPIC_NAME) VALUES ('5','Collection','Repossession')
INSERT INTO [DIM].[MRT_TNB_DIM_REPORT_TOPICS] (SK_REPORT_TOPICS_KEY,REPORT_GROUP_NAME,REPORT_TOPIC_NAME) VALUES ('6','Collection','Auction')
INSERT INTO [DIM].[MRT_TNB_DIM_REPORT_TOPICS] (SK_REPORT_TOPICS_KEY,REPORT_GROUP_NAME,REPORT_TOPIC_NAME) VALUES ('7','Collection','Vintage Performance')
INSERT INTO [DIM].[MRT_TNB_DIM_REPORT_TOPICS] (SK_REPORT_TOPICS_KEY,REPORT_GROUP_NAME,REPORT_TOPIC_NAME) VALUES ('8','Accounting','Outstanding Portfolio')