USE [DWH]
GO
/****** Object:  StoredProcedure [dbo].[usp_ReportStatus]    Script Date: 3/16/2021 9:51:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE  [dbo].[usp_ReportStatus]
as 

	declare @source varchar(max), @decoded varchar(MAX)

	SELECT @source=BulkColumn FROM OPENROWSET( BULK '\\ho-sql16\d$\REPORTS\ReportStatus.mhtml', SINGLE_CLOB) x

	SET @source = SUBSTRING(@source,CHARINDEX('base64',@source,1)+10,LEN(@source))
	SET @source = SUBSTRING(@source,1,CHARINDEX('-',@source,CHARINDEX('base64',@source,1)+10)-5)
	--set @decoded = CAST(N'' AS XML).value('xs:base64Binary(sql:variable("@source"))','VARBINARY(MAX)')
	SET @decoded = dbo.UTF8_TO_NVARCHAR(CAST(N'' AS XML).value('xs:base64Binary(sql:variable("@source"))','VARBINARY(MAX)'))

	EXEC msdb.dbo.sp_send_dbmail
			@profile_name = ''
		   ,@recipients =   'ylanou@csc.gov.il;marinas@opisoft.com' --#@recipients batelis@csc.gov.il;marinas@opisoft.com
		   --,@copy_recipients =  'ylanou@csc.gov.il'
		   --,@blind_copy_recipients = ''
		   --,@from_address  = 'מוטי אהרוני <toto@csc.gov.il>'
		   ,@from_address  = 'תמיכה BI <titi@csc.gov.il>'
		   ,@subject ='סטטוס הערכות עובדים'
		   ,@body = @decoded
		   ,@body_format = 'HTML'
   		   ,@file_attachments = '\\ho\d$\REPORTS\סטטוס הערכות.xlsx';

