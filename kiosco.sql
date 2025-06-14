USE [master]
GO
/****** Object:  Database [kiosco]    Script Date: 4/6/2025 17:06:53 ******/
CREATE DATABASE [kiosco]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'kiosco', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS01\MSSQL\DATA\kiosco.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'kiosco_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS01\MSSQL\DATA\kiosco_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [kiosco] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [kiosco].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [kiosco] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [kiosco] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [kiosco] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [kiosco] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [kiosco] SET ARITHABORT OFF 
GO
ALTER DATABASE [kiosco] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [kiosco] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [kiosco] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [kiosco] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [kiosco] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [kiosco] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [kiosco] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [kiosco] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [kiosco] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [kiosco] SET  DISABLE_BROKER 
GO
ALTER DATABASE [kiosco] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [kiosco] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [kiosco] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [kiosco] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [kiosco] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [kiosco] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [kiosco] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [kiosco] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [kiosco] SET  MULTI_USER 
GO
ALTER DATABASE [kiosco] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [kiosco] SET DB_CHAINING OFF 
GO
ALTER DATABASE [kiosco] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [kiosco] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [kiosco]
GO
/****** Object:  Table [dbo].[CabeceraTicket]    Script Date: 4/6/2025 17:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CabeceraTicket](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[comercio_id] [int] NULL,
	[fecha] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comercio]    Script Date: 4/6/2025 17:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comercio](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[razonsocial] [varchar](100) NULL,
	[cuit] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compras]    Script Date: 4/6/2025 17:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compras](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[productoproveedor_id] [int] NULL,
	[fecha] [date] NULL,
	[cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoricoPrecio]    Script Date: 4/6/2025 17:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoricoPrecio](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[productoproveedor_id] [int] NULL,
	[preciounitario] [decimal](10, 2) NULL,
	[ganancia] [decimal](10, 2) NULL,
	[fecha] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemTicket]    Script Date: 4/6/2025 17:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemTicket](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cabeceraticket_id] [int] NULL,
	[productoproveedor_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 4/6/2025 17:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipoproducto_id] [int] NULL,
	[nombre] [varchar](100) NULL,
	[nombrektt] [varchar](100) NULL,
	[activo_sn] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductoProveedor]    Script Date: 4/6/2025 17:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductoProveedor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[proveedor_id] [int] NULL,
	[producto_id] [int] NULL,
	[preciounitario] [decimal](10, 2) NULL,
	[ganancia] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 4/6/2025 17:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[razonsocial] [varchar](100) NULL,
	[cuit] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 4/6/2025 17:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[productoproveedor_id] [int] NULL,
	[cantidadminima] [int] NULL,
	[cantidadactual] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoProducto]    Script Date: 4/6/2025 17:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoProducto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CabeceraTicket]  WITH CHECK ADD FOREIGN KEY([comercio_id])
REFERENCES [dbo].[Comercio] ([id])
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD FOREIGN KEY([productoproveedor_id])
REFERENCES [dbo].[ProductoProveedor] ([id])
GO
ALTER TABLE [dbo].[HistoricoPrecio]  WITH CHECK ADD FOREIGN KEY([productoproveedor_id])
REFERENCES [dbo].[ProductoProveedor] ([id])
GO
ALTER TABLE [dbo].[ItemTicket]  WITH CHECK ADD FOREIGN KEY([cabeceraticket_id])
REFERENCES [dbo].[CabeceraTicket] ([id])
GO
ALTER TABLE [dbo].[ItemTicket]  WITH CHECK ADD FOREIGN KEY([productoproveedor_id])
REFERENCES [dbo].[ProductoProveedor] ([id])
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD FOREIGN KEY([tipoproducto_id])
REFERENCES [dbo].[TipoProducto] ([id])
GO
ALTER TABLE [dbo].[ProductoProveedor]  WITH CHECK ADD FOREIGN KEY([producto_id])
REFERENCES [dbo].[Producto] ([id])
GO
ALTER TABLE [dbo].[ProductoProveedor]  WITH CHECK ADD FOREIGN KEY([proveedor_id])
REFERENCES [dbo].[Proveedor] ([id])
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD FOREIGN KEY([productoproveedor_id])
REFERENCES [dbo].[ProductoProveedor] ([id])
GO
/****** Object:  StoredProcedure [dbo].[genCreateDelete]    Script Date: 4/6/2025 17:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[genCreateDelete]
    @id INT
AS
BEGIN
    DELETE FROM Producto
    WHERE id = @id;
END;
GO
/****** Object:  StoredProcedure [dbo].[genCreateInsert]    Script Date: 4/6/2025 17:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[genCreateInsert]
    @tipoproducto_id INT,
    @nombre VARCHAR(100),
    @nombrektt VARCHAR(100),
    @activo_sn BIT
AS
BEGIN
    INSERT INTO Producto (tipoproducto_id, nombre, nombrektt, activo_sn)
    VALUES (@tipoproducto_id, @nombre, @nombrektt, @activo_sn);
    
    SELECT SCOPE_IDENTITY() AS nuevo_id; -- Devuelve el ID insertado
END;
GO
/****** Object:  StoredProcedure [dbo].[genCreateUpdate]    Script Date: 4/6/2025 17:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[genCreateUpdate]
    @id INT,
    @tipoproducto_id INT,
    @nombre VARCHAR(100),
    @nombrektt VARCHAR(100),
    @activo_sn BIT
AS
BEGIN
    UPDATE Producto
    SET tipoproducto_id = @tipoproducto_id,
        nombre = @nombre,
        nombrektt = @nombrektt,
        activo_sn = @activo_sn
    WHERE id = @id;
END;
GO
USE [master]
GO
ALTER DATABASE [kiosco] SET  READ_WRITE 
GO
