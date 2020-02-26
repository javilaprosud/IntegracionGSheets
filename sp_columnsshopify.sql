
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

alter PROCEDURE [dbo].[SP_ColumnsShopify] 

AS
BEGIN
	SET NOCOUNT ON;
	select count(*) from sys.columns where object_id = '685466462'
END
GO


	exec SP_ColumnsShopify