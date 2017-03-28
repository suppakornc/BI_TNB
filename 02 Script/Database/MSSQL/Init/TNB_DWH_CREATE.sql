-- script for initializing dimension table GL_TNB_DWH database.
-- author		: nattapong laiyapark
-- creation date	: Sep 02 2016
-----------------------------------------------------------------------------------------------------------------------------------
-- developer notes	: 1. 	schemas created to separate tables belonging to same subject area like dim, fct, etc.
--			  	public/global synonyms are created in order to hide the complexity of knowing schema name
--			  2. 	self documentation of data dictionary is done through comment
--			  3. 	foreign keys are maintained between parent-child tables.	 
-----------------------------------------------------------------------------------------------------------------------------------
-- revision history ----------------------------------------------------------------------------------------------------------
-- 2016-09-02	nattapong laiyapark	creation of this initialization script.
-- 2016-09-07	nattapong laiyapark	add fact table.


----------------------------------------------------------------------------------------------------------------------------------
------------------------------------- c a u t i o n ------------------------------------------------------------------------------
-- do not run this script in a production environment.
-- existing data will be lost. make sure database backup exists before running this script 
-----------------------------------------------------------------------------------------------------------------------------------

USE GL_TNB_DWH
GO

/** DROP all Tables **/
IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'DWH_TNB_FCT_APP_CONTRACT')
	BEGIN
		DROP TABLE FACT.DWH_TNB_FCT_APP_CONTRACT
	END
IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'DWH_TNB_FCT_CONTRACT_MONTHLY')
	BEGIN
		DROP TABLE FACT.DWH_TNB_FCT_CONTRACT_MONTHLY
	END
IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'DWH_TNB_DIM_DATE')
	BEGIN
		DROP TABLE DIM.DWH_TNB_DIM_DATE
	END
IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'DWH_TNB_DIM_ACCOUNT_STATUS')
	BEGIN
		DROP TABLE DIM.DWH_TNB_DIM_ACCOUNT_STATUS
	END
IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'DWH_TNB_DIM_APPLICATION_STATUS')
	BEGIN
		DROP TABLE DIM.DWH_TNB_DIM_APPLICATION_STATUS
	END
IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'DWH_TNB_DIM_REQUEST_STATUS')
	BEGIN
		DROP TABLE DIM.DWH_TNB_DIM_REQUEST_STATUS
	END
IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'DWH_TNB_DIM_BRANCH')
	BEGIN
		DROP TABLE DIM.DWH_TNB_DIM_BRANCH
	END
IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'DWH_TNB_DIM_CUST_REFINANCE')
	BEGIN
		DROP TABLE DIM.DWH_TNB_DIM_CUST_REFINANCE
	END
IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'DWH_TNB_DIM_CUST_SOURCE')
	BEGIN
		DROP TABLE DIM.DWH_TNB_DIM_CUST_SOURCE
	END
IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'DWH_TNB_DIM_CUST_TYPE')
	BEGIN
		DROP TABLE DIM.DWH_TNB_DIM_CUST_TYPE
	END
IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'DWH_TNB_DIM_PRODUCT')
	BEGIN
		DROP TABLE DIM.DWH_TNB_DIM_PRODUCT
	END
IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'DWH_TNB_DIM_BOT_CLASS')
	BEGIN
		DROP TABLE DIM.DWH_TNB_DIM_BOT_CLASS
	END
IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'DWH_TNB_DIM_DEALER')
	BEGIN
		DROP TABLE DIM.DWH_TNB_DIM_DEALER
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

IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'DWH_TNB_DIM_DATE')
	BEGIN
		DROP TABLE DIM.DWH_TNB_DIM_DATE
	END

CREATE TABLE DIM.DWH_TNB_DIM_DATE
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
ALTER TABLE DIM.DWH_TNB_DIM_DATE ADD CONSTRAINT PK_DATE_KEY PRIMARY KEY CLUSTERED (DATE_KEY);

EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Definition of a date of year. Contains necessary attributes to uniquely', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Unique code for date key', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DATE',@level2type=N'column', @level2name=N'date_key'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Full datetime', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DATE', @level2type=N'column', @level2name=N'date_time'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Date in dd-mm-yyyy format', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DATE', @level2type=N'column', @level2name=N'full_date'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Field will hold day number of month', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DATE', @level2type=N'column', @level2name=N'day_of_month'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Apply suffix as 1stnot null , 2nd not null ,3rd etc', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DATE', @level2type=N'column', @level2name=N'day_suffix'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Name of the day, sunday, monday', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DATE', @level2type=N'column', @level2name=N'day_name'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Short name of the day, sun, mon', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DATE', @level2type=N'column', @level2name=N'day_short_name'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'First day of weey sunday=1 and saturday=7', @level0type=N'schema', @level0name=N'DIM', @level1type=N'table', @level1name=N'DWH_TNB_DIM_DATE', @level2type=N'column', @level2name=N'day_of_week'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Number of day in month 1st monday or 2nd monday in month', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DATE', @level2type=N'column', @level2name=N'day_of_week_in_month'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Number of week in year', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DATE', @level2type=N'column', @level2name=N'day_of_week_in_year'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Record created / last updated date and time', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DATE', @level2type=N'column', @level2name=N'day_of_quarter'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Definition of a dealer. Contains necessary attributes to uniquely identify a dealer', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table',  @level1name=N'DWH_TNB_DIM_DATE', @level2type=N'column', @level2name=N'day_of_year'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Unique code for dealer id', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DATE',@level2type=N'column', @level2name=N'week_of_month'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Non-unique for dealer company internal code', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DATE', @level2type=N'column', @level2name=N'week_of_quarter'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Non-unique for company name(native)', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DATE', @level2type=N'column', @level2name=N'week_of_year'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Non-unique for company name(en)', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DATE', @level2type=N'column', @level2name=N'month'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Non-unique for dealer type code', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DATE', @level2type=N'column', @level2name=N'month_name'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Short name of the month, jan, feb', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DATE', @level2type=N'column', @level2name=N'month_short_name'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Record last updated date time at source system', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DATE', @level2type=N'column', @level2name=N'month_of_quarter'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'y-means record marked for deletion. n - means active record', @level0type=N'schema', @level0name=N'DIM', @level1type=N'table', @level1name=N'DWH_TNB_DIM_DATE', @level2type=N'column', @level2name=N'quarter'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Source system code from which this record was created', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DATE', @level2type=N'column', @level2name=N'quarter_name'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'ETL job run instance key that created/last updated this record', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DATE', @level2type=N'column', @level2name=N'year'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Record created / last updated date and time', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DATE', @level2type=N'column', @level2name=N'year_name'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Definition of a dealer. Contains necessary attributes to uniquely identify a dealer', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DATE', @level2type=N'column', @level2name=N'month_year'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Unique code for dealer id', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DATE',@level2type=N'column', @level2name=N'mmyyyy'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Unique code for dealer id', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DATE',@level2type=N'column', @level2name=N'yyyymm'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Non-unique for dealer company internal code', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DATE', @level2type=N'column', @level2name=N'first_day_of_month'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Non-unique for company name(native)', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DATE', @level2type=N'column', @level2name=N'last_day_of_month'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Non-unique for company name(en)', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DATE', @level2type=N'column', @level2name=N'first_day_of_quarter'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Non-unique for dealer type code', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DATE', @level2type=N'column', @level2name=N'last_day_of_quarter'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Record last updated date time at source system', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DATE', @level2type=N'column', @level2name=N'first_day_of_year'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'y-means record marked for deletion. n - means active record', @level0type=N'schema', @level0name=N'DIM', @level1type=N'table', @level1name=N'DWH_TNB_DIM_DATE', @level2type=N'column', @level2name=N'last_day_of_year'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Source system code from which this record was created', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DATE', @level2type=N'column', @level2name=N'is_holiday'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Source system code from which this record was created', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DATE', @level2type=N'column', @level2name=N'is_weekday'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @name=N'ms_description', @value=N'Source system code from which this record was created', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DATE', @level2type=N'column', @level2name=N'holiday_desc'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'job run key of currently running instance of job', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DATE', @level2type=N'column', @level2name=N'JOB_RUN_KEY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'y-means record marked for deletion. n - means active record', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DATE', @level2type=N'column', @level2name=N'DELETED_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Comment for any changes to this record.', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DATE', @level2type=N'column', @level2name=N'COMMENTS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'record created / last updated date and time', @level0type=N'schema', @level0name=N'DIM', @level1type=N'table', @level1name=N'DWH_TNB_DIM_DATE', @level2type=N'column', @level2name=N'LAST_UPDATE_DATE_TIME'

DROP SYNONYM DWH_TNB_DIM_DATE;
CREATE SYNONYM DWH_TNB_DIM_DATE FOR DIM.DWH_TNB_DIM_DATE;

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': DWH_TNB_DIM_DATE TABLE CREATED.'

----------------------------------------------------------------------------------------------------------------------------------------

IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'DWH_TNB_DIM_ACCOUNT_STATUS')
	BEGIN
		DROP TABLE DIM.DWH_TNB_DIM_ACCOUNT_STATUS
	END
CREATE TABLE DIM.DWH_TNB_DIM_ACCOUNT_STATUS (
		SK_ACCOUNT_STATUS_KEY INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
		ACCOUNT_STATUS_CODE VARCHAR(30)  NULL,
		ACCOUNT_STATUS_DESC VARCHAR(80)  NULL,
		JOB_RUN_KEY BIGINT NOT NULL,
		SOURCE_SYSTEM_CODE VARCHAR(10) NOT NULL,
		SOURCE_TABLE_NAME VARCHAR(20) NOT NULL,
		DELETED_FLAG CHAR(1)  NOT NULL DEFAULT 'N', 
		COMMENTS VARCHAR(500) NULL,
		SOURCE_LAST_UPDATE_DATE_TIME DATETIME NOT NULL,
		LAST_UPDATE_DATE_TIME DATETIME  NOT NULL DEFAULT GETDATE()

); 

EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Dimension table that store all statuses of account.', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_ACCOUNT_STATUS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Surrogate Key to increment number of primary key column', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_ACCOUNT_STATUS', @level2type=N'column', @level2name=N'SK_ACCOUNT_STATUS_KEY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Code of account status : A,B,C,S,T', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_ACCOUNT_STATUS', @level2type=N'column', @level2name=N'ACCOUNT_STATUS_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Description to explain account status related with account code : active,colse,write-off,stop-account,transfer', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_ACCOUNT_STATUS', @level2type=N'column', @level2name=N'ACCOUNT_STATUS_DESC'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'job run key of currently running instance of job', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_ACCOUNT_STATUS', @level2type=N'column', @level2name=N'JOB_RUN_KEY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Code of source system for extraction', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_ACCOUNT_STATUS', @level2type=N'column', @level2name=N'SOURCE_SYSTEM_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Source table name extracted', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_ACCOUNT_STATUS', @level2type=N'column', @level2name=N'SOURCE_TABLE_NAME'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'y-means record marked for deletion. n - means active record', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_ACCOUNT_STATUS', @level2type=N'column', @level2name=N'DELETED_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Comment for any changes to this record.', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_ACCOUNT_STATUS', @level2type=N'column', @level2name=N'COMMENTS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Last update time of source', @level0type=N'schema', @level0name=N'DIM', @level1type=N'table', @level1name=N'DWH_TNB_DIM_ACCOUNT_STATUS', @level2type=N'column', @level2name=N'SOURCE_LAST_UPDATE_DATE_TIME'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'record created / last updated date and time', @level0type=N'schema', @level0name=N'DIM', @level1type=N'table', @level1name=N'DWH_TNB_DIM_ACCOUNT_STATUS', @level2type=N'column', @level2name=N'LAST_UPDATE_DATE_TIME'

IF EXISTS (SELECT name FROM sys.synonyms WHERE name = N'DWH_TNB_DIM_ACCOUNT_STATUS')
	BEGIN
		DROP SYNONYM DWH_TNB_DIM_ACCOUNT_STATUS 
	END
CREATE SYNONYM DWH_TNB_DIM_ACCOUNT_STATUS FOR DIM.DWH_TNB_DIM_ACCOUNT_STATUS;

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': DWH_TNB_DIM_ACCOUNT_STATUS TABLE CREATED.'

----------------------------------------------------------------------------------------------------------------------------------------

IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'DWH_TNB_DIM_APPLICATION_STATUS')
	BEGIN
		DROP TABLE DIM.DWH_TNB_DIM_APPLICATION_STATUS
	END
CREATE TABLE DIM.DWH_TNB_DIM_APPLICATION_STATUS (
		SK_APPLICATION_STATUS_KEY INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
		APPLICATION_STATUS_CODE VARCHAR(30)  NULL,
		APPLICATION_STATUS_DESC VARCHAR(80)  NULL,
		JOB_RUN_KEY BIGINT NOT NULL,
		SOURCE_SYSTEM_CODE VARCHAR(10) NOT NULL,
		SOURCE_TABLE_NAME VARCHAR(20) NOT NULL,
		DELETED_FLAG CHAR(1)  NOT NULL DEFAULT 'N', 
		COMMENTS VARCHAR(500) NULL,
		SOURCE_LAST_UPDATE_DATE_TIME DATETIME NOT NULL,
		LAST_UPDATE_DATE_TIME DATETIME  NOT NULL DEFAULT GETDATE()

); 

EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Dimension table that store all statuses of account.', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_APPLICATION_STATUS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Surrogate Key to increment number of primary key column', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_APPLICATION_STATUS', @level2type=N'column', @level2name=N'SK_APPLICATION_STATUS_KEY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Application status for daily report', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_APPLICATION_STATUS', @level2type=N'column', @level2name=N'APPLICATION_STATUS_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Application Status description for daily report', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_APPLICATION_STATUS', @level2type=N'column', @level2name=N'APPLICATION_STATUS_DESC'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'job run key of currently running instance of job', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_APPLICATION_STATUS', @level2type=N'column', @level2name=N'JOB_RUN_KEY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Code of source system for extraction', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_APPLICATION_STATUS', @level2type=N'column', @level2name=N'SOURCE_SYSTEM_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Source table name extracted', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_APPLICATION_STATUS', @level2type=N'column', @level2name=N'SOURCE_TABLE_NAME'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'y-means record marked for deletion. n - means active record', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_APPLICATION_STATUS', @level2type=N'column', @level2name=N'DELETED_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Comment for any changes to this record.', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_APPLICATION_STATUS', @level2type=N'column', @level2name=N'COMMENTS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Last update time of source', @level0type=N'schema', @level0name=N'DIM', @level1type=N'table', @level1name=N'DWH_TNB_DIM_APPLICATION_STATUS', @level2type=N'column', @level2name=N'SOURCE_LAST_UPDATE_DATE_TIME'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'record created / last updated date and time', @level0type=N'schema', @level0name=N'DIM', @level1type=N'table', @level1name=N'DWH_TNB_DIM_APPLICATION_STATUS', @level2type=N'column', @level2name=N'LAST_UPDATE_DATE_TIME'

IF EXISTS (SELECT name FROM sys.synonyms WHERE name = N'DWH_TNB_DIM_APPLICATION_STATUS')
	BEGIN
		DROP SYNONYM DWH_TNB_DIM_APPLICATION_STATUS 
	END
CREATE SYNONYM DWH_TNB_DIM_APPLICATION_STATUS FOR DIM.DWH_TNB_DIM_APPLICATION_STATUS;

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': DWH_TNB_DIM_APPLICATION_STATUS TABLE CREATED.'

----------------------------------------------------------------------------------------------------------------------------------------

IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'DWH_TNB_DIM_REQUEST_STATUS')
	BEGIN
		DROP TABLE DIM.DWH_TNB_DIM_REQUEST_STATUS
	END
CREATE TABLE DIM.DWH_TNB_DIM_REQUEST_STATUS (
		SK_REQUEST_STATUS_KEY INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
		REQUEST_STATUS_CODE VARCHAR(30)  NULL,
		REQUEST_STATUS_DESC VARCHAR(80)  NULL,
		JOB_RUN_KEY BIGINT NOT NULL,
		SOURCE_SYSTEM_CODE VARCHAR(10) NOT NULL,
		SOURCE_TABLE_NAME VARCHAR(20) NOT NULL,
		DELETED_FLAG CHAR(1)  NOT NULL DEFAULT 'N', 
		COMMENTS VARCHAR(500) NULL,
		SOURCE_LAST_UPDATE_DATE_TIME DATETIME NOT NULL,
		LAST_UPDATE_DATE_TIME DATETIME  NOT NULL DEFAULT GETDATE()

); 

EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Dimension table that store all statuses of account.', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_REQUEST_STATUS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Surrogate Key to increment number of primary key column', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_REQUEST_STATUS', @level2type=N'column', @level2name=N'SK_REQUEST_STATUS_KEY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Code of application status', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_REQUEST_STATUS', @level2type=N'column', @level2name=N'REQUEST_STATUS_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Description to explain application status related with account code', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_REQUEST_STATUS', @level2type=N'column', @level2name=N'REQUEST_STATUS_DESC'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'job run key of currently running instance of job', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_REQUEST_STATUS', @level2type=N'column', @level2name=N'JOB_RUN_KEY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Code of source system for extraction', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_REQUEST_STATUS', @level2type=N'column', @level2name=N'SOURCE_SYSTEM_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Source table name extracted', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_REQUEST_STATUS', @level2type=N'column', @level2name=N'SOURCE_TABLE_NAME'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'y-means record marked for deletion. n - means active record', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_REQUEST_STATUS', @level2type=N'column', @level2name=N'DELETED_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Comment for any changes to this record.', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_REQUEST_STATUS', @level2type=N'column', @level2name=N'COMMENTS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Last update time of source', @level0type=N'schema', @level0name=N'DIM', @level1type=N'table', @level1name=N'DWH_TNB_DIM_REQUEST_STATUS', @level2type=N'column', @level2name=N'SOURCE_LAST_UPDATE_DATE_TIME'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'record created / last updated date and time', @level0type=N'schema', @level0name=N'DIM', @level1type=N'table', @level1name=N'DWH_TNB_DIM_REQUEST_STATUS', @level2type=N'column', @level2name=N'LAST_UPDATE_DATE_TIME'

IF EXISTS (SELECT name FROM sys.synonyms WHERE name = N'DWH_TNB_DIM_REQUEST_STATUS')
	BEGIN
		DROP SYNONYM DWH_TNB_DIM_REQUEST_STATUS 
	END
CREATE SYNONYM DWH_TNB_DIM_REQUEST_STATUS FOR DIM.DWH_TNB_DIM_REQUEST_STATUS;

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': DWH_TNB_DIM_REQUEST_STATUS TABLE CREATED.'

----------------------------------------------------------------------------------------------------------------------------------------

IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'DWH_TNB_DIM_BRANCH')
	BEGIN
		DROP TABLE DIM.DWH_TNB_DIM_BRANCH
	END
CREATE TABLE DIM.DWH_TNB_DIM_BRANCH (
		SK_BRANCH_KEY INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
		BRANCH_CODE VARCHAR(10) NOT NULL,
		BRANCH_REGION VARCHAR(60) NOT NULL,
		BRANCH_NAME_THAI VARCHAR(60) NOT NULL,
		BRANCH_NAME_ENGLISH VARCHAR(60) NOT NULL,
		BRANCH_SHORT_NAME VARCHAR(3) NOT NULL,
		BRANCH_ORDER VARCHAR(5) NOT NULL,
		IS_ACTIVE VARCHAR(1) NOT NULL,
		VALID_FROM DATE NOT NULL,
		VALID_TO DATE NOT NULL,
		JOB_RUN_KEY BIGINT NOT NULL,
		SOURCE_SYSTEM_CODE VARCHAR(10) NOT NULL,
		SOURCE_TABLE_NAME VARCHAR(20) NOT NULL,
		DELETED_FLAG CHAR(1)  NOT NULL DEFAULT 'N', 
		COMMENTS VARCHAR(500) NULL,
		SOURCE_LAST_UPDATE_DATE_TIME DATETIME NOT NULL,
		LAST_UPDATE_DATE_TIME DATETIME  NOT NULL DEFAULT GETDATE()

); 

EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Dimension table that store all branches detail.', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_BRANCH'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Surrogate Key to increment number of primary key column', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_BRANCH', @level2type=N'column', @level2name=N'SK_BRANCH_KEY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Branch Code', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_BRANCH', @level2type=N'column', @level2name=N'BRANCH_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Region of Branch to define BKK and Province', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_BRANCH', @level2type=N'column', @level2name=N'BRANCH_REGION'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Name of branch in Thai', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_BRANCH', @level2type=N'column', @level2name=N'BRANCH_NAME_THAI'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Name of branch in English', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_BRANCH', @level2type=N'column', @level2name=N'BRANCH_NAME_ENGLISH'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Name of branch in English stan for', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_BRANCH', @level2type=N'column', @level2name=N'BRANCH_SHORT_NAME'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Define zone of each branch to order in report', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_BRANCH', @level2type=N'column', @level2name=N'BRANCH_ORDER'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Flag to define DEALER_CODE is active or not : Y = Active, N = Non-Active', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_BRANCH', @level2type=N'column', @level2name=N'IS_ACTIVE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Begin Date', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_BRANCH', @level2type=N'column', @level2name=N'VALID_FROM'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'End Date', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_BRANCH', @level2type=N'column', @level2name=N'VALID_TO'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'job run key of currently running instance of job', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_BRANCH', @level2type=N'column', @level2name=N'JOB_RUN_KEY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Code of source system for extraction', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_BRANCH', @level2type=N'column', @level2name=N'SOURCE_SYSTEM_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Source table name extracted', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_BRANCH', @level2type=N'column', @level2name=N'SOURCE_TABLE_NAME'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'y-means record marked for deletion. n - means active record', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_BRANCH', @level2type=N'column', @level2name=N'DELETED_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Comment for any changes to this record.', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_BRANCH', @level2type=N'column', @level2name=N'COMMENTS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Last update time of source', @level0type=N'schema', @level0name=N'DIM', @level1type=N'table', @level1name=N'DWH_TNB_DIM_BRANCH', @level2type=N'column', @level2name=N'SOURCE_LAST_UPDATE_DATE_TIME'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'record created / last updated date and time', @level0type=N'schema', @level0name=N'DIM', @level1type=N'table', @level1name=N'DWH_TNB_DIM_BRANCH', @level2type=N'column', @level2name=N'LAST_UPDATE_DATE_TIME'

IF EXISTS (SELECT NAME FROM SYS.SYNONYMS WHERE NAME = N'DWH_TNB_DIM_BRANCH')
	BEGIN
		DROP SYNONYM DWH_TNB_DIM_BRANCH 
	END
CREATE SYNONYM DWH_TNB_DIM_BRANCH FOR DIM.DWH_TNB_DIM_BRANCH;

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': DWH_TNB_DIM_BRANCH TABLE CREATED.'

----------------------------------------------------------------------------------------------------------------------------------------
IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'DWH_TNB_DIM_CUST_REFINANCE')
	BEGIN
		DROP TABLE DIM.DWH_TNB_DIM_CUST_REFINANCE
	END
	
CREATE TABLE [DIM].[DWH_TNB_DIM_CUST_REFINANCE](
	[SK_CUST_REFINANCE_KEY] [int] IDENTITY(1,1) NOT NULL,
	[CUST_REFINANCE_CODE] [bigint] NOT NULL,
	[CUST_REFINANCE_DESC_THAI] [varchar](20) NOT NULL,
	[CUST_REFINANCE_DESC_ENGLISH] [varchar](20) NOT NULL,
	[JOB_RUN_KEY] [bigint] NOT NULL,
	[SOURCE_SYSTEM_CODE] [varchar](10) NOT NULL,
	[SOURCE_TABLE_NAME] [varchar](20) NOT NULL,
	[DELETED_FLAG] [char](1) NOT NULL,
	[COMMENTS] [varchar](500) NULL,
	[SOURCE_LAST_UPDATE_DATE_TIME] [datetime] NOT NULL,
	[LAST_UPDATE_DATE_TIME] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SK_CUST_REFINANCE_KEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [DIM].[DWH_TNB_DIM_CUST_REFINANCE] ADD  DEFAULT ('N') FOR [DELETED_FLAG]
GO

ALTER TABLE [DIM].[DWH_TNB_DIM_CUST_REFINANCE] ADD  DEFAULT (getdate()) FOR [LAST_UPDATE_DATE_TIME]
GO

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': DWH_TNB_DIM_CUST_REFINANCE TABLE CREATED.'

----------------------------------------------------------------------------------------------------------------------------------------
IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'DWH_TNB_DIM_CUST_SOURCE')
	BEGIN
		DROP TABLE DIM.DWH_TNB_DIM_CUST_SOURCE
	END
CREATE TABLE DIM.DWH_TNB_DIM_CUST_SOURCE (
		SK_CUST_SOURCE_KEY INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
		CUST_SOURCE_CODE VARCHAR(30)  NULL,
		CUST_SOURCE_DESC VARCHAR(80)  NULL,
		JOB_RUN_KEY BIGINT NOT NULL,
		SOURCE_SYSTEM_CODE VARCHAR(10) NOT NULL,
		SOURCE_TABLE_NAME VARCHAR(20) NOT NULL,
		DELETED_FLAG CHAR(1)  NOT NULL DEFAULT 'N', 
		COMMENTS VARCHAR(500) NULL,
		SOURCE_LAST_UPDATE_DATE_TIME DATETIME NOT NULL,
		LAST_UPDATE_DATE_TIME DATETIME  NOT NULL DEFAULT GETDATE()

); 

EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Dimension table that store ways that customer known', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_CUST_SOURCE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Surrogate Key to increment number of primary key column', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_CUST_SOURCE', @level2type=N'column', @level2name=N'SK_CUST_SOURCE_KEY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Code of customer', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_CUST_SOURCE', @level2type=N'column', @level2name=N'CUST_SOURCE_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Description to explain the detail of customer', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_CUST_SOURCE', @level2type=N'column', @level2name=N'CUST_SOURCE_DESC'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'job run key of currently running instance of job', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_CUST_SOURCE', @level2type=N'column', @level2name=N'JOB_RUN_KEY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Code of source system for extraction', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_CUST_SOURCE', @level2type=N'column', @level2name=N'SOURCE_SYSTEM_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Source table name extracted', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_CUST_SOURCE', @level2type=N'column', @level2name=N'SOURCE_TABLE_NAME'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'y-means record marked for deletion. n - means active record', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_CUST_SOURCE', @level2type=N'column', @level2name=N'DELETED_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Comment for any changes to this record.', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_CUST_SOURCE', @level2type=N'column', @level2name=N'COMMENTS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Last update time of source', @level0type=N'schema', @level0name=N'DIM', @level1type=N'table', @level1name=N'DWH_TNB_DIM_CUST_SOURCE', @level2type=N'column', @level2name=N'SOURCE_LAST_UPDATE_DATE_TIME'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'record created / last updated date and time', @level0type=N'schema', @level0name=N'DIM', @level1type=N'table', @level1name=N'DWH_TNB_DIM_CUST_SOURCE', @level2type=N'column', @level2name=N'LAST_UPDATE_DATE_TIME'

IF EXISTS (SELECT name FROM sys.synonyms WHERE name = N'DWH_TNB_DIM_CUST_SOURCE')
	BEGIN
		DROP SYNONYM DWH_TNB_DIM_CUST_SOURCE 
	END
CREATE SYNONYM DWH_TNB_DIM_CUST_SOURCE FOR DIM.DWH_TNB_DIM_CUST_SOURCE;

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': DWH_TNB_DIM_CUST_SOURCE TABLE CREATED.'

----------------------------------------------------------------------------------------------------------------------------------------
IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'DWH_TNB_DIM_CUST_TYPE')
	BEGIN
		DROP TABLE DIM.DWH_TNB_DIM_CUST_TYPE
	END
	
CREATE TABLE [DIM].[DWH_TNB_DIM_CUST_TYPE](
	[SK_CUST_TYPE_KEY] [int] IDENTITY(1,1) NOT NULL,
	[CUST_TYPE_CODE] [varchar](30) NULL,
	[CUST_TYPE_DESC] [varchar](80) NULL,
	[JOB_RUN_KEY] [bigint] NOT NULL,
	[SOURCE_SYSTEM_CODE] [varchar](10) NOT NULL,
	[SOURCE_TABLE_NAME] [varchar](20) NOT NULL,
	[DELETED_FLAG] [char](1) NOT NULL,
	[COMMENTS] [varchar](500) NULL,
	[SOURCE_LAST_UPDATE_DATE_TIME] [datetime] NOT NULL,
	[LAST_UPDATE_DATE_TIME] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SK_CUST_TYPE_KEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [DIM].[DWH_TNB_DIM_CUST_TYPE] ADD  DEFAULT ('N') FOR [DELETED_FLAG]
GO

ALTER TABLE [DIM].[DWH_TNB_DIM_CUST_TYPE] ADD  DEFAULT (getdate()) FOR [LAST_UPDATE_DATE_TIME]
GO

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': DWH_TNB_DIM_CUST_TYPE TABLE CREATED.'
----------------------------------------------------------------------------------------------------------------------------------------

IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'DWH_TNB_DIM_PRODUCT')
	BEGIN
		DROP TABLE DIM.DWH_TNB_DIM_PRODUCT
	END
CREATE TABLE DIM.DWH_TNB_DIM_PRODUCT (
		SK_PRODUCT_KEY INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
		PRODUCT_CODE VARCHAR(30) NOT NULL,
		PRODUCT_NAME VARCHAR(10) NOT NULL,
		SUB_PRODUCT_NAME VARCHAR(80) NOT NULL,
		IS_ACTIVE VARCHAR(1) NOT NULL,
		VALID_FROM DATE NOT NULL,
		VALID_TO DATE NOT NULL,
		JOB_RUN_KEY BIGINT NOT NULL,
		SOURCE_SYSTEM_CODE VARCHAR(10) NOT NULL,
		SOURCE_TABLE_NAME VARCHAR(20) NOT NULL,
		DELETED_FLAG CHAR(1)  NOT NULL DEFAULT 'N', 
		COMMENTS VARCHAR(500) NULL,
		SOURCE_LAST_UPDATE_DATE_TIME DATETIME NOT NULL,
		LAST_UPDATE_DATE_TIME DATETIME  NOT NULL DEFAULT GETDATE()

); 

EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Dimension table that store all product detail.', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_PRODUCT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Surrogate Key to increment number of primary key column', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_PRODUCT', @level2type=N'column', @level2name=N'SK_PRODUCT_KEY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Product Code', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_PRODUCT', @level2type=N'column', @level2name=N'PRODUCT_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Name of product', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_PRODUCT', @level2type=N'column', @level2name=N'PRODUCT_NAME'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'child of product name', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_PRODUCT', @level2type=N'column', @level2name=N'SUB_PRODUCT_NAME'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Flag to define DEALER_CODE is active or not : Y = Active, N = Non-Active', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_PRODUCT', @level2type=N'column', @level2name=N'IS_ACTIVE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Begin Date', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_PRODUCT', @level2type=N'column', @level2name=N'VALID_FROM'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'End Date', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_PRODUCT', @level2type=N'column', @level2name=N'VALID_TO'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'job run key of currently running instance of job', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_PRODUCT', @level2type=N'column', @level2name=N'JOB_RUN_KEY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Code of source system for extraction', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_PRODUCT', @level2type=N'column', @level2name=N'SOURCE_SYSTEM_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Source table name extracted', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_PRODUCT', @level2type=N'column', @level2name=N'SOURCE_TABLE_NAME'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'y-means record marked for deletion. n - means active record', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_PRODUCT', @level2type=N'column', @level2name=N'DELETED_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Comment for any changes to this record.', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_PRODUCT', @level2type=N'column', @level2name=N'COMMENTS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Last update time of source', @level0type=N'schema', @level0name=N'DIM', @level1type=N'table', @level1name=N'DWH_TNB_DIM_PRODUCT', @level2type=N'column', @level2name=N'SOURCE_LAST_UPDATE_DATE_TIME'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'record created / last updated date and time', @level0type=N'schema', @level0name=N'DIM', @level1type=N'table', @level1name=N'DWH_TNB_DIM_PRODUCT', @level2type=N'column', @level2name=N'LAST_UPDATE_DATE_TIME'

IF EXISTS (SELECT NAME FROM SYS.SYNONYMS WHERE NAME = N'DWH_TNB_DIM_PRODUCT')
	BEGIN
		DROP SYNONYM DWH_TNB_DIM_PRODUCT 
	END
CREATE SYNONYM DWH_TNB_DIM_PRODUCT FOR DIM.DWH_TNB_DIM_PRODUCT;

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': DWH_TNB_DIM_PRODUCT TABLE CREATED.'

----------------------------------------------------------------------------------------------------------------------------------------

IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'DWH_TNB_DIM_BOT_CLASS')
	BEGIN
		DROP TABLE DIM.DWH_TNB_DIM_BOT_CLASS
	END
CREATE TABLE DIM.DWH_TNB_DIM_BOT_CLASS (
		SK_BOT_CLASS_KEY INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
		BOT_CLASS_CODE VARCHAR(30) NOT NULL,
		BOT_CLASS_DESC VARCHAR(10) NOT NULL,
		BOT_CLASS_NO VARCHAR(80) NOT NULL,
		JOB_RUN_KEY BIGINT NOT NULL,
		SOURCE_SYSTEM_CODE VARCHAR(10) NOT NULL,
		SOURCE_TABLE_NAME VARCHAR(20) NOT NULL,
		DELETED_FLAG CHAR(1)  NOT NULL DEFAULT 'N', 
		COMMENTS VARCHAR(500) NULL,
		SOURCE_LAST_UPDATE_DATE_TIME DATETIME NOT NULL,
		LAST_UPDATE_DATE_TIME DATETIME  NOT NULL DEFAULT GETDATE()

); 

EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Dimension table that store all bot class detail.', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_BOT_CLASS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Surrogate Key to increment number of primary key column', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_BOT_CLASS', @level2type=N'column', @level2name=N'SK_BOT_CLASS_KEY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'BOT Class Code ', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_BOT_CLASS', @level2type=N'column', @level2name=N'BOT_CLASS_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'BOT Class Description', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_BOT_CLASS', @level2type=N'column', @level2name=N'BOT_CLASS_DESC'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'BOT Class No.', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_BOT_CLASS', @level2type=N'column', @level2name=N'BOT_CLASS_NO'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'job run key of currently running instance of job', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_BOT_CLASS', @level2type=N'column', @level2name=N'JOB_RUN_KEY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Code of source system for extraction', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_BOT_CLASS', @level2type=N'column', @level2name=N'SOURCE_SYSTEM_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Source table name extracted', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_BOT_CLASS', @level2type=N'column', @level2name=N'SOURCE_TABLE_NAME'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'y-means record marked for deletion. n - means active record', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_BOT_CLASS', @level2type=N'column', @level2name=N'DELETED_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Comment for any changes to this record.', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_BOT_CLASS', @level2type=N'column', @level2name=N'COMMENTS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Last update time of source', @level0type=N'schema', @level0name=N'DIM', @level1type=N'table', @level1name=N'DWH_TNB_DIM_BOT_CLASS', @level2type=N'column', @level2name=N'SOURCE_LAST_UPDATE_DATE_TIME'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'record created / last updated date and time', @level0type=N'schema', @level0name=N'DIM', @level1type=N'table', @level1name=N'DWH_TNB_DIM_BOT_CLASS', @level2type=N'column', @level2name=N'LAST_UPDATE_DATE_TIME'

IF EXISTS (SELECT NAME FROM SYS.SYNONYMS WHERE NAME = N'DWH_TNB_DIM_BOT_CLASS')
	BEGIN
		DROP SYNONYM DWH_TNB_DIM_BOT_CLASS 
	END
CREATE SYNONYM DWH_TNB_DIM_BOT_CLASS FOR DIM.DWH_TNB_DIM_BOT_CLASS;

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': DWH_TNB_DIM_BOT_CLASS TABLE CREATED.'

----------------------------------------------------------------------------------------------------------------------------------------

IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'DWH_TNB_DIM_DEALER')
	BEGIN
		DROP TABLE DIM.DWH_TNB_DIM_DEALER
	END
CREATE TABLE DIM.DWH_TNB_DIM_DEALER (
		SK_DEALER_KEY INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
		DEALER_CODE VARCHAR(10) NOT NULL,
		DEALER_GROUP VARCHAR(60) NOT NULL,
		DEALER_GROUP_ID VARCHAR(5) NOT NULL,
		DEALER_NAME_THAI VARCHAR(60) NOT NULL,
		DEALER_NAME_ENGLISH VARCHAR(60) NOT NULL,
		IS_ACTIVE VARCHAR(1) NOT NULL,
		VALID_FROM DATE NOT NULL,
		VALID_TO DATE NOT NULL,
		JOB_RUN_KEY BIGINT NOT NULL,
		SOURCE_SYSTEM_CODE VARCHAR(10) NOT NULL,
		SOURCE_TABLE_NAME VARCHAR(20) NOT NULL,
		DELETED_FLAG CHAR(1)  NOT NULL DEFAULT 'N', 
		COMMENTS VARCHAR(500) NULL,
		SOURCE_LAST_UPDATE_DATE_TIME DATETIME NOT NULL,
		LAST_UPDATE_DATE_TIME DATETIME  NOT NULL DEFAULT GETDATE()

); 

EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Dimension table that store all product detail.', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DEALER'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Surrogate Key to increment number of primary key column', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DEALER', @level2type=N'column', @level2name=N'SK_DEALER_KEY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Dealer Code', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DEALER', @level2type=N'column', @level2name=N'DEALER_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Root of each dealer', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DEALER', @level2type=N'column', @level2name=N'DEALER_GROUP'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Group of dealer in number', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DEALER', @level2type=N'column', @level2name=N'DEALER_GROUP_ID'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Name of dealer in Thai', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DEALER', @level2type=N'column', @level2name=N'DEALER_NAME_THAI'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Name of dealer in English', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DEALER', @level2type=N'column', @level2name=N'DEALER_NAME_ENGLISH'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Flag to define DEALER_CODE is active or not : Y = Active, N = Non-Active', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DEALER', @level2type=N'column', @level2name=N'IS_ACTIVE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Begin Date', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DEALER', @level2type=N'column', @level2name=N'VALID_FROM'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'End Date', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DEALER', @level2type=N'column', @level2name=N'VALID_TO'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'job run key of currently running instance of job', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DEALER', @level2type=N'column', @level2name=N'JOB_RUN_KEY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Code of source system for extraction', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DEALER', @level2type=N'column', @level2name=N'SOURCE_SYSTEM_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Source table name extracted', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DEALER', @level2type=N'column', @level2name=N'SOURCE_TABLE_NAME'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'y-means record marked for deletion. n - means active record', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DEALER', @level2type=N'column', @level2name=N'DELETED_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Comment for any changes to this record.', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DEALER', @level2type=N'column', @level2name=N'COMMENTS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Last update time of source', @level0type=N'schema', @level0name=N'DIM', @level1type=N'table', @level1name=N'DWH_TNB_DIM_DEALER', @level2type=N'column', @level2name=N'SOURCE_LAST_UPDATE_DATE_TIME'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'record created / last updated date and time', @level0type=N'schema', @level0name=N'DIM', @level1type=N'table', @level1name=N'DWH_TNB_DIM_DEALER', @level2type=N'column', @level2name=N'LAST_UPDATE_DATE_TIME'

IF EXISTS (SELECT NAME FROM SYS.SYNONYMS WHERE NAME = N'DWH_TNB_DIM_DEALER')
	BEGIN
		DROP SYNONYM DWH_TNB_DIM_DEALER 
	END
CREATE SYNONYM DWH_TNB_DIM_DEALER FOR DIM.DWH_TNB_DIM_DEALER;

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': DWH_TNB_DIM_DEALER TABLE CREATED.'

----------------------------------------------------------------------------------------------------------------------------------------
/** Fact Tables **/

IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'DWH_TNB_FCT_APP_CONTRACT')
	BEGIN
		DROP TABLE FACT.DWH_TNB_FCT_APP_CONTRACT
	END
CREATE TABLE FACT.DWH_TNB_FCT_APP_CONTRACT (
		REQ_DOC FLOAT PRIMARY KEY,
		DOC_NO FLOAT NOT NULL,
		CHECK_DIGIT FLOAT NOT NULL,
		PRODUCT_CODE VARCHAR(10) NOT NULL,
		BRANCH_CODE VARCHAR(10) NOT NULL,
		DEALER_CODE VARCHAR(10) NOT NULL,
		CUST_SOURCE_CODE VARCHAR(2) NOT NULL,
		REQUEST_STATUS VARCHAR(2) NOT NULL,
		REC_STATUS VARCHAR(1) NOT NULL,
		REJECT_FLAG VARCHAR(10) NULL,
		REJECT_DESC VARCHAR(60) NULL,		
		CUST_REFINANCE_CODE FLOAT NULL,
		CUST_TYPE_CODE VARCHAR(2) NULL,		
		FINANCIAL_AMOUNT FLOAT NULL,
		INSTALLMENT_AMOUNT FLOAT NULL,
		VAT_AMOUNT FLOAT NULL,
		INTEREST_AMOUNT FLOAT NULL,
		TOTAL_TERM FLOAT NULL,
		FLAT_RATE FLOAT NULL,
		EFFECTIVE_RATE FLOAT NULL,
		DOC_DATE DATETIME NULL ,
		APPROVE_LOAN_DATE DATETIME NULL,
		APPROVE_REQUEST_DATE DATETIME NULL,
		CANCEL_DATE DATETIME NULL,
		WAITING_DATE DATETIME NULL,
		PENDING_PAYMENT_DATE DATETIME NULL,
		JOB_RUN_KEY BIGINT NOT NULL,
		SOURCE_SYSTEM_CODE VARCHAR(10) NOT NULL,
		SOURCE_TABLE_NAME VARCHAR(20) NOT NULL,
		DELETED_FLAG CHAR(1)  NOT NULL DEFAULT 'N', 
		COMMENTS VARCHAR(500) NULL,
		SOURCE_LAST_UPDATE_DATE_TIME DATETIME NOT NULL,
		LAST_UPDATE_DATE_TIME DATETIME  NOT NULL DEFAULT GETDATE()

); 

EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Fact table that store all contract detail.', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_APP_CONTRACT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Application Number', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_APP_CONTRACT', @level2type=N'column', @level2name=N'REQ_DOC'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Contract Number', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_APP_CONTRACT', @level2type=N'column', @level2name=N'DOC_NO'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Transfer No.', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_APP_CONTRACT', @level2type=N'column', @level2name=N'CHECK_DIGIT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Product Code', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_APP_CONTRACT', @level2type=N'column', @level2name=N'PRODUCT_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Branch Code', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_APP_CONTRACT', @level2type=N'column', @level2name=N'BRANCH_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Dealer Code', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_APP_CONTRACT', @level2type=N'column', @level2name=N'DEALER_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Customer Source Code ', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_APP_CONTRACT', @level2type=N'column', @level2name=N'CUST_SOURCE_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Status of applications ', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_APP_CONTRACT', @level2type=N'column', @level2name=N'REQUEST_STATUS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Record Status (A,D) : A = Active, D = Menaul delete', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_APP_CONTRACT', @level2type=N'column', @level2name=N'REC_STATUS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Application Flag (1,2) : 1 = Reject, 2 = Cancel', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_APP_CONTRACT', @level2type=N'column', @level2name=N'REJECT_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Description of Application Flag', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_APP_CONTRACT', @level2type=N'column', @level2name=N'REJECT_DESC'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Financial Amount', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_APP_CONTRACT', @level2type=N'column', @level2name=N'FINANCIAL_AMOUNT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Installment Amount', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_APP_CONTRACT', @level2type=N'column', @level2name=N'INSTALLMENT_AMOUNT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Amount of vat', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_APP_CONTRACT', @level2type=N'column', @level2name=N'VAT_AMOUNT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Total Interest Amount', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_APP_CONTRACT', @level2type=N'column', @level2name=N'INTEREST_AMOUNT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Total term of payment', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_APP_CONTRACT', @level2type=N'column', @level2name=N'TOTAL_TERM'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Flat rate', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_APP_CONTRACT', @level2type=N'column', @level2name=N'FLAT_RATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Effective rate', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_APP_CONTRACT', @level2type=N'column', @level2name=N'EFFECTIVE_RATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Date of application', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_APP_CONTRACT', @level2type=N'column', @level2name=N'DOC_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Date of contract', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_APP_CONTRACT', @level2type=N'column', @level2name=N'APPROVE_LOAN_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Date of control department approve application', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_APP_CONTRACT', @level2type=N'column', @level2name=N'APPROVE_REQUEST_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Date of application (Reject/Cancel)', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_APP_CONTRACT', @level2type=N'column', @level2name=N'CANCEL_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Date of waiting for control to approve', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_APP_CONTRACT', @level2type=N'column', @level2name=N'WAITING_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Date of pending payment to customer', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_APP_CONTRACT', @level2type=N'column', @level2name=N'PENDING_PAYMENT_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'job run key of currently running instance of job', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_APP_CONTRACT', @level2type=N'column', @level2name=N'JOB_RUN_KEY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Code of source system for extraction', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_APP_CONTRACT', @level2type=N'column', @level2name=N'SOURCE_SYSTEM_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Source table name extracted', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_APP_CONTRACT', @level2type=N'column', @level2name=N'SOURCE_TABLE_NAME'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'y-means record marked for deletion. n - means active record', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_APP_CONTRACT', @level2type=N'column', @level2name=N'DELETED_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Comment for any changes to this record.', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_APP_CONTRACT', @level2type=N'column', @level2name=N'COMMENTS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Last update time of source', @level0type=N'schema', @level0name=N'FACT', @level1type=N'table', @level1name=N'DWH_TNB_FCT_APP_CONTRACT', @level2type=N'column', @level2name=N'SOURCE_LAST_UPDATE_DATE_TIME'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'record created / last updated date and time', @level0type=N'schema', @level0name=N'FACT', @level1type=N'table', @level1name=N'DWH_TNB_FCT_APP_CONTRACT', @level2type=N'column', @level2name=N'LAST_UPDATE_DATE_TIME'

IF EXISTS (SELECT NAME FROM SYS.SYNONYMS WHERE NAME = N'DWH_TNB_FCT_APP_CONTRACT')
	BEGIN
		DROP SYNONYM DWH_TNB_FCT_APP_CONTRACT 
	END
CREATE SYNONYM DWH_TNB_FCT_APP_CONTRACT FOR FACT.DWH_TNB_FCT_APP_CONTRACT;

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': DWH_TNB_FCT_APP_CONTRACT TABLE CREATED.'

----------------------------------------------------------------------------------------------------------------------------------------------

IF EXISTS (SELECT NAME FROM SYS.TABLES WHERE NAME = N'DWH_TNB_FCT_CONTRACT_MONTHLY')
	BEGIN
		DROP TABLE FACT.DWH_TNB_FCT_CONTRACT_MONTHLY
	END
CREATE TABLE FACT.DWH_TNB_FCT_CONTRACT_MONTHLY (
		DATA_YEAR				FLOAT		NOT NULL,
		DATA_MONTH				VARCHAR(2)	NOT NULL,
		DOC_NO					FLOAT		NOT NULL,
		DATA_DATE				DATE		NOT NULL,
		REC_STATUS				VARCHAR(1)	NOT NULL,
		CHECK_DIGIT				FLOAT		NOT NULL,
		REPO_DATE				DATE		NULL,
		ACCOUNT_STATUS_CODE		CHAR(1)		NOT NULL,
		CHANGE_STATUS_DATE		DATETIME	NULL,
		BOT_CLASS_CODE			CHAR(1)		NOT NULL,
		OS_UID_PRINCIPAL		FLOAT		NOT NULL,
		OS_BAL					FLOAT		NOT NULL,
		OS_UID1_UNEARN			FLOAT		NOT NULL,
		OS_UID1_SURPLUS			FLOAT		NOT NULL,
		OS_UID1_OTHER			FLOAT		NOT NULL,
		OS_UID1_AMOUNT			FLOAT		NOT NULL,
		UNEARN_OTHER			FLOAT		NOT NULL,
		REALIZE_UNPAID_UNEARN	FLOAT		NOT NULL,
		REALIZE_UNPAID_SURPLUS	FLOAT		NOT NULL,
		REALIZE_UNPAID_OTHER	FLOAT		NOT NULL,
		REALIZED_UNPAID			FLOAT		NOT NULL,
		EOM_UNEARN				FLOAT		NOT NULL,
		EOM_SURPLUS				FLOAT		NOT NULL,
		EOM_OTHER				FLOAT		NOT NULL,
		ACCRUED_EOM				FLOAT		NOT NULL,
		REVERSE_UNEARN			FLOAT		NOT NULL,
		REVERSE_SURPLUS			FLOAT		NOT NULL,
		REVERSE_OTHER			FLOAT		NOT NULL,
		REVERSE_UID_AMT			FLOAT		NOT NULL,
		DUE_PERIOD				FLOAT		NOT NULL, -- FOR EX-COM 23/11/2016
		INSTALL_PASS_DUE		FLOAT		NOT NULL, -- FOR EX-COM 23/11/2016
		JOB_RUN_KEY				BIGINT		NOT NULL,
		SOURCE_SYSTEM_CODE		VARCHAR(10) NOT NULL,
		SOURCE_TABLE_NAME		VARCHAR(20) NOT NULL,
		DELETED_FLAG			CHAR(1)  NOT NULL DEFAULT 'N', 
		COMMENTS				VARCHAR(500) NULL,
		SOURCE_LAST_UPDATE_DATE_TIME DATETIME NOT NULL,
		LAST_UPDATE_DATE_TIME	DATETIME  NOT NULL DEFAULT GETDATE()

); 

ALTER TABLE FACT.DWH_TNB_FCT_CONTRACT_MONTHLY ADD CONSTRAINT PK_DWH_TNB_FCT_CONTRACT_MONTHLY PRIMARY KEY (DATA_YEAR,DATA_MONTH,DOC_NO,CHECK_DIGIT);

EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Fact table that store all contract that snapshot by status.', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Data Year of snapshot', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'DATA_YEAR'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Data Month of snapshot', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'DATA_MONTH'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Contract number', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'DOC_NO'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Data Date of snapshot', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'DATA_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Record Status (A,D)', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'REC_STATUS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Transfer No.', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'CHECK_DIGIT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Date of reposession', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'REPO_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Contract status (FNMDSC.MDSC_TYP = ACCOUNT-STATUS)', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'ACCOUNT_STATUS_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Date changed contract status', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'CHANGE_STATUS_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'BOT Grade', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'BOT_CLASS_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Outstanding principle', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'OS_UID_PRINCIPAL'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Remaing of outstanding', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'OS_BAL'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Unearned ‡ß‘π°ŸÈ¬◊¡ (≥ Due Date)', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'OS_UID1_UNEARN'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Unearned §Ë“ª√–‡¡‘π√“§“ (≥ Due Date)', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'OS_UID1_SURPLUS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Unearned §Ë“∏√√¡‡π’¬¡‡ß‘π°ŸÈ (≥ Due Date)', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'OS_UID1_OTHER'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Unearned (≥ Due Date)', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'OS_UID1_AMOUNT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Unearned Other(≥ Due Date)', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'UNEARN_OTHER'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Realized Unpaid ‡ß‘π°ŸÈ¬◊¡', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'REALIZE_UNPAID_UNEARN'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Realized Unpaid §Ë“ª√–‡¡‘π√“§“', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'REALIZE_UNPAID_SURPLUS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Realized Unpaid §Ë“∏√√¡‡π’¬¡‡ß‘π°ŸÈ', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'REALIZE_UNPAID_OTHER'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Realized Unpaid', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'REALIZED_UNPAID'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Accrued EOM ‡ß‘π°ŸÈ¬◊¡', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'EOM_UNEARN'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Accrued EOM §Ë“ª√–‡¡‘π√“§“', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'EOM_SURPLUS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Accrued EOM §Ë“∏√√¡‡π’¬¡‡ß‘π°ŸÈ', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'EOM_OTHER'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Accrued EOM ', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'ACCRUED_EOM'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Reverse ‡ß‘π°ŸÈ¬◊¡', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'REVERSE_UNEARN'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Reverse §Ë“ª√–‡¡‘π√“§“', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'REVERSE_SURPLUS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Reverse §Ë“∏√√¡‡π’¬¡‡ß‘π°ŸÈ', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'REVERSE_OTHER'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Reverse', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'REVERSE_UID_AMT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Due Period', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'DUE_PERIOD' -- FOR EX-COM 23/11/2016
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Install Amount Pass Due', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'INSTALL_PASS_DUE' -- FOR EX-COM 23/11/2016
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'job run key of currently running instance of job', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'JOB_RUN_KEY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Code of source system for extraction', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'SOURCE_SYSTEM_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Source table name extracted', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'SOURCE_TABLE_NAME'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'y-means record marked for deletion. n - means active record', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'DELETED_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Comment for any changes to this record.', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'COMMENTS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Last update time of source', @level0type=N'schema', @level0name=N'FACT', @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'SOURCE_LAST_UPDATE_DATE_TIME'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'record created / last updated date and time', @level0type=N'schema', @level0name=N'FACT', @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'LAST_UPDATE_DATE_TIME'

IF EXISTS (SELECT NAME FROM SYS.SYNONYMS WHERE NAME = N'DWH_TNB_FCT_CONTRACT_MONTHLY')
	BEGIN
		DROP SYNONYM DWH_TNB_FCT_CONTRACT_MONTHLY 
	END
CREATE SYNONYM DWH_TNB_FCT_CONTRACT_MONTHLY FOR FACT.DWH_TNB_FCT_CONTRACT_MONTHLY;

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': DWH_TNB_FCT_CONTRACT_MONTHLY TABLE CREATED.'

