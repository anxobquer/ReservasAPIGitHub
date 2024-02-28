USE [master]
GO
/****** Object:  Database [mi_base_de_datos]    Script Date: 2/27/2024 10:09:45 PM ******/
CREATE DATABASE [mi_base_de_datos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mi_base_de_datos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\mi_base_de_datos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'mi_base_de_datos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\mi_base_de_datos_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [mi_base_de_datos] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mi_base_de_datos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mi_base_de_datos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mi_base_de_datos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mi_base_de_datos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mi_base_de_datos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mi_base_de_datos] SET ARITHABORT OFF 
GO
ALTER DATABASE [mi_base_de_datos] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [mi_base_de_datos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mi_base_de_datos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mi_base_de_datos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mi_base_de_datos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mi_base_de_datos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mi_base_de_datos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mi_base_de_datos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mi_base_de_datos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mi_base_de_datos] SET  ENABLE_BROKER 
GO
ALTER DATABASE [mi_base_de_datos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mi_base_de_datos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mi_base_de_datos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mi_base_de_datos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mi_base_de_datos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mi_base_de_datos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mi_base_de_datos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mi_base_de_datos] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [mi_base_de_datos] SET  MULTI_USER 
GO
ALTER DATABASE [mi_base_de_datos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mi_base_de_datos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mi_base_de_datos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mi_base_de_datos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [mi_base_de_datos] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [mi_base_de_datos] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [mi_base_de_datos] SET QUERY_STORE = OFF
GO
USE [mi_base_de_datos]
GO
/****** Object:  User [user_cordova]    Script Date: 2/27/2024 10:09:45 PM ******/
CREATE USER [user_cordova] FOR LOGIN [user_cordova] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [user_cordova]
GO
/****** Object:  Table [dbo].[cli_clientes]    Script Date: 2/27/2024 10:09:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cli_clientes](
	[cli_codigo] [int] NOT NULL,
	[cli_nombres] [varchar](50) NULL,
	[cli_apellidos] [varchar](50) NULL,
	[cli_telefono] [varchar](20) NULL,
	[cli_email] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[cli_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[des_detalle_ser]    Script Date: 2/27/2024 10:09:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[des_detalle_ser](
	[des_codigo] [int] NOT NULL,
	[des_descripcion] [varchar](500) NULL,
	[des_ruta] [varchar](300) NULL,
	[des_principal] [char](2) NULL,
	[des_codser] [int] NOT NULL,
	[des_fecha_creacion] [datetime] NULL,
	[des_ult_modificacion] [datetime] NULL,
 CONSTRAINT [PK__deg_deta__DA273D6547591E14] PRIMARY KEY CLUSTERED 
(
	[des_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mes_menu_sistema]    Script Date: 2/27/2024 10:09:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mes_menu_sistema](
	[mes_codigo] [int] NOT NULL,
	[mes_nombre] [varchar](100) NOT NULL,
	[mes_codmes] [int] NULL,
	[mes_accion] [varchar](100) NULL,
	[mes_controlador] [varchar](100) NULL,
	[mes_icono] [varchar](50) NULL,
	[mes_orden] [int] NOT NULL,
	[mes_estado] [varchar](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[mes_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ser_servicios]    Script Date: 2/27/2024 10:09:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ser_servicios](
	[ser_codigo] [int] NOT NULL,
	[ser_nombre] [varchar](75) NULL,
	[ser_descripcion] [varchar](700) NULL,
	[ser_precio] [decimal](18, 2) NULL,
	[ser_fecha_creacion] [datetime] NULL,
	[ser_ult_modificacion] [datetime] NULL,
 CONSTRAINT [PK__gas_gale__15CED166FEE0E0E2] PRIMARY KEY CLUSTERED 
(
	[ser_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usa_usuarios_api]    Script Date: 2/27/2024 10:09:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usa_usuarios_api](
	[usa_codigo] [int] NOT NULL,
	[usa_usuario] [varchar](50) NULL,
	[usa_pass] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[usa_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[cli_clientes] ([cli_codigo], [cli_nombres], [cli_apellidos], [cli_telefono], [cli_email]) VALUES (13, N'Alexander', N'Ander', N'50396985475', N'testing@gmail.com')
INSERT [dbo].[cli_clientes] ([cli_codigo], [cli_nombres], [cli_apellidos], [cli_telefono], [cli_email]) VALUES (15, N'Juan', N'Castillo', N'50369854785', N'juana@gmail.com')
INSERT [dbo].[cli_clientes] ([cli_codigo], [cli_nombres], [cli_apellidos], [cli_telefono], [cli_email]) VALUES (20, N'Juan', N'Castanio', N'93939', N'tst@dot.com')
INSERT [dbo].[cli_clientes] ([cli_codigo], [cli_nombres], [cli_apellidos], [cli_telefono], [cli_email]) VALUES (29, N'Anderson', N'Acosta', N'999999', N'anderson@gmail.com')
INSERT [dbo].[cli_clientes] ([cli_codigo], [cli_nombres], [cli_apellidos], [cli_telefono], [cli_email]) VALUES (30, N'Diego', N'Dev', N'99900', N'diego@dev,com')
GO
INSERT [dbo].[des_detalle_ser] ([des_codigo], [des_descripcion], [des_ruta], [des_principal], [des_codser], [des_fecha_creacion], [des_ult_modificacion]) VALUES (7, N'', N'ServiciosImagenes/ser_24_4dadf785-2f8e-4425-a532-478e520e49d2.jpg', N'SI', 24, CAST(N'2023-03-24T00:00:00.000' AS DateTime), CAST(N'2023-12-01T09:13:47.967' AS DateTime))
INSERT [dbo].[des_detalle_ser] ([des_codigo], [des_descripcion], [des_ruta], [des_principal], [des_codser], [des_fecha_creacion], [des_ult_modificacion]) VALUES (8, N'', N'ServiciosImagenes/ser_27_d518f4e5-74b9-4074-910c-15a5c040696f.jpg', N'SI', 27, CAST(N'2023-04-01T00:00:00.000' AS DateTime), CAST(N'2023-04-01T21:44:50.810' AS DateTime))
INSERT [dbo].[des_detalle_ser] ([des_codigo], [des_descripcion], [des_ruta], [des_principal], [des_codser], [des_fecha_creacion], [des_ult_modificacion]) VALUES (9, N'', N'ServiciosImagenes/ser_28_8e65469c-ea4a-452b-a084-93aa49035c7d.jpg', N'SI', 28, CAST(N'2023-04-01T00:00:00.000' AS DateTime), CAST(N'2023-04-01T21:44:29.553' AS DateTime))
GO
INSERT [dbo].[mes_menu_sistema] ([mes_codigo], [mes_nombre], [mes_codmes], [mes_accion], [mes_controlador], [mes_icono], [mes_orden], [mes_estado]) VALUES (1, N'Clientes', 0, N'Index', N'Home', NULL, 1, N'A')
INSERT [dbo].[mes_menu_sistema] ([mes_codigo], [mes_nombre], [mes_codmes], [mes_accion], [mes_controlador], [mes_icono], [mes_orden], [mes_estado]) VALUES (2, N'Servicios', 0, N'Index', N'SerServicios', NULL, 2, N'A')
INSERT [dbo].[mes_menu_sistema] ([mes_codigo], [mes_nombre], [mes_codmes], [mes_accion], [mes_controlador], [mes_icono], [mes_orden], [mes_estado]) VALUES (3, N'Reservas', 0, N'#', N'#', NULL, 3, N'A')
INSERT [dbo].[mes_menu_sistema] ([mes_codigo], [mes_nombre], [mes_codmes], [mes_accion], [mes_controlador], [mes_icono], [mes_orden], [mes_estado]) VALUES (4, N'Hacer reservas', 3, N'Index', N'Reservas', NULL, 1, N'A')
GO
INSERT [dbo].[ser_servicios] ([ser_codigo], [ser_nombre], [ser_descripcion], [ser_precio], [ser_fecha_creacion], [ser_ult_modificacion]) VALUES (2, N'fvv', N'fffff', CAST(5.00 AS Decimal(18, 2)), CAST(N'2023-01-25T00:00:00.000' AS DateTime), CAST(N'2023-01-25T00:00:00.000' AS DateTime))
INSERT [dbo].[ser_servicios] ([ser_codigo], [ser_nombre], [ser_descripcion], [ser_precio], [ser_fecha_creacion], [ser_ult_modificacion]) VALUES (3, N'kk', N'ooi', CAST(6.00 AS Decimal(18, 2)), CAST(N'2023-01-25T00:00:00.000' AS DateTime), CAST(N'2023-01-25T00:00:00.000' AS DateTime))
INSERT [dbo].[ser_servicios] ([ser_codigo], [ser_nombre], [ser_descripcion], [ser_precio], [ser_fecha_creacion], [ser_ult_modificacion]) VALUES (4, N'aa', N'd', CAST(2.00 AS Decimal(18, 2)), CAST(N'2023-01-25T00:00:00.000' AS DateTime), CAST(N'2023-01-25T00:00:00.000' AS DateTime))
INSERT [dbo].[ser_servicios] ([ser_codigo], [ser_nombre], [ser_descripcion], [ser_precio], [ser_fecha_creacion], [ser_ult_modificacion]) VALUES (6, N'kdkdk', N'djjdjd3', CAST(4.00 AS Decimal(18, 2)), CAST(N'2023-01-29T00:00:00.000' AS DateTime), CAST(N'2023-01-29T00:00:00.000' AS DateTime))
INSERT [dbo].[ser_servicios] ([ser_codigo], [ser_nombre], [ser_descripcion], [ser_precio], [ser_fecha_creacion], [ser_ult_modificacion]) VALUES (7, N'test portada', N'portada descripcion', CAST(6.00 AS Decimal(18, 2)), CAST(N'2023-02-05T00:00:00.000' AS DateTime), CAST(N'2023-02-05T00:00:00.000' AS DateTime))
INSERT [dbo].[ser_servicios] ([ser_codigo], [ser_nombre], [ser_descripcion], [ser_precio], [ser_fecha_creacion], [ser_ult_modificacion]) VALUES (8, N'nn', N'dd', CAST(4.00 AS Decimal(18, 2)), CAST(N'2023-02-05T00:00:00.000' AS DateTime), CAST(N'2023-02-05T00:00:00.000' AS DateTime))
INSERT [dbo].[ser_servicios] ([ser_codigo], [ser_nombre], [ser_descripcion], [ser_precio], [ser_fecha_creacion], [ser_ult_modificacion]) VALUES (10, N'fff', N'ggg', CAST(4.00 AS Decimal(18, 2)), CAST(N'2023-02-18T00:00:00.000' AS DateTime), CAST(N'2023-02-18T00:00:00.000' AS DateTime))
INSERT [dbo].[ser_servicios] ([ser_codigo], [ser_nombre], [ser_descripcion], [ser_precio], [ser_fecha_creacion], [ser_ult_modificacion]) VALUES (12, N'rrr', N'ttt', CAST(6.00 AS Decimal(18, 2)), CAST(N'2023-02-18T00:00:00.000' AS DateTime), CAST(N'2023-02-18T00:00:00.000' AS DateTime))
INSERT [dbo].[ser_servicios] ([ser_codigo], [ser_nombre], [ser_descripcion], [ser_precio], [ser_fecha_creacion], [ser_ult_modificacion]) VALUES (13, N'corte 4', N'cuatro', CAST(45.00 AS Decimal(18, 2)), CAST(N'2023-02-18T00:00:00.000' AS DateTime), CAST(N'2023-02-18T00:00:00.000' AS DateTime))
INSERT [dbo].[ser_servicios] ([ser_codigo], [ser_nombre], [ser_descripcion], [ser_precio], [ser_fecha_creacion], [ser_ult_modificacion]) VALUES (14, N'cejas 2', N'cejas ', CAST(9.00 AS Decimal(18, 2)), CAST(N'2023-02-18T00:00:00.000' AS DateTime), CAST(N'2023-02-18T00:00:00.000' AS DateTime))
INSERT [dbo].[ser_servicios] ([ser_codigo], [ser_nombre], [ser_descripcion], [ser_precio], [ser_fecha_creacion], [ser_ult_modificacion]) VALUES (15, N'Cejas', N'cejas largas', CAST(3.00 AS Decimal(18, 2)), CAST(N'2023-02-18T00:00:00.000' AS DateTime), CAST(N'2023-02-18T00:00:00.000' AS DateTime))
INSERT [dbo].[ser_servicios] ([ser_codigo], [ser_nombre], [ser_descripcion], [ser_precio], [ser_fecha_creacion], [ser_ult_modificacion]) VALUES (24, N'Masaje', N'Solo, con tu pareja o tus amigos. Simplemente ven y relájate porque tú te lo mereces. ', CAST(75.00 AS Decimal(18, 2)), CAST(N'2023-03-13T00:00:00.000' AS DateTime), CAST(N'2023-12-01T09:13:47.960' AS DateTime))
INSERT [dbo].[ser_servicios] ([ser_codigo], [ser_nombre], [ser_descripcion], [ser_precio], [ser_fecha_creacion], [ser_ult_modificacion]) VALUES (27, N'Corte de cabello para hombres', N'Para ellos también tenemos los mejores estilos.', CAST(19.00 AS Decimal(18, 2)), CAST(N'2023-04-01T00:00:00.000' AS DateTime), CAST(N'2023-04-01T21:44:50.793' AS DateTime))
INSERT [dbo].[ser_servicios] ([ser_codigo], [ser_nombre], [ser_descripcion], [ser_precio], [ser_fecha_creacion], [ser_ult_modificacion]) VALUES (28, N'Numero 1', N'Corte con desnivel, y aplicación doble cero desde la parte del cuello.', CAST(15.00 AS Decimal(18, 2)), CAST(N'2023-04-01T00:00:00.000' AS DateTime), CAST(N'2023-04-01T21:44:29.537' AS DateTime))
GO
INSERT [dbo].[usa_usuarios_api] ([usa_codigo], [usa_usuario], [usa_pass]) VALUES (1, N'admin', N'Admin123@bc')
INSERT [dbo].[usa_usuarios_api] ([usa_codigo], [usa_usuario], [usa_pass]) VALUES (2, N'diego', N'admin')
GO
ALTER TABLE [dbo].[mes_menu_sistema] ADD  DEFAULT ((0)) FOR [mes_orden]
GO
ALTER TABLE [dbo].[des_detalle_ser]  WITH CHECK ADD  CONSTRAINT [FK__deg_detal__deg_c__04E4BC85] FOREIGN KEY([des_codser])
REFERENCES [dbo].[ser_servicios] ([ser_codigo])
GO
ALTER TABLE [dbo].[des_detalle_ser] CHECK CONSTRAINT [FK__deg_detal__deg_c__04E4BC85]
GO
/****** Object:  StoredProcedure [dbo].[dashboard]    Script Date: 2/27/2024 10:09:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[dashboard]
as
begin
	declare @numclientes int, @numservicios int

	select @numclientes =  COUNT(cli_codigo) from cli_clientes
	
	select @numservicios = COUNT(ser_codigo) from ser_servicios

	select @numclientes as numclientes, @numservicios as numservicios
end
GO
/****** Object:  StoredProcedure [dbo].[del_cli_cliente]    Script Date: 2/27/2024 10:09:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Wilman
-- Create date: 06/05/2022
-- Descripción: Elimina datos del cliente
-- Usado en: 
-- =============================================
create proc [dbo].[del_cli_cliente]
	@codigo int
as
begin 
	begin try
		begin transaction
			delete from cli_clientes
			where cli_codigo = @codigo
		commit
		select 1
	end try
	begin catch
		rollback
		select 0
	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[del_ser_servicios]    Script Date: 2/27/2024 10:09:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Elimina información de un servicio
-- Advertencia al eliminar un servicio también se elimina su respectiva galería
CREATE proc [dbo].[del_ser_servicios]
	@codigo int
as
begin 
	begin try
		begin transaction
			-- Primero debemos eliminar toda su galería
			delete from des_detalle_ser where des_codser = @codigo

			delete from ser_servicios where ser_codigo = @codigo
		commit
		select 1 as codigo
	end try
	begin catch
		rollback
		select 0 as codigo
	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[get_ser_img]    Script Date: 2/27/2024 10:09:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[get_ser_img]
	@codigo int
as
select top 1 des_ruta from des_detalle_ser
where des_codser = @codigo
and des_principal = 'SI'
GO
/****** Object:  StoredProcedure [dbo].[ins_cli_cliente]    Script Date: 2/27/2024 10:09:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Wilman
-- Create date: 06/05/2022
-- Descripción: Registrar un nuevo cliente
-- Usado en: 
-- =============================================
CREATE proc [dbo].[ins_cli_cliente]
	@nombres varchar(50),
	@apellidos varchar(50),
	@telefono varchar(20),
	@email varchar(50)
as
begin
	begin try
		begin transaction
			declare @codigo int
			
			select @codigo = isnull(max(cli_codigo), 0) + 1  from cli_clientes

			insert into cli_clientes(cli_codigo, cli_nombres, cli_apellidos, cli_telefono, cli_email)
			values (@codigo, @nombres, @apellidos, @telefono, @email)
			select @codigo
		commit

	end try
	begin catch
		rollback
		select 0
	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[ins_des_detalle_ser]    Script Date: 2/27/2024 10:09:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- registra información de galería los servicios
CREATE proc [dbo].[ins_des_detalle_ser]
	@descripcion varchar(500),
	@ruta varchar(75),
	@codser int,
	@principal char(2)
as
begin
begin try
	begin tran
		declare @codigo int
		select @codigo = isnull(max(des_codigo), 0) + 1 from des_detalle_ser
		insert into des_detalle_ser (des_codigo, des_descripcion, des_ruta, des_principal, des_codser, des_fecha_creacion, des_ult_modificacion)
			values (@codigo, @descripcion, @ruta, @principal, @codser, GETDATE(), GETDATE())
		select @codigo as codigo
	commit
end try

begin catch
	select 0 as codigo
end catch
end

GO
/****** Object:  StoredProcedure [dbo].[ins_ser_servicios]    Script Date: 2/27/2024 10:09:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- registra información de los servicios
create proc [dbo].[ins_ser_servicios]
	@nombre varchar(75),
	@descripcion varchar(700),
	@precio decimal(18,2)
as
begin
begin try
	begin tran
		declare @codigo int
		select @codigo = isnull(max(ser_codigo), 0) + 1 from ser_servicios
		insert into ser_servicios (ser_codigo, ser_nombre, ser_descripcion, ser_precio, ser_fecha_creacion, ser_ult_modificacion)
			values (@codigo, @nombre, @descripcion, @precio, GETDATE(), GETDATE())
		select @codigo as codigo
	commit
end try

begin catch
	select 0 as codigo
end catch
end
GO
/****** Object:  StoredProcedure [dbo].[sel_all_cli_clientes]    Script Date: 2/27/2024 10:09:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Wilman
-- Create date: 06/05/2022
-- Description: Muestra Lista de Clientes
-- Usado en: 
-- =============================================
CREATE proc [dbo].[sel_all_cli_clientes]
as
begin
	select cli_codigo, cli_nombres, cli_apellidos, cli_telefono, cli_email
	from cli_clientes
	order by cli_apellidos
end
GO
/****** Object:  StoredProcedure [dbo].[sel_all_ser_servicios]    Script Date: 2/27/2024 10:09:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sel_all_ser_servicios]
as
begin
	select ser_codigo, ser_nombre, ser_descripcion, isnull(ser_precio, 0) as ser_precio, 
		isnull(des_principal, 'NO') as deg_principal, ISNULL(des_ruta, '') as des_ruta,
		ser_fecha_creacion, ser_ult_modificacion
	from ser_servicios
	left join des_detalle_ser on des_codser = ser_codigo
	order by ser_ult_modificacion desc
end
GO
/****** Object:  StoredProcedure [dbo].[sel_cli_cliente]    Script Date: 2/27/2024 10:09:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Wilman
-- Create date: 06/05/2022
-- Description: Muestra Lista de Clientes
-- Usado en: 
-- =============================================
create proc [dbo].[sel_cli_cliente]
	@codigo int
as
begin
	select cli_codigo, cli_nombres, cli_apellidos, cli_telefono, cli_email
	from cli_clientes
	where cli_codigo = @codigo
end
GO
/****** Object:  StoredProcedure [dbo].[sel_mes_menu_sistema]    Script Date: 2/27/2024 10:09:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sel_mes_menu_sistema]
	@codigo int
as
begin
	select mes_codigo , mes_nombre, mes_codmes, mes_accion, mes_controlador,
		mes_icono, mes_orden, mes_estado,
		(select count(mes_codigo) as hijos 
		from mes_menu_sistema as menu_hijo
		where menu_hijo.mes_codmes = menu_padre.mes_codigo ) as total_sub_menu
	from mes_menu_sistema as menu_padre
	where mes_codmes = @codigo
	and mes_estado = 'A'
	order by mes_orden
end
GO
/****** Object:  StoredProcedure [dbo].[sel_mes_menu_sistema_sub_menu]    Script Date: 2/27/2024 10:09:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sel_mes_menu_sistema_sub_menu]
	@codigo int
as
begin
	select mes_codigo , mes_nombre, mes_codmes, mes_accion, mes_controlador,
		mes_icono, mes_orden, mes_estado,
		(select count(mes_codigo) as hijos 
		from mes_menu_sistema as menu_hijo
		where menu_hijo.mes_codmes = menu_padre.mes_codigo ) as mes_hijos
	from mes_menu_sistema as menu_padre
	where mes_codmes = @codigo
	order by mes_orden
end
GO
/****** Object:  StoredProcedure [dbo].[sel_ser_servicio]    Script Date: 2/27/2024 10:09:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Mostrar detalles de un servicio
CREATE proc [dbo].[sel_ser_servicio]
	@codigo int
as
begin
	select ser_codigo, ser_nombre, ser_descripcion, isnull(ser_precio, 0) as ser_precio, isnull(des_principal, 'No') as deg_principal,
		ser_fecha_creacion, ser_ult_modificacion,
		des_descripcion, des_ult_modificacion, des_ruta
	from ser_servicios
	left join des_detalle_ser on des_codser = ser_codigo
	where ser_codigo = @codigo
end
GO
/****** Object:  StoredProcedure [dbo].[sel_usa_usuarios_api]    Script Date: 2/27/2024 10:09:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sel_usa_usuarios_api]
	@usuario varchar(50),
	@pass varchar(250)
as
begin
	select top 1 usa_codigo, usa_usuario
	from usa_usuarios_api
	where usa_usuario = @usuario
	and usa_pass = @pass
end
GO
/****** Object:  StoredProcedure [dbo].[up_cli_cliente]    Script Date: 2/27/2024 10:09:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Wilman
-- Create date: 06/05/2022
-- Descripción: Actualizar datos del cliente
-- Usado en: 
-- =============================================
create proc [dbo].[up_cli_cliente]
	@nombres varchar(50),
	@apellidos varchar(50),
	@telefono varchar(20),
	@email varchar(50),
	@codigo int
as
begin
	begin try
		begin transaction
			update cli_clientes
			set cli_nombres = @nombres, 
				cli_apellidos = @apellidos, 
				cli_telefono = @telefono, 
				cli_email = @email
			where cli_codigo = @codigo
			select 1
		commit

	end try
	begin catch
		rollback
		select 0
	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[up_des_detalle_des]    Script Date: 2/27/2024 10:09:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- actualiza información de galería los servicios
CREATE proc [dbo].[up_des_detalle_des]
	@descripcion varchar(500),
	@ruta varchar(75),
	@principal char(2),
	@codser int,
	@codigo int
as
begin
begin try
	begin tran
		update des_detalle_ser set 
			des_descripcion = @descripcion,
			des_ruta = @ruta,
			des_principal = @principal,
			des_codser = @codser, 
			des_ult_modificacion = GETDATE()		
		where des_codigo = @codigo
		select 1 as codigo
	commit
end try

begin catch
	select 0 as codigo
end catch
end
GO
/****** Object:  StoredProcedure [dbo].[up_ruta_des_detalle_ser]    Script Date: 2/27/2024 10:09:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- actualizar información de galería de los servicios
CREATE proc [dbo].[up_ruta_des_detalle_ser]
	@ruta varchar(75),
	@codser int
as
begin
begin try
	begin tran
		update des_detalle_ser set
		des_ruta = @ruta, 
		des_ult_modificacion = GETDATE()
		where des_codser = @codser
		and des_principal = 'SI'
		select 1 as codigo
	commit
end try

begin catch
	select 0 as codigo
end catch
end
GO
/****** Object:  StoredProcedure [dbo].[up_ser_servicios]    Script Date: 2/27/2024 10:09:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[up_ser_servicios]
	@nombre varchar(75),
	@descripcion varchar(700),
	@precio decimal(18,2),
	@codigo int
as
begin
begin try
	begin tran
		update ser_servicios set
			ser_nombre = @nombre,
			ser_descripcion = @descripcion,
			ser_precio = @precio,
			ser_ult_modificacion = GETDATE()
		where ser_codigo = @codigo
		select @codigo as codigo
	commit
end try

begin catch
	select 0 as codigo
end catch
end
GO
USE [master]
GO
ALTER DATABASE [mi_base_de_datos] SET  READ_WRITE 
GO
