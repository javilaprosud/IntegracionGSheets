SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

alter PROCEDURE [dbo].[SP_ADDColumnShopify] 

AS
	declare @nombre varchar(255)
BEGIN

	SET NOCOUNT ON;

	ALTER TABLE Shopify_Prueba ADD columna nvarchar(255) NULL;

	EXEC sp_RENAME 'Shopify_Prueba.columna' , @nombre, 'COLUMN'

END
GO
