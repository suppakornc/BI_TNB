USE [GL_ETL_CONTROL]
GO

/* Purpose	: Insert JOB_CODE Scripts
 *
 * ---------  -------------  -------------------  --------------------------------------------------------------
 * ePWR No    Date			 Author               Description of change
 * ---------  -------------  -------------------  --------------------------------------------------------------
 *            2016-11-24     Suppakorn.C		  Creation of this initialization script.
*/

  INSERT INTO [GL_ETL_CONTROL].[ETL].[JOB_CONTROL] 
  (
		 [JOB_KEY]
		,[JOB_CODE]
		,[JOB_DESCRIPTION]
		,[JOB_GROUP_NAME]
		,[DELETED_FLAG]
		,[CREATED_BY]
		,[LAST_UPDATE_DATE_TIME]
		,[SOURCE_EXTRACT_SQL]
	)
  VALUES 
  (
		'6'
		,'EXCOM_MRT'
		,'ExCom Mart Load'
		,'TNB'
		,'N'
		,'SUPPAKORN.C'
		,GETDATE()
		,''
	)
GO

  INSERT INTO [GL_ETL_CONTROL].[ETL].[JOB_CONTROL] 
  (
		 [JOB_KEY]
		,[JOB_CODE]
		,[JOB_DESCRIPTION]
		,[JOB_GROUP_NAME]
		,[DELETED_FLAG]
		,[CREATED_BY]
		,[LAST_UPDATE_DATE_TIME]
		,[SOURCE_EXTRACT_SQL]
	)
  VALUES 
  (
		'4'
		,'TADS_DWH'
		,'TADS DWH Load'
		,'TNB'
		,'N'
		,'JIRAPONG.C'
		,GETDATE()
		,''
	)
GO

  INSERT INTO [GL_ETL_CONTROL].[ETL].[JOB_CONTROL] 
  (
		 [JOB_KEY]
		,[JOB_CODE]
		,[JOB_DESCRIPTION]
		,[JOB_GROUP_NAME]
		,[DELETED_FLAG]
		,[CREATED_BY]
		,[LAST_UPDATE_DATE_TIME]
		,[SOURCE_EXTRACT_SQL]
	)
  VALUES 
  (
		'5'
		,'TADS_MRT'
		,'TADS MRT Load'
		,'TNB'
		,'N'
		,'JIRAPONG.C'
		,GETDATE()
		,''
	)
GO


