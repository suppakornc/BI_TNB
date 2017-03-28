USE [GL_TNB_MRT]

--Create PPL.NUMDAYINPERIOD function

/****** Object:  UserDefinedFunction [PPL].[NumDayInPeriod]    Script Date: 07-Dec-16 5:07:43 PM ******/
DROP FUNCTION [PPL].[NumDayInPeriod]

/****** Object:  UserDefinedFunction [PPL].[NumDayInPeriod]    Script Date: 07-Dec-16 5:07:43 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE FUNCTION [PPL].[NUMDAYINPERIOD]
(
	@STARTDATE	datetime,
	@ENDDATE	datetime,
	@DAYOFWEEK	VARCHAR(10)
)
	RETURNS FLOAT
AS BEGIN 

/* Functions Name	:	PPL.NumDayInPeriod

 * Purpose			:	To calculate number of specific day from start date to end date
 * Parameters		:	- @STARTDATE
						- @ENDDATE
						- @DAYOFWEEK ( Sunday,Monday,Tuesday,Wendesday,Thursday,Friday,Saturday )   
 * Permissions		:	-
 * Testing Method	:	1. 
						2. 
						3.       
 * Revision History
 * ---------  -------------  -------------------  --------------------------------------------------------------
 * ePWR No    Date			 Author               Description of change
 * ---------  -------------  -------------------  --------------------------------------------------------------
 *            2016-12-02     Suppakorn.C		  Creation of this initialization script.
 */
	
	DECLARE @NUMOFDAY	FLOAT,
			@Start_Date DATETIME,
			@End_Date	DATETIME

	SET @Start_Date = DATEADD(DAY,DATEDIFF(DAY,0,@STARTDATE),0)
	SET @End_Date = DATEADD(DAY,DATEDIFF(DAY,0,@ENDDATE),0)

	SET @NUMOFDAY = (SELECT COUNT(*)
	FROM [GL_TNB_DWH].[DIM].[DWH_TNB_DIM_DATE]
	WHERE  DATE_TIME BETWEEN @Start_Date AND @End_Date
		AND DAY_NAME IN (@DAYOFWEEK)
	)
	
	RETURN @NUMOFDAY
END