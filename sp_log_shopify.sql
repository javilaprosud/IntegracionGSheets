SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

alter PROCEDURE [dbo].[SP_Log_Shopify] 

	@id_insercion int,
	@info varchar(max),
	@estado varchar(max)
AS
BEGIN

	SET NOCOUNT ON;

	insert into Log_Shopify(id_InsercionBD,log_text, estado, log_fecha) values(@id_insercion,@info,@estado, GETDATE())
END
GO


select * from log_Shopify