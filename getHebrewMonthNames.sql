USE [FlexWarehouse]
GO

/****** Object:  UserDefinedFunction [dbo].[getHebrewMonthNames]    Script Date: 8/13/2019 8:59:25 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[getHebrewMonthNames]
(
	-- Add the parameters for the function here
	@Month_num int
)
RETURNS nvarchar(255)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ResultVar nvarchar(255)

	-- Add the T-SQL statements to compute the return value here
	SELECT @ResultVar=case @Month_num 
		when 1	then 'ינואר'
		when 2	then 'פברואר'
		when 3	then 'מרץ'
		when 4	then 'אפריל'
		when 5	then 'מאי'
		when 6	then 'יוני'
		when 7	then 'יולי'
		when 8	then 'אוגוסט'
		when 9	then 'ספטמבר'
		when 10 then 'אוקטובר'
		when 11 then 'נובמבר'
		when 12 then 'דצמבר'
	end

	-- Return the result of the function
	RETURN @ResultVar

END



GO

