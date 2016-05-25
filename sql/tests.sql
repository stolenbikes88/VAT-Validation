-- Valid
SELECT [dbo].[ufnValidateVAT] ('GB339072747')
GO

-- Too Short
SELECT [dbo].[ufnValidateVAT] ('GB3390727')
GO

-- Too Long
SELECT [dbo].[ufnValidateVAT] ('GB33907274777')
GO

-- Invalid
SELECT [dbo].[ufnValidateVAT] ('GB339072766')
GO
