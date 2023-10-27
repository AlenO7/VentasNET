USE [VentasNet]
GO
/****** Object:  StoredProcedure [dbo].[sp_Buscar_Pais]    Script Date: 6/10/2023 5:37:07 p. m. ******/
DROP PROCEDURE [dbo].[sp_Buscar_Pais]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 6/10/2023 5:37:07 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario]') AND type in (N'U'))
DROP TABLE [dbo].[Usuario]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 6/10/2023 5:37:07 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rol]') AND type in (N'U'))
DROP TABLE [dbo].[Rol]
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 6/10/2023 5:37:07 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Provincia]') AND type in (N'U'))
DROP TABLE [dbo].[Provincia]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 6/10/2023 5:37:07 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proveedor]') AND type in (N'U'))
DROP TABLE [dbo].[Proveedor]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 6/10/2023 5:37:07 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto]') AND type in (N'U'))
DROP TABLE [dbo].[Producto]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 6/10/2023 5:37:07 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pais]') AND type in (N'U'))
DROP TABLE [dbo].[Pais]
GO
/****** Object:  Table [dbo].[Localidad]    Script Date: 6/10/2023 5:37:07 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Localidad]') AND type in (N'U'))
DROP TABLE [dbo].[Localidad]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 6/10/2023 5:37:07 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente]') AND type in (N'U'))
DROP TABLE [dbo].[Cliente]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 6/10/2023 5:37:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [bigint] IDENTITY(1,1) NOT NULL,
	[RazonSocial] [varchar](50) NOT NULL,
	[Cuit] [varchar](50) NOT NULL,
	[Domicilio] [varchar](100) NULL,
	[Fecha_alta] [date] NULL,
	[Fecha_baja] [date] NULL,
	[Email] [varchar](100) NULL,
	[Estado] [bit] NULL,
	[IdPais] [int] NULL,
	[IdProvincia] [int] NULL,
	[IdLocalidad] [int] NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localidad]    Script Date: 6/10/2023 5:37:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localidad](
	[IdLocalidad] [int] NOT NULL,
	[Nombre] [varchar](70) NOT NULL,
	[IdProvincia] [int] NULL,
 CONSTRAINT [PK_Localidad] PRIMARY KEY CLUSTERED 
(
	[IdLocalidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 6/10/2023 5:37:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[IdPais] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Pais] PRIMARY KEY CLUSTERED 
(
	[IdPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 6/10/2023 5:37:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](100) NULL,
	[Precio] [int] NULL,
	[Estado] [bit] NULL,
	[IdProveeor] [int] NULL,
	[Codigo] [int] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 6/10/2023 5:37:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[IdProveedor] [int] IDENTITY(1,1) NOT NULL,
	[RazonSocial] [varchar](50) NULL,
	[Cuit] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
	[Domicilio] [varchar](50) NULL,
	[IdLocalidad] [int] NULL,
	[IdProvincia] [int] NULL,
	[IdPais] [int] NULL,
	[Fecha_alta] [date] NULL,
	[Fecha_baja] [date] NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[IdProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 6/10/2023 5:37:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincia](
	[IdProvincia] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[IdPais] [int] NULL,
 CONSTRAINT [PK_Provincia] PRIMARY KEY CLUSTERED 
(
	[IdProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 6/10/2023 5:37:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[IdRol] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 6/10/2023 5:37:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Cuit] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Clave] [varchar](50) NULL,
	[Fecha_alta] [date] NULL,
	[Fecha_baja] [date] NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 
GO
INSERT [dbo].[Cliente] ([IdCliente], [RazonSocial], [Cuit], [Domicilio], [Fecha_alta], [Fecha_baja], [Email], [Estado], [IdPais], [IdProvincia], [IdLocalidad]) VALUES (14, N'JuanSRL', N'4554554', N'Nueva Córdoba 123', CAST(N'2023-09-27' AS Date), CAST(N'2023-09-27' AS Date), N'alenozcariz07@gmail.com', 0, NULL, NULL, NULL)
GO
INSERT [dbo].[Cliente] ([IdCliente], [RazonSocial], [Cuit], [Domicilio], [Fecha_alta], [Fecha_baja], [Email], [Estado], [IdPais], [IdProvincia], [IdLocalidad]) VALUES (15, N'PEDRO', N'45454', N'MITRE', NULL, NULL, N'PEDRO@GMAIL.COM', 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Cliente] ([IdCliente], [RazonSocial], [Cuit], [Domicilio], [Fecha_alta], [Fecha_baja], [Email], [Estado], [IdPais], [IdProvincia], [IdLocalidad]) VALUES (16, N'Coca Cola SRL', N'34343', N'Alsina', CAST(N'2023-10-04' AS Date), CAST(N'2023-10-04' AS Date), N'alenozcariz07@gmail.com', 0, NULL, NULL, NULL)
GO
INSERT [dbo].[Cliente] ([IdCliente], [RazonSocial], [Cuit], [Domicilio], [Fecha_alta], [Fecha_baja], [Email], [Estado], [IdPais], [IdProvincia], [IdLocalidad]) VALUES (17, N'Coca Cola SRL', N'6565656', N'Alsina', CAST(N'2023-10-04' AS Date), NULL, N'alenozcariz07@gmail.com', 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Cliente] ([IdCliente], [RazonSocial], [Cuit], [Domicilio], [Fecha_alta], [Fecha_baja], [Email], [Estado], [IdPais], [IdProvincia], [IdLocalidad]) VALUES (18, N'Pepsi', N'23764445', N'mitre', CAST(N'2023-10-04' AS Date), NULL, N'Pepsi@gmail.com', 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Cliente] ([IdCliente], [RazonSocial], [Cuit], [Domicilio], [Fecha_alta], [Fecha_baja], [Email], [Estado], [IdPais], [IdProvincia], [IdLocalidad]) VALUES (19, N'fanta', N'1234567', N'Belgrano', CAST(N'2023-10-04' AS Date), NULL, N'fanta@gmail.com', 1, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
INSERT [dbo].[Localidad] ([IdLocalidad], [Nombre], [IdProvincia]) VALUES (1, N'Córdoba', NULL)
GO
INSERT [dbo].[Pais] ([IdPais], [Nombre]) VALUES (1, N'Argentina')
GO
INSERT [dbo].[Pais] ([IdPais], [Nombre]) VALUES (2, N'Brasil')
GO
INSERT [dbo].[Pais] ([IdPais], [Nombre]) VALUES (3, N'Uruguay')
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 
GO
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Descripcion], [Precio], [Estado], [IdProveeor], [Codigo]) VALUES (1, NULL, NULL, NULL, 0, NULL, 0)
GO
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Descripcion], [Precio], [Estado], [IdProveeor], [Codigo]) VALUES (2, N'mesa', N'Color: Blanco', 100000, 1, NULL, 211)
GO
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Descripcion], [Precio], [Estado], [IdProveeor], [Codigo]) VALUES (1002, N'Silla', N'Material: Madera / Color: marrón', 2000, 1, NULL, 5001)
GO
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO
SET IDENTITY_INSERT [dbo].[Proveedor] ON 
GO
INSERT [dbo].[Proveedor] ([IdProveedor], [RazonSocial], [Cuit], [Email], [Telefono], [Domicilio], [IdLocalidad], [IdProvincia], [IdPais], [Fecha_alta], [Fecha_baja], [Estado]) VALUES (1, N'JuanSRL', N'121212', N'alenozcariz07@gmail.com', N'11232323', N'Mitre', NULL, NULL, NULL, CAST(N'2023-10-04' AS Date), CAST(N'2023-10-04' AS Date), 0)
GO
INSERT [dbo].[Proveedor] ([IdProveedor], [RazonSocial], [Cuit], [Email], [Telefono], [Domicilio], [IdLocalidad], [IdProvincia], [IdPais], [Fecha_alta], [Fecha_baja], [Estado]) VALUES (2, N'FELIPE', N'542376', N'FELIPE@GMAIL.COM', N'11234532', N'BELGRANO', NULL, NULL, NULL, CAST(N'2023-10-04' AS Date), NULL, 1)
GO
INSERT [dbo].[Proveedor] ([IdProveedor], [RazonSocial], [Cuit], [Email], [Telefono], [Domicilio], [IdLocalidad], [IdProvincia], [IdPais], [Fecha_alta], [Fecha_baja], [Estado]) VALUES (3, N'Fantoche', N'23754887', N'alenozcariz07@gmail.com', N'11232323', N'Rivadavia 1000', NULL, NULL, NULL, CAST(N'2023-10-04' AS Date), CAST(N'2023-10-04' AS Date), 0)
GO
SET IDENTITY_INSERT [dbo].[Proveedor] OFF
GO
SET IDENTITY_INSERT [dbo].[Provincia] ON 
GO
INSERT [dbo].[Provincia] ([IdProvincia], [Nombre], [IdPais]) VALUES (1, N'Córdoba', NULL)
GO
SET IDENTITY_INSERT [dbo].[Provincia] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 
GO
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Apellido], [Cuit], [Email], [Clave], [Fecha_alta], [Fecha_baja], [Estado]) VALUES (2, N'Alen', N'Ozcariz', N'20543673230', N'alenozcariz07@gmail.com', N'1234', CAST(N'2023-10-06' AS Date), NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_Buscar_Pais]    Script Date: 6/10/2023 5:37:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Buscar_Pais] 
AS
BEGIN
	SELECT IdPais, Nombre FROM Pais ORDER BY NOMBRE ASC
END
GO
