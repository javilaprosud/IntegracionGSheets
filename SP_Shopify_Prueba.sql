SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_ShopifyInsercion ]
	-- Add the parameters for the stored procedure here
	@Artisan nvarchar(255), 
    @ArtisanCrackers nvarchar(255), 
    @Billingaddressaddress1 nvarchar(255), 
    @Billingaddressaddress2 nvarchar(255), 
    @Billingaddressaddresses nvarchar(255), 
    @Billingaddresscity nvarchar(255), 
    @Billingaddresscompany nvarchar(255), 
    @Billingaddresscountry nvarchar(255), 
    @Billingaddresscountrycode nvarchar(255), 
    @Billingaddressfirstname nvarchar(255), 
    @Billingaddressfullinfo nvarchar(255), 
    @Billingaddressfullname nvarchar(255), 
    @Billingaddresslastname nvarchar(255), 
    @Billingaddresslatitude nvarchar(255), 
    @Billingaddresslongitude nvarchar(255), 
    @Billingaddressname nvarchar(255), 
    @Billingaddressphone nvarchar(255), 
    @Billingaddressprovince nvarchar(255), 
    @Billingaddressprovincecode nvarchar(255), 
    @Billingaddresszip nvarchar(255), 
    @Buyeracceptsmarketing nvarchar(255), 
    @Cancelreason nvarchar(255), 
    @Cancelledat nvarchar(255), 
    @Carttoken nvarchar(255), 
    @Checkoutid nvarchar(255), 
    @Checkouttoken nvarchar(255), 
    @Closedat nvarchar(255), 
    @Confirmed nvarchar(255), 
    @Createdat nvarchar(255), 
    @Createdatwithouttime nvarchar(255), 
    @Createdatwithouttimezone nvarchar(255), 
    @Created_at nvarchar(255), 
    @Currency nvarchar(255), 
    @Customeracceptsmarketing nvarchar(255), 
    @Customercompany nvarchar(255), 
    @Customercreatedat nvarchar(255), 
    @Customeremail nvarchar(255), 
    @Customerfirstname nvarchar(255), 
    @Customerfullname nvarchar(255), 
    @Customerid nvarchar(255), 
    @Customerlastname nvarchar(255), 
    @Customernote nvarchar(255), 
    @Customerorderscount nvarchar(255), 
    @Customerphone nvarchar(255), 
    @Customerstate nvarchar(255), 
    @Customertags nvarchar(255), 
    @Customertaxexempt nvarchar(255), 
    @Customerverifiedemail nvarchar(255), 
    @Discountcodes nvarchar(255), 
    @Discountcodesnames nvarchar(255), 
    @Email nvarchar(255), 
    @Financialstatus nvarchar(255), 
    @Fulfillmentstatus nvarchar(255), 
    @Gclid nvarchar(255), 
    @Haslineitemproperties nvarchar(255), 
    @Id nvarchar(255), 
    @Iscancelled nvarchar(255), 
    @Isonlinestoreorder nvarchar(255), 
    @Isposorder nvarchar(255), 
    @Landingsite nvarchar(255), 
    @Landingsiteref nvarchar(255), 
    @Lineitemdestinationlocation nvarchar(255), 
    @Lineitemfulfillmentdate nvarchar(255), 
    @Lineitemfulfillmentservice nvarchar(255), 
    @Lineitemfulfillmentstatus nvarchar(255), 
    @Lineitemfulfillments nvarchar(255), 
    @Lineitemgiftcard nvarchar(255), 
    @Lineitemgrams nvarchar(255), 
    @Lineitemid nvarchar(255), 
    @Lineitemisdelivered nvarchar(255), 
    @Lineitemisrefunded nvarchar(255), 
    @Lineitemname nvarchar(255), 
    @Lineitemoriginlocation nvarchar(255), 
    @Lineitemprice nvarchar(255), 
    @Lineitemproductid nvarchar(255), 
    @Lineitemquantity nvarchar(255), 
    @Lineitemquantitywithoutrefunds nvarchar(255), 
    @Lineitemrealprice nvarchar(255), 
    @Lineitemrequiresshipping nvarchar(255), 
    @Lineitemsku nvarchar(255), 
    @Lineitemtaxlines nvarchar(255), 
    @Lineitemtaxable nvarchar(255), 
    @Lineitemtitle nvarchar(255), 
    @Lineitemtotaldiscount nvarchar(255), 
    @Lineitemtotalprice nvarchar(255), 
    @Lineitemtotalpricewithoutdiscount nvarchar(255), 
    @Lineitemtotalpricewithoutshopifyfee nvarchar(255), 
    @Lineitemtotaltaxes nvarchar(255), 
    @Lineitemvariantid nvarchar(255), 
    @Lineitemvariantinventorymanagement nvarchar(255), 
    @Lineitemvarianttitle nvarchar(255), 
    @Lineitemvendor nvarchar(255), 
    @Lineitemscount nvarchar(255), 
    @Locationid nvarchar(255), 
    @Mc_cid nvarchar(255), 
    @Mermelada1 nvarchar(255), 
    @Mermelada1_copy nvarchar(255), 
    @Mermelada2 nvarchar(255), 
    @Mermelada3 nvarchar(255), 
    @Mermelada3_copy nvarchar(255), 
    @Mermelada4 nvarchar(255), 
    @Name nvarchar(255), 
    @Note nvarchar(255), 
    @Number nvarchar(255), 
    @Orderadminurl nvarchar(255), 
    @Ordernumber nvarchar(255), 
    @Orderstatusurl nvarchar(255), 
    @PackMixVegetales1 nvarchar(255), 
    @PackMixVegetales2 nvarchar(255), 
    @PackMixVegetales3 nvarchar(255), 
    @PackMixVegetales4 nvarchar(255), 
    @PackSalsasPicoteo1 nvarchar(255), 
    @PackSalsasPicoteo2 nvarchar(255), 
    @PackSalsasPicoteo3 nvarchar(255), 
    @PackSalsasPicoteo4 nvarchar(255), 
    @PackSalsasyPitaCrackers nvarchar(255), 
    @PackSalsasyPitaCrackers_copy nvarchar(255), 
    @Paymentgatewaynames nvarchar(255), 
    @Pesto1 nvarchar(255), 
    @Pesto2 nvarchar(255), 
    @Pesto3 nvarchar(255), 
    @Pesto4 nvarchar(255), 
    @Processedat nvarchar(255), 
    @Processingmethod nvarchar(255), 
    @Referringsite nvarchar(255), 
    @Refundslatestrefunddate nvarchar(255), 
    @Refundstotal nvarchar(255), 
    @Saleschannel nvarchar(255), 
    @Salsa1 nvarchar(255), 
    @Salsa2 nvarchar(255), 
    @Salsa3 nvarchar(255), 
    @Salsa4 nvarchar(255), 
    @Shippingaddressaddress1 nvarchar(255), 
    @Shippingaddressaddress2 nvarchar(255), 
    @Shippingaddressaddresses nvarchar(255), 
    @Shippingaddresscity nvarchar(255), 
    @Shippingaddresscompany nvarchar(255), 
    @Shippingaddresscountry nvarchar(255), 
    @Shippingaddresscountrycode nvarchar(255), 
    @Shippingaddressfirstname nvarchar(255), 
    @Shippingaddressfullinfo nvarchar(255), 
    @Shippingaddressfullname nvarchar(255), 
    @Shippingaddresslastname nvarchar(255), 
    @Shippingaddresslatitude nvarchar(255), 
    @Shippingaddresslongitude nvarchar(255), 
    @Shippingaddressname nvarchar(255), 
    @Shippingaddressphone nvarchar(255), 
    @Shippingaddressprovince nvarchar(255), 
    @Shippingaddressprovincecode nvarchar(255), 
    @Shippingaddresszip nvarchar(255), 
    @Shippingmethod nvarchar(255), 
    @Shippingprice nvarchar(255), 
    @Shopifyfee nvarchar(255), 
    @Sourcename nvarchar(255), 
    @Subtotalprice nvarchar(255), 
    @Tags nvarchar(255), 
    @Taxlines nvarchar(255), 
    @Taxesincluded nvarchar(255), 
    @Totaldiscounts nvarchar(255), 
    @Totallineitemsprice nvarchar(255), 
    @Totalprice nvarchar(255), 
    @Totalpriceincents nvarchar(255), 
    @Totalpriceusd nvarchar(255), 
    @Totalpricewithoutshopifyfee nvarchar(255), 
    @Totalquantity nvarchar(255), 
    @Totaltax nvarchar(255), 
    @Totalweight nvarchar(255), 
    @Totalwithoutrefunds nvarchar(255), 
    @Updatedat nvarchar(255), 
    @Utmcampaign nvarchar(255), 
    @Utmcontent nvarchar(255), 
    @Utmmedium nvarchar(255), 
    @Utmsource nvarchar(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into Shopify_Prueba values (
	@Artisan, 
    @ArtisanCrackers, 
    @Billingaddressaddress1, 
    @Billingaddressaddress2, 
    @Billingaddressaddresses, 
    @Billingaddresscity, 
    @Billingaddresscompany, 
    @Billingaddresscountry, 
    @Billingaddresscountrycode, 
    @Billingaddressfirstname, 
    @Billingaddressfullinfo, 
    @Billingaddressfullname, 
    @Billingaddresslastname, 
    @Billingaddresslatitude, 
    @Billingaddresslongitude, 
    @Billingaddressname, 
    @Billingaddressphone, 
    @Billingaddressprovince, 
    @Billingaddressprovincecode, 
    @Billingaddresszip, 
    @Buyeracceptsmarketing, 
    @Cancelreason, 
    @Cancelledat, 
    @Carttoken, 
    @Checkoutid, 
    @Checkouttoken, 
    @Closedat, 
    @Confirmed, 
    @Createdat, 
    @Createdatwithouttime, 
    @Createdatwithouttimezone, 
    @Created_at, 
    @Currency, 
    @Customeracceptsmarketing, 
    @Customercompany, 
    @Customercreatedat, 
    @Customeremail, 
    @Customerfirstname, 
    @Customerfullname, 
    @Customerid, 
    @Customerlastname, 
    @Customernote, 
    @Customerorderscount, 
    @Customerphone, 
    @Customerstate, 
    @Customertags, 
    @Customertaxexempt, 
    @Customerverifiedemail, 
    @Discountcodes, 
    @Discountcodesnames, 
    @Email, 
    @Financialstatus, 
    @Fulfillmentstatus, 
    @Gclid, 
    @Haslineitemproperties, 
    @Id, 
    @Iscancelled, 
    @Isonlinestoreorder, 
    @Isposorder, 
    @Landingsite, 
    @Landingsiteref, 
    @Lineitemdestinationlocation, 
    @Lineitemfulfillmentdate, 
    @Lineitemfulfillmentservice, 
    @Lineitemfulfillmentstatus, 
    @Lineitemfulfillments, 
    @Lineitemgiftcard, 
    @Lineitemgrams, 
    @Lineitemid, 
    @Lineitemisdelivered, 
    @Lineitemisrefunded, 
    @Lineitemname, 
    @Lineitemoriginlocation, 
    @Lineitemprice, 
    @Lineitemproductid, 
    @Lineitemquantity, 
    @Lineitemquantitywithoutrefunds, 
    @Lineitemrealprice, 
    @Lineitemrequiresshipping, 
    @Lineitemsku, 
    @Lineitemtaxlines, 
    @Lineitemtaxable, 
    @Lineitemtitle, 
    @Lineitemtotaldiscount, 
    @Lineitemtotalprice, 
    @Lineitemtotalpricewithoutdiscount, 
    @Lineitemtotalpricewithoutshopifyfee, 
    @Lineitemtotaltaxes, 
    @Lineitemvariantid, 
    @Lineitemvariantinventorymanagement, 
    @Lineitemvarianttitle, 
    @Lineitemvendor, 
    @Lineitemscount, 
    @Locationid, 
    @Mc_cid, 
    @Mermelada1, 
    @Mermelada1_copy, 
    @Mermelada2, 
    @Mermelada3, 
    @Mermelada3_copy, 
    @Mermelada4, 
    @Name, 
    @Note, 
    @Number, 
    @Orderadminurl, 
    @Ordernumber, 
    @Orderstatusurl, 
    @PackMixVegetales1, 
    @PackMixVegetales2, 
    @PackMixVegetales3, 
    @PackMixVegetales4, 
    @PackSalsasPicoteo1, 
    @PackSalsasPicoteo2, 
    @PackSalsasPicoteo3, 
    @PackSalsasPicoteo4, 
    @PackSalsasyPitaCrackers, 
    @PackSalsasyPitaCrackers_copy, 
    @Paymentgatewaynames, 
    @Pesto1, 
    @Pesto2, 
    @Pesto3, 
    @Pesto4, 
    @Processedat, 
    @Processingmethod, 
    @Referringsite, 
    @Refundslatestrefunddate, 
    @Refundstotal, 
    @Saleschannel, 
    @Salsa1, 
    @Salsa2, 
    @Salsa3, 
    @Salsa4, 
    @Shippingaddressaddress1, 
    @Shippingaddressaddress2, 
    @Shippingaddressaddresses, 
    @Shippingaddresscity, 
    @Shippingaddresscompany, 
    @Shippingaddresscountry, 
    @Shippingaddresscountrycode, 
    @Shippingaddressfirstname, 
    @Shippingaddressfullinfo, 
    @Shippingaddressfullname, 
    @Shippingaddresslastname, 
    @Shippingaddresslatitude, 
    @Shippingaddresslongitude, 
    @Shippingaddressname, 
    @Shippingaddressphone, 
    @Shippingaddressprovince, 
    @Shippingaddressprovincecode, 
    @Shippingaddresszip, 
    @Shippingmethod, 
    @Shippingprice, 
    @Shopifyfee, 
    @Sourcename, 
    @Subtotalprice, 
    @Tags, 
    @Taxlines, 
    @Taxesincluded, 
    @Totaldiscounts, 
    @Totallineitemsprice, 
    @Totalprice, 
    @Totalpriceincents, 
    @Totalpriceusd, 
    @Totalpricewithoutshopifyfee, 
    @Totalquantity, 
    @Totaltax, 
    @Totalweight, 
    @Totalwithoutrefunds, 
    @Updatedat, 
    @Utmcampaign, 
    @Utmcontent, 
    @Utmmedium, 
    @Utmsource
	)
END
GO