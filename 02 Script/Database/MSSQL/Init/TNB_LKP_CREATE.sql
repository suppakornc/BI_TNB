-- script for initializing mapping table GL_TNB_LKP database.
-- author		: nattapong laiyapark
-- creation date	: Aug 09 2016
-----------------------------------------------------------------------------------------------------------------------------------
-- developer notes	: 1. 	schemas created to separate tables belonging to same subject area like LKP, LKP, etc.
--			  	public/global synonyms are created in order to hide the complexity of knowing schema name
--			  2. 	self documentation of data dictionary is done through comment
--			  3. 	foreign keys are maintained between parent-child tables.	 
-----------------------------------------------------------------------------------------------------------------------------------
-- revision history ----------------------------------------------------------------------------------------------------------
-- 2016-08-09	nattapong laiyapark	creation of this initialization script.

----------------------------------------------------------------------------------------------------------------------------------
------------------------------------- c a u t i o n ------------------------------------------------------------------------------
-- do not run this script in a production environment.
-- existing data will be lost. make sure database backup exists before running this script 
-----------------------------------------------------------------------------------------------------------------------------------
/** DROP all Tables **/

IF EXISTS (SELECT name FROM sys.tables WHERE name = N'LKP_TNB_MST_DEALER')
	BEGIN
		DROP TABLE LKP.LKP_TNB_MST_DEALER
	END
IF EXISTS (SELECT name FROM sys.tables WHERE name = N'LKP_TNB_MST_BRANCH')
	BEGIN
		DROP TABLE LKP.LKP_TNB_MST_BRANCH
	END
IF EXISTS (SELECT name FROM sys.tables WHERE name = N'LKP_TNB_CUST_SOURCE')
	BEGIN
		DROP TABLE LKP.LKP_TNB_CUST_SOURCE
	END

/** Schema Creation **/
IF EXISTS (SELECT NAME FROM SYS.schemas WHERE NAME = N'LKP')
	BEGIN
		DROP SCHEMA LKP
	END
GO

CREATE SCHEMA LKP
GO

/** Mapping Tables **/
IF EXISTS (SELECT name FROM sys.tables WHERE name = N'LKP_TNB_MST_DEALER')
	BEGIN
		DROP TABLE LKP.LKP_TNB_MST_DEALER
	END
CREATE TABLE LKP.LKP_TNB_MST_DEALER (
		DEALER_CODE VARCHAR(10) NOT NULL ,
		DEALER_NAME_THAI VARCHAR(60) NOT NULL ,
		DEALER_NAME_ENG VARCHAR(60) NOT NULL ,
		DEALER_GROUP_ID VARCHAR(4) NOT NULL ,
		DEALER_GROUP_NAME VARCHAR(60) NOT NULL ,
		COMMENTS VARCHAR(500) NULL,
		DELETED_FLAG CHAR(1)  NOT NULL DEFAULT 'N', 
		LAST_UPDATE_DATE_TIME DATETIME  NOT NULL DEFAULT GETDATE()
);

ALTER TABLE LKP.LKP_TNB_MST_DEALER ADD CONSTRAINT PK_LKP_TNB_MST_DEALER PRIMARY KEY (DEALER_CODE);
 
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Mapping zone of dealer table to know province or BKK' , @level0type=N'SCHEMA',@level0name=N'LKP', @level1type=N'TABLE',@level1name=N'LKP_TNB_MST_DEALER'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Specific charater to define unique of dealer', @level0type=N'schema', @level0name=N'LKP',  @level1type=N'table', @level1name=N'LKP_TNB_MST_DEALER', @level2type=N'column', @level2name=N'DEALER_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Dealer name in Thai', @level0type=N'schema', @level0name=N'LKP',  @level1type=N'table', @level1name=N'LKP_TNB_MST_DEALER', @level2type=N'column', @level2name=N'DEALER_NAME_THAI'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Dealer name in English', @level0type=N'schema', @level0name=N'LKP',  @level1type=N'table', @level1name=N'LKP_TNB_MST_DEALER', @level2type=N'column', @level2name=N'DEALER_NAME_ENG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Specific charater to define unique of group of dealer', @level0type=N'schema', @level0name=N'LKP',  @level1type=N'table', @level1name=N'LKP_TNB_MST_DEALER', @level2type=N'column', @level2name=N'DEALER_GROUP_ID'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Group dealer name', @level0type=N'schema', @level0name=N'LKP',  @level1type=N'table', @level1name=N'LKP_TNB_MST_DEALER', @level2type=N'column', @level2name=N'DEALER_GROUP_NAME'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Comment for any changes to this record.', @level0type=N'schema', @level0name=N'LKP',  @level1type=N'table', @level1name=N'LKP_TNB_MST_DEALER', @level2type=N'column', @level2name=N'COMMENTS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'y-means record marked for deletion. n - means active record', @level0type=N'schema', @level0name=N'LKP',  @level1type=N'table', @level1name=N'LKP_TNB_MST_DEALER', @level2type=N'column', @level2name=N'DELETED_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'record created / last updated date and time', @level0type=N'schema', @level0name=N'LKP', @level1type=N'table', @level1name=N'LKP_TNB_MST_DEALER', @level2type=N'column', @level2name=N'LAST_UPDATE_DATE_TIME'


IF EXISTS (SELECT name FROM sys.synonyms WHERE name = N'LKP_TNB_MST_DEALER')
	BEGIN
		DROP SYNONYM LKP_TNB_MST_DEALER 
	END
CREATE SYNONYM LKP_TNB_MST_DEALER FOR LKP.LKP_TNB_MST_DEALER;

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': LKP_TNB_MST_DEALER TABLE CREATED.'

----------------------------------------------------------------------------------------------------------------------------------------

IF EXISTS (SELECT name FROM sys.tables WHERE name = N'LKP_TNB_MST_BRANCH')
	BEGIN
		DROP TABLE LKP.LKP_TNB_MST_BRANCH
	END
CREATE TABLE LKP.LKP_TNB_MST_BRANCH (
		BRANCH_CODE VARCHAR(10) NOT NULL,
		BRANCH_NAME_THAI VARCHAR(60) NULL,
		BRANCH_NAME_ENG VARCHAR(60) NULL,
		BRANCH_SHORT_NAME VARCHAR(3) NULL,
		BRANCH_ZONE_ID VARCHAR(10) NULL,
		BRANCH_ZONE_NAME VARCHAR(60) NULL,
		BRANCH_SUB_ZONE_ID VARCHAR(10) NULL,
		BRANCH_ORDER VARCHAR(5) NULL,
		COMMENTS VARCHAR(500) NULL,
		DELETED_FLAG CHAR(1)  NOT NULL DEFAULT 'N', 
		LAST_UPDATE_DATE_TIME DATETIME  NOT NULL DEFAULT GETDATE()

); 

ALTER TABLE LKP.LKP_TNB_MST_BRANCH ADD CONSTRAINT PK_LKP_TNB_MST_BRANCH PRIMARY KEY (BRANCH_CODE);

EXEC SYS.sp_addextendedproperty @name=N'MS_description', @value=N'Mapping zone of dealer table to know province or BKK' , @level0type=N'schema',@level0name=N'LKP', @level1type=N'table',@level1name=N'LKP_TNB_MST_BRANCH'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Branch Code', @level0type=N'schema', @level0name=N'LKP',  @level1type=N'table', @level1name=N'LKP_TNB_MST_BRANCH', @level2type=N'column', @level2name=N'BRANCH_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Branch Name Thai', @level0type=N'schema', @level0name=N'LKP', @level1type=N'table', @level1name=N'LKP_TNB_MST_BRANCH', @level2type=N'column', @level2name=N'BRANCH_NAME_THAI'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Branch Name Eng', @level0type=N'schema', @level0name=N'LKP',  @level1type=N'table', @level1name=N'LKP_TNB_MST_BRANCH', @level2type=N'column', @level2name=N'BRANCH_NAME_ENG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Name of Brach that stand for full name', @level0type=N'schema', @level0name=N'LKP', @level1type=N'table', @level1name=N'LKP_TNB_MST_BRANCH', @level2type=N'column', @level2name=N'BRANCH_SHORT_NAME'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Branch Zone Id', @level0type=N'schema', @level0name=N'LKP', @level1type=N'table', @level1name=N'LKP_TNB_MST_BRANCH', @level2type=N'column', @level2name=N'BRANCH_ZONE_ID'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Branch Zone Name', @level0type=N'schema', @level0name=N'LKP',  @level1type=N'table', @level1name=N'LKP_TNB_MST_BRANCH', @level2type=N'column', @level2name=N'BRANCH_ZONE_NAME'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Sub zone of branch to group by specific areas', @level0type=N'schema', @level0name=N'LKP', @level1type=N'table', @level1name=N'LKP_TNB_MST_BRANCH', @level2type=N'column', @level2name=N'BRANCH_SUB_ZONE_ID'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Order', @level0type=N'schema', @level0name=N'LKP', @level1type=N'table', @level1name=N'LKP_TNB_MST_BRANCH', @level2type=N'column', @level2name=N'BRANCH_ORDER'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Comment for any changes to this record.', @level0type=N'schema', @level0name=N'LKP',  @level1type=N'table', @level1name=N'LKP_TNB_MST_BRANCH', @level2type=N'column', @level2name=N'COMMENTS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'y-means record marked for deletion. n - means active record', @level0type=N'schema', @level0name=N'LKP',  @level1type=N'table', @level1name=N'LKP_TNB_MST_BRANCH', @level2type=N'column', @level2name=N'DELETED_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'record created / last updated date and time', @level0type=N'schema', @level0name=N'LKP', @level1type=N'table', @level1name=N'LKP_TNB_MST_BRANCH', @level2type=N'column', @level2name=N'LAST_UPDATE_DATE_TIME'



IF EXISTS (SELECT name FROM sys.synonyms WHERE name = N'LKP_TNB_MST_BRANCH')
	BEGIN
		DROP SYNONYM LKP_TNB_MST_BRANCH 
	END
CREATE SYNONYM LKP_TNB_MST_BRANCH FOR LKP.LKP_TNB_MST_BRANCH;

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': LKP_TNB_MST_BRANCH TABLE CREATED.'

----------------------------------------------------------------------------------------------------------------------------------------

IF EXISTS (SELECT name FROM sys.tables WHERE name = N'LKP_TNB_CUST_SOURCE')
	BEGIN
		DROP TABLE LKP.LKP_TNB_CUST_SOURCE
	END
CREATE TABLE LKP.LKP_TNB_CUST_SOURCE (
		CUST_SOURCE_CODE VARCHAR(10) NOT NULL,
		CUST_SOURCE_DESC_THAI VARCHAR(60) NULL,
		CUST_SOURCE_DESC_ENG VARCHAR(60) NULL,
		COMMENTS VARCHAR(500) NULL,
		DELETED_FLAG CHAR(1)  NOT NULL DEFAULT 'N', 
		LAST_UPDATE_DATE_TIME DATETIME  NOT NULL DEFAULT GETDATE()

); 

ALTER TABLE LKP.LKP_TNB_CUST_SOURCE ADD CONSTRAINT PK_LKP_TNB_CUST_SOURCE PRIMARY KEY (CUST_SOURCE_CODE);

EXEC SYS.sp_addextendedproperty @name=N'MS_description', @value=N'Mapping Name Eng of Customer Source dimension ' , @level0type=N'schema',@level0name=N'LKP', @level1type=N'table',@level1name=N'LKP_TNB_CUST_SOURCE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Customer Source Code', @level0type=N'schema', @level0name=N'LKP',  @level1type=N'table', @level1name=N'LKP_TNB_CUST_SOURCE', @level2type=N'column', @level2name=N'CUST_SOURCE_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Customer Source Name Thai', @level0type=N'schema', @level0name=N'LKP', @level1type=N'table', @level1name=N'LKP_TNB_CUST_SOURCE', @level2type=N'column', @level2name=N'CUST_SOURCE_DESC_THAI'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Customer Source Name Eng', @level0type=N'schema', @level0name=N'LKP',  @level1type=N'table', @level1name=N'LKP_TNB_CUST_SOURCE', @level2type=N'column', @level2name=N'CUST_SOURCE_DESC_ENG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Comment for any changes to this record.', @level0type=N'schema', @level0name=N'LKP',  @level1type=N'table', @level1name=N'LKP_TNB_CUST_SOURCE', @level2type=N'column', @level2name=N'COMMENTS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'y-means record marked for deletion. n - means active record', @level0type=N'schema', @level0name=N'LKP',  @level1type=N'table', @level1name=N'LKP_TNB_CUST_SOURCE', @level2type=N'column', @level2name=N'DELETED_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'record created / last updated date and time', @level0type=N'schema', @level0name=N'LKP', @level1type=N'table', @level1name=N'LKP_TNB_CUST_SOURCE', @level2type=N'column', @level2name=N'LAST_UPDATE_DATE_TIME'



IF EXISTS (SELECT name FROM sys.synonyms WHERE name = N'LKP_TNB_CUST_SOURCE')
	BEGIN
		DROP SYNONYM LKP_TNB_CUST_SOURCE 
	END
CREATE SYNONYM LKP_TNB_CUST_SOURCE FOR LKP.LKP_TNB_CUST_SOURCE;

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': LKP_TNB_CUST_SOURCE TABLE CREATED.'

----------------------------------------------------------------------------------------------------------------------------------------




