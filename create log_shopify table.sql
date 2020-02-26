USE [procesadorabd]
GO

/****** Object:  Table [dbo].[Log_Shopify]    Script Date: 13/2/2020 11:23:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Log_Shopify](
	[id_log] [int] IDENTITY(1,1) NOT NULL,
	[id_InsercionBD] [int] NULL,
	[log_text] [varchar](max) NULL,
	[log_fecha] [datetime] NOT NULL,
	[estado] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


