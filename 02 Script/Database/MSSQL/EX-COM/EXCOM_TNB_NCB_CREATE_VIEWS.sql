-- The BI.V_TADS_STG_TNB_TRN_NCB_EVENT_LOG view need to be created at TNBNCB DB
-- Create BI.V_TADS_STG_TNB_TRN_NCB_EVENT_LOG

IF EXISTS (SELECT name FROM sys.views WHERE name = N'V_TADS_STG_TNB_TRN_NCB_EVENT_LOG')
	BEGIN
		DROP VIEW BI.V_TADS_STG_TNB_TRN_NCB_EVENT_LOG
	END
GO
CREATE VIEW BI.V_TADS_STG_TNB_TRN_NCB_EVENT_LOG
AS SELECT [SID]
      ,[IPAddress]
      ,[SystemName]
      ,[CustomerID]
      ,[CustomerName]
      ,[NCRSUsername]
      ,[EventName]
      ,[Description]
      ,[IsCPUToCPU]
      ,[EventBy]
      ,[EventOn]
      ,[IsReceiveConsent]
      ,[MemberRef]
      ,[ReceiveConsentOn]
	  ,NULL AS JOB_RUN_KEY
	  ,'TNBNCB' AS SOURCE_SYSTEM_CODE
	  ,'NCBEventLog' AS SOURCE_TABLE_NAME
	  ,'N' DELETED_FLAG
	  ,[EventOn] AS SOURCE_LAST_UPDATE_DATE_TIME
	  ,NULL AS LAST_UPDATE_DATE_TIME
  FROM NCBEventLog INF WITH(NOLOCK)
GO
PRINT SUBSTRING(CONVERT(NVARCHAR(33),CURRENT_TIMESTAMP,121),1,19) + ': V_TADS_STG_TNB_TRN_NCB_EVENT_LOG VIEW CREATED.'