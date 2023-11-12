USE [VentasNet]
GO
/****** Object:  StoredProcedure [dbo].[sp_Buscar_Pais]    Script Date: 8/11/2023 11:41:40 p. m. ******/
DROP PROCEDURE [dbo].[sp_Buscar_Pais]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 8/11/2023 11:41:40 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ventas]') AND type in (N'U'))
DROP TABLE [dbo].[Ventas]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 8/11/2023 11:41:40 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario]') AND type in (N'U'))
DROP TABLE [dbo].[Usuario]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 8/11/2023 11:41:40 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Stock]') AND type in (N'U'))
DROP TABLE [dbo].[Stock]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 8/11/2023 11:41:40 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rol]') AND type in (N'U'))
DROP TABLE [dbo].[Rol]
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 8/11/2023 11:41:40 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Provincia]') AND type in (N'U'))
DROP TABLE [dbo].[Provincia]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 8/11/2023 11:41:40 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proveedor]') AND type in (N'U'))
DROP TABLE [dbo].[Proveedor]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 8/11/2023 11:41:40 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto]') AND type in (N'U'))
DROP TABLE [dbo].[Producto]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 8/11/2023 11:41:40 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pais]') AND type in (N'U'))
DROP TABLE [dbo].[Pais]
GO
/****** Object:  Table [dbo].[MovimientoDeProveedores]    Script Date: 8/11/2023 11:41:40 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MovimientoDeProveedores]') AND type in (N'U'))
DROP TABLE [dbo].[MovimientoDeProveedores]
GO
/****** Object:  Table [dbo].[MovimientoDeComprobantes]    Script Date: 8/11/2023 11:41:40 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MovimientoDeComprobantes]') AND type in (N'U'))
DROP TABLE [dbo].[MovimientoDeComprobantes]
GO
/****** Object:  Table [dbo].[MetodosPago]    Script Date: 8/11/2023 11:41:40 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MetodosPago]') AND type in (N'U'))
DROP TABLE [dbo].[MetodosPago]
GO
/****** Object:  Table [dbo].[Localidad]    Script Date: 8/11/2023 11:41:40 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Localidad]') AND type in (N'U'))
DROP TABLE [dbo].[Localidad]
GO
/****** Object:  Table [dbo].[FormaPago]    Script Date: 8/11/2023 11:41:40 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FormaPago]') AND type in (N'U'))
DROP TABLE [dbo].[FormaPago]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 8/11/2023 11:41:40 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente]') AND type in (N'U'))
DROP TABLE [dbo].[Cliente]
GO
/****** Object:  View [dbo].[VWComprobante]    Script Date: 8/11/2023 11:41:40 p. m. ******/
DROP VIEW [dbo].[VWComprobante]
GO
/****** Object:  Table [dbo].[Comprobante]    Script Date: 8/11/2023 11:41:40 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Comprobante]') AND type in (N'U'))
DROP TABLE [dbo].[Comprobante]
GO
/****** Object:  Table [dbo].[Comprobante]    Script Date: 8/11/2023 11:41:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comprobante](
	[IdComprobante] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[NombreCorto] [varchar](50) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[NroInicioCbte] [int] NULL,
	[NroSucursal] [int] NULL,
	[NroUltimoCbte] [int] NULL,
	[FechaMovimiento] [datetime] NULL,
 CONSTRAINT [PK_Comprobante] PRIMARY KEY CLUSTERED 
(
	[IdComprobante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VWComprobante]    Script Date: 8/11/2023 11:41:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[VWComprobante]
as
	Select IdComprobante, Nombre, NombreCorto, Descripcion, NroInicioCbte, NroSucursal, NroUltimoCbte ,CONCAT('000',NroSucursal,'-','0000000',NroUltimoCbte+1)as NroProximoCbte from Comprobante

GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 8/11/2023 11:41:40 p. m. ******/
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
	[Pais] [varchar](50) NULL,
	[Provincia] [varchar](50) NULL,
	[Localidad] [varchar](50) NULL,
	[Nombre] [varchar](50) NULL,
	[Apeliido] [varchar](50) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormaPago]    Script Date: 8/11/2023 11:41:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormaPago](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[IdMetodoPago] [int] NOT NULL,
	[Entidad] [varchar](50) NOT NULL,
	[IdFinanciacion] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_FormaDePagos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localidad]    Script Date: 8/11/2023 11:41:40 p. m. ******/
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
/****** Object:  Table [dbo].[MetodosPago]    Script Date: 8/11/2023 11:41:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MetodosPago](
	[IdMetodoPago] [int] IDENTITY(1,1) NOT NULL,
	[MetodoPago] [varchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
	[FechaAlta] [date] NULL,
	[FechaBaja] [date] NULL,
 CONSTRAINT [PK_MetodosPago] PRIMARY KEY CLUSTERED 
(
	[IdMetodoPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovimientoDeComprobantes]    Script Date: 8/11/2023 11:41:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovimientoDeComprobantes](
	[Id] [int] NOT NULL,
	[IdComprobante] [int] NOT NULL,
	[IdMovimientoProveedor] [int] NULL,
	[Importe] [decimal](16, 2) NOT NULL,
	[Descuento] [decimal](16, 2) NULL,
	[Impuesto] [decimal](16, 2) NULL,
	[Total] [decimal](16, 2) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_MovimientoDeComprobantes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovimientoDeProveedores]    Script Date: 8/11/2023 11:41:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovimientoDeProveedores](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Comprobante] [varchar](50) NOT NULL,
	[FechaComprobante] [date] NOT NULL,
	[ImporteTotal] [decimal](16, 2) NOT NULL,
	[Descuentos] [decimal](16, 2) NULL,
	[Recargas] [decimal](16, 2) NULL,
	[Fecha Movimient] [timestamp] NOT NULL,
	[IdUsuario] [int] NOT NULL,
 CONSTRAINT [PK_MovimientoDeProveedores] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 8/11/2023 11:41:40 p. m. ******/
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
/****** Object:  Table [dbo].[Producto]    Script Date: 8/11/2023 11:41:40 p. m. ******/
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
/****** Object:  Table [dbo].[Proveedor]    Script Date: 8/11/2023 11:41:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[IdProveedor] [int] IDENTITY(1,1) NOT NULL,
	[RazonSocial] [varchar](50) NOT NULL,
	[Cuit] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
	[Domicilio] [varchar](50) NULL,
	[Localidad] [varchar](50) NULL,
	[Provincia] [varchar](50) NULL,
	[Pais] [varchar](50) NULL,
	[Fecha_alta] [date] NULL,
	[Fecha_baja] [date] NULL,
	[Estado] [bit] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[IdProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 8/11/2023 11:41:40 p. m. ******/
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
/****** Object:  Table [dbo].[Rol]    Script Date: 8/11/2023 11:41:40 p. m. ******/
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
/****** Object:  Table [dbo].[Stock]    Script Date: 8/11/2023 11:41:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdProducto] [int] NOT NULL,
	[CantIngreso] [int] NOT NULL,
	[FechaIngreso] [date] NULL,
	[CantEgreso] [int] NOT NULL,
	[FechaEgreso] [date] NULL,
	[IdUsuario] [int] NOT NULL,
	[FechaMovimiento] [timestamp] NOT NULL,
	[IdComprobante] [int] NOT NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 8/11/2023 11:41:40 p. m. ******/
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
/****** Object:  Table [dbo].[Ventas]    Script Date: 8/11/2023 11:41:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[IdVenta] [int] IDENTITY(1,1) NOT NULL,
	[IdComprobante] [int] NOT NULL,
	[NombreCorto] [varchar](50) NULL,
	[IdFormaPago] [int] NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[ImporteTotal] [decimal](16, 2) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[FechaMovimiento] [timestamp] NULL,
 CONSTRAINT [PK_Pagos] PRIMARY KEY CLUSTERED 
(
	[IdVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 
GO
INSERT [dbo].[Cliente] ([IdCliente], [RazonSocial], [Cuit], [Domicilio], [Fecha_alta], [Fecha_baja], [Email], [Estado], [Pais], [Provincia], [Localidad], [Nombre], [Apeliido]) VALUES (1, N'Vital - QUILMES', N'76532192', N'Calchaqui 2450', CAST(N'2023-11-04' AS Date), CAST(N'2023-11-08' AS Date), N'vital@gmail.com', 0, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Cliente] ([IdCliente], [RazonSocial], [Cuit], [Domicilio], [Fecha_alta], [Fecha_baja], [Email], [Estado], [Pais], [Provincia], [Localidad], [Nombre], [Apeliido]) VALUES (2, N'Coto SRL', N'34657982', N'Lavalle 123', CAST(N'2023-11-08' AS Date), NULL, N'coto@gmail.com', 1, N'Argentina', N'Buenos Aires', N'Quilmes', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[Comprobante] ON 
GO
INSERT [dbo].[Comprobante] ([IdComprobante], [Nombre], [NombreCorto], [Descripcion], [NroInicioCbte], [NroSucursal], [NroUltimoCbte], [FechaMovimiento]) VALUES (1, N'ticket', N'tck', N'ticket', 1, 1, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[Comprobante] OFF
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
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Descripcion], [Precio], [Estado], [IdProveeor], [Codigo]) VALUES (2, N'Mesa', N'Color: Blanco', 20000, 1, NULL, 211)
GO
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Descripcion], [Precio], [Estado], [IdProveeor], [Codigo]) VALUES (1002, N'Silla', N'Material: Madera / Color: marrón', 8000, 1, NULL, 5001)
GO
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO
SET IDENTITY_INSERT [dbo].[Proveedor] ON 
GO
INSERT [dbo].[Proveedor] ([IdProveedor], [RazonSocial], [Cuit], [Email], [Telefono], [Domicilio], [Localidad], [Provincia], [Pais], [Fecha_alta], [Fecha_baja], [Estado], [Nombre], [Apellido]) VALUES (1, N'JuanSRL', N'121212', N'alenozcariz07@gmail.com', N'11232323', N'Mitre', NULL, NULL, NULL, CAST(N'2023-10-04' AS Date), CAST(N'2023-10-04' AS Date), 0, NULL, NULL)
GO
INSERT [dbo].[Proveedor] ([IdProveedor], [RazonSocial], [Cuit], [Email], [Telefono], [Domicilio], [Localidad], [Provincia], [Pais], [Fecha_alta], [Fecha_baja], [Estado], [Nombre], [Apellido]) VALUES (2, N'FELIPE', N'542376', N'FELIPE@GMAIL.COM', N'11234532', N'BELGRANO', NULL, NULL, NULL, CAST(N'2023-10-04' AS Date), CAST(N'2023-11-04' AS Date), 0, NULL, NULL)
GO
INSERT [dbo].[Proveedor] ([IdProveedor], [RazonSocial], [Cuit], [Email], [Telefono], [Domicilio], [Localidad], [Provincia], [Pais], [Fecha_alta], [Fecha_baja], [Estado], [Nombre], [Apellido]) VALUES (3, N'Fantoche', N'23754887', N'alenozcariz07@gmail.com', N'11232323', N'Rivadavia 1000', NULL, NULL, NULL, CAST(N'2023-10-04' AS Date), CAST(N'2023-10-04' AS Date), 0, NULL, NULL)
GO
INSERT [dbo].[Proveedor] ([IdProveedor], [RazonSocial], [Cuit], [Email], [Telefono], [Domicilio], [Localidad], [Provincia], [Pais], [Fecha_alta], [Fecha_baja], [Estado], [Nombre], [Apellido]) VALUES (4, N'Coca Cola SRL', N'23547642', N'cocacola@gmail.com', N'11456337', N'Alsina 320', N'Quilmes', N'Buenos Aires', N'Argentina', CAST(N'2023-11-04' AS Date), NULL, 1, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Proveedor] OFF
GO
SET IDENTITY_INSERT [dbo].[Provincia] ON 
GO
INSERT [dbo].[Provincia] ([IdProvincia], [Nombre], [IdPais]) VALUES (1, N'Córdoba', 1)
GO
INSERT [dbo].[Provincia] ([IdProvincia], [Nombre], [IdPais]) VALUES (2, N'Buenos Aires', 1)
GO
INSERT [dbo].[Provincia] ([IdProvincia], [Nombre], [IdPais]) VALUES (3, N'Sao Pablo', 2)
GO
SET IDENTITY_INSERT [dbo].[Provincia] OFF
GO
SET IDENTITY_INSERT [dbo].[Stock] ON 
GO
INSERT [dbo].[Stock] ([Id], [IdProducto], [CantIngreso], [FechaIngreso], [CantEgreso], [FechaEgreso], [IdUsuario], [IdComprobante]) VALUES (1, 0, 0, CAST(N'2023-10-30' AS Date), 0, NULL, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[Stock] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 
GO
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [Apellido], [Cuit], [Email], [Clave], [Fecha_alta], [Fecha_baja], [Estado]) VALUES (2, N'Alen', N'Ozcariz', N'20543673230', N'alenozcariz07@gmail.com', N'1234', CAST(N'2023-10-06' AS Date), NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[Ventas] ON 
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (2, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (3, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (4, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (5, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (6, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (7, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (8, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (9, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (10, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (11, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (12, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (13, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (14, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (15, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (16, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (17, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (18, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (19, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (20, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (21, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (22, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (23, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (24, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (25, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (26, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (27, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (28, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (29, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (30, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (31, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (32, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1002, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1003, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1004, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1005, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1006, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1007, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1008, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1009, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1010, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1011, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1012, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1013, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1014, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1015, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1016, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1017, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1018, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1019, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1020, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1021, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1022, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1023, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1024, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1025, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1026, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1027, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1028, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1029, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1030, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1031, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1032, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1033, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1034, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1035, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1036, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1037, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1038, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1039, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1040, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1041, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1042, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1043, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1044, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1045, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1046, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1047, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1048, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1049, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1050, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1051, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1052, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1053, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1054, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1055, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1056, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1057, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1058, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
INSERT [dbo].[Ventas] ([IdVenta], [IdComprobante], [NombreCorto], [IdFormaPago], [Descripcion], [ImporteTotal], [IdCliente], [IdUsuario]) VALUES (1059, 0, NULL, 0, NULL, CAST(0.00 AS Decimal(16, 2)), 0, 0)
GO
SET IDENTITY_INSERT [dbo].[Ventas] OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_Buscar_Pais]    Script Date: 8/11/2023 11:41:41 p. m. ******/
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
