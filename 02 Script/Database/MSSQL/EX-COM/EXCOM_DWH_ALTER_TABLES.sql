--Add columns for DWH_TNB_DIM_BRANCH
ALTER TABLE GL_TNB_DWH.DIM.DWH_TNB_DIM_BRANCH
ADD BRANCH_CREATE_DATE DATETIME;

ALTER TABLE GL_TNB_DWH.DIM.DWH_TNB_DIM_BRANCH
ADD TAKE_CARE_BY_BRANCH_CODE INT;

ALTER TABLE GL_TNB_DWH.DIM.DWH_TNB_DIM_BRANCH
ADD BRANCH_CLOSE_DATE DATETIME;

ALTER TABLE GL_TNB_DWH.DIM.DWH_TNB_DIM_BRANCH
ADD BRANCH_ACTIVE_STATUS VARCHAR(1);

EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'branch created date', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_BRANCH', @level2type=N'column', @level2name=N'BRANCH_CREATE_DATE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'branch code', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_BRANCH', @level2type=N'column', @level2name=N'TAKE_CARE_BY_BRANCH_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'branch closed date', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_BRANCH', @level2type=N'column', @level2name=N'BRANCH_CLOSE_DATE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'branch active status', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_BRANCH', @level2type=N'column', @level2name=N'BRANCH_ACTIVE_STATUS'

--Add columns for DWH_TNB_DIM_DEALER

ALTER TABLE GL_TNB_DWH.DIM.DWH_TNB_DIM_DEALER
ADD DEALER_JOIN_DATE DATETIME;

ALTER TABLE GL_TNB_DWH.DIM.DWH_TNB_DIM_DEALER
ADD DEALER_QUIT_DATE DATETIME;

ALTER TABLE GL_TNB_DWH.DIM.DWH_TNB_DIM_DEALER
ADD DEALER_ACTIVE_STATUS VARCHAR(1);

EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'dealer join date', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DEALER', @level2type=N'column', @level2name=N'DEALER_JOIN_DATE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'dealer quit date', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DEALER', @level2type=N'column', @level2name=N'DEALER_QUIT_DATE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'dealer active status', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_DEALER', @level2type=N'column', @level2name=N'DEALER_ACTIVE_STATUS'

--Add columns for DWH_TNB_FCT_CONTRACT_MONTHLY

ALTER TABLE GL_TNB_DWH.FACT.DWH_TNB_FCT_CONTRACT_MONTHLY
ADD DUE_PERIOD FLOAT;

ALTER TABLE GL_TNB_DWH.FACT.DWH_TNB_FCT_CONTRACT_MONTHLY
ADD INSTALL_PASS_DUE FLOAT;

ALTER TABLE GL_TNB_DWH.FACT.DWH_TNB_FCT_CONTRACT_MONTHLY
ADD PAY_PRINCIPAL FLOAT;

EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'due period', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'DUE_PERIOD'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'ค่างวดค้างชำระ', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'INSTALL_PASS_DUE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'จำนวนเงินที่ชำระ', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_CONTRACT_MONTHLY', @level2type=N'column', @level2name=N'PAY_PRINCIPAL'

--Add columns for DWH_TNB_FCT_APP_CONTRACT

ALTER TABLE GL_TNB_DWH.FACT.DWH_TNB_FCT_APP_CONTRACT
ADD LAST_PAY_PERIOD FLOAT;

ALTER TABLE GL_TNB_DWH.FACT.DWH_TNB_FCT_APP_CONTRACT
ADD REPO_DATE DATETIME;

ALTER TABLE GL_TNB_DWH.FACT.DWH_TNB_FCT_APP_CONTRACT
ADD NEXT_DUE_DATE DATETIME;

ALTER TABLE GL_TNB_DWH.FACT.DWH_TNB_FCT_APP_CONTRACT
ADD FIRST_DUE_DATE DATETIME;

EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'First due date', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_APP_CONTRACT', @level2type=N'column', @level2name=N'FIRST_DUE_DATE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'ชำระค่างวดล่าสุดครั้งที่ (Period No.)', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_APP_CONTRACT', @level2type=N'column', @level2name=N'LAST_PAY_PERIOD'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Repossession Date', @level0type=N'schema', @level0name=N'FACT',  @level1type=N'table', @level1name=N'DWH_TNB_FCT_APP_CONTRACT', @level2type=N'column', @level2name=N'REPO_DATE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Next Payment Date', @level0type=N'schema', @level0name=N'FACT', @level1type=N'table', @level1name=N'DWH_TNB_FCT_APP_CONTRACT', @level2type=N'column', @level2name=N'NEXT_DUE_DATE'

--Add columns for DWH_TNB_DIM_REQUEST_STATUS

ALTER TABLE GL_TNB_DWH.DIM.DWH_TNB_DIM_REQUEST_STATUS
ADD REQ_STATUS_GRP_CODE VARCHAR(10) NULL;

ALTER TABLE GL_TNB_DWH.DIM.DWH_TNB_DIM_REQUEST_STATUS
ADD REQ_STATUS_GRP_DESC VARCHAR(30) NULL;

EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Request status group code defined by DWH', @level0type=N'schema', @level0name=N'DIM',  @level1type=N'table', @level1name=N'DWH_TNB_DIM_REQUEST_STATUS', @level2type=N'column', @level2name=N'REQ_STATUS_GRP_CODE'
EXEC sys.sp_addextendedproperty @name=N'MS_description', @value=N'Request status group description defined by DWH', @level0type=N'schema', @level0name=N'DIM', @level1type=N'table', @level1name=N'DWH_TNB_DIM_REQUEST_STATUS', @level2type=N'column', @level2name=N'REQ_STATUS_GRP_DESC'
