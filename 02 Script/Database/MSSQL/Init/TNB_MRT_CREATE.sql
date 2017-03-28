-- script for initializing data mart model table GL_TNB_DWH database.
-- author		: nattapong laiyapark
-- creation date	: Sep 07 2016
-----------------------------------------------------------------------------------------------------------------------------------
-- developer notes	: 1. 	schemas created to separate tables belonging to same subject area like dim, fct, etc.
--			  	public/global synonyms are created in order to hide the complexity of knowing schema name
--			  2. 	self documentation of data dictionary is done through comment
--			  3. 	foreign keys are maintained between parent-child tables.	 
-----------------------------------------------------------------------------------------------------------------------------------
-- revision history ----------------------------------------------------------------------------------------------------------
-- 2016-09-07	nattapong laiyapark	creation of this initialization script.


----------------------------------------------------------------------------------------------------------------------------------
------------------------------------- c a u t i o n ------------------------------------------------------------------------------
-- do not run this script in a production environment.
-- existing data will be lost. make sure database backup exists before running this script 
-----------------------------------------------------------------------------------------------------------------------------------

USE GL_TNB_MRT
GO

/** DROP all Tables **/

IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'MRT_TNB_FCT_SALE_CONTRACT')
	BEGIN
		DROP TABLE FACT.MRT_TNB_FCT_SALE_CONTRACT
	END
IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'MRT_TNB_FCT_ACCOUNT_MOVEMENT')
	BEGIN
		DROP TABLE FACT.MRT_TNB_FCT_ACCOUNT_MOVEMENT
	END
IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'MRT_TNB_DIM_DATE')
	BEGIN
		DROP TABLE DIM.MRT_TNB_DIM_DATE
	END
IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'MRT_TNB_DIM_ACCOUNT_STATUS')
	BEGIN
		DROP TABLE DIM.MRT_TNB_DIM_ACCOUNT_STATUS
	END
IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'MRT_TNB_DIM_APPLICATION_STATUS')
	BEGIN
		DROP TABLE DIM.MRT_TNB_DIM_APPLICATION_STATUS
	END
IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'MRT_TNB_DIM_BRANCH')
	BEGIN
		DROP TABLE DIM.MRT_TNB_DIM_BRANCH
	END
IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'MRT_TNB_DIM_CUST_REFINANCE')
	BEGIN
		DROP TABLE DIM.MRT_TNB_DIM_CUST_REFINANCE
	END
IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'MRT_TNB_DIM_CUST_SOURCE')
	BEGIN
		DROP TABLE DIM.MRT_TNB_DIM_CUST_SOURCE
	END
IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'MRT_TNB_DIM_CUST_TYPE')
	BEGIN
		DROP TABLE DIM.MRT_TNB_DIM_CUST_TYPE
	END
IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'MRT_TNB_DIM_PRODUCT')
	BEGIN
		DROP TABLE DIM.MRT_TNB_DIM_PRODUCT
	END
IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'MRT_TNB_DIM_DEALER')
	BEGIN
		DROP TABLE DIM.MRT_TNB_DIM_DEALER
	END


/** Schema Creation **/
IF EXISTS (SELECT NAME FROM SYS.SCHEMAS WHERE NAME = N'FACT')
	BEGIN
		DROP SCHEMA FACT
	END
GO
IF EXISTS (SELECT NAME FROM SYS.SCHEMAS WHERE NAME = N'DIM')
	BEGIN
		DROP SCHEMA DIM
	END
GO


CREATE SCHEMA DIM
GO
CREATE SCHEMA FACT
GO

/** Dimension Tables **/

IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'MRT_TNB_DIM_DATE')
	BEGIN
		DROP TABLE DIM.MRT_TNB_DIM_DATE
	END

CREATE TABLE DIM.MRT_TNB_DIM_DATE
	(	DATE_KEY INT NOT NULL, 
		DATE_TIME DATETIME NOT NULL,
		FULL_DATE CHAR(10) NOT NULL, -- DATE IN DD-MM-YYYY FORMAT
		DAY_OF_MONTH INT NOT NULL , -- FIELD WILL HOLD DAY NUMBER OF MONTH
		DAY_SUFFIX VARCHAR(4) NOT NULL , -- APPLY SUFFIX AS 1ST, 2ND ,3RD ETC
		DAY_NAME VARCHAR(9) NOT NULL , -- CONTAINS NAME OF THE DAY , SUNDAY , MONDAY 
		DAY_SHORT_NAME VARCHAR(9) NOT NULL , -- CONTAINS NAME OF THE DAY , SUN , MON 
		DAY_OF_WEEK INT NOT NULL ,-- FIRST DAY SUNDAY=1 AND SATURDAY=7
		DAY_OF_WEEK_IN_MONTH INT NOT NULL , --1ST MONDAY OR 2ND MONDAY IN MONTH
		DAY_OF_WEEK_IN_YEAR INT NOT NULL ,
		DAY_OF_QUARTER INT NOT NULL ,
		DAY_OF_YEAR INT NOT NULL ,
		WEEK_OF_MONTH INT NOT NULL ,-- WEEK NUMBER OF MONTH 
		WEEK_OF_QUARTER INT NOT NULL , --WEEK NUMBER OF THE QUARTER
		WEEK_OF_YEAR INT NOT NULL ,--WEEK NUMBER OF THE YEAR
		MONTH INT NOT NULL , --NUMBER OF THE MONTH 1 TO 12
		MONTH_NAME VARCHAR(9) NOT NULL ,--JANUARYNOT NULL , FEBRUARY ETC
		MONTH_SHORT_NAME VARCHAR(9) NOT NULL ,--JAN NOT NULL , FEB ETC
		MONTH_OF_QUARTER INT NOT NULL ,-- MONTH NUMBER BELONGS TO QUARTER
		QUARTER INT NOT NULL ,
		QUARTER_NAME VARCHAR(9) NOT NULL ,--FIRSTNOT NULL ,SECOND..
		YEAR INT NOT NULL ,-- YEAR VALUE OF DATE STORED IN ROW
		YEAR_NAME CHAR(7) NOT NULL , --CY 2012NOT NULL ,CY 2013
		MONTH_YEAR CHAR(10) NOT NULL , --JAN-2013NOT NULL ,FEB-2013
		MMYYYY CHAR(6) NOT NULL ,
		YYYYMM CHAR(6) NOT NULL ,
		FIRST_DAY_OF_MONTH DATE NOT NULL ,
		LAST_DAY_OF_MONTH DATE NOT NULL ,
		FIRST_DAY_OF_QUARTER DATE NOT NULL ,
		LAST_DAY_OF_QUARTER DATE NOT NULL ,
		FIRST_DAY_OF_YEAR DATE NOT NULL ,
		LAST_DAY_OF_YEAR DATE NOT NULL ,
		IS_HOLIDAY BIT NOT NULL ,-- FLAG 1=NATIONAL HOLIDAYNOT NULL , 0-NO NATIONAL HOLIDAY
		IS_WEEKDAY BIT NOT NULL ,-- 0=WEEK END NOT NULL ,1=WEEK DAY
		HOLIDAY_DESC VARCHAR(50)  NULL, --NAME OF HOLIDAY IN US
		JOB_RUN_KEY BIGINT NOT NULL,
		--SOURCE_SYSTEM_CODE VARCHAR(10) NOT NULL,
		--SOURCE_TABLE_NAME VARCHAR(15) NOT NULL,
		DELETED_FLAG CHAR(1)  NOT NULL DEFAULT 'N', 
		COMMENTS VARCHAR(500) NULL,
		--SOURCE_LAST_UPDATE_DATE_TIME DATETIME NOT NULL,
		LAST_UPDATE_DATE_TIME DATETIME  NOT NULL DEFAULT GETDATE()
	)
GO
ALTER TABLE DIM.MRT_TNB_DIM_DATE ADD CONSTRAINT PK_DATE_KEY PRIMARY KEY CLUSTERED (DATE_KEY);

EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Definition of a date of year. Contains necessary attributes to uniquely', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Unique code for date key', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DATE',@level2type=N'column', @level2name=N'date_key'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Full datetime', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DATE', @level2type=N'column', @level2name=N'date_time'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Date in dd-mm-yyyy format', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DATE', @level2type=N'column', @level2name=N'full_date'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Field will hold day number of month', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DATE', @level2type=N'column', @level2name=N'day_of_month'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Apply suffix as 1stnot null , 2nd not null ,3rd etc', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DATE', @level2type=N'column', @level2name=N'day_suffix'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Name of the day, sunday, monday', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DATE', @level2type=N'column', @level2name=N'day_name'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Short name of the day, sun, mon', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DATE', @level2type=N'column', @level2name=N'day_short_name'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'First day of weey sunday=1 and saturday=7', @level0type=N'schema', @level0name=N'DIM', @level1type=N'table', @level1name=N'MRT_TNB_DIM_DATE', @level2type=N'column', @level2name=N'day_of_week'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Number of day in month 1st monday or 2nd monday in month', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DATE', @level2type=N'column', @level2name=N'day_of_week_in_month'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Number of week in year', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DATE', @level2type=N'column', @level2name=N'day_of_week_in_year'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Record created / last updated date and time', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DATE', @level2type=N'column', @level2name=N'day_of_quarter'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Definition of a dealer. Contains necessary attributes to uniquely identify a dealer', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table',  @level1name=N'MRT_TNB_DIM_DATE', @level2type=N'column', @level2name=N'day_of_year'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Unique code for dealer id', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DATE',@level2type=N'column', @level2name=N'week_of_month'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Non-unique for dealer company internal code', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DATE', @level2type=N'column', @level2name=N'week_of_quarter'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Non-unique for company name(native)', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DATE', @level2type=N'column', @level2name=N'week_of_year'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Non-unique for company name(en)', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DATE', @level2type=N'column', @level2name=N'month'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Name of the month, january, febuary', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DATE', @level2type=N'column', @level2name=N'month_name'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Short name of the month, jan, feb', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DATE', @level2type=N'column', @level2name=N'month_short_name'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Record last updated date time at source system', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DATE', @level2type=N'column', @level2name=N'month_of_quarter'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'y-means record marked for deletion. n - means active record', @level0type=N'schema', @level0name=N'DIM', @level1type=N'table', @level1name=N'MRT_TNB_DIM_DATE', @level2type=N'column', @level2name=N'quarter'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Source system code from which this record was created', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DATE', @level2type=N'column', @level2name=N'quarter_name'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'ETL job run instance key that created/last updated this record', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DATE', @level2type=N'column', @level2name=N'year'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Record created / last updated date and time', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DATE', @level2type=N'column', @level2name=N'year_name'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Definition of a dealer. Contains necessary attributes to uniquely identify a dealer', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DATE', @level2type=N'column', @level2name=N'month_year'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Unique code for dealer id', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DATE',@level2type=N'column', @level2name=N'mmyyy'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Non-unique for dealer company internal code', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DATE', @level2type=N'column', @level2name=N'first_day_of_month'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Non-unique for company name(native)', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DATE', @level2type=N'column', @level2name=N'last_day_of_month'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Non-unique for company name(en)', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DATE', @level2type=N'column', @level2name=N'first_day_of_quarter'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Non-unique for dealer type code', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DATE', @level2type=N'column', @level2name=N'last_day_of_quarter'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Record last updated date time at source system', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DATE', @level2type=N'column', @level2name=N'first_day_of_year'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'y-means record marked for deletion. n - means active record', @level0type=N'schema', @level0name=N'DIM', @level1type=N'table', @level1name=N'MRT_TNB_DIM_DATE', @level2type=N'column', @level2name=N'last_day_of_year'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Source system code from which this record was created', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DATE', @level2type=N'column', @level2name=N'is_holiday'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Source system code from which this record was created', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DATE', @level2type=N'column', @level2name=N'is_weekday'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Source system code from which this record was created', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DATE', @level2type=N'column', @level2name=N'holiday_desc'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'job run key of currently running instance of job', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DATE', @level2type=N'column', @level2name=N'JOB_RUN_KEY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Comment for any changes to this record.', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DATE', @level2type=N'column', @level2name=N'COMMENTS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'record created / last updated date and time', @level0type=N'schema', @level0name=N'DIM', @level1type=N'table', @level1name=N'MRT_TNB_DIM_DATE', @level2type=N'column', @level2name=N'LAST_UPDATE_DATE_TIME'

DROP SYNONYM MRT_TNB_DIM_DATE;
CREATE SYNONYM MRT_TNB_DIM_DATE FOR DIM.MRT_TNB_DIM_DATE;

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': MRT_TNB_DIM_DATE TABLE CREATED.'

----------------------------------------------------------------------------------------------------------------------------------------

IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'MRT_TNB_DIM_ACCOUNT_STATUS')
	BEGIN
		DROP TABLE DIM.MRT_TNB_DIM_ACCOUNT_STATUS
	END
CREATE TABLE DIM.MRT_TNB_DIM_ACCOUNT_STATUS (
		SK_ACCOUNT_STATUS_KEY BIGINT NOT NULL PRIMARY KEY,
		ACCOUNT_STATUS_CODE VARCHAR(30)  NULL,
		ACCOUNT_STATUS_DESC VARCHAR(80)  NULL,
		COMMENTS VARCHAR(500) NULL,
		LAST_UPDATE_DATE_TIME DATETIME  NOT NULL DEFAULT GETDATE()

); 

EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Dimension table that store all statuses of account.', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_ACCOUNT_STATUS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Surrogate Key to increment number of primary key column', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_ACCOUNT_STATUS', @level2type=N'column', @level2name=N'SK_ACCOUNT_STATUS_KEY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Code of account status : A,B,C,S,T', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_ACCOUNT_STATUS', @level2type=N'column', @level2name=N'ACCOUNT_STATUS_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Description to explain account status related with account code : active,colse,write-off,stop-account,transfer', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_ACCOUNT_STATUS', @level2type=N'column', @level2name=N'ACCOUNT_STATUS_DESC'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Comment for any changes to this record.', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_ACCOUNT_STATUS', @level2type=N'column', @level2name=N'COMMENTS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'record created / last updated date and time', @level0type=N'schema', @level0name=N'DIM', @level1type=N'table', @level1name=N'MRT_TNB_DIM_ACCOUNT_STATUS', @level2type=N'column', @level2name=N'LAST_UPDATE_DATE_TIME'

IF EXISTS (SELECT name FROM sys.synonyms WHERE name = N'MRT_TNB_DIM_ACCOUNT_STATUS')
	BEGIN
		DROP SYNONYM MRT_TNB_DIM_ACCOUNT_STATUS 
	END
CREATE SYNONYM MRT_TNB_DIM_ACCOUNT_STATUS FOR DIM.MRT_TNB_DIM_ACCOUNT_STATUS;

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': MRT_TNB_DIM_ACCOUNT_STATUS TABLE CREATED.'

----------------------------------------------------------------------------------------------------------------------------------------

IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'MRT_TNB_DIM_APPLICATION_STATUS')
	BEGIN
		DROP TABLE DIM.MRT_TNB_DIM_APPLICATION_STATUS
	END
CREATE TABLE DIM.MRT_TNB_DIM_APPLICATION_STATUS (
		SK_APPLICATION_STATUS_KEY BIGINT NOT NULL PRIMARY KEY,
		APPLICATION_STATUS_DESC VARCHAR(80)  NULL,
		COMMENTS VARCHAR(500) NULL,
		LAST_UPDATE_DATE_TIME DATETIME  NOT NULL DEFAULT GETDATE()
); 

EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Dimension table that store all statuses of account.', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_APPLICATION_STATUS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Surrogate Key to increment number of primary key column', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_APPLICATION_STATUS', @level2type=N'column', @level2name=N'SK_APPLICATION_STATUS_KEY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Description to explain account status related with account code : active,colse,write-off,stop-account,transfer', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_APPLICATION_STATUS', @level2type=N'column', @level2name=N'APPLICATION_STATUS_DESC'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Comment for any changes to this record.', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_APPLICATION_STATUS', @level2type=N'column', @level2name=N'COMMENTS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'record created / last updated date and time', @level0type=N'schema', @level0name=N'DIM', @level1type=N'table', @level1name=N'MRT_TNB_DIM_APPLICATION_STATUS', @level2type=N'column', @level2name=N'LAST_UPDATE_DATE_TIME'

IF EXISTS (SELECT name FROM sys.synonyms WHERE name = N'MRT_TNB_DIM_APPLICATION_STATUS')
	BEGIN
		DROP SYNONYM MRT_TNB_DIM_APPLICATION_STATUS 
	END
CREATE SYNONYM MRT_TNB_DIM_APPLICATION_STATUS FOR DIM.MRT_TNB_DIM_APPLICATION_STATUS;

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': MRT_TNB_DIM_APPLICATION_STATUS TABLE CREATED.'

----------------------------------------------------------------------------------------------------------------------------------------

IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'MRT_TNB_DIM_BRANCH')
	BEGIN
		DROP TABLE DIM.MRT_TNB_DIM_BRANCH
	END
CREATE TABLE DIM.MRT_TNB_DIM_BRANCH (
		SK_BRANCH_KEY BIGINT NOT NULL PRIMARY KEY,
		BRANCH_CODE VARCHAR(10) NOT NULL,
		BRANCH_REGION VARCHAR(60) NOT NULL,
		BRANCH_NAME_THAI VARCHAR(60) NOT NULL,
		BRANCH_NAME_ENGLISH VARCHAR(60) NOT NULL,
		BRANCH_SHORT_NAME VARCHAR(3) NOT NULL,
		BRANCH_ORDER VARCHAR(5) NOT NULL,
		COMMENTS VARCHAR(500) NULL,
		LAST_UPDATE_DATE_TIME DATETIME  NOT NULL DEFAULT GETDATE()

); 

EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Dimension table that store all branches detail.', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_BRANCH'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Surrogate Key to increment number of primary key column', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_BRANCH', @level2type=N'column', @level2name=N'SK_BRANCH_KEY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Branch Code', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_BRANCH', @level2type=N'column', @level2name=N'BRANCH_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Region of Branch to define BKK and Province', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_BRANCH', @level2type=N'column', @level2name=N'BRANCH_REGION'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Name of branch in Thai', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_BRANCH', @level2type=N'column', @level2name=N'BRANCH_NAME_THAI'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Name of branch in English', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_BRANCH', @level2type=N'column', @level2name=N'BRANCH_NAME_ENGLISH'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Name of branch in English stan for', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_BRANCH', @level2type=N'column', @level2name=N'BRANCH_SHORT_NAME'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Define zone of each branch to order in report', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_BRANCH', @level2type=N'column', @level2name=N'BRANCH_ORDER'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Comment for any changes to this record.', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_BRANCH', @level2type=N'column', @level2name=N'COMMENTS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'record created / last updated date and time', @level0type=N'schema', @level0name=N'DIM', @level1type=N'table', @level1name=N'MRT_TNB_DIM_BRANCH', @level2type=N'column', @level2name=N'LAST_UPDATE_DATE_TIME'

IF EXISTS (SELECT NAME FROM SYS.SYNONYMS WHERE NAME = N'MRT_TNB_DIM_BRANCH')
	BEGIN
		DROP SYNONYM MRT_TNB_DIM_BRANCH 
	END
CREATE SYNONYM MRT_TNB_DIM_BRANCH FOR DIM.MRT_TNB_DIM_BRANCH;

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': MRT_TNB_DIM_BRANCH TABLE CREATED.'

----------------------------------------------------------------------------------------------------------------------------------------
IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'MRT_TNB_DIM_CUST_REFINANCE')
	BEGIN
		DROP TABLE DIM.MRT_TNB_DIM_CUST_REFINANCE
	END
	
CREATE TABLE [DIM].[MRT_TNB_DIM_CUST_REFINANCE](
	[SK_CUST_REFINANCE_KEY] [bigint] NOT NULL,
	[CUST_REFINANCE_CODE] [bigint] NULL,
	[CUST_REFINANCE_DESC_THAI] [varchar](20) NULL,
	[CUST_REFINANCE_DESC_ENGLISH] [varchar](20) NULL,
	[COMMENTS] [varchar](500) NULL,
	[LAST_UPDATE_DATE_TIME] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SK_CUST_REFINANCE_KEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [DIM].[MRT_TNB_DIM_CUST_REFINANCE] ADD DEFAULT (getdate()) FOR [LAST_UPDATE_DATE_TIME]
GO

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': MRT_TNB_DIM_CUST_REFINANCE TABLE CREATED.'
----------------------------------------------------------------------------------------------------------------------------------------

IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'MRT_TNB_DIM_CUST_SOURCE')
	BEGIN
		DROP TABLE DIM.MRT_TNB_DIM_CUST_SOURCE
	END
CREATE TABLE DIM.MRT_TNB_DIM_CUST_SOURCE (
		SK_CUST_SOURCE_KEY BIGINT NOT NULL PRIMARY KEY,
		CUST_SOURCE_CODE VARCHAR(30)  NULL,
		CUST_SOURCE_DESC VARCHAR(80)  NULL,
		COMMENTS VARCHAR(500) NULL,
		LAST_UPDATE_DATE_TIME DATETIME  NOT NULL DEFAULT GETDATE()
); 

EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Dimension table that store ways that customer known', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_CUST_SOURCE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Surrogate Key to increment number of primary key column', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_CUST_SOURCE', @level2type=N'column', @level2name=N'SK_CUST_SOURCE_KEY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Code of customer', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_CUST_SOURCE', @level2type=N'column', @level2name=N'CUST_SOURCE_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Description to explain the detail of customer', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_CUST_SOURCE', @level2type=N'column', @level2name=N'CUST_SOURCE_DESC'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Comment for any changes to this record.', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_CUST_SOURCE', @level2type=N'column', @level2name=N'COMMENTS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'record created / last updated date and time', @level0type=N'schema', @level0name=N'DIM', @level1type=N'table', @level1name=N'MRT_TNB_DIM_CUST_SOURCE', @level2type=N'column', @level2name=N'LAST_UPDATE_DATE_TIME'

IF EXISTS (SELECT name FROM sys.synonyms WHERE name = N'MRT_TNB_DIM_CUST_SOURCE')
	BEGIN
		DROP SYNONYM MRT_TNB_DIM_CUST_SOURCE 
	END
CREATE SYNONYM MRT_TNB_DIM_CUST_SOURCE FOR DIM.MRT_TNB_DIM_CUST_SOURCE;

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': MRT_TNB_DIM_CUST_SOURCE TABLE CREATED.'

----------------------------------------------------------------------------------------------------------------------------------------
IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'MRT_TNB_DIM_CUST_TYPE')
	BEGIN
		DROP TABLE DIM.MRT_TNB_DIM_CUST_TYPE
	END
	
CREATE TABLE [DIM].[MRT_TNB_DIM_CUST_TYPE](
	[SK_CUST_TYPE_KEY] [bigint] NOT NULL,
	[CUST_TYPE_CODE] [varchar](30) NULL,
	[CUST_TYPE_DESC] [varchar](80) NULL,
	[COMMENTS] [varchar](500) NULL,
	[LAST_UPDATE_DATE_TIME] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SK_CUST_TYPE_KEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [DIM].[MRT_TNB_DIM_CUST_TYPE] ADD DEFAULT (getdate()) FOR [LAST_UPDATE_DATE_TIME]
GO

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': MRT_TNB_DIM_CUST_TYPE TABLE CREATED.'
----------------------------------------------------------------------------------------------------------------------------------------

IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'MRT_TNB_DIM_PRODUCT')
	BEGIN
		DROP TABLE DIM.MRT_TNB_DIM_PRODUCT
	END
CREATE TABLE DIM.MRT_TNB_DIM_PRODUCT (
		SK_PRODUCT_KEY BIGINT NOT NULL PRIMARY KEY,
		PRODUCT_CODE VARCHAR(30) NOT NULL,
		PRODUCT_NAME VARCHAR(10) NOT NULL,
		SUB_PRODUCT_NAME VARCHAR(80) NOT NULL,
		COMMENTS VARCHAR(500) NULL,
		LAST_UPDATE_DATE_TIME DATETIME  NOT NULL DEFAULT GETDATE()

); 

EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Dimension table that store all product detail.', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_PRODUCT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Surrogate Key to increment number of primary key column', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_PRODUCT', @level2type=N'column', @level2name=N'SK_PRODUCT_KEY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Product Code', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_PRODUCT', @level2type=N'column', @level2name=N'PRODUCT_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Name of product', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_PRODUCT', @level2type=N'column', @level2name=N'PRODUCT_NAME'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'child of product name', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_PRODUCT', @level2type=N'column', @level2name=N'SUB_PRODUCT_NAME'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Comment for any changes to this record.', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_PRODUCT', @level2type=N'column', @level2name=N'COMMENTS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'record created / last updated date and time', @level0type=N'schema', @level0name=N'DIM', @level1type=N'table', @level1name=N'MRT_TNB_DIM_PRODUCT', @level2type=N'column', @level2name=N'LAST_UPDATE_DATE_TIME'

IF EXISTS (SELECT NAME FROM SYS.SYNONYMS WHERE NAME = N'MRT_TNB_DIM_PRODUCT')
	BEGIN
		DROP SYNONYM MRT_TNB_DIM_PRODUCT 
	END
CREATE SYNONYM MRT_TNB_DIM_PRODUCT FOR DIM.MRT_TNB_DIM_PRODUCT;

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': MRT_TNB_DIM_PRODUCT TABLE CREATED.'

----------------------------------------------------------------------------------------------------------------------------------------

IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'MRT_TNB_DIM_DEALER')
	BEGIN
		DROP TABLE DIM.MRT_TNB_DIM_DEALER
	END
CREATE TABLE DIM.MRT_TNB_DIM_DEALER (
		SK_DEALER_KEY BIGINT NOT NULL PRIMARY KEY,
		DEALER_CODE VARCHAR(10) NOT NULL,
		DEALER_GROUP VARCHAR(60) NOT NULL,
		DEALER_GROUP_ID VARCHAR(5) NOT NULL,
		DEALER_NAME_THAI VARCHAR(60) NOT NULL,
		DEALER_NAME_ENGLISH VARCHAR(60) NOT NULL,
		COMMENTS VARCHAR(500) NULL,
		LAST_UPDATE_DATE_TIME DATETIME  NOT NULL DEFAULT GETDATE()

); 

EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Dimension table that store all product detail.', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DEALER'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Surrogate Key to increment number of primary key column', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DEALER', @level2type=N'column', @level2name=N'SK_DEALER_KEY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Dealer Code', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DEALER', @level2type=N'column', @level2name=N'DEALER_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Root of each dealer', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DEALER', @level2type=N'column', @level2name=N'DEALER_GROUP'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Group of dealer in number', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DEALER', @level2type=N'column', @level2name=N'DEALER_GROUP_ID'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Name of branch in Thai', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DEALER', @level2type=N'column', @level2name=N'DEALER_NAME_THAI'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Name of branch in English', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DEALER', @level2type=N'column', @level2name=N'DEALER_NAME_ENGLISH'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Comment for any changes to this record.', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'MRT_TNB_DIM_DEALER', @level2type=N'column', @level2name=N'COMMENTS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'record created / last updated date and time', @level0type=N'schema', @level0name=N'DIM', @level1type=N'table', @level1name=N'MRT_TNB_DIM_DEALER', @level2type=N'column', @level2name=N'LAST_UPDATE_DATE_TIME'

IF EXISTS (SELECT NAME FROM SYS.SYNONYMS WHERE NAME = N'MRT_TNB_DIM_DEALER')
	BEGIN
		DROP SYNONYM MRT_TNB_DIM_DEALER 
	END
CREATE SYNONYM MRT_TNB_DIM_DEALER FOR DIM.MRT_TNB_DIM_DEALER;

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': MRT_TNB_DIM_DEALER TABLE CREATED.'

----------------------------------------------------------------------------------------------------------------------------------------
/** Fact Tables **/

IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'MRT_TNB_FCT_SALE_CONTRACT')
	BEGIN
		DROP TABLE FACT.MRT_TNB_FCT_SALE_CONTRACT
	END
CREATE TABLE FACT.MRT_TNB_FCT_SALE_CONTRACT (
		SK_DATE_KEY					INT NOT NULL,
		SK_PRODUCT_KEY				BIGINT NOT NULL,
		SK_BRANCH_KEY				BIGINT NOT NULL,
		SK_DEALER_KEY				BIGINT NOT NULL,
		SK_CUST_SOURCE_KEY			BIGINT NOT NULL,
		SK_APPLICATION_STATUS_KEY	BIGINT NOT NULL,
		SK_CUST_REFINANCE_KEY 		BIGINT NOT NULL,
		SK_CUST_TYPE_KEY 			BIGINT NOT NULL,
		TOTAL_CONTRACT				FLOAT  NOT NULL,
		TOTAL_FINANCIAL_AMOUNT		FLOAT  NOT NULL,
		TOTAL_INTEREST_AMOUNT		FLOAT  NOT NULL,
		TOTAL_FINANCIAL_AND_INTEREST FLOAT  NOT NULL,
		TOTAL_INSTALLMENT_AMOUNT	FLOAT  NOT NULL,
		TOTAL_FINANCIAL_AND_INSTALLMENT FLOAT  NOT NULL,
		TOTAL_VAT_AMOUNT			FLOAT  NOT NULL,
		TOTAL_TERM					FLOAT  NOT NULL,
		TOTAL_FINANCIAL_AND_TERM	FLOAT  NOT NULL,
		TOTAL_FLAT_RATE				FLOAT  NOT NULL,
		TOTAL_EFFECTIVE_RATE			FLOAT  NOT NULL,
		TOTAL_FINANCIAL_AND_EFFECTIVE_RATE FLOAT  NOT NULL,
		COMMENTS					VARCHAR(500) NULL,
		LAST_UPDATE_DATE_TIME		DATETIME  NOT NULL DEFAULT GETDATE()

); 

ALTER TABLE [FACT].[MRT_TNB_FCT_SALE_CONTRACT] ADD  CONSTRAINT [DF_MRT_TNB_FCT_SALE_CONTRACT_SK_CUST_REFINANCE_KEY]  DEFAULT ((-1)) FOR [SK_CUST_REFINANCE_KEY]
GO

ALTER TABLE [FACT].[MRT_TNB_FCT_SALE_CONTRACT] ADD  CONSTRAINT [DF_MRT_TNB_FCT_SALE_CONTRACT_SK_CUST_TYPE_KEY]  DEFAULT ((-1)) FOR [SK_CUST_TYPE_KEY]
GO

EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Accumulate Fact table that summarize all measure', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'MRT_TNB_FCT_SALE_CONTRACT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Surrogate Key to increment number of primary key of date column', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'MRT_TNB_FCT_SALE_CONTRACT', @level2type=N'column', @level2name=N'SK_DATE_KEY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Surrogate Key to increment number of primary key of product column', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'MRT_TNB_FCT_SALE_CONTRACT', @level2type=N'column', @level2name=N'SK_PRODUCT_KEY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Surrogate Key to increment number of primary key of branch column', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'MRT_TNB_FCT_SALE_CONTRACT', @level2type=N'column', @level2name=N'SK_BRANCH_KEY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Surrogate Key to increment number of primary key of dealer column', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'MRT_TNB_FCT_SALE_CONTRACT', @level2type=N'column', @level2name=N'SK_DEALER_KEY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Surrogate Key to increment number of primary key of customer source column', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'MRT_TNB_FCT_SALE_CONTRACT', @level2type=N'column', @level2name=N'SK_CUST_SOURCE_KEY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Surrogate Key to increment number of primary key of appliaction status column', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'MRT_TNB_FCT_SALE_CONTRACT', @level2type=N'column', @level2name=N'SK_APPLICATION_STATUS_KEY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Total number of contract', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'MRT_TNB_FCT_SALE_CONTRACT', @level2type=N'column', @level2name=N'TOTAL_CONTRACT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Financial Amount', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'MRT_TNB_FCT_SALE_CONTRACT', @level2type=N'column', @level2name=N'TOTAL_FINANCIAL_AMOUNT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Total Interest Amount', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'MRT_TNB_FCT_SALE_CONTRACT', @level2type=N'column', @level2name=N'TOTAL_INTEREST_AMOUNT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Value of summariztion of Financial Amount*Interest Amount', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'MRT_TNB_FCT_SALE_CONTRACT', @level2type=N'column', @level2name=N'TOTAL_FINANCIAL_AND_INTEREST'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Installment Amount', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'MRT_TNB_FCT_SALE_CONTRACT', @level2type=N'column', @level2name=N'TOTAL_INSTALLMENT_AMOUNT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Value of summariztion of Financial Amount*Installment Amount', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'MRT_TNB_FCT_SALE_CONTRACT', @level2type=N'column', @level2name=N'TOTAL_FINANCIAL_AND_INSTALLMENT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Total of VAT amount of contract', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'MRT_TNB_FCT_SALE_CONTRACT', @level2type=N'column', @level2name=N'TOTAL_VAT_AMOUNT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Total term of payment', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'MRT_TNB_FCT_SALE_CONTRACT', @level2type=N'column', @level2name=N'TOTAL_TERM'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Value of summariztion of Financial Amount*Total term of payment', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'MRT_TNB_FCT_SALE_CONTRACT', @level2type=N'column', @level2name=N'TOTAL_FINANCIAL_AND_TERM'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Total of Flat rate', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'MRT_TNB_FCT_SALE_CONTRACT', @level2type=N'column', @level2name=N'TOTAL_FLAT_RATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Total of Effective rate', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'MRT_TNB_FCT_SALE_CONTRACT', @level2type=N'column', @level2name=N'TOTAL_EFFECTIVE_RATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Value of summariztion of Financial Amount*Effective rate', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'MRT_TNB_FCT_SALE_CONTRACT', @level2type=N'column', @level2name=N'TOTAL_FINANCIAL_AND_EFFECTIVE_RATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Comment for any changes to this record.', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'MRT_TNB_FCT_SALE_CONTRACT', @level2type=N'column', @level2name=N'COMMENTS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'record created / last updated date and time', @level0type=N'schema', @level0name=N'FACT', @level1type=N'table', @level1name=N'MRT_TNB_FCT_SALE_CONTRACT', @level2type=N'column', @level2name=N'LAST_UPDATE_DATE_TIME'

IF EXISTS (SELECT NAME FROM SYS.SYNONYMS WHERE NAME = N'MRT_TNB_FCT_SALE_CONTRACT')
	BEGIN
		DROP SYNONYM MRT_TNB_FCT_SALE_CONTRACT 
	END
CREATE SYNONYM MRT_TNB_FCT_SALE_CONTRACT FOR FACT.MRT_TNB_FCT_SALE_CONTRACT;

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': MRT_TNB_FCT_SALE_CONTRACT TABLE CREATED.'

----------------------------------------------------------------------------------------------------------------------------------------------

--IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'MRT_TNB_FCT_CONTRACT')
--	BEGIN
--		DROP TABLE FACT.MRT_TNB_FCT_CONTRACT
--	END
--CREATE TABLE FACT.MRT_TNB_FCT_CONTRACT (
--		SK_DATE_KEY					BIGINT NOT NULL,
--		SK_PRODUCT_KEY				BIGINT NOT NULL,
--		SK_ACCOUNT_STATUS_KEY		BIGINT NOT NULL,
--		TOTAL_CONTRACT				FLOAT  NOT NULL,
--		TOTAL_FINANCIAL_AMOUNT		FLOAT  NOT NULL,
--		TOTAL_INTEREST_AMOUNT		FLOAT  NOT NULL,
--		TOTAL_INSTALLMENT_AMOUNT	FLOAT  NOT NULL,
--		TOTAL_TERM					FLOAT  NOT NULL,
--		TOTAL_FLAT_RATE				FLOAT  NOT NULL,
--		TOTAL_EFFECTIVE_RATE		FLOAT  NOT NULL,
--		COMMENTS					VARCHAR(500) NULL,
--		LAST_UPDATE_DATE_TIME		DATETIME  NOT NULL DEFAULT GETDATE()

--); 

--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Accumulate Fact table that summarize all measure', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'MRT_TNB_FCT_CONTRACT'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Surrogate Key to increment number of primary key of date column', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'MRT_TNB_FCT_CONTRACT', @level2type=N'column', @level2name=N'SK_DATE_KEY'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Surrogate Key to increment number of primary key of product column', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'MRT_TNB_FCT_CONTRACT', @level2type=N'column', @level2name=N'SK_PRODUCT_KEY'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Surrogate Key to increment number of primary key of branch column', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'MRT_TNB_FCT_CONTRACT', @level2type=N'column', @level2name=N'SK_ACCOUNT_STATUS_KEY'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Total number of contract', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'MRT_TNB_FCT_CONTRACT', @level2type=N'column', @level2name=N'TOTAL_CONTRACT'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Financial Amount', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'MRT_TNB_FCT_CONTRACT', @level2type=N'column', @level2name=N'TOTAL_FINANCIAL_AMOUNT'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Total Interest Amount', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'MRT_TNB_FCT_CONTRACT', @level2type=N'column', @level2name=N'TOTAL_INTEREST_AMOUNT'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Installment Amount', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'MRT_TNB_FCT_CONTRACT', @level2type=N'column', @level2name=N'TOTAL_INSTALLMENT_AMOUNT'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Total term of payment', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'MRT_TNB_FCT_CONTRACT', @level2type=N'column', @level2name=N'TOTAL_TERM'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Total of Flat rate', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'MRT_TNB_FCT_CONTRACT', @level2type=N'column', @level2name=N'TOTAL_FLAT_RATE'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Total of Effective rate', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'MRT_TNB_FCT_CONTRACT', @level2type=N'column', @level2name=N'TOTAL_EFFECTIVE_RATE'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Comment for any changes to this record.', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'MRT_TNB_FCT_CONTRACT', @level2type=N'column', @level2name=N'COMMENTS'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'record created / last updated date and time', @level0type=N'schema', @level0name=N'FACT', @level1type=N'table', @level1name=N'MRT_TNB_FCT_CONTRACT', @level2type=N'column', @level2name=N'LAST_UPDATE_DATE_TIME'

--IF EXISTS (SELECT NAME FROM SYS.SYNONYMS WHERE NAME = N'MRT_TNB_FCT_CONTRACT')
--	BEGIN
--		DROP SYNONYM MRT_TNB_FCT_CONTRACT 
--	END
--CREATE SYNONYM MRT_TNB_FCT_CONTRACT FOR FACT.MRT_TNB_FCT_CONTRACT;

--PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': MRT_TNB_FCT_CONTRACT TABLE CREATED.'

----------------------------------------------------------------------------------------------------------------------------------------------

IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'MRT_TNB_FCT_ACCOUNT_MOVEMENT')
	BEGIN
		DROP TABLE FACT.MRT_TNB_FCT_ACCOUNT_MOVEMENT
	END
CREATE TABLE FACT.MRT_TNB_FCT_ACCOUNT_MOVEMENT (
		DATA_YEAR					INT NOT NULL,
		DATA_MONTH					INT NOT NULL,
		PRODUCT						VARCHAR(100) NOT NULL,
		ACCOUNT_STATUS				VARCHAR(50) NOT NULL,
		UNIT						BIGINT NOT NULL,
		AMOUNT						FLOAT NOT NULL,
		COMMENTS					VARCHAR(500) NULL,
		LAST_UPDATE_DATE_TIME		DATETIME  NOT NULL DEFAULT GETDATE()

); 

EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Table of movement in accounting included repo, write-off, close and so on', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'MRT_TNB_FCT_ACCOUNT_MOVEMENT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Year of data', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'MRT_TNB_FCT_ACCOUNT_MOVEMENT', @level2type=N'column', @level2name=N'DATA_YEAR'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Month of data', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'MRT_TNB_FCT_ACCOUNT_MOVEMENT', @level2type=N'column', @level2name=N'DATA_MONTH'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Accounting product', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'MRT_TNB_FCT_ACCOUNT_MOVEMENT', @level2type=N'column', @level2name=N'PRODUCT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Account status', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'MRT_TNB_FCT_ACCOUNT_MOVEMENT', @level2type=N'column', @level2name=N'ACCOUNT_STATUS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Number of contract', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'MRT_TNB_FCT_ACCOUNT_MOVEMENT', @level2type=N'column', @level2name=N'UNIT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Amount', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'MRT_TNB_FCT_ACCOUNT_MOVEMENT', @level2type=N'column', @level2name=N'AMOUNT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Comment for any changes to this record.', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'MRT_TNB_FCT_ACCOUNT_MOVEMENT', @level2type=N'column', @level2name=N'COMMENTS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'record created / last updated date and time', @level0type=N'schema', @level0name=N'FACT', @level1type=N'table', @level1name=N'MRT_TNB_FCT_ACCOUNT_MOVEMENT', @level2type=N'column', @level2name=N'LAST_UPDATE_DATE_TIME'

IF EXISTS (SELECT NAME FROM SYS.SYNONYMS WHERE NAME = N'MRT_TNB_FCT_ACCOUNT_MOVEMENT')
	BEGIN
		DROP SYNONYM MRT_TNB_FCT_ACCOUNT_MOVEMENT 
	END
CREATE SYNONYM MRT_TNB_FCT_ACCOUNT_MOVEMENT FOR FACT.MRT_TNB_FCT_ACCOUNT_MOVEMENT;

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': MRT_TNB_FCT_ACCOUNT_MOVEMENT TABLE CREATED.'

----------------------------------------------------------------------------------------------------------------------------------------------


