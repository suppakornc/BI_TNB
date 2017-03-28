-- script for initializing staging table GL_TNB_STG database.
-- author		: nattapong laiyapark
-- creation date	: Aug 29 2016
-----------------------------------------------------------------------------------------------------------------------------------
-- developer notes	: 1. 	schemas created to separate tables belonging to same subject area like etl, bi, etc.
--			  	public/global synonyms are created in order to hide the complexity of knowing schema name
--			  2. 	self documentation of data dictionary is done through comment
--			  3. 	foreign keys are maintained between parent-child tables.	 
-----------------------------------------------------------------------------------------------------------------------------------
-- revision history ----------------------------------------------------------------------------------------------------------
-- 2016-08-29	nattapong laiyapark	creation of this initialization script.
-- 2016-08-29	supawadee Klomnit	add STG_TNB_TRN_CONTRACT.
-- 2016-11-23   suppakorn choochom  add STG_TNB_TRN_APP_IN_LOG.

----------------------------------------------------------------------------------------------------------------------------------
------------------------------------- c a u t i o n ------------------------------------------------------------------------------
-- do not run this script in a production environment.
-- existing data will be lost. make sure database backup exists before running this script 
-----------------------------------------------------------------------------------------------------------------------------------

USE GL_TNB_STG
GO


/** DROP all Tables **/

IF EXISTS (SELECT name FROM sys.tables WHERE name = N'STG_TNB_TRN_CONTRACT')
	BEGIN
		DROP TABLE STG.STG_TNB_TRN_CONTRACT
	END
IF EXISTS (SELECT name FROM sys.tables WHERE name = N'STG_TNB_TRN_APPLICATION')
	BEGIN
		DROP TABLE STG.STG_TNB_TRN_APPLICATION
	END
IF EXISTS (SELECT name FROM sys.tables WHERE name = N'STG_TNB_TRN_CONTRACT_MONTHEND')
	BEGIN
		DROP TABLE STG.STG_TNB_TRN_CONTRACT_MONTHEND
	END
IF EXISTS (SELECT name FROM sys.tables WHERE name = N'STG_TNB_TRN_APP_IN_LOG')
	BEGIN
		DROP TABLE STG.STG_TNB_TRN_APP_IN_LOG
	END
IF EXISTS (SELECT name FROM sys.tables WHERE name = N'STG_TNB_MST_BRANCH')
	BEGIN
		DROP TABLE STG.STG_TNB_MST_BRANCH
	END
IF EXISTS (SELECT name FROM sys.tables WHERE name = N'STG_TNB_MST_CUST_SOURCE')
	BEGIN
		DROP TABLE STG.STG_TNB_MST_CUST_SOURCE
	END
IF EXISTS (SELECT name FROM sys.tables WHERE name = N'STG_TNB_MST_CUST_TYPE')
	BEGIN
		DROP TABLE STG.STG_TNB_MST_CUST_TYPE
	END
IF EXISTS (SELECT name FROM sys.tables WHERE name = N'STG_TNB_MST_PRODUCT')
	BEGIN
		DROP TABLE STG.STG_TNB_MST_PRODUCT
	END
IF EXISTS (SELECT name FROM sys.tables WHERE name = N'STG_TNB_MST_ACCOUNT_STATUS')
	BEGIN
		DROP TABLE STG.STG_TNB_MST_ACCOUNT_STATUS
	END
IF EXISTS (SELECT name FROM sys.tables WHERE name = N'STG_TNB_MST_REQUEST_STATUS')
	BEGIN
		DROP TABLE STG.STG_TNB_MST_REQUEST_STATUS
	END
IF EXISTS (SELECT name FROM sys.tables WHERE name = N'STG_TNB_MST_DEALER')
	BEGIN
		DROP TABLE STG.STG_TNB_MST_DEALER
	END
IF EXISTS (SELECT name FROM sys.tables WHERE name = N'STG_TNB_MST_BOT_CLASS')
	BEGIN
		DROP TABLE STG.STG_TNB_MST_BOT_CLASS
	END
/** Schema Creation **/
IF EXISTS (SELECT NAME FROM SYS.schemas WHERE NAME = N'STG')
	BEGIN
		DROP SCHEMA STG
	END
GO

CREATE SCHEMA STG
GO

/** Transaction Tables **/
IF EXISTS (SELECT name FROM sys.tables WHERE name = N'STG_TNB_TRN_CONTRACT')
	BEGIN
		DROP TABLE STG.STG_TNB_TRN_CONTRACT
	END
CREATE TABLE STG.STG_TNB_TRN_CONTRACT (
		MLHP_REC_STS VARCHAR(1) NULL,
		MLHP_BRN_DOC FLOAT NULL,
		MLHP_REQ_DOC FLOAT NULL,
		MLHP_DOC_NO FLOAT NULL,
		MLHP_CHECK_DIGIT FLOAT NULL,
		MLHP_SELLING_PLUS_VAT FLOAT NULL,
		MLHP_SELLING_PRICE FLOAT NULL,
		MLHP_VAT_SELL FLOAT NULL,
		MLHP_AVERAGE_PRICE_80 FLOAT NULL,
		MLHP_DOWN_AMT_FLAG VARCHAR(1) NULL,
		MLHP_VAT_DOWN_COM_PAY_FLAG VARCHAR(1) NULL,
		MLHP_DOWN_PAYMENT_AMT FLOAT NULL,
		MLHP_DOWN_PERCENT FLOAT NULL,
		MLHP_VAT_DOWN_FLAG VARCHAR(1) NULL,
		MLHP_VAT_DOWN FLOAT NULL,
		MLHP_DOWN_PAYMENT_FLAG VARCHAR(1) NULL,
		MLHP_INVENSTMENT_AMT FLOAT NULL,
		MLHP_VAT_INVENSTMENT FLOAT NULL,
		MLHP_HIRING_CHARGE FLOAT NULL,
		MLHP_VAT_HIRING_CHARGE FLOAT NULL,
		MLHP_FLAG_RATE VARCHAR(1) NULL,
		MLHP_ROUND_FLAG VARCHAR(1) NULL,
		MLHP_FLAT_RATE FLOAT NULL,
		MLHP_EFFECTIVE_RATE FLOAT NULL,
		MLHP_FLAT_RATE_PER_MONTH FLOAT NULL,
		MLHP_DUE_BALANCE FLOAT NULL,
		MLHP_VAT_DUE_BALANCE FLOAT NULL,
		MLHP_OUTSTANDING_BALANCE FLOAT NULL,
		MLHP_DEALER_CODE VARCHAR(10) NULL,
		MLHP_FROM_SHOWROOM VARCHAR(10) NULL,
		MLHP_SELLMAN_CODE VARCHAR(10) NULL,
		MLHP_PAY_PERIOD_AMOUNT FLOAT NULL,
		MLHP_VAT_PAY_PERIOD FLOAT NULL,
		MLHP_PAY_LAST_PERIOD_AMOUNT FLOAT NULL,
		MLHP_VAT_PAY_LAST_PERIOD FLOAT NULL,
		MLHP_COLLATERAL_NO FLOAT NULL,
		MLHP_DR_AC VARCHAR(15) NULL,
		MLHP_REMARK_3 VARCHAR(50) NULL,
		MLHP_SPECIAL_CONDITION VARCHAR(50) NULL,
		MLHP_CUSTOMER_POSITION VARCHAR(50) NULL,
		MLHP_BEGIN_ENDIND_FLAG VARCHAR(1) NULL,
		MLHP_SUBSIDIZED_RATE FLOAT NULL,
		MLHP_SUBSIDIZED_AMOUNT FLOAT NULL,
		MLHP_DEDUCTION_FLAG VARCHAR(1) NULL,
		MLHP_DEDUCTION_BASE_AMT FLOAT NULL,
		MLHP_DEDUCTION_VAT FLOAT NULL,
		MLHP_DEDUCTION_WH_TAX FLOAT NULL,
		MLHP_DEDUCTION_PIAD_AMT FLOAT NULL,
		MLHP_COMPANY_WHD_TAX_RATE FLOAT NULL,
		MLHP_COMPANY_INC_TAX_RATE FLOAT NULL,
		MLHP_COMPANY_DEDUCTION_RATE FLOAT NULL,
		MLHP_PRINT_RECEIPT_STATUS VARCHAR(1) NULL,
		MLHP_RECEIPT_NO FLOAT NULL,
		MLHP_PRINT_TAX_INVOICE_STATUS VARCHAR(1) NULL,
		MLHP_TAX_INVOICE_NO FLOAT NULL,
		MLHP_PRINT_RECEIPT_DEDUCT_STS VARCHAR(1) NULL,
		MLHP_RECEIPT_DEDUCT_NO FLOAT NULL,
		MLHP_PRINT_VAT_DEDUCT_STATUS VARCHAR(1) NULL,
		MLHP_VAT_DEDUCT_NO FLOAT NULL,
		MLHP_PRINT_RECEIPT_SUBSIDY_ST VARCHAR(1) NULL,
		MLHP_RECEIPT_SUBSIDY_NO FLOAT NULL,
		MLHP_PRINT_VAT_SUBSIDY_STATUS VARCHAR(1) NULL,
		MLHP_VAT_SUBSIDY_NO FLOAT NULL,
		MLHP_VAT_RATE FLOAT NULL,
		MLHP_DARFT_FLAG VARCHAR(1) NULL,
		MLHP_DEDUCT_INS_AMT FLOAT NULL,
		MLHP_RECEIVER_CODE VARCHAR(10) NULL,
		MLHP_DOWN_INCLUDE_VAT FLOAT NULL,
		MLHP_CREDITOR_CODE VARCHAR(20) NULL,
		MLHP_CHECKER_CODE VARCHAR(10) NULL,
		MLHP_PURPOSE_HPLS VARCHAR(10) NULL,
		MLHP_TR_FROM_DOC_NO VARCHAR(20) NULL,
		MLHP_LIFE_INS_FLAG VARCHAR(1) NULL,
		MLHP_LIFE_INS_AMT FLOAT NULL,
		MLHP_LIFE_INS_AMT_INC_TO_INVEST VARCHAR(1) NULL,
		MLHP_MARKETING_DATE DATETIME NULL,
		MLHP_INSURANCE_FLAG CHAR(1) NULL,
		MLHP_INSURANCE_AMT FLOAT NULL,
		MLHP_LATE_CHARGE_CODE VARCHAR(20) NULL,
		MLHP_LATE_CHARGE_SPREAD FLOAT NULL,
		MLHP_ADJ_INSURANCE_AMT FLOAT NULL,
		MLHP_ADJ_INSURANCE_VAT FLOAT NULL,
		MLHP_ADJ_INSURANCE_INC_VAT FLOAT NULL,
		MLHP_INSTALLMENT_FLAG CHAR(1) NULL,
		MLHP_TERM_CALCULATE_COMM NUMERIC(3, 0) NULL,
		MLHP_FLAG CHAR(1) NULL,
		MLHP_SUBSIDIZED_WH_AMOUNT FLOAT NULL,
		MLHP_FIN_AMT_SUBSIDIZED FLOAT NULL,
		MLHP_SUBSIDIZED_NET_VAT FLOAT NULL,
		MLHP_NET_EFFECTIVE_RATE FLOAT NULL,
		MLHP_NET_SUBSIDY_RATE FLOAT NULL,
		MLHP_NET_EXPENSE_RATE FLOAT NULL,
		MLHP_NET_UNEARN_RATE FLOAT NULL,
		MLHP_NET_INS_FREE_RATE FLOAT NULL,
		MLHP_LIFE_INS_DATE DATETIME NULL,
		MLHP_LIFE_INS_PERIOD INT NULL,
		MLHP_LIFE_INS_AMT_PER_MONTH FLOAT NULL,
		MLHP_HEALTH_INS_AMT FLOAT NULL,
		MLHP_ADJ_HEALTH_INS_AMT FLOAT NULL,
		MLHP_ADJ_HEALTH_INS_VAT FLOAT NULL,
		MLHP_ADJ_HEALTH_INS_INC_VAT FLOAT NULL,
		MLHP_BEGIN_PAY_PERIOD_AMT FLOAT NULL,
		MLHP_NET_LIFE_INS_RATE FLOAT NULL,
		MLHP_NET_HEALTH_INS_RATE FLOAT NULL,
		MLHP_ASSET_TAX_INVOICE_NO VARCHAR(30) NULL,
		MLHP_INPUT_FLAT_RATE FLOAT NULL,
		MLHP_INPUT_EFFECTIVE_RATE FLOAT NULL,
		MLHP_INPUT_FLAT_RATE_PER_MONTH FLOAT NULL,
		MLHP_LIFE_INS_AMT_EXD_VAT FLOAT NULL,
		MLHP_ATM_NO FLOAT NULL,
		MLHP_CONSULT_FLAG VARCHAR(1) NULL,
		MLHP_CONTROL_OWNER VARCHAR(20) NULL,
		MLHP_PERIOD_INSTALL_PRINCIPAL FLOAT NULL,
		MLHP_STANDARD_CAR_PRICE FLOAT NULL,
		MLHP_ADVANCE_INSTALLMENT_TERM TINYINT NULL,
		MLHP_ADVANCE_INSTALLMENT_AMT FLOAT NULL,
		MLHP_LIFE_INS_AMT_ORG FLOAT NULL,
		MLHP_LIFE_INS_AMT_PER_MONTH_ORG FLOAT NULL,
		MLHP_LIFE_INS_AMT_EXD_VAT_ORG FLOAT NULL,
		MLHP_BEG_INVENSTMENT_AMT FLOAT NULL,
		MLHP_BEG_VAT_INVENSTMENT FLOAT NULL,
		MLHP_ADVANCE_BY_CUSTOMER_TERM INT NULL,
		MLHP_ADVANCE_BY_CUSTOMER_AMT FLOAT NULL,
		MLHP_ADVANCE_INSTALLMENT_ADJ INT NULL,
		MLHP_LIMIT_FEE_AMOUNT FLOAT NULL,
		MLHP_LIMIT_FEE_VAT_AMOUNT FLOAT NULL,
		MLHP_PA_FLAG VARCHAR(10) NULL,
		MLHP_PA_CODE VARCHAR(30) NULL,
		MLHP_PA_AMOUNT FLOAT NULL,
		MLHP_BANK_CODE VARCHAR(3) NULL,
		MLHP_ACCOUNT_NO VARCHAR(15) NULL,
		MLHP_SCAN_DATE [datetime] NULL,
		MLHP_UPLOAD_DATE [datetime] NULL,
		MLHP_SENT_RCV_BY [varchar](1) NULL,
		MLHP_CUSTYPE_FROM [varchar](2) NULL,
		MLHP_REFINAN_NUM [float] NULL,
		MLHP_CHANG_ADD [varchar](1) NULL,
		JOB_RUN_KEY BIGINT NOT NULL,
		SOURCE_SYSTEM_CODE VARCHAR(10) NOT NULL,
		SOURCE_TABLE_NAME VARCHAR(15) NOT NULL,
		DELETED_FLAG CHAR(1)  NOT NULL DEFAULT 'N', 
		SOURCE_LAST_UPDATE_DATE_TIME DATETIME NOT NULL,
		LAST_UPDATE_DATE_TIME DATETIME  NOT NULL DEFAULT GETDATE()

); 

--CREATE CLUSTERED INDEX IDX_JOB_RUN_KEY ON STG.STG_TNB_TRN_CONTRACT (JOB_RUN_KEY); 

EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Hire Purchase Table to store detail of contract, finance amount and any condition.', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Record Status', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT',@level2type=N'column', @level2name=N'MLHP_REC_STS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Branch Code', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_BRN_DOC'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Request No.', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_REQ_DOC'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Contract No.', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_DOC_NO'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Transfer No.', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_CHECK_DIGIT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Property Price (Include VAT)', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_SELLING_PLUS_VAT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Property Price (No VAT)', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_SELLING_PRICE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Property VAT', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_VAT_SELL'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Standard Price', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_AVERAGE_PRICE_80'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Down Amount Flag', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_DOWN_AMT_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'VAT Down Pay By (Company / Dealer)', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_VAT_DOWN_COM_PAY_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Down Payment Amount', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_DOWN_PAYMENT_AMT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Down Percent', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_DOWN_PERCENT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'VAT Down Flag', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT',@level2type=N'column', @level2name=N'MLHP_VAT_DOWN_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'VAT Down Amount', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_VAT_DOWN'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Down Payment Flag', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_DOWN_PAYMENT_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Invenstment Amount', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_INVENSTMENT_AMT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'VAT Investment Amount', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_VAT_INVENSTMENT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Hiring Charge', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_HIRING_CHARGE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'VAT Hiring Charge', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_VAT_HIRING_CHARGE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Flag Rate (Flat or Effective)', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_FLAG_RATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Round Amount Flag', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_ROUND_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Flat Rate', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_FLAT_RATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Effective Rate', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_EFFECTIVE_RATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Flat Rate Per Month', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_FLAT_RATE_PER_MONTH'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Due Balance', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_DUE_BALANCE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Vat Due Balance', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_VAT_DUE_BALANCE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'O/S Balance', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT',@level2type=N'column', @level2name=N'MLHP_OUTSTANDING_BALANCE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Dealer Code', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_DEALER_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Sub Dealer Code', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_FROM_SHOWROOM'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Salesman Code', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_SELLMAN_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Pay Install Amount', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_PAY_PERIOD_AMOUNT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Pay VAT Install Amount', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_VAT_PAY_PERIOD'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Pay Last Install Amount', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_PAY_LAST_PERIOD_AMOUNT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Pay Last VAT Install Amount', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_VAT_PAY_LAST_PERIOD'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Collateral No.', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_COLLATERAL_NO'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Debit Account For Pay By T/R', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_DR_AC'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Remark No. 3', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_REMARK_3'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Special Condition', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_SPECIAL_CONDITION'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Customer Position', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_CUSTOMER_POSITION'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Begin or Ending Flag', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_BEGIN_ENDIND_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Subsidy Rate', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT',@level2type=N'column', @level2name=N'MLHP_SUBSIDIZED_RATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Subsidy Amount', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_SUBSIDIZED_AMOUNT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Deduct Flag', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_DEDUCTION_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Deduct Base Amount', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_DEDUCTION_BASE_AMT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Deduct VAT', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_DEDUCTION_VAT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Deduct W/H Tax', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_DEDUCTION_WH_TAX'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Deduct Paid Amount', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_DEDUCTION_PIAD_AMT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'W/H Tax Rate', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_COMPANY_WHD_TAX_RATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Income Tax Rate', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_COMPANY_INC_TAX_RATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Deduct Rate', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_COMPANY_DEDUCTION_RATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Print Receipt Status', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_PRINT_RECEIPT_STATUS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Receipt No.', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_RECEIPT_NO'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Print Tax Inv. Status', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_PRINT_TAX_INVOICE_STATUS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Tax Inv. No.', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_TAX_INVOICE_NO'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Print Receipt Deduct Status', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT',@level2type=N'column', @level2name=N'MLHP_PRINT_RECEIPT_DEDUCT_STS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Print Receipt Deduct No.', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_RECEIPT_DEDUCT_NO'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Print Vat Deduct Status', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_PRINT_VAT_DEDUCT_STATUS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Print Vat Deduct No.', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_VAT_DEDUCT_NO'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Print Receipt Subsidy Status', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_PRINT_RECEIPT_SUBSIDY_ST'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Print Receipt Subsidy No.', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_RECEIPT_SUBSIDY_NO'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Print Vat Subsidy Status', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_PRINT_VAT_SUBSIDY_STATUS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Print Vat subsidy No.', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_VAT_SUBSIDY_NO'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'VAT Rate', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_VAT_RATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Darft Flag', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_DARFT_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Deduct Install Amount', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_DEDUCT_INS_AMT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Receiver Code', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_RECEIVER_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Down Include VAT', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_DOWN_INCLUDE_VAT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Creditor Code', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_CREDITOR_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Checker Code', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT',@level2type=N'column', @level2name=N'MLHP_CHECKER_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Purpose H/P', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_PURPOSE_HPLS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'T/R From Contract No.', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_TR_FROM_DOC_NO'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Life Ins. Flag', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_LIFE_INS_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Life Ins. Amount', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_LIFE_INS_AMT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Life Ins. Include to Investment Flag', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_LIFE_INS_AMT_INC_TO_INVEST'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Marketing Date', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_MARKETING_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Insurance Flag', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_INSURANCE_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Insurance Amount', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_INSURANCE_AMT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Late Charge Code', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_LATE_CHARGE_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Late Charge Spread', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_LATE_CHARGE_SPREAD'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Insurance Amount Include Investment', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_ADJ_INSURANCE_AMT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Insurance VAT Include Investment', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_ADJ_INSURANCE_VAT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Insurance+VAT Amount Include Investment', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_ADJ_INSURANCE_INC_VAT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Insurance Flag', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT',@level2type=N'column', @level2name=N'MLHP_INSTALLMENT_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Term Calculate Commission', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_TERM_CALCULATE_COMM'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Flag For Process', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Subsidy W/H Amount', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_SUBSIDIZED_WH_AMOUNT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Finance Amount Subsidy', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_FIN_AMT_SUBSIDIZED'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Subsidy Net VAT', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_SUBSIDIZED_NET_VAT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Net Effective Rate', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_NET_EFFECTIVE_RATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Net Subsidy Rate', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_NET_SUBSIDY_RATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Net Expense Rate', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_NET_EXPENSE_RATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Net Unearn Rate', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_NET_UNEARN_RATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Net Ins. Free Rate', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_NET_INS_FREE_RATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Life Ins. Date', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_LIFE_INS_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Life Ins. Period', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_LIFE_INS_PERIOD'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Life Ins. Amount per Month', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_LIFE_INS_AMT_PER_MONTH'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Health Ins. Amount', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT',@level2type=N'column', @level2name=N'MLHP_HEALTH_INS_AMT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Health Ins. Amount Include Investment', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_ADJ_HEALTH_INS_AMT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Health Ins. VAT Include Investment', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_ADJ_HEALTH_INS_VAT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Health Ins. Amount+VAT Include Investment', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_ADJ_HEALTH_INS_INC_VAT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Old Install Amount', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_BEGIN_PAY_PERIOD_AMT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Net Life Insurance Rate', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_NET_LIFE_INS_RATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Net Health Insurance Rate', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_NET_HEALTH_INS_RATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Asset Tax Invoice No.ใบกำกับภาษีซื้อ', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_ASSET_TAX_INVOICE_NO'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Keep User Input Flat Rate', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_INPUT_FLAT_RATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Keep User Input Effective Rate', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_INPUT_EFFECTIVE_RATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Keep User Input Flat Rate per Month', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_INPUT_FLAT_RATE_PER_MONTH'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Life Ins. Include VAT', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_LIFE_INS_AMT_EXD_VAT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ATM No.', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_ATM_NO'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Consult Flag', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_CONSULT_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Control Owner', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT',@level2type=N'column', @level2name=N'MLHP_CONTROL_OWNER'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'No. of Install ', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_PERIOD_INSTALL_PRINCIPAL'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Standard Car Price', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_STANDARD_CAR_PRICE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Advance Install Term', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_ADVANCE_INSTALLMENT_TERM'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Advance Install Amount', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_ADVANCE_INSTALLMENT_AMT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Life Ins. Amount Before Change', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_LIFE_INS_AMT_ORG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Life Ins. Amount per Month Before Change', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_LIFE_INS_AMT_PER_MONTH_ORG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Life Ins. Exclude VAT Before Change', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_LIFE_INS_AMT_EXD_VAT_ORG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Investment Amount', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_BEG_INVENSTMENT_AMT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'VAT Investment Amount', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_BEG_VAT_INVENSTMENT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Advance Install by customer (Term)', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_ADVANCE_BY_CUSTOMER_TERM'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Advance Install by customer (Amount)', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_ADVANCE_BY_CUSTOMER_AMT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Advance Installment Adjust', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_ADVANCE_INSTALLMENT_ADJ'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Contract Fee', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_LIMIT_FEE_AMOUNT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Contract Fee Vat', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_LIMIT_FEE_VAT_AMOUNT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'PA Flag ', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_PA_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'PA CODE (MDSC_TYP = ‘PA_CODE’)', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_PA_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'PA AMOUNT', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_PA_AMOUNT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Bank Code', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_BANK_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Bank Account Number', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'MLHP_ACCOUNT_NO'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'job run key of currently running instance of job', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'JOB_RUN_KEY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Code of source system for extraction', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'SOURCE_SYSTEM_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Source table name extracted', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'SOURCE_TABLE_NAME'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'y-means record marked for deletion. n - means active record', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'DELETED_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Last update time of source', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'SOURCE_LAST_UPDATE_DATE_TIME'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'record created / last updated date and time', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT', @level2type=N'column', @level2name=N'LAST_UPDATE_DATE_TIME'



IF EXISTS (SELECT name FROM sys.synonyms WHERE name = N'STG_TNB_TRN_CONTRACT')
	BEGIN
		DROP SYNONYM STG_TNB_TRN_CONTRACT 
	END
CREATE SYNONYM STG_TNB_TRN_CONTRACT FOR STG.STG_TNB_TRN_CONTRACT;

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': STG_TNB_TRN_CONTRACT TABLE CREATED.'

----------------------------------------------------------------------------------------------------------------------------------------

IF EXISTS (SELECT name FROM sys.tables WHERE name = N'STG_TNB_TRN_CONTRACT_MONTHEND')
	BEGIN
		DROP TABLE STG.STG_TNB_TRN_CONTRACT_MONTHEND
	END
CREATE TABLE STG.STG_TNB_TRN_CONTRACT_MONTHEND (
		MSOL_REC_STS					VARCHAR(1)	,
		MSOL_LN_BRN						FLOAT		,
		MSOL_LN_TYP						VARCHAR(2)	,
		MSOL_DOC_NO						FLOAT		,
		MSOL_CHECK_DIGIT				FLOAT		,
		MSOL_YEAR						FLOAT		,
		MSOL_MONTH						FLOAT		,
		MSOL_UID_PERIOD					FLOAT		,
		MSOL_OS_BAL						FLOAT		,
		MSOL_OS_BAL_VAT					FLOAT		,
		MSOL_CHQ_EFF					FLOAT		,
		MSOL_PAY_PRINCIPAL				FLOAT		,
		MSOL_PAY_VAT_AMT				FLOAT		,
		MSOL_OS_UID_PRINCIPAL			FLOAT		,
		MSOL_OS_UID_AMOUNT				FLOAT		,
		MSOL_REALIZED_UID_AMT			FLOAT		,
		MSOL_REVERSE_UID_AMT			FLOAT		,
		MSOL_REALIZED_PAID				FLOAT		,
		MSOL_REALIZED_UNPAID			FLOAT		,
		MSOL_OS_SUBSIDY_AMT				FLOAT		,
		MSOL_REALIZED_SUBSIDY			FLOAT		,
		MSOL_REVERSE_SUBSIDY			FLOAT		,
		MSOL_OS_EXPENSE_AMT				FLOAT		,
		MSOL_REALIZED_EXPENSE			FLOAT		,
		MSOL_REVERSE_EXPENSE			FLOAT		,
		MSOL_OS_INS_FREE_AMT			FLOAT		,
		MSOL_REALIZED_INS_FREE			FLOAT		,
		MSOL_REVERSE_INS_FREE			FLOAT		,
		MSOL_ACC_INT					FLOAT		,
		MSOL_STOP_DATE					DATETIME	,
		MSOL_NEXT_PAY_PRINCIPAL_DATE	DATETIME	,
		MSOL_LST_PAY_PERIOD_PRINCIPAL	FLOAT		,
		MSOL_MATURITY_DATE				DATETIME	,
		MSOL_TERM						FLOAT		,
		MSOL_VALUE_DATE					DATETIME	,
		MSOL_AGING_TERM					FLOAT		,
		MSOL_AGING_DAY					FLOAT		,
		MSOL_GRADE						CHAR(1)		,
		MSOL_STATUS_FLAG				CHAR(1)		,
		MSOL_AST_STS					CHAR(1)		,
		MSOL_STOP_VAT_FLAG				CHAR(1)		,
		MSOL_RELIEVE_FLAG				CHAR(1)		,
		MSOL_DUE_PERIOD					FLOAT		,
		MSOL_BEFORE_REL_UID_SEQ			FLOAT		,
		MSOL_AFTER_REL_UID_SEQ			FLOAT		,
		MSOL_OS_HEALTH_INS_AMT			FLOAT		,
		MSOL_REALIZED_HEALTH_INS		FLOAT		,
		MSOL_OS_LIFE_INS_AMT			FLOAT		,
		MSOL_REALIZED_LIFE_INS			FLOAT		,
		MSOL_ACCRUED_EOM				FLOAT		,
		MSOL_PROVISION_AMT				FLOAT		,
		MSOL_OS_UID1_AMOUNT				FLOAT		,
		MSOL_CHANGE_STATUS_DATE			DATETIME	,
		MSOL_REPO_DATE					DATETIME	,
		MSOL_REPO_SELL_DATE				DATETIME	,
		MSOL_PRINT_CANCEL_LETTER_DATE	DATETIME	,
		MSOL_REPO_FLAG					VARCHAR(1)	,
		MSOL_OS_AR_VAT					FLOAT		,
		MSOL_SEQ_UID_RD					FLOAT		,
		MSOL_REALIZED_RD_THIS_MTH		FLOAT		,
		MSOL_PAY_PRINCIPAL_THIS_YEAR	FLOAT		,
		MSOL_PAY_PRINCIPAL_ALL			FLOAT		,
		MSOL_INSTALL_PASS_DUE			FLOAT		,
		MSOL_OVER_1_YEAR				VARCHAR(1)	,
		MSOL_FLAG						VARCHAR(1)	,
		MSOL_BAL_INSTALL_NEXT_PRINC		FLOAT		,
		MSOL_VAT_PASS_DUE				FLOAT		,
		MSOL_AST_STS_ACTUAL				VARCHAR(1)	,
		MSOL_LAST_PAY_DATE				DATETIME	,
		MSOL_CLOSE_AMORTIZE_DATE		DATETIME	,
		MSOL_CLOSE_AMORTIZE_FLAG		VARCHAR(1)	,
		MSOL_PREV_YEAR					FLOAT		,
		MSOL_PREV_MONTH					FLOAT		,
		MSOL_WO_DATE					DATETIME	,
		MSOL_PAY_VAT_ALL				FLOAT		,
		MSOL_DISCOUNT_AMOUNT			FLOAT		,
		MSOL_PREV_GRADE					VARCHAR(1)	,
		MSOL_PREV_STATUS_FLAG			VARCHAR(1)	,
		MSOL_PREV_AST_STS_ACTUAL		VARCHAR(1)	,
		MSOL_PAY_PRINCIPAL_ADJ			FLOAT		,
		MSOL_PAY_VAT_AMT_ADJ			FLOAT		,
		MSOL_PAY_PRINCIPAL_WO			FLOAT		,
		MSOL_PAY_VAT_AMT_WO				FLOAT		,
		MSOL_FORECLOSE_PROP_FLAG		VARCHAR(1)	,
		MSOL_DAMAGE_AMT_INC_VAT			FLOAT		,
		MSOL_COLLECTOR_CODE				VARCHAR(20)	,
		MSOL_INSTALL_PERIOD_NEXT_MTH	FLOAT		,
		MSOL_INSTALL_OVER_DUE_NEXT_MTH	FLOAT		,
		MSOL_COST_ESTIMATE				FLOAT		,
		MSOL_ESTIMATE_DATE				DATETIME	,
		MSOL_PAY_PRINCIPAL_ADJ_THIS_YY	FLOAT		,
		MSOL_PAY_PRINCIPAL_WO_THIS_YY	FLOAT		,
		MSOL_REALIZE_UNEARN				FLOAT		,
		MSOL_EOM_UNEARN					FLOAT		,
		MSOL_CF_UNEARN					FLOAT		,
		MSOL_REALIZE_UNEARN_SURPLUS		FLOAT		,
		MSOL_EOM_UNEARN_SURPLUS			FLOAT		,
		MSOL_CF_UNEARN_SURPLUS			FLOAT		,
		MSOL_REALIZE_OTHER_SURPLUS		FLOAT		,
		MSOL_EOM_OTHER_SURPLUS			FLOAT		,
		MSOL_CF_OTHER_SURPLUS			FLOAT		,
		MSOL_REALIZE_PAID_UNEARN		FLOAT		,
		MSOL_REALIZE_PAID_UNEARN_YEAR	FLOAT		,
		MSOL_REALIZE_PAID_UNEARN_MONTH	FLOAT		,
		MSOL_REALIZE_UNPAID_UNEARN		FLOAT		,
		MSOL_OS_UID1_UNEARN				FLOAT		,
		MSOL_REVERSE_UNEARN				FLOAT		,
		MSOL_REALIZE_PAID_SURPLUS		FLOAT		,
		MSOL_REALIZE_PAID_SURPLUS_YEAR	FLOAT		,
		MSOL_REALIZE_PAID_SURPLUS_MONTH	FLOAT		,
		MSOL_REALIZE_UNPAID_SURPLUS		FLOAT		,
		MSOL_EOM_SURPLUS				FLOAT		,
		MSOL_OS_UID1_SURPLUS			FLOAT		,
		MSOL_REVERSE_SURPLUS			FLOAT		,
		MSOL_REALIZE_PAID_OTHER			FLOAT		,
		MSOL_REALIZE_PAID_OTHER_YEAR	FLOAT		,
		MSOL_REALIZE_PAID_OTHER_MONTH	FLOAT		,
		MSOL_REALIZE_UNPAID_OTHER		FLOAT		,
		MSOL_EOM_OTHER					FLOAT		,
		MSOL_OS_UID1_OTHER				FLOAT		,
		MSOL_REVERSE_OTHER				FLOAT		,
		MSOL_OS_IN_YEAR					FLOAT		,
		MSOL_OS_MORE_YEAR				FLOAT		,
		MSOL_UNEARN_IN_YEAR				FLOAT		,
		MSOL_UNEARN_OTHER				FLOAT		,
		MSOL_UNEARN_OTHER_IN_YEAR		FLOAT		,
		MSOL_UNEARN_MORE_YEAR			FLOAT		,
		MSOL_UNEARN_OTHER_MORE_YEAR		FLOAT		,
		MSOL_PRINCIPAL_IN_YEAR			FLOAT		,
		MSOL_PRINCIPAL_MORE_YEAR		FLOAT		,
		MSOL_PROVISION_IN_YEAR			FLOAT		,
		MSOL_PROVISION_MORE_YEAR		FLOAT		,
		MSOL_NEW_PRINCIPAL				FLOAT		,
		MSOL_REALIZED_OTHER				FLOAT		,
		MSOL_REALIZED_OTHER_MONTH		FLOAT		,
		MSOL_REALIZED_OTHER_THIS_YEAR	FLOAT		,
		MSOL_NEW_PROVISION_AMT			FLOAT		,
		MSOL_REALIZED_EXP_INS_THIS_YEAR	FLOAT		,
		MSOL_REALIZED_EXP_INS			FLOAT		,
		JOB_RUN_KEY						BIGINT NOT NULL,
		SOURCE_SYSTEM_CODE				VARCHAR(10) NOT NULL,
		SOURCE_TABLE_NAME				VARCHAR(15) NOT NULL,
		DELETED_FLAG					CHAR(1)  NOT NULL DEFAULT 'N', 
		SOURCE_LAST_UPDATE_DATE_TIME	DATETIME NOT NULL,
		LAST_UPDATE_DATE_TIME			DATETIME  NOT NULL DEFAULT GETDATE()

); 

--CREATE CLUSTERED INDEX IDX_JOB_RUN_KEY ON STG.STG_TNB_TRN_CONTRACT_MONTHEND (JOB_RUN_KEY); 

--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Hire Purchase Table to store detail of contract, finance amount and any condition.', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Record Status', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND',@level2type=N'column', @level2name=N'MLHP_REC_STS'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Branch Code', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_BRN_DOC'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Request No.', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_REQ_DOC'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Contract No.', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_DOC_NO'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Transfer No.', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_CHECK_DIGIT'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Property Price (Include VAT)', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_SELLING_PLUS_VAT'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Property Price (No VAT)', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_SELLING_PRICE'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Property VAT', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_VAT_SELL'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Standard Price', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_AVERAGE_PRICE_80'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Down Amount Flag', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_DOWN_AMT_FLAG'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'VAT Down Pay By (Company / Dealer)', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_VAT_DOWN_COM_PAY_FLAG'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Down Payment Amount', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_DOWN_PAYMENT_AMT'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Down Percent', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_DOWN_PERCENT'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'VAT Down Flag', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND',@level2type=N'column', @level2name=N'MLHP_VAT_DOWN_FLAG'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'VAT Down Amount', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_VAT_DOWN'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Down Payment Flag', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_DOWN_PAYMENT_FLAG'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Invenstment Amount', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_INVENSTMENT_AMT'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'VAT Investment Amount', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_VAT_INVENSTMENT'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Hiring Charge', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_HIRING_CHARGE'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'VAT Hiring Charge', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_VAT_HIRING_CHARGE'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Flag Rate (Flat or Effective)', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_FLAG_RATE'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Round Amount Flag', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_ROUND_FLAG'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Flat Rate', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_FLAT_RATE'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Effective Rate', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_EFFECTIVE_RATE'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Flat Rate Per Month', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_FLAT_RATE_PER_MONTH'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Due Balance', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_DUE_BALANCE'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Vat Due Balance', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_VAT_DUE_BALANCE'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'O/S Balance', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND',@level2type=N'column', @level2name=N'MLHP_OUTSTANDING_BALANCE'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Dealer Code', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_DEALER_CODE'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Sub Dealer Code', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_FROM_SHOWROOM'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Salesman Code', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_SELLMAN_CODE'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Pay Install Amount', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_PAY_PERIOD_AMOUNT'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Pay VAT Install Amount', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_VAT_PAY_PERIOD'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Pay Last Install Amount', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_PAY_LAST_PERIOD_AMOUNT'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Pay Last VAT Install Amount', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_VAT_PAY_LAST_PERIOD'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Collateral No.', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_COLLATERAL_NO'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Debit Account For Pay By T/R', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_DR_AC'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Remark No. 3', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_REMARK_3'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Special Condition', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_SPECIAL_CONDITION'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Customer Position', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_CUSTOMER_POSITION'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Begin or Ending Flag', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_BEGIN_ENDIND_FLAG'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Subsidy Rate', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND',@level2type=N'column', @level2name=N'MLHP_SUBSIDIZED_RATE'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Subsidy Amount', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_SUBSIDIZED_AMOUNT'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Deduct Flag', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_DEDUCTION_FLAG'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Deduct Base Amount', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_DEDUCTION_BASE_AMT'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Deduct VAT', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_DEDUCTION_VAT'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Deduct W/H Tax', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_DEDUCTION_WH_TAX'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Deduct Paid Amount', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_DEDUCTION_PIAD_AMT'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'W/H Tax Rate', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_COMPANY_WHD_TAX_RATE'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Income Tax Rate', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_COMPANY_INC_TAX_RATE'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Deduct Rate', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_COMPANY_DEDUCTION_RATE'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Print Receipt Status', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_PRINT_RECEIPT_STATUS'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Receipt No.', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_RECEIPT_NO'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Print Tax Inv. Status', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_PRINT_TAX_INVOICE_STATUS'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Tax Inv. No.', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_TAX_INVOICE_NO'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Print Receipt Deduct Status', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND',@level2type=N'column', @level2name=N'MLHP_PRINT_RECEIPT_DEDUCT_STS'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Print Receipt Deduct No.', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_RECEIPT_DEDUCT_NO'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Print Vat Deduct Status', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_PRINT_VAT_DEDUCT_STATUS'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Print Vat Deduct No.', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_VAT_DEDUCT_NO'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Print Receipt Subsidy Status', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_PRINT_RECEIPT_SUBSIDY_ST'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Print Receipt Subsidy No.', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_RECEIPT_SUBSIDY_NO'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Print Vat Subsidy Status', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_PRINT_VAT_SUBSIDY_STATUS'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Print Vat subsidy No.', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_VAT_SUBSIDY_NO'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'VAT Rate', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_VAT_RATE'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Darft Flag', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_DARFT_FLAG'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Deduct Install Amount', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_DEDUCT_INS_AMT'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Receiver Code', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_RECEIVER_CODE'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Down Include VAT', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_DOWN_INCLUDE_VAT'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Creditor Code', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_CREDITOR_CODE'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Checker Code', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND',@level2type=N'column', @level2name=N'MLHP_CHECKER_CODE'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Purpose H/P', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_PURPOSE_HPLS'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'T/R From Contract No.', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_TR_FROM_DOC_NO'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Life Ins. Flag', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_LIFE_INS_FLAG'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Life Ins. Amount', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_LIFE_INS_AMT'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Life Ins. Include to Investment Flag', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_LIFE_INS_AMT_INC_TO_INVEST'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Marketing Date', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_MARKETING_DATE'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Insurance Flag', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_INSURANCE_FLAG'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Insurance Amount', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_INSURANCE_AMT'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Late Charge Code', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_LATE_CHARGE_CODE'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Late Charge Spread', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_LATE_CHARGE_SPREAD'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Insurance Amount Include Investment', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_ADJ_INSURANCE_AMT'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Insurance VAT Include Investment', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_ADJ_INSURANCE_VAT'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Insurance+VAT Amount Include Investment', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_ADJ_INSURANCE_INC_VAT'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Insurance Flag', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND',@level2type=N'column', @level2name=N'MLHP_INSTALLMENT_FLAG'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Term Calculate Commission', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_TERM_CALCULATE_COMM'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Flag For Process', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_FLAG'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Subsidy W/H Amount', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_SUBSIDIZED_WH_AMOUNT'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Finance Amount Subsidy', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_FIN_AMT_SUBSIDIZED'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Subsidy Net VAT', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_SUBSIDIZED_NET_VAT'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Net Effective Rate', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_NET_EFFECTIVE_RATE'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Net Subsidy Rate', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_NET_SUBSIDY_RATE'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Net Expense Rate', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_NET_EXPENSE_RATE'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Net Unearn Rate', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_NET_UNEARN_RATE'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Net Ins. Free Rate', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_NET_INS_FREE_RATE'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Life Ins. Date', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_LIFE_INS_DATE'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Life Ins. Period', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_LIFE_INS_PERIOD'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Life Ins. Amount per Month', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_LIFE_INS_AMT_PER_MONTH'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Health Ins. Amount', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND',@level2type=N'column', @level2name=N'MLHP_HEALTH_INS_AMT'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Health Ins. Amount Include Investment', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_ADJ_HEALTH_INS_AMT'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Health Ins. VAT Include Investment', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_ADJ_HEALTH_INS_VAT'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Health Ins. Amount+VAT Include Investment', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_ADJ_HEALTH_INS_INC_VAT'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Old Install Amount', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_BEGIN_PAY_PERIOD_AMT'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Net Life Insurance Rate', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_NET_LIFE_INS_RATE'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Net Health Insurance Rate', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_NET_HEALTH_INS_RATE'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Asset Tax Invoice No.ใบกำกับภาษีซื้อ', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_ASSET_TAX_INVOICE_NO'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Keep User Input Flat Rate', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_INPUT_FLAT_RATE'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Keep User Input Effective Rate', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_INPUT_EFFECTIVE_RATE'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Keep User Input Flat Rate per Month', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_INPUT_FLAT_RATE_PER_MONTH'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Life Ins. Include VAT', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_LIFE_INS_AMT_EXD_VAT'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ATM No.', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_ATM_NO'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Consult Flag', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_CONSULT_FLAG'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Control Owner', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND',@level2type=N'column', @level2name=N'MLHP_CONTROL_OWNER'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'No. of Install ', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_PERIOD_INSTALL_PRINCIPAL'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Standard Car Price', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_STANDARD_CAR_PRICE'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Advance Install Term', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_ADVANCE_INSTALLMENT_TERM'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Advance Install Amount', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_ADVANCE_INSTALLMENT_AMT'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Life Ins. Amount Before Change', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_LIFE_INS_AMT_ORG'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Life Ins. Amount per Month Before Change', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_LIFE_INS_AMT_PER_MONTH_ORG'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Life Ins. Exclude VAT Before Change', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_LIFE_INS_AMT_EXD_VAT_ORG'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Investment Amount', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_BEG_INVENSTMENT_AMT'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'VAT Investment Amount', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_BEG_VAT_INVENSTMENT'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Advance Install by customer (Term)', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_ADVANCE_BY_CUSTOMER_TERM'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Advance Install by customer (Amount)', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_ADVANCE_BY_CUSTOMER_AMT'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Advance Installment Adjust', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_ADVANCE_INSTALLMENT_ADJ'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Contract Fee', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_LIMIT_FEE_AMOUNT'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Contract Fee Vat', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_LIMIT_FEE_VAT_AMOUNT'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'PA Flag ', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_PA_FLAG'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'PA CODE (MDSC_TYP = ‘PA_CODE’)', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_PA_CODE'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'PA AMOUNT', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_PA_AMOUNT'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Bank Code', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_BANK_CODE'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Bank Account Number', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'MLHP_ACCOUNT_NO'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'job run key of currently running instance of job', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'JOB_RUN_KEY'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Code of source system for extraction', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'SOURCE_SYSTEM_CODE'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Source table name extracted', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'SOURCE_TABLE_NAME'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'y-means record marked for deletion. n - means active record', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'DELETED_FLAG'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Last update time of source', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'SOURCE_LAST_UPDATE_DATE_TIME'
--EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'record created / last updated date and time', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_CONTRACT_MONTHEND', @level2type=N'column', @level2name=N'LAST_UPDATE_DATE_TIME'



IF EXISTS (SELECT name FROM sys.synonyms WHERE name = N'STG_TNB_TRN_CONTRACT_MONTHEND')
	BEGIN
		DROP SYNONYM STG_TNB_TRN_CONTRACT_MONTHEND 
	END
CREATE SYNONYM STG_TNB_TRN_CONTRACT_MONTHEND FOR STG.STG_TNB_TRN_CONTRACT_MONTHEND;

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': STG_TNB_TRN_CONTRACT_MONTHEND TABLE CREATED.'

----------------------------------------------------------------------------------------------------------------------------------------

IF EXISTS (SELECT name FROM sys.tables WHERE name = N'STG_TNB_TRN_APPLICATION')
	BEGIN
		DROP TABLE STG.STG_TNB_TRN_APPLICATION
	END

CREATE TABLE STG.STG_TNB_TRN_APPLICATION (
		MLMH_REC_STS varchar(1) NULL,
		MLMH_LN_TYP varchar(2) NULL,
		MLMH_BRN_DOC float NULL,
		MLMH_REQ_DOC float NOT NULL,
		MLMH_DOC_NO float NULL,
		MLMH_CHECK_DIGIT float NULL,
		MLMH_CORE_BANK_ACCTNO numeric(18, 0) NULL,
		MLMH_DOC_DATE datetime NULL,
		MLMH_AST_FLAG varchar(5) NULL,
		MLMH_REJECT_FLAG varchar(10) NULL,
		MLMH_CFR_LINE_NO float NULL,
		MLMH_PURPOSE_CODE varchar(10) NULL,
		MLMH_PRD_COD varchar(10) NULL,
		MLMH_AO_COD varchar(10) NULL,
		MLMH_ORIGINAL_AMOUNT float NULL,
		MLMH_OUTSTANDING_BALANCE float NULL,
		MLMH_YESTERDAY_OS_BAL float NULL,
		MLMH_AR_CUR_MTH float NULL,
		MLMH_PAID_PRN_CUR float NULL,
		MLMH_PAID_VAT_CUR float NULL,
		MLMH_CONTACT_DATE datetime NULL,
		MLMH_LOAN_DATE datetime NULL,
		MLMH_MATURITY_DATE datetime NULL,
		MLMH_COLLECTION_TYPE varchar(2) NULL,
		MLMH_COLLECTOR_CODE varchar(20) NULL,
		MLMH_COLLECTION_AREA varchar(10) NULL,
		MLMH_PAY_PRINCIPAL_DAY float NULL,
		MLMH_PAY_INTEREST_DAY float NULL,
		MLMH_PERIOD_INSTALL_PRINCIPAL float NULL,
		MLMH_PERIOD_INSTALL_INTEREST float NULL,
		MLMH_START_PAY_PRINCIPAL_DATE datetime NULL,
		MLMH_START_PAY_INTEREST_DATE datetime NULL,
		MLMH_SUP_ID_APPROVE_REQUEST varchar(20) NULL,
		MLMH_APPROVE_REQUEST_DATE datetime NULL,
		MLMH_REQUEST_STATUS varchar(2) NULL,
		MLMH_SUP_ID_APPROVE_LOAN varchar(20) NULL,
		MLMH_APPROVE_LOAN_DATE datetime NULL,
		MLMH_STATUS_FLAG varchar(1) NULL,
		MLMH_CHANGE_STATUS_DATE datetime NULL,
		MLMH_TR_BRN_DOC float NULL,
		MLMH_TR_REQ_DOC float NULL,
		MLMH_TR_DOC_NO float NULL,
		MLMH_TR_CHECK_DIGIT float NULL,
		MLMH_TR_TO_BRN_DOC float NULL,
		MLMH_TR_TO_REQ_DOC float NULL,
		MLMH_LAST_CAL_INTEREST_DATE datetime NULL,
		MLMH_LAST_PAY_DOC_TYPE varchar(1) NULL,
		MLMH_LAST_PAY_BRANCH float NULL,
		MLMH_LAST_PAY_YEAR float NULL,
		MLMH_LAST_PAY_NO float NULL,
		MLMH_LAST_PAY_DATE datetime NULL,
		MLMH_NEXT_PAY_PRINCIPAL_DATE datetime NULL,
		MLMH_NEXT_PAY_INTEREST_DATE datetime NULL,
		MLMH_LST_PAY_PERIOD_PRINCIPAL float NULL,
		MLMH_LST_PAY_PERIOD_VAT float NULL,
		MLMH_BAL_INSTALL_NEXT_PRINC float NULL,
		MLMH_BAL_INSTALL_NEXT_INT float NULL,
		MLMH_BAL_INSTALL_NEXT_VAT float NULL,
		MLMH_CHEQUE_EFFECT_FLAG varchar(1) NULL,
		MLMH_CANCEL_DATE datetime NULL,
		MLMH_REJECT_REASON_CODE varchar(2) NULL,
		MLMH_REQ_DATE_TIME varchar(19) NULL,
		MLMH_CHQ_DATE_TIME varchar(19) NULL,
		MLMH_AST_STS varchar(10) NULL,
		MLMH_APPROXIMATE_CLOSE_AC datetime NULL,
		MLMH_CREATE_MM float NULL,
		MLMH_CREATE_YY float NULL,
		MLMH_SEND_REQ_DATE datetime NULL,
		MLMH_SEND_REQ_MM float NULL,
		MLMH_SEND_REQ_YY float NULL,
		MLMH_APPROVE_RQ_MM float NULL,
		MLMH_APPROVE_RQ_YY float NULL,
		MLMH_APPROVE_LN_MM float NULL,
		MLMH_APPROVE_LN_YY float NULL,
		MLMH_CANCEL_MM float NULL,
		MLMH_CANCEL_YY float NULL,
		MLMH_PO_DATE datetime NULL,
		MLMH_INV_LB_FLAG varchar(1) NULL,
		MLMH_INV_LB_DATE datetime NULL,
		MLMH_INV_LB_BY_USER varchar(20) NULL,
		MLMH_SETTLEMENT_PENDING_FLAG varchar(10) NULL,
		MLMH_STANDARD_CAR_PRICE float NULL,
		MLMH_SETTLEMENT_PENDING_DATE datetime NULL,
		MLMH_INCREASE_CAR_PRICE float NULL,
		MLMH_ASSIGN_APPL_TO_CREDIT datetime NULL,
		MLMH_RETURN_CASE_TO varchar(10) NULL,
		MLMH_DECREASE_CAR_PRICE float NULL,
		MLMH_DATE_ON_CHEQUE datetime NULL,
		MLMH_SEND_INVOICE_TO varchar(10) NULL,
		MLMH_FREE_DEC_4 float NULL,
		MLMH_FLAG_INS_TR varchar(1) NULL,
		MLMH_FLAG_ACT_TR varchar(1) NULL,
		MLMH_FLAG_INS_DEL varchar(1) NULL,
		MLMH_FLAG_ACT_DEL varchar(1) NULL,
		MLMH_MTN_TERMINAL_ID varchar(10) NULL,
		MLMH_MTN_PROGRAM_ID varchar(20) NULL,
		MLMH_MTN_BRANCH_CODE float NULL,
		MLMH_MTN_USER_ID varchar(20) NULL,
		MLMH_MTN_DATE_TIME datetime NULL,
		MLMH_COR_DOC_BRN float NULL,
		MLMH_COR_DOC_YY float NULL,
		MLMH_COR_DOC_NO float NULL,
		MLMH_CRA_BRN_DOC float NULL,
		MLMH_CRA_REQ_DOC float NULL,
		MLMH_REVOLVING_FLAG varchar(1) NULL,
		MLMH_DISBURSE_DATE datetime NULL,
		MLMH_STOP_VAT_FLAG varchar(1) NULL,
		MLMH_REL_UID_SEQ float NULL,
		MLMH_PROJECT_CODE varchar(10) NULL,
		MLMH_PRODUCT_TYPE varchar(10) NULL,
		MLMH_LN_CHANNEL varchar(1) NULL,
		MLMH_BRANCH_GROUP varchar(10) NULL,
		MLMH_BRANCH_CODE float NULL,
		MLMH_SUB_BRANCH_CODE float NULL,
		MLMH_BRANCH_CORE_BANK float NULL,
		MLMH_GEN_SCRIPT_COMPLETE varchar(1) NULL,
		MLMH_REQ_DOC_OLD float NULL,
		MLMH_DOC_RECEIVE_DATE datetime NULL,
		MLMH_MARKETING_SUP varchar(10) NULL,
		MLMH_AREA_MANAGER varchar(10) NULL,
		MLMH_REFERRAL_NO int NULL,
		MLMH_GEN_SCRIPT_FACILITY varchar(1) NULL,
		MLMH_BUSINESS_SIZE char(1) NULL,
		MLMH_EXCEPTION_AUTO_REJECT char(1) NULL,
		MLMH_FLAG char(1) NULL,
		MLMH_ACCRUE_INT_LAST_CALC_DATE datetime NULL,
		MLMH_ACCRUE_INT_RATE float NULL,
		MLMH_ACCRUE_INT_RATE_CHANGE datetime NULL,
		MLMH_ACCRUE_INT_AMT_PER_DAY decimal(17, 5) NULL,
		MLMH_ACCRUE_INT_ADJ_AMT_TODAY decimal(17, 5) NULL,
		MLMH_ACCRUE_INT_MONTH decimal(17, 5) NULL,
		MLMH_ACCRUE_INT_AMOUNT_OS decimal(17, 5) NULL,
		MLMH_STOP_VAT_DATE datetime NULL,
		MLMH_TAX_INT float NULL,
		MLMH_NON_TAX_INT float NULL,
		MLMH_SUB_CAMPAIGN_CODE varchar(10) NULL,
		MLMH_CLOSE_ACC_BEFORE_MONTH float NULL,
		MLMH_CLOSE_ACC_BEFORE_CHARGE float NULL,
		MLMH_STAMP_DUTY float NULL,
		MLMH_GUARANTOR_DUTY float NULL,
		MLMH_DUPLICATE_DUTY float NULL,
		MLMH_CREDIT_RATING decimal(3, 0) NULL,
		MLMH_CLOSE_AMORTIZE_FLAG varchar(1) NULL,
		MLMH_CLOSE_AMORTIZE_DATE datetime NULL,
		MLMH_GRADE varchar(1) NULL,
		MLMH_ACF_NO varchar(20) NULL,
		MLMH_RELIEVE_FLAG varchar(1) NULL,
		MLMH_ACCRUE_INT_AMOUNT_OS_YES decimal(17, 5) NULL,
		MLMH_TAX_INT_YES float NULL,
		MLMH_NON_TAX_INT_YES float NULL,
		MLMH_PAID_INT_CUR float NULL,
		MLMH_ACCRUE_PENALTY_INT float NULL,
		MLMH_STOP_ACCRUE_INT char(1) NULL,
		MLMH_DOC_YY_REPO int NULL,
		MLMH_DOC_NO_REPO float NULL,
		MLMH_CUST_ID_BUYER float NULL,
		MLMH_PAYBACK_PREV_MONTH char(1) NULL,
		MLMH_PAID_PRN_PRV_MTH float NULL,
		MLMH_PAID_VAT_PRV_MTH float NULL,
		MLMH_DISCOUNT_BEFORE_CLOSING char(1) NULL,
		MLMH_REPO_SELL_DATE datetime NULL,
		MLMH_PRINT_CANCEL_LETTER_DATE datetime NULL,
		MLMH_REPO_DATE datetime NULL,
		MLMH_REPO_FLAG varchar(1) NULL,
		MLMH_MSOL_YEAR float NULL,
		MLMH_MSOL_MONTH float NULL,
		MLMH_BAR_CODE varchar(10) NULL,
		MLMH_COL_GROUP_FLAG varchar(1) NULL,
		MLMH_FIELD_CODE varchar(20) NULL,
		MLMH_CUSTOMER_COME_FROM varchar(2) NULL,
		MLMH_CONSULT_FLAG varchar(1) NULL,
		MLMH_APPROVE_REASON varchar(5) NULL,
		MLMH_LAST_PAYMENT_DATE datetime NULL,
		MLMH_OS_INC_VAT float NULL,
		MLMH_COLLECTOR_CODE_OLD varchar(20) NULL,
		MLMH_SEND_NCB varchar(1) NULL,
		MLMH_CHANGE_COLLECTOR_DATE datetime NULL,
		MLMH_WO_DATE datetime NULL,
		MLMH_FORECLOSED_PROPERTIES float NULL,
		MLMH_REFIN_LOAN_NO float NULL,
		MLMH_REFIN_LOAN_CHK_DIGIT int NULL,
		MLMH_LAST_PAY_BY_CODE varchar(2) NULL,
		MLMH_BANK_CODE varchar(3) NULL,
		MLMH_ACCOUNT_NO varchar(15) NULL,
		MLMH_OVERDUE_TERM float NULL,
		MLMH_LAST_INTEREST_AMT_OVER float NULL,
		MLMH_DOC_NO_SORT float NULL,
		MLMH_ADVICE_NAME varchar(150) NULL,
		MLMH_ADVICE_PHONE varchar(200) NULL,
		MLMH_BARCODE_TYPE varchar(2) NULL,
		MLMH_SMILE_CARD_FLAG varchar(1) NULL,
		MLMH_SMILE_CARD_DATE datetime NULL,
		MLMH_SMILE_CARD_AMT float NULL,
		MLMH_SCAN_DATE datetime NULL,
		MLMH_UPLOAD_DATE datetime NULL,
		MLMH_CLAIM_INSURANCE float NULL,
		MLMH_CLAIM_PAY_DATE datetime NULL,
		JOB_RUN_KEY BIGINT NOT NULL,
		SOURCE_SYSTEM_CODE VARCHAR(10) NOT NULL,
		SOURCE_TABLE_NAME VARCHAR(15) NOT NULL,
		DELETED_FLAG CHAR(1)  NOT NULL DEFAULT 'N', 
		SOURCE_LAST_UPDATE_DATE_TIME DATETIME NOT NULL,
		LAST_UPDATE_DATE_TIME DATETIME  NOT NULL DEFAULT GETDATE()

); 

--CREATE CLUSTERED INDEX IDX_JOB_RUN_KEY ON STG.STG_TNB_TRN_APPLICATION (JOB_RUN_KEY); 

EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Loan Master Table', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Record Status', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_REC_STS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Loan Type', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_LN_TYP'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Branch Code', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_BRN_DOC'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Request No.', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_REQ_DOC'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Contract No.', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_DOC_NO'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Transfer No.', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_CHECK_DIGIT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Core Bank Account No.', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_CORE_BANK_ACCTNO'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Entry Date', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_DOC_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'1 = New, 2 Used', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_AST_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Normal, 1 Reject, 2=Cancel', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_REJECT_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Credit Line No.', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_CFR_LINE_NO'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'วัตถุประสงค์การกู้ (รหัสตาม BOT)', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_PURPOSE_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'รหัสการบริโภคส่วนบุคคล', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_PRD_COD'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'รหัส Checker หรือ Marketing', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_AO_COD'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ค่าเช่ารวมดอกเบี้ยไม่รวม VAT (ตอนเริ่มต้นสัญญา)', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_ORIGINAL_AMOUNT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ค่าเช่ารวมดอกเบี้ยไม่รวม VAT คงเหลือ', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_OUTSTANDING_BALANCE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ค่าเช่ารวมดอกเบี้ยไม่รวม VAT คงเหลือ (Yesterday)', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_YESTERDAY_OS_BAL'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ยอดชำระ VAT ล่วงหน้า ในเดือน', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_AR_CUR_MTH'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ยอดชำระ ค่างวด ในเดือน', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_PAID_PRN_CUR'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ยอดชำระ VAT ทั้งหมด ในเดือน', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_PAID_VAT_CUR'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'วันที่ทำสัญญา', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_CONTACT_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'วันที่เริ่มคิดดอกเบี้ย', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_LOAN_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'วันที่สิ้นสุด', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_MATURITY_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'วิธีการชำระค่างวด', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_COLLECTION_TYPE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'รหัสพนักงานติดตามหนี้', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_COLLECTOR_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'รหัสพื้นที่ของพนักงานติดตามหนี้', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_COLLECTION_AREA'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ชำระค่างวดทุก ๆ วันที่', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_PAY_PRINCIPAL_DAY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ชำระดอกเบี้ยทุก ๆ วันที่', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_PAY_INTEREST_DAY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ระยะเวลาเช่าซื้อ (จำนวนงวด)', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_PERIOD_INSTALL_PRINCIPAL'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ระยะเวลาชำระดอกเบี้ย (จำนวนงวด)', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_PERIOD_INSTALL_INTEREST'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'วันที่เริ่มชำระค่างวด', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_START_PAY_PRINCIPAL_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'วันที่เริ่มชำระดอกเบี้ย', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_START_PAY_INTEREST_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'รหัส Credit Supervisor ที่อนุมัติใบคำขอ', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_SUP_ID_APPROVE_REQUEST'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'วันเวลาที่อนุมัติใบคำขอ', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_APPROVE_REQUEST_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'สถานะใบคำขอ', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_REQUEST_STATUS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'รหัสผู้ใช้งาน ที่อนุมัติสัญญา', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_SUP_ID_APPROVE_LOAN'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'วันเวลาที่อนุมัติสัญญา', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_APPROVE_LOAN_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'สถานะสัญญา', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_STATUS_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'วันที่เปลี่ยนสถานะสัญญา', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_CHANGE_STATUS_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'เอกสารสาขาที่โอนสิทธิ', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_TR_BRN_DOC'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'เลขที่ใบคำขอที่โอนสิทธิ', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_TR_REQ_DOC'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'เลขที่สัญญาที่โอนสิทธิ', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_TR_DOC_NO'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ลำดับที่สัญญาที่โอนสิทธิ', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_TR_CHECK_DIGIT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'โอนสิทธิไปที่สาขาใบคำขอที่รับโอน', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_TR_TO_BRN_DOC'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'โอนสิทธิไปที่เลขที่ใบคำขอที่รับโอน', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_TR_TO_REQ_DOC'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'วันที่คิดเบี้ยปรับล่าสุด', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_LAST_CAL_INTEREST_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ประเภทเอกสารล่าสุด', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_LAST_PAY_DOC_TYPE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'สาขาเอกสารล่าสุด', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_LAST_PAY_BRANCH'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ปีเอกสารล่าสุด', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_LAST_PAY_YEAR'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'เลขที่เอกสารล่าสุด', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_LAST_PAY_NO'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'วันที่ชำระล่าสุด', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_LAST_PAY_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'วันที่ชำระค่างวดครั้งต่อไป', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_NEXT_PAY_PRINCIPAL_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'วันที่ชำระดอกเบี้ยครั้งต่อไป', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_NEXT_PAY_INTEREST_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ชำระค่างวดล่าสุดครั้งที่ (Period No.)', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_LST_PAY_PERIOD_PRINCIPAL'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ชำระ VAT ล่าสุดครั้งที่', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_LST_PAY_PERIOD_VAT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'จำนวนเงินที่จ่ายค่างวดล่วงหน้า (กรณีจ่ายไม่ครบงวด)', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_BAL_INSTALL_NEXT_PRINC'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'จำนวนเงินที่จ่ายดอกเบี้ยล่วงหน้า(กรณีจ่ายไม่ครบงวด)', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_BAL_INSTALL_NEXT_INT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'จำนวนเงินที่จ่าย VAT ล่วงหน้า (กรณีจ่ายไม่ครบงวด)', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_BAL_INSTALL_NEXT_VAT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Y กรณีที่การชำระเงินด้วยเช็ค และรอผลการ Clearing', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_CHEQUE_EFFECT_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'วันที่ยกเลิกสัญญา', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_CANCEL_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'รหัสเหตุผลการไม่อนุมัติ', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_REJECT_REASON_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'วันเวลาอนุมัติใบคำขอ (Text)', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_REQ_DATE_TIME'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'วันเวลาบันทึกการจ่ายเงิน (Text)', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_CHQ_DATE_TIME'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'รหัสสถานะทรัพย์สิน', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_AST_STS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'วันที่ลูกค้านัดปิดบัญชี', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_APPROXIMATE_CLOSE_AC'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'เดือนที่สร้างใบคำขอ', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_CREATE_MM'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ปีที่สร้างใบคำขอ', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_CREATE_YY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'วันที่ D/E ส่งใบคำขอให้ Creditor', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_SEND_REQ_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'เดือน D/E ส่งใบคำขอให้ Creditor', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_SEND_REQ_MM'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ปี D/E ส่งใบคำขอให้ Creditor', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_SEND_REQ_YY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'เดือนที่อนุมัติใบคำขอ', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_APPROVE_RQ_MM'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ปีที่อนุมัติใบคำขอ', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_APPROVE_RQ_YY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'เดือนที่อนุมัติสัญญา', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_APPROVE_LN_MM'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ปีที่อนุมัติสัญญา', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_APPROVE_LN_YY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'เดือนที่ยกเลิกสัญญา', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_CANCEL_MM'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ปีที่ยกเลิกสัญญา', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_CANCEL_YY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'วันที่ใบสั่งซื้อ', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_PO_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Invoice / Log Book Receive Flag', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_INV_LB_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Invoice / Log Book Receive Date', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_INV_LB_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Invoice / Log Book Receive By', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_INV_LB_BY_USER'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Settlement Pending Flag', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_SETTLEMENT_PENDING_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ราคากลาง', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_STANDARD_CAR_PRICE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Settlement Pending Date', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_SETTLEMENT_PENDING_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ราคาส่วนเพิ่ม นอกจากราคารถ', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_INCREASE_CAR_PRICE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'วันที่จ่ายงานให้ Creditor', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_ASSIGN_APPL_TO_CREDIT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ส่งใบคำขอคืนหน่วยงาน', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_RETURN_CASE_TO'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ราคาส่วนลด จากราคารถ', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_DECREASE_CAR_PRICE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'วันที่หน้าเช็ค', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_DATE_ON_CHEQUE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ส่ง Invoice ให้', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_SEND_INVOICE_TO'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ส่วนลดจากปิดบัญชี', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_FREE_DEC_4'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'โอนกรมธรรม์ภาคสมัครใจ', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_FLAG_INS_TR'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'โอนกรมธรรม์ภาคบังคับ', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_FLAG_ACT_TR'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ยกเลิกกรมธรรม์ภาคสมัครใจ', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_FLAG_INS_DEL'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ยกเลิกกรมธรรม์ภาคบังคับ', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_FLAG_ACT_DEL'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'แก้ไขข้อมูลที่เครื่อง', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_MTN_TERMINAL_ID'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'แก้ไขโดยรหัสโปรแกรม', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_MTN_PROGRAM_ID'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'แก้ไขที่สาขา', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_MTN_BRANCH_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'แก้ไขโดย User ID.', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_MTN_USER_ID'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'วันเวลาที่แก้ไข', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_MTN_DATE_TIME'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'สาขาเอกสารคำขอเบิกวงเงิน', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_COR_DOC_BRN'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ปีเอกสารคำขอเบิกวงเงิน', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_COR_DOC_YY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'เลขที่เอกสารคำขอเบิกวงเงิน', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_COR_DOC_NO'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'สาขาเอกสารคำขอใช้วงเงิน', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_CRA_BRN_DOC'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'เลขที่เอกสารคำขอใช้วงเงิน', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_CRA_REQ_DOC'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Revolving Flag', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_REVOLVING_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'วันที่ทำการจ่ายเงินค่าสินค้า', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_DISBURSE_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Stop VAT Flag', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_STOP_VAT_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Realize UID Seq. No.', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_REL_UID_SEQ'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Campaign', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_PROJECT_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ประเภทการเช่าซื้อ/เช่า', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_PRODUCT_TYPE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Loan Channel', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_LN_CHANNEL'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Area Code ของพนักงงานขาย', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_BRANCH_GROUP'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Hub Code ของพนักงงานขาย', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_BRANCH_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Sub Hub Code ของพนักงงานขาย', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_SUB_BRANCH_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'สาขาที่ออกสัญญา อ้างอิงตามพนักงานขาย ', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_BRANCH_CORE_BANK'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Gen. Script for Core Bank Flag', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_GEN_SCRIPT_COMPLETE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'เลขที่ใบคำขอเดิม', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_REQ_DOC_OLD'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'วันที่รับ App. In จริงจาก Marketing', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_DOC_RECEIVE_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Markting Supervisor อ้างอิงตามฐานข้อมูลพนักงานขาย', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_MARKETING_SUP'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Area Manager อ้างอิงตามฐานข้อมูลพนักงานขาย', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_AREA_MANAGER'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Referral No.', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_REFERRAL_NO'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Gen. Script Facility for Core Bank Flag', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_GEN_SCRIPT_FACILITY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Business Size', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_BUSINESS_SIZE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Flag ยกเว้น Auto Reject', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_EXCEPTION_AUTO_REJECT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Flag สำหรับการใช้งานประมวลผลสิ้นเดือน', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'วันที่คำนวณ Accrue Interest ล่าสุด (Effective Rate)', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_ACCRUE_INT_LAST_CALC_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'อัตราดอกเบี้ย  (Effective Rate)', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_ACCRUE_INT_RATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'อัตราดอกเบี้ยล่าช้า  (Effective Rate)', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_ACCRUE_INT_RATE_CHANGE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'จำนวนเงินดอกเบี้ยต่อวัน', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_ACCRUE_INT_AMT_PER_DAY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ยอดปรับปรุงดอกเบี้ยในวัน', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_ACCRUE_INT_ADJ_AMT_TODAY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ดอกเบี้ยสะสมในเดือน', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_ACCRUE_INT_MONTH'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ดอกเบี้ยสะสมคงเหลือ', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_ACCRUE_INT_AMOUNT_OS'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'วันที่ Stop Vat', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_STOP_VAT_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ดอกเบี้ยที่เสียภาษี', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_TAX_INT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ดอกเบี้ยที่ยังไม่เสียภาษี (Memo Int.)', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_NON_TAX_INT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Sub Campaign Code', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_SUB_CAMPAIGN_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'จำนวนเดือนที่ห้ามปิดบัญชีก่อนกำหนด', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_CLOSE_ACC_BEFORE_MONTH'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'อัตราคำธรรมเนียม ที่ปิดบัญชีก่อนกำหนด', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_CLOSE_ACC_BEFORE_CHARGE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ค่าอากรสัญญาเช่าซื้อ', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_STAMP_DUTY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ค่าอากรสัญญาค้ำ', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_GUARANTOR_DUTY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ค่าอากรสำเนา', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_DUPLICATE_DUTY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Credit Rating ของบริษัทลูกค้า', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_CREDIT_RATING'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'สถานะการรับรู้รายได้ทั้งหมด', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_CLOSE_AMORTIZE_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'วันที่รับรู้รายได้ทั้งหมด', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_CLOSE_AMORTIZE_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'รหัสการจัดชั้น', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_GRADE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ACF No. (Core Bank)', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_ACF_NO'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Flag การผ่อนผ่อน', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_RELIEVE_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ดอกเบี้ยสะสมคงเหลือ เมื่อวาน', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_ACCRUE_INT_AMOUNT_OS_YES'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ดอกเบี้ยที่เสียภาษี เมื่อวาน', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_TAX_INT_YES'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ดอกเบี้ยที่ยังไม่เสียภาษี เมื่อวาน (Memo Int.)', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_NON_TAX_INT_YES'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ชำระดอกเบี้ยในเดือน', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_PAID_INT_CUR'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'เบี้ยปรับสะสม', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_ACCRUE_PENALTY_INT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Flag หยุดรับรู้รายได้ (Effective Rate)', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_STOP_ACCRUE_INT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ปีเอกสารการรับชำระ กรณีผู้ประมูลชำระค่าสินค้ารถยึด', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_DOC_YY_REPO'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'เลขที่เอกสารการรับชำระ กรณีผู้ประมูลชำระค่าสินค้ารถยึด', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_DOC_NO_REPO'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'รหัสลูกค้าสำหรับผู้ประมูลรถยึด', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_CUST_ID_BUYER'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Flag การประมวลผลสิ้นเดือนย้อนหลัง', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_PAYBACK_PREV_MONTH'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ชำระค่างวดย้อนหลัง', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_PAID_PRN_PRV_MTH'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ชำระค่า VAT ย้อนหลัง', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_PAID_VAT_PRV_MTH'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ให้ส่วนลดก่อนปิดบัญชี กรณีเฉพาะสัญญา Leasing', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_DISCOUNT_BEFORE_CLOSING'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'วันที่ขายรถยึด', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_REPO_SELL_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'วันที่ออกจดหมายบอกเลิกสัญญา', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_PRINT_CANCEL_LETTER_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'วันที่รับรถ อ้างอิง receive date', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_REPO_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'สถานะการยึด', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_REPO_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ปีข้อมูล Summary of Loan', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_MSOL_YEAR'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'เดือนข้อมูล Summary of Loan', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_MSOL_MONTH'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Bar Code', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_BAR_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'รหัสกลุ่มฝ่ายบริหารหนี้', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_COL_GROUP_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'รหัสพนักงานเก็บเงิน', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_FIELD_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ที่มาของลูกค้า', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_CUSTOMER_COME_FROM'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'สถานะการให้คำปรึกษา', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_CONSULT_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'รหัสเหตุผลการอนุมัติ', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_APPROVE_REASON'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'วันที่ชำระค่างวดหรือ VAT ล่าสุด', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_LAST_PAYMENT_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ค่างวดรวม VAT คงเหลือ', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_OS_INC_VAT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'รหัสผู้ติดตามหนี้เดิม', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_COLLECTOR_CODE_OLD'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ส่ง NCB Flag', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_SEND_NCB'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'วันที่แก้ไขรหัสผู้ติดตามหนี้', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_CHANGE_COLLECTOR_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'วันที่ตัดหนี้สูญ', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_WO_DATE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ค่าเสียหายคงเหลือ', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_FORECLOSED_PROPERTIES'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'เลขที่สัญญา Refinance', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_REFIN_LOAN_NO'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ลำดับที่สัญญา Refinance', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_REFIN_LOAN_CHK_DIGIT'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'รหัสการชำระค่างวดล่าสุด', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_LAST_PAY_BY_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'รหัสธนาคาร', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_BANK_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'เลขที่บัญชีธนาคาร', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_ACCOUNT_NO'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'ผู้แนะนำ', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_ADVICE_NAME'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'เบอร์โทรผู้แนะนำ', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION',@level2type=N'column', @level2name=N'MLMH_ADVICE_PHONE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'job run key of currently running instance of job', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION', @level2type=N'column', @level2name=N'JOB_RUN_KEY'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Code of source system for extraction', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION', @level2type=N'column', @level2name=N'SOURCE_SYSTEM_CODE'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Source table name extracted', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION', @level2type=N'column', @level2name=N'SOURCE_TABLE_NAME'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'y-means record marked for deletion. n - means active record', @level0type=N'schema', @level0name=N'STG',  @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION', @level2type=N'column', @level2name=N'DELETED_FLAG'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'Last update time of source', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION', @level2type=N'column', @level2name=N'SOURCE_LAST_UPDATE_DATE_TIME'
EXEC SYS.SP_ADDEXTENDEDPROPERTY @NAME=N'MS_description', @value=N'record created / last updated date and time', @level0type=N'schema', @level0name=N'STG', @level1type=N'table', @level1name=N'STG_TNB_TRN_APPLICATION', @level2type=N'column', @level2name=N'LAST_UPDATE_DATE_TIME'



IF EXISTS (SELECT name FROM sys.synonyms WHERE name = N'STG_TNB_TRN_APPLICATION')
	BEGIN
		DROP SYNONYM STG_TNB_TRN_APPLICATION  
	END
CREATE SYNONYM STG_TNB_TRN_APPLICATION FOR STG.STG_TNB_TRN_APPLICATION;

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': STG_TNB_TRN_APPLICATION TABLE CREATED.'

----------------------------------------------------------------------------------------------------------------------------------------

IF EXISTS (SELECT name FROM sys.tables WHERE name = N'STG_TNB_TRN_APP_IN_LOG')
	BEGIN
		DROP TABLE STG.STG_TNB_TRN_APP_IN_LOG
	END
GO

CREATE TABLE STG.STG_TNB_TRN_APP_IN_LOG 
(
		MLRQ_BRN_DOC FLOAT NULL,
		MLRQ_REQ_DOC FLOAT NULL,
		MLRQ_START_DATE_TIME DATETIME NULL,
		MLRQ_STATUS_BEFORE_CHANGE VARCHAR(2) NULL,
		MLRQ_END_DATE_TIME DATETIME NULL,
		MLRQ_BY_PROGRAM_ID VARCHAR(10) NULL,
		MLRQ_STATUS VARCHAR(2) NULL,
		MLRQ_USER_ID VARCHAR(20) NULL,
		MLRQ_CR_CODE VARCHAR(10) NULL,
		JOB_RUN_KEY BIGINT NOT NULL,
		SOURCE_SYSTEM_CODE VARCHAR(10) NOT NULL,
		SOURCE_TABLE_NAME VARCHAR(15) NOT NULL,
		DELETED_FLAG CHAR(1) NOT NULL DEFAULT 'N',
		COMMENTS VARCHAR(500) NULL,
		SOURCE_LAST_UPDATE_DATE_TIME DATETIME NOT NULL,
		LAST_UPDATE_DATE_TIME DATETIME NOT NULL DEFAULT GETDATE()

);

--CREATE CLUSTERED INDEX IDX_JOB_RUN_KEY ON STG.STG_TNB_TRN_APP_IN_LOG (JOB_RUN_KEY); 

EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Loan Application In Log Table' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_TRN_APP_IN_LOG'
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

IF EXISTS (SELECT name FROM sys.synonyms WHERE name = N'STG_TNB_TRN_APP_IN_LOG')
	BEGIN
		DROP SYNONYM STG_TNB_TRN_APP_IN_LOG 
	END
CREATE SYNONYM STG_TNB_TRN_APP_IN_LOG FOR STG.STG_TNB_TRN_APP_IN_LOG;

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': STG_TNB_TRN_APP_IN_LOG TABLE CREATED.'

----------------------------------------------------------------------------------------------------------------------------------------

IF EXISTS (SELECT name FROM sys.tables WHERE name = N'STG_TNB_MST_BRANCH')
	BEGIN
		DROP TABLE STG.STG_TNB_MST_BRANCH
	END

CREATE TABLE STG.STG_TNB_MST_BRANCH
(
			MDLR_STATUS VARCHAR(1),
			MDLR_DEALER_CODE VARCHAR(10) NOT NULL,
			MDLR_TITLE_CODE VARCHAR(6),
			MDLR_DEALER_NAME_THAI VARCHAR(60),
			MDLR_DEALER_NAME_ENGLISH VARCHAR(60),
			MDLR_ADDR_NO VARCHAR(20),
			MDLR_ADDR_MOO VARCHAR(50),
			MDLR_ADDR_BUILDING VARCHAR(50),
			MDLR_ADDR_SOI VARCHAR(50),
			MDLR_ADDR_ROAD VARCHAR(50),
			MDLR_ADDR_TUMPON VARCHAR(2),
			MDLR_ADDR_AMPUR VARCHAR(2),
			MDLR_ADDR_CHANGWAT VARCHAR(2),
			MDLR_ADDR_ZIP_CODE VARCHAR(10),
			MDLR_TELEPHONE VARCHAR(75),
			MDLR_FAX_NO VARCHAR(30),
			MDLR_EMAIL_ADDR VARCHAR(50),
			MDLR_CONTACT_PERSON VARCHAR(50),
			MDLR_COMM_PERCENT VARCHAR(50),
			MDLR_CHEQUE_NAME VARCHAR(80),
			MDLR_VAT_ADR1 VARCHAR(50),
			MDLR_VAT_ADR2 VARCHAR(50),
			MDLR_VAT_ADR3 VARCHAR(50),
			MDLR_VAT_ADR4 VARCHAR(50),
			MDLR_TAX_ID VARCHAR(13),
			MDLR_CHEQUE_TYPE VARCHAR(1),
			MDLR_PAY_COMM_FLAG VARCHAR(1),
			MDLR_HIR_CORP_RATE FLOAT,
			MDLR_COMM_WH VARCHAR(1),
			MDLR_HIR_IND_RATE FLOAT,
			MDLR_COMM_WH_IND VARCHAR(1),
			MDLR_CHANG_HIR_RATE_FLAG VARCHAR(1),
			MDLR_CHEQUE_TYPE_COM_FIN VARCHAR(1),
			MDLR_CHEQUE_TYPE_COM_FIN_1 VARCHAR(1),
			MDLR_PAY_INS_FLAG VARCHAR(1),
			MDLR_COMM_INS_AMT FLOAT, 
			MDLR_INS_WH VARCHAR(1),
			MDLR_CHANG_INS_AMT_FLAG VARCHAR(1),
			MDLR_CHEQUE_TYPE_COM_INS VARCHAR(1),
			MDLR_CHEQUE_TYPE_COM_INS_1 VARCHAR(1),
			MDLR_DEALER_GROUP VARCHAR(10),
			MDLR_CHEQUE_FLAG VARCHAR(1),
			MDLR_OTHER_FLAG VARCHAR(1),
			MDLR_IN_VAT_SYSTEM VARCHAR(1),
			MDLR_ABSORB_VAT VARCHAR(1),
			MDLR_DARFT_FLAG VARCHAR(1),
			MDLR_TRANSFER_TO_BNK VARCHAR(3),
			MDLR_TRANSFER_TO_BRN VARCHAR(40),
			MDLR_TRANSFER_TO_AC_TYPE VARCHAR(1),
			MDLR_ACCOUNT_NO VARCHAR(15),
			MDLR_CREDIT_CODE VARCHAR(1),
			MDLR_PO_FLAG VARCHAR(1),
			MDLR_PO_DEALER_HO VARCHAR(10),
			MDLR_AO_COD VARCHAR(10),
			MDLR_PO_NAME VARCHAR(50),
			MDLR_PO_INSURANCE_FLAG VARCHAR(1),
			MDLR_PO_COMM_RATE_FLAG VARCHAR(1),
			MDLR_ASSET_BRAND VARCHAR(40),
			MDLR_FREE_DEC_1 FLOAT,
			MDLR_FREE_ALPHA_2 VARCHAR(10),
			MDLR_SALESMAN_RUN_NO FLOAT,
			MDLR_BASE_CALULATE_COMM INT,
			MDLR_BASE_CALCULATE_CHANGE CHAR(1),
			MDLR_ASSET_TYPE VARCHAR(1),
			MDLR_CORE_BANK_CODE VARCHAR(10),
			MDLR_LIFE_INS_AMT_INC_TO_INVEST VARCHAR(1),
			MDLR_PAY_ASSET_TYPE VARCHAR(2),
			MDLR_PAY_ASSET_BNK_CODE VARCHAR(4),
			MDLR_PAY_ASSET_ACC_NO VARCHAR(20),
			MDLR_PAY_COMM_ASSET_TYPE VARCHAR(2),
			MDLR_PAY_COMM_ASSET_BNK_CODE VARCHAR(4),
			MDLR_PAY_COMM_ASSET_ACC_NO VARCHAR(20),
			MDLR_PAY_COMM_INS_TYPE VARCHAR(2),
			MDLR_PAY_COMM_INS_BNK_CODE VARCHAR(4),
			MDLR_PAY_COMM_INS_ACC_NO VARCHAR(20),
			MDLR_PAY_EXTRA_COMM_TYPE VARCHAR(2),
			MDLR_PAY_EXTRA_COMM_BNK_CODE VARCHAR(4),
			MDLR_PAY_EXTRA_COMM_ACC_NO VARCHAR(20),
			MDLR_ADDITIONAL_CONDITION TEXT,
			MDLR_MTN_TERMINAL_ID VARCHAR(10),
			MDLR_MTN_PROGRAM_ID VARCHAR(20),
			MDLR_MTN_BRANCH_CODE FLOAT,
			MDLR_MTN_USER_ID VARCHAR(20),
			MDLR_MTN_DATE_TIME DATETIME,
			MDLR_APPROVED_BY VARCHAR(20),
			MDLR_APPROVED_DATE DATETIME,
			MDLR_RUNNING  FLOAT,
			MDLR_STATUS_PROCESS VARCHAR(1),
			MDLR_BRACH_ACC_CODE FLOAT,
			MDLR_CONTRACT_DATE DATETIME,
			MDLR_LAST_BOOK_LOAN_DATE DATETIME,
			MDLR_TAKE_CARE_BY_BRANCH_CODE FLOAT,
			MDLR_BRANCH_ID FLOAT,
			JOB_RUN_KEY BIGINT NOT NULL,
			SOURCE_SYSTEM_CODE VARCHAR(10) NOT NULL,
			SOURCE_TABLE_NAME VARCHAR(15) NOT NULL,
			DELETED_FLAG CHAR(1)  NOT NULL DEFAULT 'N', 
			SOURCE_LAST_UPDATE_DATE_TIME DATETIME NOT NULL,
			LAST_UPDATE_DATE_TIME DATETIME  NOT NULL DEFAULT GETDATE() 
)

--CREATE CLUSTERED INDEX IDX_JOB_RUN_KEY ON STG.STG_TNB_MST_BRANCH (JOB_RUN_KEY); 
--ALTER TABLE STG.STG_TNB_MST_BRANCH ADD CONSTRAINT PK_STG_TNB_MST_BRANCH PRIMARY KEY CLUSTERED (MDLR_DEALER_CODE);
--CREATE CLUSTERED INDEX IDX_MDLR_DEALER_CODE ON STG.STG_TNB_MST_BRANCH (MDLR_DEALER_CODE);  

EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Record Status' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_STATUS'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Dealer Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_DEALER_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Title Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_TITLE_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Thai Name' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_DEALER_NAME_THAI'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'English Name' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_DEALER_NAME_ENGLISH'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Address No.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_ADDR_NO'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Moo' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_ADDR_MOO'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Building/Village Name' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_ADDR_BUILDING'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Soi' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_ADDR_SOI'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Road' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_ADDR_ROAD'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Tumpon' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_ADDR_TUMPON'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Ampur' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_ADDR_AMPUR'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Province' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_ADDR_CHANGWAT'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Post Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_ADDR_ZIP_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Tel.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_TELEPHONE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Fax No.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_FAX_NO'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Email Address' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_EMAIL_ADDR'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Contact Person' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_CONTACT_PERSON'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Commission Percent' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_COMM_PERCENT'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Cheque Name' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_CHEQUE_NAME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'VAT Address #1' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_VAT_ADR1'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'VAT Address #2' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_VAT_ADR2'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'VAT Address #3' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_VAT_ADR3'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'VAT Address #4' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_VAT_ADR4'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Tax ID.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_TAX_ID'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Cheque Type' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_CHEQUE_TYPE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'จ่ายค่านายหน้ารถให้ Dealer/Other' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_PAY_COMM_FLAG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'อัตราค่านายหน้านิติบุคคล' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_HIR_CORP_RATE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Absorb Tax Corp.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_COMM_WH'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'อัตราค่านายหน้าบุคคลธรรมดา' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_HIR_IND_RATE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Absorb Tax Ind.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_COMM_WH_IND'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'อัตราค่านายหน้ารถสามารถแก้ไขได้หรือไม่' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_CHANG_HIR_RATE_FLAG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'ค่านายหน้ารถนิติบุคคลจ่ายแบบ' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_CHEQUE_TYPE_COM_FIN'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'ค่านายหน้ารถบุคคลธรรมดาจ่ายแบบ' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_CHEQUE_TYPE_COM_FIN_1'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'จ่ายค่านายหน้าประกันให้ Dealer/Other' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_PAY_INS_FLAG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'จำนวนเงินค่านายหน้าประกันภัย' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_COMM_INS_AMT'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Absorb Tax Extra Comm.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_INS_WH'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'อัตราค่านายหน้าประกันสามารถแก้ไขได้หรือไม่' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_CHANG_INS_AMT_FLAG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'ค่านายหน้าประกันนิติบุคคลจ่ายแบบ' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_CHEQUE_TYPE_COM_INS'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'ค่านายหน้าประกันบุคคลธรรมดาจ่ายแบบ' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_CHEQUE_TYPE_COM_INS_1'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Group Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_DEALER_GROUP'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Dealer รับค่างวดจากลูกค้า ให้หัก/ไม่หักจากหน้าเช็ค' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_CHEQUE_FLAG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Other Dealer Flag' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_OTHER_FLAG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Dealer อยู่ในระบบ VAT หรือไม่' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_IN_VAT_SYSTEM'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'ถ้าไม่อยู่ในระบบ VAT ผู้จ่าย VAT คือใคร' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_ABSORB_VAT'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'เช็คที่จ่ายมีการบวกค่าใช้จ่ายหรือไม่' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_DARFT_FLAG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'โอนเงินค่าทรัพย์สินไปยัง รหัสธนาคาร' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_TRANSFER_TO_BNK'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'โอนเงินค่าทรัพย์สินไปยัง รหัสสาขาธนาคาร' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_TRANSFER_TO_BRN'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'โอนเงินค่าทรัพย์สินไปยัง ประเภทบัญชี' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_TRANSFER_TO_AC_TYPE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'โอนเงินค่าทรัพย์สินไปยัง เลขที่บัญชี' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_ACCOUNT_NO'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Creditor Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_CREDIT_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'การส่ง P/O เป็นแบบ' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_PO_FLAG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'รหัสตัวแทนสำนักงานใหญ่' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_PO_DEALER_HO'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'A/O Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_AO_COD'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'ชื่อผู้รับ P/O' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_PO_NAME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'เมื่อมีการแก้ไขข้อมูลประกันภัย ให้ส่ง P/O ใหม่' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_PO_INSURANCE_FLAG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'แสดงอัตราค่านายหน้าใน P/O หรือไม่' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_PO_COMM_RATE_FLAG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'ยี่ห้อทรัพย์สิน' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_ASSET_BRAND'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Not Used' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_FREE_DEC_1'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Not Used' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_FREE_ALPHA_2'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Salesman Running No.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_SALESMAN_RUN_NO'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'จำนวนงวดที่เป็นฐานการคำนวณค่านายหน้า' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_BASE_CALULATE_COMM'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'จำนวนงวดที่เป็นฐานการคำนวณแก้ไขได้หรือไม่' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_BASE_CALCULATE_CHANGE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'ประเภททรัพย์สิน' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_ASSET_TYPE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Core Bank Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_CORE_BANK_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'ราคาใบเสร็จรวมเบี้ยประกันชีวิต' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_LIFE_INS_AMT_INC_TO_INVEST'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'เงื่อนไขการสั่งจ่ายค่าทรัพย์สิน จ่ายโดยวิธี' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_PAY_ASSET_TYPE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'รหัสธนาคาร' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_PAY_ASSET_BNK_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'ชื่อบัญชี' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_PAY_ASSET_ACC_NO'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'เงื่อนไขการสั่งจ่ายค่านายหน้าทรัพย์สิน จ่ายโดยวิธี' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_PAY_COMM_ASSET_TYPE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'รหัสธนาคาร' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_PAY_COMM_ASSET_BNK_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'ชื่อบัญชี' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_PAY_COMM_ASSET_ACC_NO'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'เงื่อนไขการสั่งจ่ายค่านายหน้าประกัน จ่ายโดยวิธี' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_PAY_COMM_INS_TYPE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'รหัสธนาคาร' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_PAY_COMM_INS_BNK_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'ชื่อบัญชี' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_PAY_COMM_INS_ACC_NO'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'เงื่อนไขการสั่งจ่ายค่านายหน้าพิเศษ จ่ายโดยวิธี' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_PAY_EXTRA_COMM_TYPE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'รหัสธนาคาร' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_PAY_EXTRA_COMM_BNK_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'ชื่อบัญชี' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_PAY_EXTRA_COMM_ACC_NO'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'เงื่อนไขอื่น ๆ' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_ADDITIONAL_CONDITION'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Terminal ID.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_MTN_TERMINAL_ID'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Program ID.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_MTN_PROGRAM_ID'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Branch Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_MTN_BRANCH_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'User ID.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_MTN_USER_ID'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Date Time Update' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_MTN_DATE_TIME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Approved By' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_APPROVED_BY'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Approved Date' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_APPROVED_DATE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Running No.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_RUNNING'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Status Process' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_STATUS_PROCESS'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Branch A/C Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_BRACH_ACC_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Contract Date' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_CONTRACT_DATE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Lost Book Loan Date' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_LAST_BOOK_LOAN_DATE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'สาขาที่ทำการออกสัญญา' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_TAKE_CARE_BY_BRANCH_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'รหัสสาขาของ Dealer' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'MDLR_BRANCH_ID'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'job run key of currently running instance of job' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'JOB_RUN_KEY'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Code of source system for extraction' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'SOURCE_SYSTEM_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Source table name extracted' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'SOURCE_TABLE_NAME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'y-means record marked for deletion. n - means active record' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'DELETED_FLAG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Last update time of source' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'SOURCE_LAST_UPDATE_DATE_TIME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'record created / last updated date and time' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH', @level2type=N'COLUMN',@level2name=N'LAST_UPDATE_DATE_TIME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Branch Detail Table' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BRANCH'


IF EXISTS (SELECT name FROM sys.synonyms WHERE name = N'STG_TNB_MST_BRANCH')
	BEGIN
		DROP SYNONYM STG_TNB_MST_BRANCH 
	END
CREATE SYNONYM STG_TNB_MST_BRANCH FOR STG.STG_TNB_MST_BRANCH;

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': STG_TNB_MST_BRANCH TABLE CREATED.'

----------------------------------------------------------------------------------------------------------------------------------------

IF EXISTS (SELECT name FROM sys.tables WHERE name = N'STG_TNB_MST_PRODUCT')
	BEGIN
		DROP TABLE STG.STG_TNB_MST_PRODUCT
	END

CREATE TABLE STG.STG_TNB_MST_PRODUCT
( 
		MDSC_STATUS VARCHAR(1),
		MDSC_TYP VARCHAR(20),
		MDSC_COD VARCHAR(30),
		MDSC_LNG VARCHAR(1),
		MDSC_DSC VARCHAR(80),
		MDSC_GROUP VARCHAR(10),
		MDSC_FREE_ALPHA_1 VARCHAR(10),
		MDSC_FREE_DECIMAL_1 FLOAT,
		MDSC_MTN_TERMINAL_ID VARCHAR(10),
		MDSC_MTN_PROGRAM_ID VARCHAR(20),
		MDSC_MTN_BRANCH FLOAT,
		MDSC_MTN_USER_ID VARCHAR(20),
		MDSC_MTN_DATE DATETIME,
		JOB_RUN_KEY BIGINT NOT NULL,
		SOURCE_SYSTEM_CODE VARCHAR(10) NOT NULL,
		SOURCE_TABLE_NAME VARCHAR(15) NOT NULL,
		DELETED_FLAG CHAR(1)  NOT NULL DEFAULT 'N', 
		SOURCE_LAST_UPDATE_DATE_TIME DATETIME NOT NULL,
		LAST_UPDATE_DATE_TIME DATETIME  NOT NULL DEFAULT GETDATE()
); 

--CREATE CLUSTERED INDEX IDX_JOB_RUN_KEY ON STG.STG_TNB_MST_PRODUCT (JOB_RUN_KEY); 

EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Product Detail Table' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_PRODUCT'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Record Status' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_PRODUCT', @level2type=N'COLUMN',@level2name=N'MDSC_STATUS'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Type' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_PRODUCT', @level2type=N'COLUMN',@level2name=N'MDSC_TYP'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_PRODUCT', @level2type=N'COLUMN',@level2name=N'MDSC_COD'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Language Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_PRODUCT', @level2type=N'COLUMN',@level2name=N'MDSC_LNG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Description' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_PRODUCT', @level2type=N'COLUMN',@level2name=N'MDSC_DSC'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Group Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_PRODUCT', @level2type=N'COLUMN',@level2name=N'MDSC_GROUP'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Free Alpha' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_PRODUCT', @level2type=N'COLUMN',@level2name=N'MDSC_FREE_ALPHA_1'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Fee Decimal' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_PRODUCT', @level2type=N'COLUMN',@level2name=N'MDSC_FREE_DECIMAL_1'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Terminal ID.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_PRODUCT', @level2type=N'COLUMN',@level2name=N'MDSC_MTN_TERMINAL_ID'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Program ID.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_PRODUCT', @level2type=N'COLUMN',@level2name=N'MDSC_MTN_PROGRAM_ID'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Branch Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_PRODUCT', @level2type=N'COLUMN',@level2name=N'MDSC_MTN_BRANCH'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'User ID.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_PRODUCT', @level2type=N'COLUMN',@level2name=N'MDSC_MTN_USER_ID'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Date Time Update' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_PRODUCT', @level2type=N'COLUMN',@level2name=N'MDSC_MTN_DATE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'job run key of currently running instance of job' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_PRODUCT', @level2type=N'COLUMN',@level2name=N'JOB_RUN_KEY'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Code of source system for extraction' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_PRODUCT', @level2type=N'COLUMN',@level2name=N'SOURCE_SYSTEM_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Source table name extracted' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_PRODUCT', @level2type=N'COLUMN',@level2name=N'SOURCE_TABLE_NAME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'y-means record marked for deletion. n - means active record' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_PRODUCT', @level2type=N'COLUMN',@level2name=N'DELETED_FLAG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Last update time of source' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_PRODUCT', @level2type=N'COLUMN',@level2name=N'SOURCE_LAST_UPDATE_DATE_TIME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'record created / last updated date and time' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_PRODUCT', @level2type=N'COLUMN',@level2name=N'LAST_UPDATE_DATE_TIME'


IF EXISTS (SELECT name FROM sys.synonyms WHERE name = N'STG_TNB_MST_PRODUCT')
	BEGIN
		DROP SYNONYM STG_TNB_MST_PRODUCT 
	END
CREATE SYNONYM STG_TNB_MST_PRODUCT FOR STG.STG_TNB_MST_PRODUCT;

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': STG_TNB_MST_PRODUCT TABLE CREATED.'

----------------------------------------------------------------------------------------------------------------------------------------

IF EXISTS (SELECT name FROM sys.tables WHERE name = N'STG_TNB_MST_ACCOUNT_STATUS')
	BEGIN
		DROP TABLE STG.STG_TNB_MST_ACCOUNT_STATUS
	END


CREATE TABLE STG.STG_TNB_MST_ACCOUNT_STATUS
(
		MDSC_STATUS VARCHAR(1),
		MDSC_TYP VARCHAR(20),
		MDSC_COD VARCHAR(30),
		MDSC_LNG VARCHAR(1),
		MDSC_DSC VARCHAR(80),
		MDSC_GROUP VARCHAR(10),
		MDSC_FREE_ALPHA_1 VARCHAR(10),
		MDSC_FREE_DECIMAL_1 FLOAT,
		MDSC_MTN_TERMINAL_ID VARCHAR(10),
		MDSC_MTN_PROGRAM_ID VARCHAR(20),
		MDSC_MTN_BRANCH FLOAT,
		MDSC_MTN_USER_ID VARCHAR(20),
		MDSC_MTN_DATE DATETIME,
		JOB_RUN_KEY BIGINT NOT NULL,
		SOURCE_SYSTEM_CODE VARCHAR(10) NOT NULL,
		SOURCE_TABLE_NAME VARCHAR(15) NOT NULL,
		DELETED_FLAG CHAR(1)  NOT NULL DEFAULT 'N', 
		SOURCE_LAST_UPDATE_DATE_TIME DATETIME NOT NULL,
		LAST_UPDATE_DATE_TIME DATETIME  NOT NULL DEFAULT GETDATE()
)

--CREATE CLUSTERED INDEX IDX_JOB_RUN_KEY ON STG.STG_TNB_MST_ACCOUNT_STATUS (JOB_RUN_KEY); 

EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Account Status Detail Table' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_ACCOUNT_STATUS'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Record Status' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_ACCOUNT_STATUS', @level2type=N'COLUMN',@level2name=N'MDSC_STATUS'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Type' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_ACCOUNT_STATUS', @level2type=N'COLUMN',@level2name=N'MDSC_TYP'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_ACCOUNT_STATUS', @level2type=N'COLUMN',@level2name=N'MDSC_COD'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Language Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_ACCOUNT_STATUS', @level2type=N'COLUMN',@level2name=N'MDSC_LNG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Description' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_ACCOUNT_STATUS', @level2type=N'COLUMN',@level2name=N'MDSC_DSC'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Group Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_ACCOUNT_STATUS', @level2type=N'COLUMN',@level2name=N'MDSC_GROUP'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Free Alpha' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_ACCOUNT_STATUS', @level2type=N'COLUMN',@level2name=N'MDSC_FREE_ALPHA_1'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Fee Decimal' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_ACCOUNT_STATUS', @level2type=N'COLUMN',@level2name=N'MDSC_FREE_DECIMAL_1'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Terminal ID.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_ACCOUNT_STATUS', @level2type=N'COLUMN',@level2name=N'MDSC_MTN_TERMINAL_ID'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Program ID.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_ACCOUNT_STATUS', @level2type=N'COLUMN',@level2name=N'MDSC_MTN_PROGRAM_ID'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Branch Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_ACCOUNT_STATUS', @level2type=N'COLUMN',@level2name=N'MDSC_MTN_BRANCH'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'User ID.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_ACCOUNT_STATUS', @level2type=N'COLUMN',@level2name=N'MDSC_MTN_USER_ID'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Date Time Update' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_ACCOUNT_STATUS', @level2type=N'COLUMN',@level2name=N'MDSC_MTN_DATE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'job run key of currently running instance of job' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_ACCOUNT_STATUS', @level2type=N'COLUMN',@level2name=N'JOB_RUN_KEY'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Code of source system for extraction' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_ACCOUNT_STATUS', @level2type=N'COLUMN',@level2name=N'SOURCE_SYSTEM_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Source table name extracted' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_ACCOUNT_STATUS', @level2type=N'COLUMN',@level2name=N'SOURCE_TABLE_NAME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'y-means record marked for deletion. n - means active record' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_ACCOUNT_STATUS', @level2type=N'COLUMN',@level2name=N'DELETED_FLAG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Last update time of source' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_ACCOUNT_STATUS', @level2type=N'COLUMN',@level2name=N'SOURCE_LAST_UPDATE_DATE_TIME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'record created / last updated date and time' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_ACCOUNT_STATUS', @level2type=N'COLUMN',@level2name=N'LAST_UPDATE_DATE_TIME'


IF EXISTS (SELECT name FROM sys.synonyms WHERE name = N'STG_TNB_MST_ACCOUNT_STATUS')
	BEGIN
		DROP SYNONYM STG_TNB_MST_ACCOUNT_STATUS 
	END
CREATE SYNONYM STG_TNB_MST_ACCOUNT_STATUS FOR STG.STG_TNB_MST_ACCOUNT_STATUS;

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': STG_TNB_MST_ACCOUNT_STATUS TABLE CREATED.'

----------------------------------------------------------------------------------------------------------------------------------------

IF EXISTS (SELECT name FROM sys.tables WHERE name = N'STG_TNB_MST_REQUEST_STATUS')
	BEGIN
		DROP TABLE STG.STG_TNB_MST_REQUEST_STATUS
	END


CREATE TABLE STG.STG_TNB_MST_REQUEST_STATUS
(
		MDSC_STATUS					VARCHAR(1),
		MDSC_TYP					VARCHAR(20),
		MDSC_COD					VARCHAR(30),
		MDSC_LNG					VARCHAR(1),
		MDSC_DSC					VARCHAR(80),
		MDSC_GROUP					VARCHAR(10),
		MDSC_FREE_ALPHA_1			VARCHAR(10),
		MDSC_FREE_DECIMAL_1			FLOAT,
		MDSC_MTN_TERMINAL_ID		VARCHAR(10),
		MDSC_MTN_PROGRAM_ID			VARCHAR(20),
		MDSC_MTN_BRANCH				FLOAT,
		MDSC_MTN_USER_ID			VARCHAR(20),
		MDSC_MTN_DATE				DATETIME,
		JOB_RUN_KEY					BIGINT NOT NULL,
		SOURCE_SYSTEM_CODE			VARCHAR(10) NOT NULL,
		SOURCE_TABLE_NAME			VARCHAR(15) NOT NULL,
		DELETED_FLAG				CHAR(1)  NOT NULL DEFAULT 'N', 
		SOURCE_LAST_UPDATE_DATE_TIME DATETIME NOT NULL,
		LAST_UPDATE_DATE_TIME		DATETIME  NOT NULL DEFAULT GETDATE()
)

--CREATE CLUSTERED INDEX IDX_JOB_RUN_KEY ON STG.STG_TNB_MST_REQUEST_STATUS (JOB_RUN_KEY); 

EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Account Status Detail Table' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_REQUEST_STATUS'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Record Status' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_REQUEST_STATUS', @level2type=N'COLUMN',@level2name=N'MDSC_STATUS'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Type' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_REQUEST_STATUS', @level2type=N'COLUMN',@level2name=N'MDSC_TYP'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_REQUEST_STATUS', @level2type=N'COLUMN',@level2name=N'MDSC_COD'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Language Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_REQUEST_STATUS', @level2type=N'COLUMN',@level2name=N'MDSC_LNG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Description' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_REQUEST_STATUS', @level2type=N'COLUMN',@level2name=N'MDSC_DSC'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Group Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_REQUEST_STATUS', @level2type=N'COLUMN',@level2name=N'MDSC_GROUP'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Free Alpha' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_REQUEST_STATUS', @level2type=N'COLUMN',@level2name=N'MDSC_FREE_ALPHA_1'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Fee Decimal' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_REQUEST_STATUS', @level2type=N'COLUMN',@level2name=N'MDSC_FREE_DECIMAL_1'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Terminal ID.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_REQUEST_STATUS', @level2type=N'COLUMN',@level2name=N'MDSC_MTN_TERMINAL_ID'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Program ID.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_REQUEST_STATUS', @level2type=N'COLUMN',@level2name=N'MDSC_MTN_PROGRAM_ID'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Branch Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_REQUEST_STATUS', @level2type=N'COLUMN',@level2name=N'MDSC_MTN_BRANCH'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'User ID.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_REQUEST_STATUS', @level2type=N'COLUMN',@level2name=N'MDSC_MTN_USER_ID'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Date Time Update' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_REQUEST_STATUS', @level2type=N'COLUMN',@level2name=N'MDSC_MTN_DATE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'job run key of currently running instance of job' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_REQUEST_STATUS', @level2type=N'COLUMN',@level2name=N'JOB_RUN_KEY'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Code of source system for extraction' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_REQUEST_STATUS', @level2type=N'COLUMN',@level2name=N'SOURCE_SYSTEM_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Source table name extracted' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_REQUEST_STATUS', @level2type=N'COLUMN',@level2name=N'SOURCE_TABLE_NAME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'y-means record marked for deletion. n - means active record' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_REQUEST_STATUS', @level2type=N'COLUMN',@level2name=N'DELETED_FLAG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Last update time of source' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_REQUEST_STATUS', @level2type=N'COLUMN',@level2name=N'SOURCE_LAST_UPDATE_DATE_TIME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'record created / last updated date and time' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_REQUEST_STATUS', @level2type=N'COLUMN',@level2name=N'LAST_UPDATE_DATE_TIME'


IF EXISTS (SELECT name FROM sys.synonyms WHERE name = N'STG_TNB_MST_REQUEST_STATUS')
	BEGIN
		DROP SYNONYM STG_TNB_MST_REQUEST_STATUS 
	END
CREATE SYNONYM STG_TNB_MST_REQUEST_STATUS FOR STG.STG_TNB_MST_REQUEST_STATUS;

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': STG_TNB_MST_REQUEST_STATUS TABLE CREATED.'

----------------------------------------------------------------------------------------------------------------------------------------

IF EXISTS (SELECT name FROM sys.tables WHERE name = N'STG_TNB_MST_CUST_SOURCE')
	BEGIN
		DROP TABLE STG.STG_TNB_MST_CUST_SOURCE
	END

CREATE TABLE STG.STG_TNB_MST_CUST_SOURCE
( 
		[MDSC_STATUS] VARCHAR(1),
		[MDSC_TYP] VARCHAR(20),
		[MDSC_COD] VARCHAR(30),
		[MDSC_LNG] VARCHAR(1),
		[MDSC_DSC] VARCHAR(80),
		[MDSC_GROUP] VARCHAR(10),
		[MDSC_FREE_ALPHA_1] VARCHAR(10),
		[MDSC_FREE_DECIMAL_1] FLOAT,
		[MDSC_MTN_TERMINAL_ID] VARCHAR(10),
		[MDSC_MTN_PROGRAM_ID] VARCHAR(20),
		[MDSC_MTN_BRANCH] FLOAT,
		[MDSC_MTN_USER_ID] VARCHAR(20),
		[MDSC_MTN_DATE] DATETIME,
		JOB_RUN_KEY BIGINT,
		SOURCE_SYSTEM_CODE VARCHAR(4),
		SOURCE_TABLE_NAME VARCHAR(6),
		DELETED_FLAG VARCHAR(1),
		SOURCE_LAST_UPDATE_DATE_TIME DATETIME,
		LAST_UPDATE_DATE_TIME DATETIME
); 

--CREATE CLUSTERED INDEX IDX_JOB_RUN_KEY ON STG.STG_TNB_MST_CUST_SOURCE (JOB_RUN_KEY); 

EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Cust Source Detail Table' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUST_SOURCE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Record Status' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUST_SOURCE', @level2type=N'COLUMN',@level2name=N'MDSC_STATUS'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Type' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUST_SOURCE', @level2type=N'COLUMN',@level2name=N'MDSC_TYP'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUST_SOURCE', @level2type=N'COLUMN',@level2name=N'MDSC_COD'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Language Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUST_SOURCE', @level2type=N'COLUMN',@level2name=N'MDSC_LNG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Description' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUST_SOURCE', @level2type=N'COLUMN',@level2name=N'MDSC_DSC'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Group Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUST_SOURCE', @level2type=N'COLUMN',@level2name=N'MDSC_GROUP'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Free Alpha' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUST_SOURCE', @level2type=N'COLUMN',@level2name=N'MDSC_FREE_ALPHA_1'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Fee Decimal' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUST_SOURCE', @level2type=N'COLUMN',@level2name=N'MDSC_FREE_DECIMAL_1'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Terminal ID.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUST_SOURCE', @level2type=N'COLUMN',@level2name=N'MDSC_MTN_TERMINAL_ID'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Program ID.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUST_SOURCE', @level2type=N'COLUMN',@level2name=N'MDSC_MTN_PROGRAM_ID'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Branch Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUST_SOURCE', @level2type=N'COLUMN',@level2name=N'MDSC_MTN_BRANCH'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'User ID.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUST_SOURCE', @level2type=N'COLUMN',@level2name=N'MDSC_MTN_USER_ID'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Date Time Update' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUST_SOURCE', @level2type=N'COLUMN',@level2name=N'MDSC_MTN_DATE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'job run key of currently running instance of job' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUST_SOURCE', @level2type=N'COLUMN',@level2name=N'JOB_RUN_KEY'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Code of source system for extraction' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUST_SOURCE', @level2type=N'COLUMN',@level2name=N'SOURCE_SYSTEM_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Source table name extracted' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUST_SOURCE', @level2type=N'COLUMN',@level2name=N'SOURCE_TABLE_NAME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'y-means record marked for deletion. n - means active record' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUST_SOURCE', @level2type=N'COLUMN',@level2name=N'DELETED_FLAG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Last update time of source' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUST_SOURCE', @level2type=N'COLUMN',@level2name=N'SOURCE_LAST_UPDATE_DATE_TIME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'record created / last updated date and time' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_CUST_SOURCE', @level2type=N'COLUMN',@level2name=N'LAST_UPDATE_DATE_TIME'

IF EXISTS (SELECT name FROM sys.synonyms WHERE name = N'STG_TNB_MST_CUST_SOURCE')
	BEGIN
		DROP SYNONYM STG_TNB_MST_CUST_SOURCE 
	END
CREATE SYNONYM STG_TNB_MST_CUST_SOURCE FOR STG.STG_TNB_MST_CUST_SOURCE;

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': STG_TNB_MST_CUST_SOURCE TABLE CREATED.'
-------------------------------------------------------------------------------------------------------------------
IF EXISTS (SELECT name FROM sys.tables WHERE name = N'STG_TNB_MST_CUST_TYPE')
	BEGIN
		DROP TABLE STG.STG_TNB_MST_CUST_TYPE
	END

CREATE TABLE [STG].[STG_TNB_MST_CUST_TYPE](
	[MDSC_STATUS] [varchar](1) NULL,
	[MDSC_TYP] [varchar](20) NULL,
	[MDSC_COD] [varchar](30) NULL,
	[MDSC_LNG] [varchar](1) NULL,
	[MDSC_DSC] [varchar](80) NULL,
	[MDSC_GROUP] [varchar](10) NULL,
	[MDSC_FREE_ALPHA_1] [varchar](10) NULL,
	[MDSC_FREE_DECIMAL_1] [float] NULL,
	[MDSC_MTN_TERMINAL_ID] [varchar](10) NULL,
	[MDSC_MTN_PROGRAM_ID] [varchar](20) NULL,
	[MDSC_MTN_BRANCH] [float] NULL,
	[MDSC_MTN_USER_ID] [varchar](20) NULL,
	[MDSC_MTN_DATE] [datetime] NULL,
	[JOB_RUN_KEY] [bigint] NULL,
	[SOURCE_SYSTEM_CODE] [varchar](4) NULL,
	[SOURCE_TABLE_NAME] [varchar](6) NULL,
	[DELETED_FLAG] [varchar](1) NULL,
	[SOURCE_LAST_UPDATE_DATE_TIME] [datetime] NULL,
	[LAST_UPDATE_DATE_TIME] [datetime] NULL
) ON [PRIMARY]
	
PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': STG_TNB_MST_CUST_TYPE TABLE CREATED.'
-------------------------------------------------------------------------------------------------------------------
IF EXISTS (SELECT name FROM sys.tables WHERE name = N'STG_TNB_MST_DEALER')
	BEGIN
		DROP TABLE STG.STG_TNB_MST_DEALER
	END


CREATE TABLE STG.STG_TNB_MST_DEALER
(
		[MDLR_STATUS] VARCHAR(1),
		[MDLR_DEALER_CODE] VARCHAR(10) NOT NULL,
		[MDLR_TITLE_CODE]  VARCHAR(6),
		[MDLR_DEALER_NAME_THAI]  VARCHAR(60),
		[MDLR_DEALER_NAME_ENGLISH]  VARCHAR(60),
		[MDLR_ADDR_NO] VARCHAR(20),
		[MDLR_ADDR_MOO] VARCHAR(50),
		[MDLR_ADDR_BUILDING] VARCHAR(50),
		[MDLR_ADDR_SOI] VARCHAR(50),
		[MDLR_ADDR_ROAD] VARCHAR(50),
		[MDLR_ADDR_TUMPON] VARCHAR(2),
		[MDLR_ADDR_AMPUR] VARCHAR(2),
		[MDLR_ADDR_CHANGWAT] VARCHAR(2),
		[MDLR_ADDR_ZIP_CODE] VARCHAR(10),
		[MDLR_TELEPHONE] VARCHAR(75),
		[MDLR_FAX_NO] VARCHAR(30),
		[MDLR_EMAIL_ADDR] VARCHAR(50),
		[MDLR_CONTACT_PERSON] VARCHAR(50),
		[MDLR_COMM_PERCENT] FLOAT,
		[MDLR_CHEQUE_NAME] VARCHAR(80),
		[MDLR_VAT_ADR1] VARCHAR(50),
		[MDLR_VAT_ADR2] VARCHAR(50),
		[MDLR_VAT_ADR3] VARCHAR(50),
		[MDLR_VAT_ADR4] VARCHAR(50),
		[MDLR_TAX_ID] VARCHAR(13),
		[MDLR_CHEQUE_TYPE] VARCHAR(10),  
		[MDLR_PAY_COMM_FLAG] VARCHAR(1),
		[MDLR_HIR_CORP_RATE] FLOAT,
		[MDLR_COMM_WH] VARCHAR(1),
		[MDLR_HIR_IND_RATE] FLOAT,
		[MDLR_COMM_WH_IND] VARCHAR(1),
		[MDLR_CHANG_HIR_RATE_FLAG] VARCHAR(1),
		[MDLR_CHEQUE_TYPE_COM_FIN] VARCHAR(1),
		[MDLR_CHEQUE_TYPE_COM_FIN_1] VARCHAR(1),
		[MDLR_PAY_INS_FLAG] VARCHAR(1),
		[MDLR_COMM_INS_AMT] FLOAT,
		[MDLR_INS_WH] VARCHAR(1),
		[MDLR_CHANG_INS_AMT_FLAG] VARCHAR(1),
		[MDLR_CHEQUE_TYPE_COM_INS] VARCHAR(1),
		[MDLR_CHEQUE_TYPE_COM_INS_1] VARCHAR(1),
		[MDLR_DEALER_GROUP] VARCHAR(10),
		[MDLR_CHEQUE_FLAG] VARCHAR(1),
		[MDLR_OTHER_FLAG] VARCHAR(1),
		[MDLR_IN_VAT_SYSTEM] VARCHAR(1),
		[MDLR_ABSORB_VAT] VARCHAR(1),
		[MDLR_DARFT_FLAG] VARCHAR(1),
		[MDLR_TRANSFER_TO_BNK] VARCHAR(3),
		[MDLR_TRANSFER_TO_BRN] VARCHAR(40),
		[MDLR_TRANSFER_TO_AC_TYPE] VARCHAR(1),
		[MDLR_ACCOUNT_NO] VARCHAR(15),
		[MDLR_CREDIT_CODE] VARCHAR(1),
		[MDLR_PO_FLAG] VARCHAR(1),
		[MDLR_PO_DEALER_HO] VARCHAR(10),
		[MDLR_AO_COD] VARCHAR(10),
		[MDLR_PO_NAME] VARCHAR(50),
		[MDLR_PO_INSURANCE_FLAG] VARCHAR(1),
		[MDLR_PO_COMM_RATE_FLAG] VARCHAR(1),
		[MDLR_ASSET_BRAND] VARCHAR(40),
		[MDLR_FREE_DEC_1] FLOAT,
		[MDLR_FREE_ALPHA_2] VARCHAR(10),
		[MDLR_SALESMAN_RUN_NO] FLOAT,
		[MDLR_BASE_CALULATE_COMM] INT,
		[MDLR_BASE_CALCULATE_CHANGE] CHAR(1),
		[MDLR_ASSET_TYPE] VARCHAR(1),
		[MDLR_CORE_BANK_CODE] VARCHAR(10),
		[MDLR_LIFE_INS_AMT_INC_TO_INVEST] VARCHAR(1),
		[MDLR_PAY_ASSET_TYPE] VARCHAR(2),
		[MDLR_PAY_ASSET_BNK_CODE] VARCHAR(4),
		[MDLR_PAY_ASSET_ACC_NO] VARCHAR(20),
		[MDLR_PAY_COMM_ASSET_TYPE] VARCHAR(2),
		[MDLR_PAY_COMM_ASSET_BNK_CODE] VARCHAR(4),
		[MDLR_PAY_COMM_ASSET_ACC_NO] VARCHAR(20),
		[MDLR_PAY_COMM_INS_TYPE] VARCHAR(2),
		[MDLR_PAY_COMM_INS_BNK_CODE] VARCHAR(4),
		[MDLR_PAY_COMM_INS_ACC_NO] VARCHAR(20),
		[MDLR_PAY_EXTRA_COMM_TYPE] VARCHAR(2),
		[MDLR_PAY_EXTRA_COMM_BNK_CODE] VARCHAR(4),
		[MDLR_PAY_EXTRA_COMM_ACC_NO] VARCHAR(20),
		[MDLR_ADDITIONAL_CONDITION] TEXT,
		[MDLR_MTN_TERMINAL_ID] VARCHAR(10),
		[MDLR_MTN_PROGRAM_ID] VARCHAR(20),
		[MDLR_MTN_BRANCH_CODE] FLOAT,
		[MDLR_MTN_USER_ID] VARCHAR(20),
		[MDLR_MTN_DATE_TIME] DATETIME,
		[MDLR_APPROVED_BY] VARCHAR(20),
		[MDLR_APPROVED_DATE] DATETIME,
		[MDLR_RUNNING] FLOAT,
		[MDLR_STATUS_PROCESS] VARCHAR(1),
		[MDLR_BRACH_ACC_CODE] FLOAT,
		[MDLR_CONTRACT_DATE] DATETIME,
		[MDLR_LAST_BOOK_LOAN_DATE] DATETIME,
		[MDLR_TAKE_CARE_BY_BRANCH_CODE] FLOAT,
		[MDLR_BRANCH_ID] FLOAT,
		JOB_RUN_KEY BIGINT NOT NULL,
		SOURCE_SYSTEM_CODE VARCHAR(10) NOT NULL,
		SOURCE_TABLE_NAME VARCHAR(15) NOT NULL,
		DELETED_FLAG CHAR(1)  NOT NULL DEFAULT 'N', 
		SOURCE_LAST_UPDATE_DATE_TIME DATETIME NOT NULL,
		LAST_UPDATE_DATE_TIME DATETIME  NOT NULL DEFAULT GETDATE()
)

--CREATE CLUSTERED INDEX IDX_JOB_RUN_KEY ON STG.STG_TNB_MST_DEALER (JOB_RUN_KEY); 

EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Dealer Detail Table' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Record Status' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_STATUS'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Dealer Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_DEALER_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Title Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_TITLE_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Thai Name' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_DEALER_NAME_THAI'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'English Name' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_DEALER_NAME_ENGLISH'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Address No.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_ADDR_NO'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Moo' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_ADDR_MOO'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Building/Village Name' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_ADDR_BUILDING'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Soi' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_ADDR_SOI'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Road' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_ADDR_ROAD'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Tumpon' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_ADDR_TUMPON'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Ampur' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_ADDR_AMPUR'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Province' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_ADDR_CHANGWAT'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Post Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_ADDR_ZIP_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Tel.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_TELEPHONE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Fax No.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_FAX_NO'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Email Address' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_EMAIL_ADDR'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Contact Person' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_CONTACT_PERSON'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Commission Percent' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_COMM_PERCENT'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Cheque Name' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_CHEQUE_NAME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'VAT Address #1' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_VAT_ADR1'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'VAT Address #2' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_VAT_ADR2'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'VAT Address #3' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_VAT_ADR3'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'VAT Address #4' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_VAT_ADR4'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Tax ID.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_TAX_ID'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Cheque Type' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_CHEQUE_TYPE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'จ่ายค่านายหน้ารถให้ Dealer/Other' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_PAY_COMM_FLAG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'อัตราค่านายหน้านิติบุคคล' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_HIR_CORP_RATE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Absorb Tax Corp.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_COMM_WH'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'อัตราค่านายหน้าบุคคลธรรมดา' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_HIR_IND_RATE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Absorb Tax Ind.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_COMM_WH_IND'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'อัตราค่านายหน้ารถสามารถแก้ไขได้หรือไม่' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_CHANG_HIR_RATE_FLAG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'ค่านายหน้ารถนิติบุคคลจ่ายแบบ' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_CHEQUE_TYPE_COM_FIN'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'ค่านายหน้ารถบุคคลธรรมดาจ่ายแบบ' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_CHEQUE_TYPE_COM_FIN_1'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'จ่ายค่านายหน้าประกันให้ Dealer/Other' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_PAY_INS_FLAG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'จำนวนเงินค่านายหน้าประกันภัย' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_COMM_INS_AMT'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Absorb Tax Extra Comm.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_INS_WH'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'อัตราค่านายหน้าประกันสามารถแก้ไขได้หรือไม่' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_CHANG_INS_AMT_FLAG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'ค่านายหน้าประกันนิติบุคคลจ่ายแบบ' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_CHEQUE_TYPE_COM_INS'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'ค่านายหน้าประกันบุคคลธรรมดาจ่ายแบบ' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_CHEQUE_TYPE_COM_INS_1'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Group Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_DEALER_GROUP'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Dealer รับค่างวดจากลูกค้า ให้หัก/ไม่หักจากหน้าเช็ค' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_CHEQUE_FLAG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Other Dealer Flag' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_OTHER_FLAG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Dealer อยู่ในระบบ VAT หรือไม่' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_IN_VAT_SYSTEM'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'ถ้าไม่อยู่ในระบบ VAT ผู้จ่าย VAT คือใคร' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_ABSORB_VAT'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'เช็คที่จ่ายมีการบวกค่าใช้จ่ายหรือไม่' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_DARFT_FLAG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'โอนเงินค่าทรัพย์สินไปยัง รหัสธนาคาร' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_TRANSFER_TO_BNK'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'โอนเงินค่าทรัพย์สินไปยัง รหัสสาขาธนาคาร' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_TRANSFER_TO_BRN'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'โอนเงินค่าทรัพย์สินไปยัง ประเภทบัญชี' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_TRANSFER_TO_AC_TYPE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'โอนเงินค่าทรัพย์สินไปยัง เลขที่บัญชี' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_ACCOUNT_NO'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Creditor Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_CREDIT_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'การส่ง P/O เป็นแบบ' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_PO_FLAG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'รหัสตัวแทนสำนักงานใหญ่' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_PO_DEALER_HO'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'A/O Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_AO_COD'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'ชื่อผู้รับ P/O' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_PO_NAME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'เมื่อมีการแก้ไขข้อมูลประกันภัย ให้ส่ง P/O ใหม่' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_PO_INSURANCE_FLAG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'แสดงอัตราค่านายหน้าใน P/O หรือไม่' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_PO_COMM_RATE_FLAG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'ยี่ห้อทรัพย์สิน' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_ASSET_BRAND'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Not Used' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_FREE_DEC_1'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Not Used' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_FREE_ALPHA_2'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Salesman Running No.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_SALESMAN_RUN_NO'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'จำนวนงวดที่เป็นฐานการคำนวณค่านายหน้า' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_BASE_CALULATE_COMM'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'จำนวนงวดที่เป็นฐานการคำนวณแก้ไขได้หรือไม่' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_BASE_CALCULATE_CHANGE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'ประเภททรัพย์สิน' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_ASSET_TYPE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Core Bank Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_CORE_BANK_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'ราคาใบเสร็จรวมเบี้ยประกันชีวิต' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_LIFE_INS_AMT_INC_TO_INVEST'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'เงื่อนไขการสั่งจ่ายค่าทรัพย์สิน จ่ายโดยวิธี' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_PAY_ASSET_TYPE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'รหัสธนาคาร' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_PAY_ASSET_BNK_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'ชื่อบัญชี' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_PAY_ASSET_ACC_NO'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'เงื่อนไขการสั่งจ่ายค่านายหน้าทรัพย์สิน จ่ายโดยวิธี' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_PAY_COMM_ASSET_TYPE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'รหัสธนาคาร' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_PAY_COMM_ASSET_BNK_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'ชื่อบัญชี' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_PAY_COMM_ASSET_ACC_NO'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'เงื่อนไขการสั่งจ่ายค่านายหน้าประกัน จ่ายโดยวิธี' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_PAY_COMM_INS_TYPE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'รหัสธนาคาร' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_PAY_COMM_INS_BNK_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'ชื่อบัญชี' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_PAY_COMM_INS_ACC_NO'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'เงื่อนไขการสั่งจ่ายค่านายหน้าพิเศษ จ่ายโดยวิธี' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_PAY_EXTRA_COMM_TYPE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'รหัสธนาคาร' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_PAY_EXTRA_COMM_BNK_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'ชื่อบัญชี' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_PAY_EXTRA_COMM_ACC_NO'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'เงื่อนไขอื่น ๆ' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_ADDITIONAL_CONDITION'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Terminal ID.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_MTN_TERMINAL_ID'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Program ID.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_MTN_PROGRAM_ID'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Branch Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_MTN_BRANCH_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'User ID.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_MTN_USER_ID'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Date Time Update' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_MTN_DATE_TIME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Approved By' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_APPROVED_BY'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Approved Date' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_APPROVED_DATE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Running No.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_RUNNING'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Status Process' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_STATUS_PROCESS'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Branch A/C Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_BRACH_ACC_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Contract Date' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_CONTRACT_DATE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Lost Book Loan Date' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_LAST_BOOK_LOAN_DATE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'สาขาที่ทำการออกสัญญา' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_TAKE_CARE_BY_BRANCH_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'รหัสสาขาของ Dealer' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'MDLR_BRANCH_ID'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'job run key of currently running instance of job' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'JOB_RUN_KEY'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Code of source system for extraction' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'SOURCE_SYSTEM_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Source table name extracted' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'SOURCE_TABLE_NAME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'y-means record marked for deletion. n - means active record' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'DELETED_FLAG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Last update time of source' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'SOURCE_LAST_UPDATE_DATE_TIME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'record created / last updated date and time' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_DEALER', @level2type=N'COLUMN',@level2name=N'LAST_UPDATE_DATE_TIME'

--ALTER TABLE STG.STG_TNB_MST_DEALER ADD CONSTRAINT PK_STG_TNB_MST_DEALER PRIMARY KEY CLUSTERED (MDLR_DEALER_CODE);
--CREATE CLUSTERED INDEX IDX_MDLR_DEALER_CODE ON STG.STG_TNB_MST_DEALER (MDLR_DEALER_CODE);


IF EXISTS (SELECT name FROM sys.synonyms WHERE name = N'STG_TNB_MST_DEALER')
	BEGIN
		DROP SYNONYM STG_TNB_MST_DEALER 
	END

CREATE SYNONYM STG_TNB_MST_DEALER FOR STG.STG_TNB_MST_DEALER;

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': STG_TNB_MST_DEALER TABLE CREATED.'

-------------------------------------------------------------------------------------------------------------------

IF EXISTS (SELECT name FROM sys.tables WHERE name = N'STG_TNB_MST_BOT_CLASS')
	BEGIN
		DROP TABLE STG.STG_TNB_MST_BOT_CLASS
	END


CREATE TABLE STG.STG_TNB_MST_BOT_CLASS
(
		MDSC_STATUS VARCHAR(1),
		MDSC_TYP VARCHAR(20),
		MDSC_COD VARCHAR(30),
		MDSC_LNG VARCHAR(1),
		MDSC_DSC VARCHAR(80),
		MDSC_GROUP VARCHAR(10),
		MDSC_FREE_ALPHA_1 VARCHAR(10),
		MDSC_FREE_DECIMAL_1 FLOAT,
		MDSC_MTN_TERMINAL_ID VARCHAR(10),
		MDSC_MTN_PROGRAM_ID VARCHAR(20),
		MDSC_MTN_BRANCH FLOAT,
		MDSC_MTN_USER_ID VARCHAR(20),
		MDSC_MTN_DATE DATETIME,
		JOB_RUN_KEY BIGINT NOT NULL,
		SOURCE_SYSTEM_CODE VARCHAR(10) NOT NULL,
		SOURCE_TABLE_NAME VARCHAR(15) NOT NULL,
		DELETED_FLAG CHAR(1)  NOT NULL DEFAULT 'N', 
		SOURCE_LAST_UPDATE_DATE_TIME DATETIME NOT NULL,
		LAST_UPDATE_DATE_TIME DATETIME  NOT NULL DEFAULT GETDATE()
); 

--CREATE CLUSTERED INDEX IDX_JOB_RUN_KEY ON STG.STG_TNB_MST_BOT_CLASS (JOB_RUN_KEY); 

EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Product Detail Table' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BOT_CLASS'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Record Status' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BOT_CLASS', @level2type=N'COLUMN',@level2name=N'MDSC_STATUS'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Type' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BOT_CLASS', @level2type=N'COLUMN',@level2name=N'MDSC_TYP'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BOT_CLASS', @level2type=N'COLUMN',@level2name=N'MDSC_COD'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Language Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BOT_CLASS', @level2type=N'COLUMN',@level2name=N'MDSC_LNG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Description' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BOT_CLASS', @level2type=N'COLUMN',@level2name=N'MDSC_DSC'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Group Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BOT_CLASS', @level2type=N'COLUMN',@level2name=N'MDSC_GROUP'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Free Alpha' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BOT_CLASS', @level2type=N'COLUMN',@level2name=N'MDSC_FREE_ALPHA_1'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Fee Decimal' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BOT_CLASS', @level2type=N'COLUMN',@level2name=N'MDSC_FREE_DECIMAL_1'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Terminal ID.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BOT_CLASS', @level2type=N'COLUMN',@level2name=N'MDSC_MTN_TERMINAL_ID'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Program ID.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BOT_CLASS', @level2type=N'COLUMN',@level2name=N'MDSC_MTN_PROGRAM_ID'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Branch Code' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BOT_CLASS', @level2type=N'COLUMN',@level2name=N'MDSC_MTN_BRANCH'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'User ID.' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BOT_CLASS', @level2type=N'COLUMN',@level2name=N'MDSC_MTN_USER_ID'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Date Time Update' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BOT_CLASS', @level2type=N'COLUMN',@level2name=N'MDSC_MTN_DATE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'job run key of currently running instance of job' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BOT_CLASS', @level2type=N'COLUMN',@level2name=N'JOB_RUN_KEY'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Code of source system for extraction' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BOT_CLASS', @level2type=N'COLUMN',@level2name=N'SOURCE_SYSTEM_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Source table name extracted' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BOT_CLASS', @level2type=N'COLUMN',@level2name=N'SOURCE_TABLE_NAME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'y-means record marked for deletion. n - means active record' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BOT_CLASS', @level2type=N'COLUMN',@level2name=N'DELETED_FLAG'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Last update time of source' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BOT_CLASS', @level2type=N'COLUMN',@level2name=N'SOURCE_LAST_UPDATE_DATE_TIME'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'record created / last updated date and time' , @level0type=N'SCHEMA',@level0name=N'STG', @level1type=N'TABLE',@level1name=N'STG_TNB_MST_BOT_CLASS', @level2type=N'COLUMN',@level2name=N'LAST_UPDATE_DATE_TIME'


IF EXISTS (SELECT name FROM sys.synonyms WHERE name = N'STG_TNB_MST_BOT_CLASS')
	BEGIN
		DROP SYNONYM STG_TNB_MST_BOT_CLASS 
	END

CREATE SYNONYM STG_TNB_MST_BOT_CLASS FOR STG.STG_TNB_MST_BOT_CLASS;

PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': STG_TNB_MST_BOT_CLASS TABLE CREATED.'









