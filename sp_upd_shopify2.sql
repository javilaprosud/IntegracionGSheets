USE [procesadorabd]
GO
/****** Object:  StoredProcedure [dbo].[SP_UPD_Shopify]    Script Date: 11/2/2020 18:05:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[SP_UPD_Shopify] 

		@Columna nvarchar(255),
		@Data nvarchar(255),
		@Id int

	
AS

BEGIN

	SET NOCOUNT ON;

	exec( 'update Shopify_Prueba set ['+@Columna+'] = '+@Data+' where id_InsercionBD = '+@Id+'');
END
