/****** Object:  UserDefinedFunction [dbo].[ufnValidateVAT]    Script Date: 05/25/2016 11:36:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<John Moss>
-- Create date: <2016/05/25>
-- Description:	<Returns true or false dependent on if VAT number if valid>
-- =============================================
CREATE FUNCTION [dbo].[ufnValidateVAT] (
	-- Add the parameters for the function here
	@VATnumber NVARCHAR(500)
	)
RETURNS bit
	WITH SCHEMABINDING
AS
BEGIN
	-- Declare the return variable here
	DECLARE @VATvalid bit
	Declare @checkdigits int 
	Declare @digitone int 
	Declare @digittwo int 
	Declare @digitthree int 
	Declare @digitfour int 
	Declare @digitfive int 
	Declare @digitsix int 
	Declare @digitseven int
	Declare @total int
	
	
	---- Generate our values
	SET @checkdigits = RIGHT(@VATnumber, 2)
	SET @digitone = RIGHT(LEFT(@VATnumber, 3), 1)
	SET @digittwo = RIGHT(LEFT(@VATnumber, 4), 1)
	SET @digitthree = RIGHT(LEFT(@VATnumber, 5), 1)
	SET @digitfour = RIGHT(LEFT(@VATnumber, 6), 1)
	SET @digitfive = RIGHT(LEFT(@VATnumber, 7), 1)
	SET @digitsix = RIGHT(LEFT(@VATnumber, 8), 1)
	SET @digitseven = RIGHT(LEFT(@VATnumber, 9), 1)
	
	-- perform the calculation to check against checkdigit
	SET @total = (@digitone * 8) + (@digittwo * 7) + (@digitthree * 6) + (@digitfour * 5) + (@digitfive * 4) + (@digitsix * 3) + (@digitseven * 2)
	SET @total = CEILING(@total / 97.0) * 97 - @total

	SET @VATvalid = CASE 
				WHEN len(@VATnumber) <> 11
					THEN 0
				WHEN @total = @checkdigits
					THEN 1
				WHEN @total - 55 = @checkdigits
					THEN 1
				WHEN ((@total - 55) < 0) AND (@total + 42) = @checkdigits
					THEN 1
				ELSE 0
			END
	
	--SET @VATvalid = @checkdigits

	RETURN @VATvalid
END


GO
