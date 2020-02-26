
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

alter PROCEDURE [dbo].[SP_ADD_Shopify] 
as
BEGIN

	SET NOCOUNT ON;
	insert into Shopify_Prueba(Artisan) values ('')

END

begin

select max(id_InsercionBD) from Shopify_Prueba

end
GO

