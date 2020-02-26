USE [procesadorabd]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter procedure [dbo].[SP_correo_shopify2]
@pedidos varchar(max),
@name varchar(max)

as
begin
		 
declare @html varchar(3000)

if @pedidos > 0
begin 
                                                                                                                                                                                                                                                      
set @html = 
N'<p>Hay '+ @pedidos +' pedido(s) nuevo(s) para procesar y Generar OP de la tienda de Perfect Choice. Numero(s): '+ @name +'.  Saludos.</p>';
              
         EXEC msdb.dbo.sp_send_dbmail
         --@recipients = 'digitacion@prosud.cl; clara@prosud.cl; rserra@prosud.cl; mopazo@prosud.cl; mgonzalez@prosud.cl' ,
         --@copy_recipients = 'javila@prosud.cl; ccabrera@prosud.cl ',
         --@profile_name = 'PROSUD',
         --@subject = 'Nuevos pedidos en Shopify' , 
         --@body_format = 'HTML',
         --@body = @html; 

		 @recipients = 'mgarridop@prosud.cl' ,
         @copy_recipients = 'javila@prosud.cl ',
         @profile_name = 'PROSUD',
         @subject = 'PRUEBA - Nuevos pedidos en Shopify' , 
         @body_format = 'HTML',
         @body = @html; 
		                                                                                                                                                                                                                     
		 end 
end 