USE [master]
GO
/****** Object:  Database [Plan2024]    Script Date: 4/6/2025 16:24:07 ******/
CREATE DATABASE [Plan2024]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Plan2024', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS01\MSSQL\DATA\Plan2024.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Plan2024_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS01\MSSQL\DATA\Plan2024_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Plan2024] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Plan2024].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Plan2024] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Plan2024] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Plan2024] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Plan2024] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Plan2024] SET ARITHABORT OFF 
GO
ALTER DATABASE [Plan2024] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Plan2024] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Plan2024] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Plan2024] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Plan2024] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Plan2024] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Plan2024] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Plan2024] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Plan2024] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Plan2024] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Plan2024] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Plan2024] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Plan2024] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Plan2024] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Plan2024] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Plan2024] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Plan2024] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Plan2024] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Plan2024] SET  MULTI_USER 
GO
ALTER DATABASE [Plan2024] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Plan2024] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Plan2024] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Plan2024] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Plan2024]
GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumno](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[persona_id] [int] NOT NULL,
	[planestudio_id] [int] NOT NULL,
	[legajo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Area]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Asignatura]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asignatura](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[area_id] [int] NOT NULL,
	[regimen_id] [int] NOT NULL,
	[nombre] [varchar](256) NOT NULL,
	[horassemana] [int] NOT NULL,
	[horascuatrimestre] [int] NOT NULL,
	[creditos] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carrera]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carrera](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[institucion_id] [int] NOT NULL,
	[tipocarrera_id] [int] NOT NULL,
	[modalidadcarrera_id] [int] NOT NULL,
	[nombre] [varchar](256) NOT NULL,
	[duracion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Correlativas]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Correlativas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[asignatura_id] [int] NOT NULL,
	[correlativa_id] [int] NOT NULL,
	[tipo_correlativa] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cuatrimestre]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuatrimestre](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numero] [int] NOT NULL,
	[descripcion] [varchar](128) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evaluacion]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evaluacion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipoevaluacion_id] [int] NOT NULL,
	[materiaplan_id] [int] NOT NULL,
	[alumno_id] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[aprobada_sn] [char](1) NOT NULL,
	[promovida_sn] [char](1) NOT NULL,
	[calificacion] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoricoEvaluacion]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoricoEvaluacion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipoevaluacion_id] [int] NOT NULL,
	[alumno_id] [int] NOT NULL,
	[materiaplan_id] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[aprobada_sn] [char](1) NOT NULL,
	[promovida_sn] [char](1) NOT NULL,
	[calificacion] [float] NULL,
	[usuario] [varchar](128) NOT NULL,
	[fechaoperacion] [datetime] NOT NULL,
	[operacion] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Institucion]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Institucion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](256) NOT NULL,
	[domicilio] [varchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MateriasPlan]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MateriasPlan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[plan_id] [int] NOT NULL,
	[asignatura_id] [int] NULL,
	[nivel_id] [int] NOT NULL,
	[cuatrimestre_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModalidadCarrera]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModalidadCarrera](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](128) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nivel]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nivel](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numero] [int] NOT NULL,
	[descripcion] [varchar](128) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[apellido] [varchar](64) NOT NULL,
	[nombre] [varchar](64) NOT NULL,
	[dni] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanEstudio]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanEstudio](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](256) NOT NULL,
	[carrera_id] [int] NOT NULL,
	[fecha_inicio] [datetime] NOT NULL,
	[fecha_fin] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profesor]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profesor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[persona_id] [int] NOT NULL,
	[materiaplan_id] [int] NOT NULL,
	[legajo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Regimen]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Regimen](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoCarrera]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoCarrera](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](128) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoEvaluacion]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoEvaluacion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](128) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vAlumnos]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vAlumnos]
as
select p.apellido, p.nombre, p.dni, a.legajo, pe.nombre as PlanEstudio
from Alumno a 
inner join Persona p 
on p.id = a.persona_id 
inner join PlanEstudio pe 
on pe.id = a.planestudio_id;
GO
/****** Object:  View [dbo].[vCreditosXNivel]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vCreditosXNivel]
as
select n.descripcion as Nivel, sum(a.creditos) as CreditosXNivel, count(*) as 
Materias
from MateriasPlan mp 
inner join Asignatura a 
on a.id = mp.asignatura_id 
inner join Nivel n 
on n.id = mp.nivel_id 
inner join Cuatrimestre c 
on c.id = mp.cuatrimestre_id 
group by n.descripcion;
GO
/****** Object:  View [dbo].[vEstadoAcademico]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vEstadoAcademico]
as
select 
p.apellido as Apellido, 
p.nombre as Nombre, 
p.dni as DNI, 
n.descripcion as Nivel, 
asig.nombre as Materia, 
e.calificacion as Nota 
from Alumno a 
inner join MateriasPlan mp 
on mp.plan_id = a.planestudio_id 
inner join Asignatura asig 
on asig.id = mp.asignatura_id 
inner join Nivel n
on n.id = mp.nivel_id 
inner join Persona p 
on p.id = a.persona_id
left join Evaluacion e 
on e.alumno_id = a.id 
and e.materiaplan_id = mp.id;
GO
/****** Object:  View [dbo].[vEvaluacionesMateria]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create view [dbo].[vEvaluacionesMateria]
	as
	select 
	mp.id as MateriaID,
	a.nombre as Materia, 
	round(avg(e.calificacion),2) as Promedio, 
	min(e.calificacion) as Minimo, 
	max(e.calificacion) as Maximo,
	count(*) as Alumnos
	from Evaluacion e 
	inner join MateriasPlan mp 
	on mp.id = e.materiaplan_id 
	inner join Asignatura a 
	on a.id = mp.asignatura_id 
	group by mp.id, a.nombre;
GO
/****** Object:  View [dbo].[vMateriasXArea]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[vMateriasXArea] as
select 
 a.nombre as Area, 
 count(*) as Materias, 
 sum(m.creditos) as Creditos, 
 sum(m.horassemana) as HorasXSemana,
 avg(m.horascuatrimestre) as PromedioHoras
from Area a
inner join Asignatura m 
 on m.area_id = a.id
group by a.nombre;
GO
/****** Object:  View [dbo].[vMateriasXCuatrimestre]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vMateriasXCuatrimestre]
as
select n.descripcion as Nivel, c.descripcion as Cuatrimestre, count(*) as 
MateriasXCuatrimestre
from MateriasPlan mp 
inner join Asignatura a 
on a.id = mp.asignatura_id 
inner join Nivel n 
on n.id = mp.nivel_id 
inner join Cuatrimestre c 
on c.id = mp.cuatrimestre_id 
group by n.descripcion, c.descripcion;
GO
/****** Object:  View [dbo].[vMateriasXNivel]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vMateriasXNivel]
as
select n.descripcion as Nivel, count(*) as MateriasXNivel
from MateriasPlan mp 
inner join Asignatura a 
on a.id = mp.asignatura_id 
inner join Nivel n 
on n.id = mp.nivel_id 
group by n.descripcion;
GO
/****** Object:  View [dbo].[vPromedios]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vPromedios]
as
select 
p.apellido as Apellido, 
p.nombre as Nombre, 
p.dni as DNI,
round(avg(calificacion),2) as Promedio
from Evaluacion e 
inner join Alumno a 
on a.id = e.alumno_id 
inner join Persona p 
on p.id = a.persona_id 
group by p.apellido, p.nombre, p.dni;
GO
SET IDENTITY_INSERT [dbo].[Alumno] ON 

INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (1, 51, 1, 0)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (2, 22, 1, 31609644)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (3, 30, 1, 34452097)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (4, 49, 1, 34752679)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (5, 50, 1, 35221396)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (6, 12, 1, 35404199)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (7, 11, 1, 37076152)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (8, 9, 1, 40347408)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (9, 27, 1, 41099895)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (10, 42, 1, 41453317)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (11, 60, 1, 41567993)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (12, 41, 1, 41859543)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (13, 29, 1, 41942657)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (14, 5, 1, 42136261)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (15, 31, 1, 42574517)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (16, 59, 1, 42574577)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (17, 18, 1, 42580309)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (18, 14, 1, 42780089)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (19, 26, 1, 43179666)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (20, 56, 1, 43179687)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (21, 58, 1, 43258761)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (22, 7, 1, 43589383)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (23, 34, 1, 43590356)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (24, 17, 1, 43658432)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (25, 55, 1, 43802522)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (26, 35, 1, 43802529)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (27, 24, 1, 44114756)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (28, 13, 1, 44241242)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (29, 3, 1, 44380799)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (30, 54, 1, 44574756)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (31, 48, 1, 44604957)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (32, 39, 1, 44816850)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (33, 1, 1, 44867259)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (34, 15, 1, 45238938)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (35, 16, 1, 45422900)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (36, 45, 1, 45422909)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (37, 4, 1, 45641180)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (38, 21, 1, 45806889)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (39, 57, 1, 45879984)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (40, 38, 1, 45987822)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (41, 8, 1, 45987825)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (42, 44, 1, 45987888)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (43, 53, 1, 45988474)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (44, 47, 1, 46041088)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (45, 6, 1, 46093128)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (46, 10, 1, 46093256)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (47, 52, 1, 46093313)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (48, 40, 1, 46114413)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (49, 25, 1, 46191595)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (50, 19, 1, 46191665)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (51, 46, 1, 46218480)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (52, 20, 1, 46263777)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (53, 43, 1, 46330415)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (54, 28, 1, 46359298)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (55, 32, 1, 46420610)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (56, 23, 1, 46988698)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (57, 37, 1, 47117878)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (58, 2, 1, 47139322)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (59, 36, 1, 47139358)
INSERT [dbo].[Alumno] ([id], [persona_id], [planestudio_id], [legajo]) VALUES (60, 33, 1, 47163100)
SET IDENTITY_INSERT [dbo].[Alumno] OFF
GO
SET IDENTITY_INSERT [dbo].[Area] ON 

INSERT [dbo].[Area] ([id], [nombre]) VALUES (1, N'Ciencias BÃ¡sicas')
INSERT [dbo].[Area] ([id], [nombre]) VALUES (3, N'Disciplinas Complementarias')
INSERT [dbo].[Area] ([id], [nombre]) VALUES (2, N'Disciplinas TecnolÃ³gicas')
INSERT [dbo].[Area] ([id], [nombre]) VALUES (4, N'IntegraciÃ³n Multidisciplinaria')
SET IDENTITY_INSERT [dbo].[Area] OFF
GO
SET IDENTITY_INSERT [dbo].[Asignatura] ON 

INSERT [dbo].[Asignatura] ([id], [area_id], [regimen_id], [nombre], [horassemana], [horascuatrimestre], [creditos]) VALUES (1, 2, 1, N'Programacion I', 8, 128, 13)
INSERT [dbo].[Asignatura] ([id], [area_id], [regimen_id], [nombre], [horassemana], [horascuatrimestre], [creditos]) VALUES (2, 2, 1, N'Arquitectura y Sistemas Operativos', 4, 64, 5)
INSERT [dbo].[Asignatura] ([id], [area_id], [regimen_id], [nombre], [horassemana], [horascuatrimestre], [creditos]) VALUES (3, 1, 1, N'Matematica', 4, 64, 5)
INSERT [dbo].[Asignatura] ([id], [area_id], [regimen_id], [nombre], [horassemana], [horascuatrimestre], [creditos]) VALUES (4, 3, 1, N'Organizacion empresarial', 4, 64, 5)
INSERT [dbo].[Asignatura] ([id], [area_id], [regimen_id], [nombre], [horassemana], [horascuatrimestre], [creditos]) VALUES (5, 2, 1, N'Programacion II', 8, 128, 13)
INSERT [dbo].[Asignatura] ([id], [area_id], [regimen_id], [nombre], [horassemana], [horascuatrimestre], [creditos]) VALUES (6, 1, 1, N'Probabilidad y Estadastica', 4, 64, 5)
INSERT [dbo].[Asignatura] ([id], [area_id], [regimen_id], [nombre], [horassemana], [horascuatrimestre], [creditos]) VALUES (7, 2, 1, N'Base de Datos I', 4, 64, 5)
INSERT [dbo].[Asignatura] ([id], [area_id], [regimen_id], [nombre], [horassemana], [horascuatrimestre], [creditos]) VALUES (8, 3, 1, N'Ingles I', 4, 64, 5)
INSERT [dbo].[Asignatura] ([id], [area_id], [regimen_id], [nombre], [horassemana], [horascuatrimestre], [creditos]) VALUES (9, 2, 1, N'Programacion III', 8, 128, 13)
INSERT [dbo].[Asignatura] ([id], [area_id], [regimen_id], [nombre], [horassemana], [horascuatrimestre], [creditos]) VALUES (10, 2, 1, N'Base de Datos II', 4, 64, 5)
INSERT [dbo].[Asignatura] ([id], [area_id], [regimen_id], [nombre], [horassemana], [horascuatrimestre], [creditos]) VALUES (11, 2, 1, N'Metodologia de Sistemas I', 4, 64, 5)
INSERT [dbo].[Asignatura] ([id], [area_id], [regimen_id], [nombre], [horassemana], [horascuatrimestre], [creditos]) VALUES (12, 3, 1, N'Ingles II', 4, 64, 5)
INSERT [dbo].[Asignatura] ([id], [area_id], [regimen_id], [nombre], [horassemana], [horascuatrimestre], [creditos]) VALUES (13, 2, 1, N'Programacion IV', 8, 128, 13)
INSERT [dbo].[Asignatura] ([id], [area_id], [regimen_id], [nombre], [horassemana], [horascuatrimestre], [creditos]) VALUES (14, 2, 1, N'Metodologia de  Sistemas II', 4, 64, 5)
INSERT [dbo].[Asignatura] ([id], [area_id], [regimen_id], [nombre], [horassemana], [horascuatrimestre], [creditos]) VALUES (15, 2, 1, N'Introduccion al analisis de datos', 2, 32, 2)
INSERT [dbo].[Asignatura] ([id], [area_id], [regimen_id], [nombre], [horassemana], [horascuatrimestre], [creditos]) VALUES (16, 3, 1, N'Legislacion', 2, 32, 2)
INSERT [dbo].[Asignatura] ([id], [area_id], [regimen_id], [nombre], [horassemana], [horascuatrimestre], [creditos]) VALUES (17, 2, 1, N'Gestion de desarrollo de software', 4, 64, 5)
SET IDENTITY_INSERT [dbo].[Asignatura] OFF
GO
SET IDENTITY_INSERT [dbo].[Carrera] ON 

INSERT [dbo].[Carrera] ([id], [institucion_id], [tipocarrera_id], [modalidadcarrera_id], [nombre], [duracion]) VALUES (1, 1, 1, 1, N'Tecnicatura Universitaria en ProgramaciÃ³n', 2)
SET IDENTITY_INSERT [dbo].[Carrera] OFF
GO
SET IDENTITY_INSERT [dbo].[Correlativas] ON 

INSERT [dbo].[Correlativas] ([id], [asignatura_id], [correlativa_id], [tipo_correlativa]) VALUES (1, 5, 1, N'C')
INSERT [dbo].[Correlativas] ([id], [asignatura_id], [correlativa_id], [tipo_correlativa]) VALUES (2, 5, 2, N'C')
INSERT [dbo].[Correlativas] ([id], [asignatura_id], [correlativa_id], [tipo_correlativa]) VALUES (3, 7, 4, N'C')
INSERT [dbo].[Correlativas] ([id], [asignatura_id], [correlativa_id], [tipo_correlativa]) VALUES (4, 9, 5, N'C')
INSERT [dbo].[Correlativas] ([id], [asignatura_id], [correlativa_id], [tipo_correlativa]) VALUES (5, 9, 7, N'C')
INSERT [dbo].[Correlativas] ([id], [asignatura_id], [correlativa_id], [tipo_correlativa]) VALUES (6, 9, 1, N'A')
INSERT [dbo].[Correlativas] ([id], [asignatura_id], [correlativa_id], [tipo_correlativa]) VALUES (7, 10, 7, N'C')
INSERT [dbo].[Correlativas] ([id], [asignatura_id], [correlativa_id], [tipo_correlativa]) VALUES (8, 10, 8, N'C')
INSERT [dbo].[Correlativas] ([id], [asignatura_id], [correlativa_id], [tipo_correlativa]) VALUES (9, 10, 4, N'A')
INSERT [dbo].[Correlativas] ([id], [asignatura_id], [correlativa_id], [tipo_correlativa]) VALUES (10, 11, 5, N'C')
INSERT [dbo].[Correlativas] ([id], [asignatura_id], [correlativa_id], [tipo_correlativa]) VALUES (11, 11, 7, N'C')
INSERT [dbo].[Correlativas] ([id], [asignatura_id], [correlativa_id], [tipo_correlativa]) VALUES (12, 11, 1, N'A')
INSERT [dbo].[Correlativas] ([id], [asignatura_id], [correlativa_id], [tipo_correlativa]) VALUES (13, 13, 9, N'C')
INSERT [dbo].[Correlativas] ([id], [asignatura_id], [correlativa_id], [tipo_correlativa]) VALUES (14, 13, 10, N'C')
INSERT [dbo].[Correlativas] ([id], [asignatura_id], [correlativa_id], [tipo_correlativa]) VALUES (15, 13, 11, N'C')
INSERT [dbo].[Correlativas] ([id], [asignatura_id], [correlativa_id], [tipo_correlativa]) VALUES (16, 13, 5, N'A')
INSERT [dbo].[Correlativas] ([id], [asignatura_id], [correlativa_id], [tipo_correlativa]) VALUES (17, 15, 10, N'C')
INSERT [dbo].[Correlativas] ([id], [asignatura_id], [correlativa_id], [tipo_correlativa]) VALUES (18, 15, 6, N'A')
INSERT [dbo].[Correlativas] ([id], [asignatura_id], [correlativa_id], [tipo_correlativa]) VALUES (19, 16, 6, N'A')
INSERT [dbo].[Correlativas] ([id], [asignatura_id], [correlativa_id], [tipo_correlativa]) VALUES (20, 16, 7, N'A')
INSERT [dbo].[Correlativas] ([id], [asignatura_id], [correlativa_id], [tipo_correlativa]) VALUES (21, 17, 5, N'C')
INSERT [dbo].[Correlativas] ([id], [asignatura_id], [correlativa_id], [tipo_correlativa]) VALUES (22, 17, 7, N'C')
INSERT [dbo].[Correlativas] ([id], [asignatura_id], [correlativa_id], [tipo_correlativa]) VALUES (23, 17, 10, N'C')
INSERT [dbo].[Correlativas] ([id], [asignatura_id], [correlativa_id], [tipo_correlativa]) VALUES (24, 17, 11, N'C')
SET IDENTITY_INSERT [dbo].[Correlativas] OFF
GO
SET IDENTITY_INSERT [dbo].[Cuatrimestre] ON 

INSERT [dbo].[Cuatrimestre] ([id], [numero], [descripcion]) VALUES (1, 1, N'Primer')
INSERT [dbo].[Cuatrimestre] ([id], [numero], [descripcion]) VALUES (2, 2, N'Segundo')
INSERT [dbo].[Cuatrimestre] ([id], [numero], [descripcion]) VALUES (3, 3, N'Proyecto Final')
SET IDENTITY_INSERT [dbo].[Cuatrimestre] OFF
GO
SET IDENTITY_INSERT [dbo].[Evaluacion] ON 

INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (1, 1, 1, 1, CAST(N'2024-07-03T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (2, 1, 1, 2, CAST(N'2024-07-14T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (3, 1, 1, 3, CAST(N'2024-04-12T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (4, 1, 1, 4, CAST(N'2024-05-25T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (5, 1, 1, 5, CAST(N'2024-04-10T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (6, 1, 1, 6, CAST(N'2024-10-27T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (7, 1, 1, 7, CAST(N'2024-02-01T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (8, 1, 1, 8, CAST(N'2024-09-01T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (9, 1, 1, 9, CAST(N'2024-04-14T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (10, 1, 1, 10, CAST(N'2024-08-23T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (11, 1, 1, 11, CAST(N'2024-05-17T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (12, 1, 1, 12, CAST(N'2024-02-19T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (13, 1, 1, 13, CAST(N'2024-02-05T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (14, 1, 1, 14, CAST(N'2024-06-19T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (15, 1, 1, 15, CAST(N'2024-03-08T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (16, 1, 1, 16, CAST(N'2024-09-27T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (17, 1, 1, 17, CAST(N'2024-04-01T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (18, 1, 1, 18, CAST(N'2024-02-11T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (19, 1, 1, 19, CAST(N'2024-08-21T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (20, 1, 1, 20, CAST(N'2024-07-15T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (21, 1, 1, 21, CAST(N'2024-10-19T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (22, 1, 1, 22, CAST(N'2024-04-06T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (23, 1, 1, 23, CAST(N'2024-01-19T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (24, 1, 1, 24, CAST(N'2024-05-06T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (25, 1, 1, 25, CAST(N'2024-08-01T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (26, 1, 1, 26, CAST(N'2024-06-22T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (27, 1, 1, 27, CAST(N'2024-11-09T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (28, 1, 1, 28, CAST(N'2024-06-06T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (29, 1, 1, 29, CAST(N'2024-07-20T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (30, 1, 1, 30, CAST(N'2024-11-04T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (31, 1, 1, 31, CAST(N'2024-06-25T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (32, 1, 1, 32, CAST(N'2024-05-07T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (33, 1, 1, 33, CAST(N'2024-11-13T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (34, 1, 1, 34, CAST(N'2024-05-15T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (35, 1, 1, 35, CAST(N'2024-08-02T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (36, 1, 1, 36, CAST(N'2024-08-06T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (37, 1, 1, 37, CAST(N'2024-06-16T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (38, 1, 1, 38, CAST(N'2024-03-19T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (39, 1, 1, 39, CAST(N'2024-07-23T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (40, 1, 1, 40, CAST(N'2024-10-22T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (41, 1, 1, 41, CAST(N'2024-02-19T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (42, 1, 1, 42, CAST(N'2024-03-06T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (43, 1, 1, 43, CAST(N'2024-10-09T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (44, 1, 1, 44, CAST(N'2024-11-14T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (45, 1, 1, 45, CAST(N'2024-01-22T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (46, 1, 1, 46, CAST(N'2024-06-06T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (47, 1, 1, 47, CAST(N'2024-01-05T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (48, 1, 1, 48, CAST(N'2024-03-06T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (49, 1, 1, 49, CAST(N'2024-08-27T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (50, 1, 1, 50, CAST(N'2024-09-01T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (51, 1, 1, 51, CAST(N'2024-03-14T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (52, 1, 1, 52, CAST(N'2024-01-19T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (53, 1, 1, 53, CAST(N'2024-11-20T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (54, 1, 1, 54, CAST(N'2024-02-27T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (55, 1, 1, 55, CAST(N'2024-05-07T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (56, 1, 1, 56, CAST(N'2024-09-17T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (57, 1, 1, 57, CAST(N'2024-02-22T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (58, 1, 1, 58, CAST(N'2024-01-06T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (59, 1, 1, 59, CAST(N'2024-02-26T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (60, 1, 1, 60, CAST(N'2024-05-20T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (61, 1, 2, 1, CAST(N'2024-02-02T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (62, 1, 2, 2, CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (63, 1, 2, 3, CAST(N'2024-07-22T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (64, 1, 2, 4, CAST(N'2024-01-15T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (65, 1, 2, 5, CAST(N'2024-03-22T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (66, 1, 2, 6, CAST(N'2024-02-09T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (67, 1, 2, 7, CAST(N'2024-04-04T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (68, 1, 2, 8, CAST(N'2024-10-23T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (69, 1, 2, 9, CAST(N'2024-03-04T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (70, 1, 2, 10, CAST(N'2024-02-21T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (71, 1, 2, 11, CAST(N'2024-05-01T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (72, 1, 2, 12, CAST(N'2024-11-24T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (73, 1, 2, 13, CAST(N'2024-04-16T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (74, 1, 2, 14, CAST(N'2024-08-13T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (75, 1, 2, 15, CAST(N'2024-05-24T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (76, 1, 2, 16, CAST(N'2024-06-14T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (77, 1, 2, 17, CAST(N'2024-02-02T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (78, 1, 2, 18, CAST(N'2024-02-20T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (79, 1, 2, 19, CAST(N'2024-01-01T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (80, 1, 2, 20, CAST(N'2024-01-07T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (81, 1, 2, 21, CAST(N'2024-03-02T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (82, 1, 2, 22, CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (83, 1, 2, 23, CAST(N'2024-09-12T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (84, 1, 2, 24, CAST(N'2024-01-02T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (85, 1, 2, 25, CAST(N'2024-03-18T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (86, 1, 2, 26, CAST(N'2024-10-03T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (87, 1, 2, 27, CAST(N'2024-04-16T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (88, 1, 2, 28, CAST(N'2024-10-18T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (89, 1, 2, 29, CAST(N'2024-04-01T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (90, 1, 2, 30, CAST(N'2024-07-09T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (91, 1, 2, 31, CAST(N'2024-02-09T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (92, 1, 2, 32, CAST(N'2024-11-07T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (93, 1, 2, 33, CAST(N'2024-05-14T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (94, 1, 2, 34, CAST(N'2024-03-03T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (95, 1, 2, 35, CAST(N'2024-09-20T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (96, 1, 2, 36, CAST(N'2024-11-17T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (97, 1, 2, 37, CAST(N'2024-07-02T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (98, 1, 2, 38, CAST(N'2024-09-15T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (99, 1, 2, 39, CAST(N'2024-01-08T00:00:00.000' AS DateTime), N'S', N'N', 9)
GO
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (100, 1, 2, 40, CAST(N'2024-01-04T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (101, 1, 2, 41, CAST(N'2024-01-20T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (102, 1, 2, 42, CAST(N'2024-05-18T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (103, 1, 2, 43, CAST(N'2024-11-15T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (104, 1, 2, 44, CAST(N'2024-09-04T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (105, 1, 2, 45, CAST(N'2024-08-16T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (106, 1, 2, 46, CAST(N'2024-07-26T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (107, 1, 2, 47, CAST(N'2024-05-08T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (108, 1, 2, 48, CAST(N'2024-10-02T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (109, 1, 2, 49, CAST(N'2024-06-02T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (110, 1, 2, 50, CAST(N'2024-03-09T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (111, 1, 2, 51, CAST(N'2024-06-03T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (112, 1, 2, 52, CAST(N'2024-09-24T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (113, 1, 2, 53, CAST(N'2024-01-12T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (114, 1, 2, 54, CAST(N'2024-02-17T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (115, 1, 2, 55, CAST(N'2024-10-18T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (116, 1, 2, 56, CAST(N'2024-02-18T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (117, 1, 2, 57, CAST(N'2024-07-15T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (118, 1, 2, 58, CAST(N'2024-08-25T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (119, 1, 2, 59, CAST(N'2024-07-06T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (120, 1, 2, 60, CAST(N'2024-08-16T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (121, 1, 3, 1, CAST(N'2024-02-26T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (122, 1, 3, 2, CAST(N'2024-09-12T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (123, 1, 3, 3, CAST(N'2024-07-23T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (124, 1, 3, 4, CAST(N'2024-04-17T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (125, 1, 3, 5, CAST(N'2024-10-11T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (126, 1, 3, 6, CAST(N'2024-09-11T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (127, 1, 3, 7, CAST(N'2024-06-03T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (128, 1, 3, 8, CAST(N'2024-10-10T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (129, 1, 3, 9, CAST(N'2024-07-11T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (130, 1, 3, 10, CAST(N'2024-04-11T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (131, 1, 3, 11, CAST(N'2024-06-11T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (132, 1, 3, 12, CAST(N'2024-11-10T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (133, 1, 3, 13, CAST(N'2024-03-11T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (134, 1, 3, 14, CAST(N'2024-05-19T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (135, 1, 3, 15, CAST(N'2024-04-14T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (136, 1, 3, 16, CAST(N'2024-01-24T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (137, 1, 3, 17, CAST(N'2024-06-07T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (138, 1, 3, 18, CAST(N'2024-01-20T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (139, 1, 3, 19, CAST(N'2024-03-09T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (140, 1, 3, 20, CAST(N'2024-05-20T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (141, 1, 3, 21, CAST(N'2024-07-06T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (142, 1, 3, 22, CAST(N'2024-07-10T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (143, 1, 3, 23, CAST(N'2024-09-04T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (144, 1, 3, 24, CAST(N'2024-08-02T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (145, 1, 3, 25, CAST(N'2024-03-03T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (146, 1, 3, 26, CAST(N'2024-11-03T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (147, 1, 3, 27, CAST(N'2024-10-21T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (148, 1, 3, 28, CAST(N'2024-02-20T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (149, 1, 3, 29, CAST(N'2024-03-01T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (150, 1, 3, 30, CAST(N'2024-01-06T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (151, 1, 3, 31, CAST(N'2024-11-21T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (152, 1, 3, 32, CAST(N'2024-09-21T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (153, 1, 3, 33, CAST(N'2024-02-09T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (154, 1, 3, 34, CAST(N'2024-04-21T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (155, 1, 3, 35, CAST(N'2024-06-19T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (156, 1, 3, 36, CAST(N'2024-01-21T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (157, 1, 3, 37, CAST(N'2024-09-01T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (158, 1, 3, 38, CAST(N'2024-07-27T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (159, 1, 3, 39, CAST(N'2024-10-18T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (160, 1, 3, 40, CAST(N'2024-04-11T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (161, 1, 3, 41, CAST(N'2024-07-11T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (162, 1, 3, 42, CAST(N'2024-02-01T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (163, 1, 3, 43, CAST(N'2024-02-19T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (164, 1, 3, 44, CAST(N'2024-10-06T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (165, 1, 3, 45, CAST(N'2024-07-24T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (166, 1, 3, 46, CAST(N'2024-01-27T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (167, 1, 3, 47, CAST(N'2024-02-15T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (168, 1, 3, 48, CAST(N'2024-11-01T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (169, 1, 3, 49, CAST(N'2024-11-01T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (170, 1, 3, 50, CAST(N'2024-09-07T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (171, 1, 3, 51, CAST(N'2024-02-03T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (172, 1, 3, 52, CAST(N'2024-05-05T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (173, 1, 3, 53, CAST(N'2024-04-13T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (174, 1, 3, 54, CAST(N'2024-09-04T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (175, 1, 3, 55, CAST(N'2024-08-27T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (176, 1, 3, 56, CAST(N'2024-02-06T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (177, 1, 3, 57, CAST(N'2024-10-24T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (178, 1, 3, 58, CAST(N'2024-11-04T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (179, 1, 3, 59, CAST(N'2024-05-15T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (180, 1, 3, 60, CAST(N'2024-06-15T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (181, 1, 4, 1, CAST(N'2024-01-25T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (182, 1, 4, 2, CAST(N'2024-05-05T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (183, 1, 4, 3, CAST(N'2024-01-23T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (184, 1, 4, 4, CAST(N'2024-10-10T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (185, 1, 4, 5, CAST(N'2024-05-25T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (186, 1, 4, 6, CAST(N'2024-06-20T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (187, 1, 4, 7, CAST(N'2024-09-13T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (188, 1, 4, 8, CAST(N'2024-02-13T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (189, 1, 4, 9, CAST(N'2024-06-04T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (190, 1, 4, 10, CAST(N'2024-07-04T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (191, 1, 4, 11, CAST(N'2024-09-24T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (192, 1, 4, 12, CAST(N'2024-02-26T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (193, 1, 4, 13, CAST(N'2024-08-21T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (194, 1, 4, 14, CAST(N'2024-03-25T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (195, 1, 4, 15, CAST(N'2024-11-09T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (196, 1, 4, 16, CAST(N'2024-10-12T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (197, 1, 4, 17, CAST(N'2024-08-18T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (198, 1, 4, 18, CAST(N'2024-07-07T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (199, 1, 4, 19, CAST(N'2024-10-10T00:00:00.000' AS DateTime), N'S', N'N', 4)
GO
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (200, 1, 4, 20, CAST(N'2024-10-08T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (201, 1, 4, 21, CAST(N'2024-06-25T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (202, 1, 4, 22, CAST(N'2024-08-01T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (203, 1, 4, 23, CAST(N'2024-04-26T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (204, 1, 4, 24, CAST(N'2024-07-03T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (205, 1, 4, 25, CAST(N'2024-09-16T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (206, 1, 4, 26, CAST(N'2024-01-23T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (207, 1, 4, 27, CAST(N'2024-05-19T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (208, 1, 4, 28, CAST(N'2024-02-11T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (209, 1, 4, 29, CAST(N'2024-04-18T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (210, 1, 4, 30, CAST(N'2024-09-16T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (211, 1, 4, 31, CAST(N'2024-08-05T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (212, 1, 4, 32, CAST(N'2024-03-12T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (213, 1, 4, 33, CAST(N'2024-07-05T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (214, 1, 4, 34, CAST(N'2024-04-11T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (215, 1, 4, 35, CAST(N'2024-06-11T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (216, 1, 4, 36, CAST(N'2024-08-02T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (217, 1, 4, 37, CAST(N'2024-03-08T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (218, 1, 4, 38, CAST(N'2024-11-05T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (219, 1, 4, 39, CAST(N'2024-01-25T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (220, 1, 4, 40, CAST(N'2024-09-12T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (221, 1, 4, 41, CAST(N'2024-11-16T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (222, 1, 4, 42, CAST(N'2024-01-17T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (223, 1, 4, 43, CAST(N'2024-02-15T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (224, 1, 4, 44, CAST(N'2024-09-04T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (225, 1, 4, 45, CAST(N'2024-03-03T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (226, 1, 4, 46, CAST(N'2024-05-11T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (227, 1, 4, 47, CAST(N'2024-05-07T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (228, 1, 4, 48, CAST(N'2024-06-13T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (229, 1, 4, 49, CAST(N'2024-10-04T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (230, 1, 4, 50, CAST(N'2024-06-04T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (231, 1, 4, 51, CAST(N'2024-10-22T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (232, 1, 4, 52, CAST(N'2024-01-06T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (233, 1, 4, 53, CAST(N'2024-02-26T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (234, 1, 4, 54, CAST(N'2024-07-11T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (235, 1, 4, 55, CAST(N'2024-09-11T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (236, 1, 4, 56, CAST(N'2024-08-20T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (237, 1, 4, 57, CAST(N'2024-01-27T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (238, 1, 4, 58, CAST(N'2024-04-02T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (239, 1, 4, 59, CAST(N'2024-11-18T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (240, 1, 4, 60, CAST(N'2024-05-07T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (241, 1, 5, 1, CAST(N'2024-01-03T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (242, 1, 5, 2, CAST(N'2024-07-04T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (243, 1, 5, 3, CAST(N'2024-05-14T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (244, 1, 5, 4, CAST(N'2024-11-12T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (245, 1, 5, 5, CAST(N'2024-11-16T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (246, 1, 5, 6, CAST(N'2024-07-01T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (247, 1, 5, 7, CAST(N'2024-01-12T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (248, 1, 5, 8, CAST(N'2024-09-01T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (249, 1, 5, 9, CAST(N'2024-11-15T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (250, 1, 5, 10, CAST(N'2024-04-04T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (251, 1, 5, 11, CAST(N'2024-09-15T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (252, 1, 5, 12, CAST(N'2024-03-14T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (253, 1, 5, 13, CAST(N'2024-05-06T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (254, 1, 5, 14, CAST(N'2024-09-22T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (255, 1, 5, 15, CAST(N'2024-05-21T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (256, 1, 5, 16, CAST(N'2024-08-08T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (257, 1, 5, 17, CAST(N'2024-10-16T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (258, 1, 5, 18, CAST(N'2024-10-08T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (259, 1, 5, 19, CAST(N'2024-01-25T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (260, 1, 5, 20, CAST(N'2024-02-03T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (261, 1, 5, 21, CAST(N'2024-01-22T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (262, 1, 5, 22, CAST(N'2024-02-20T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (263, 1, 5, 23, CAST(N'2024-11-26T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (264, 1, 5, 24, CAST(N'2024-07-14T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (265, 1, 5, 25, CAST(N'2024-03-20T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (266, 1, 5, 26, CAST(N'2024-02-25T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (267, 1, 5, 27, CAST(N'2024-11-10T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (268, 1, 5, 28, CAST(N'2024-11-25T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (269, 1, 5, 29, CAST(N'2024-10-13T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (270, 1, 5, 30, CAST(N'2024-04-20T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (271, 1, 5, 31, CAST(N'2024-04-10T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (272, 1, 5, 32, CAST(N'2024-02-25T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (273, 1, 5, 33, CAST(N'2024-05-16T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (274, 1, 5, 34, CAST(N'2024-02-27T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (275, 1, 5, 35, CAST(N'2024-05-21T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (276, 1, 5, 36, CAST(N'2024-02-20T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (277, 1, 5, 37, CAST(N'2024-07-02T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (278, 1, 5, 38, CAST(N'2024-05-06T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (279, 1, 5, 39, CAST(N'2024-08-22T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (280, 1, 5, 40, CAST(N'2024-09-14T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (281, 1, 5, 41, CAST(N'2024-07-22T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (282, 1, 5, 42, CAST(N'2024-04-15T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (283, 1, 5, 43, CAST(N'2024-06-18T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (284, 1, 5, 44, CAST(N'2024-05-23T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (285, 1, 5, 45, CAST(N'2024-08-08T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (286, 1, 5, 46, CAST(N'2024-03-19T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (287, 1, 5, 47, CAST(N'2024-02-10T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (288, 1, 5, 48, CAST(N'2024-07-11T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (289, 1, 5, 49, CAST(N'2024-08-22T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (290, 1, 5, 50, CAST(N'2024-04-07T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (291, 1, 5, 51, CAST(N'2024-03-15T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (292, 1, 5, 52, CAST(N'2024-05-09T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (293, 1, 5, 53, CAST(N'2024-08-02T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (294, 1, 5, 54, CAST(N'2024-07-05T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (295, 1, 5, 55, CAST(N'2024-02-22T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (296, 1, 5, 56, CAST(N'2024-05-24T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (297, 1, 5, 57, CAST(N'2024-03-07T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (298, 1, 5, 58, CAST(N'2024-03-19T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (299, 1, 5, 59, CAST(N'2024-04-11T00:00:00.000' AS DateTime), N'S', N'N', 9)
GO
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (300, 1, 5, 60, CAST(N'2024-05-10T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (301, 1, 6, 1, CAST(N'2024-09-12T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (302, 1, 6, 2, CAST(N'2024-06-11T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (303, 1, 6, 3, CAST(N'2024-03-23T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (304, 1, 6, 4, CAST(N'2024-05-25T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (305, 1, 6, 5, CAST(N'2024-04-01T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (306, 1, 6, 6, CAST(N'2024-04-05T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (307, 1, 6, 7, CAST(N'2024-04-24T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (308, 1, 6, 8, CAST(N'2024-11-10T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (309, 1, 6, 9, CAST(N'2024-01-22T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (310, 1, 6, 10, CAST(N'2024-09-12T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (311, 1, 6, 11, CAST(N'2024-08-27T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (312, 1, 6, 12, CAST(N'2024-01-06T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (313, 1, 6, 13, CAST(N'2024-07-13T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (314, 1, 6, 14, CAST(N'2024-10-02T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (315, 1, 6, 15, CAST(N'2024-08-26T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (316, 1, 6, 16, CAST(N'2024-02-09T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (317, 1, 6, 17, CAST(N'2024-03-16T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (318, 1, 6, 18, CAST(N'2024-10-19T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (319, 1, 6, 19, CAST(N'2024-01-07T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (320, 1, 6, 20, CAST(N'2024-02-16T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (321, 1, 6, 21, CAST(N'2024-10-14T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (322, 1, 6, 22, CAST(N'2024-03-09T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (323, 1, 6, 23, CAST(N'2024-02-20T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (324, 1, 6, 24, CAST(N'2024-05-16T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (325, 1, 6, 25, CAST(N'2024-11-17T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (326, 1, 6, 26, CAST(N'2024-05-04T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (327, 1, 6, 27, CAST(N'2024-10-11T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (328, 1, 6, 28, CAST(N'2024-07-06T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (329, 1, 6, 29, CAST(N'2024-07-04T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (330, 1, 6, 30, CAST(N'2024-08-15T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (331, 1, 6, 31, CAST(N'2024-03-25T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (332, 1, 6, 32, CAST(N'2024-10-23T00:00:00.000' AS DateTime), N'S', N'S', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (333, 1, 6, 33, CAST(N'2024-07-16T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (334, 1, 6, 34, CAST(N'2024-11-02T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (335, 1, 6, 35, CAST(N'2024-08-04T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (336, 1, 6, 36, CAST(N'2024-07-14T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (337, 1, 6, 37, CAST(N'2024-10-16T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (338, 1, 6, 38, CAST(N'2024-04-15T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (339, 1, 6, 39, CAST(N'2024-10-04T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (340, 1, 6, 40, CAST(N'2024-10-02T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (341, 1, 6, 41, CAST(N'2024-08-04T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (342, 1, 6, 42, CAST(N'2024-01-02T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (343, 1, 6, 43, CAST(N'2024-05-27T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (344, 1, 6, 44, CAST(N'2024-07-14T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (345, 1, 6, 45, CAST(N'2024-09-17T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (346, 1, 6, 46, CAST(N'2024-01-17T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (347, 1, 6, 47, CAST(N'2024-01-23T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (348, 1, 6, 48, CAST(N'2024-02-12T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (349, 1, 6, 49, CAST(N'2024-03-01T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (350, 1, 6, 50, CAST(N'2024-11-25T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (351, 1, 6, 51, CAST(N'2024-02-21T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (352, 1, 6, 52, CAST(N'2024-06-25T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (353, 1, 6, 53, CAST(N'2024-10-12T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (354, 1, 6, 54, CAST(N'2024-04-25T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (355, 1, 6, 55, CAST(N'2024-02-27T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (356, 1, 6, 56, CAST(N'2024-10-17T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (357, 1, 6, 57, CAST(N'2024-05-11T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (358, 1, 6, 58, CAST(N'2024-07-06T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (359, 1, 6, 59, CAST(N'2024-02-07T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (360, 1, 6, 60, CAST(N'2024-03-02T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (361, 1, 7, 1, CAST(N'2024-05-20T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (362, 1, 7, 2, CAST(N'2024-01-12T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (363, 1, 7, 3, CAST(N'2024-08-11T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (364, 1, 7, 4, CAST(N'2024-11-20T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (365, 1, 7, 5, CAST(N'2024-08-01T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (366, 1, 7, 6, CAST(N'2024-03-26T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (367, 1, 7, 7, CAST(N'2024-11-15T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (368, 1, 7, 8, CAST(N'2024-06-17T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (369, 1, 7, 9, CAST(N'2024-09-16T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (370, 1, 7, 10, CAST(N'2024-01-22T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (371, 1, 7, 11, CAST(N'2024-06-01T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (372, 1, 7, 12, CAST(N'2024-02-04T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (373, 1, 7, 13, CAST(N'2024-07-05T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (374, 1, 7, 14, CAST(N'2024-08-24T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (375, 1, 7, 15, CAST(N'2024-05-14T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (376, 1, 7, 16, CAST(N'2024-07-11T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (377, 1, 7, 17, CAST(N'2024-07-03T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (378, 1, 7, 18, CAST(N'2024-06-15T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (379, 1, 7, 19, CAST(N'2024-09-11T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (380, 1, 7, 20, CAST(N'2024-08-03T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (381, 1, 7, 21, CAST(N'2024-08-08T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (382, 1, 7, 22, CAST(N'2024-07-01T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (383, 1, 7, 23, CAST(N'2024-05-03T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (384, 1, 7, 24, CAST(N'2024-11-02T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (385, 1, 7, 25, CAST(N'2024-06-26T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (386, 1, 7, 26, CAST(N'2024-05-19T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (387, 1, 7, 27, CAST(N'2024-01-08T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (388, 1, 7, 28, CAST(N'2024-05-25T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (389, 1, 7, 29, CAST(N'2024-10-21T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (390, 1, 7, 30, CAST(N'2024-11-11T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (391, 1, 7, 31, CAST(N'2024-09-15T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (392, 1, 7, 32, CAST(N'2024-05-27T00:00:00.000' AS DateTime), N'S', N'S', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (393, 1, 7, 33, CAST(N'2024-06-01T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (394, 1, 7, 34, CAST(N'2024-06-12T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (395, 1, 7, 35, CAST(N'2024-06-05T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (396, 1, 7, 36, CAST(N'2024-06-11T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (397, 1, 7, 37, CAST(N'2024-10-14T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (398, 1, 7, 38, CAST(N'2024-01-10T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (399, 1, 7, 39, CAST(N'2024-01-21T00:00:00.000' AS DateTime), N'S', N'N', 6)
GO
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (400, 1, 7, 40, CAST(N'2024-10-23T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (401, 1, 7, 41, CAST(N'2024-04-15T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (402, 1, 7, 42, CAST(N'2024-07-11T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (403, 1, 7, 43, CAST(N'2024-04-01T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (404, 1, 7, 44, CAST(N'2024-06-10T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (405, 1, 7, 45, CAST(N'2024-06-16T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (406, 1, 7, 46, CAST(N'2024-11-27T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (407, 1, 7, 47, CAST(N'2024-01-26T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (408, 1, 7, 48, CAST(N'2024-10-06T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (409, 1, 7, 49, CAST(N'2024-02-08T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (410, 1, 7, 50, CAST(N'2024-10-13T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (411, 1, 7, 51, CAST(N'2024-11-24T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (412, 1, 7, 52, CAST(N'2024-09-19T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (413, 1, 7, 53, CAST(N'2024-06-07T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (414, 1, 7, 54, CAST(N'2024-10-26T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (415, 1, 7, 55, CAST(N'2024-02-05T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (416, 1, 7, 56, CAST(N'2024-10-09T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (417, 1, 7, 57, CAST(N'2024-05-20T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (418, 1, 7, 58, CAST(N'2024-02-15T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (419, 1, 7, 59, CAST(N'2024-10-24T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (420, 1, 7, 60, CAST(N'2024-01-07T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (421, 1, 8, 1, CAST(N'2024-04-03T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (422, 1, 8, 2, CAST(N'2024-10-25T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (423, 1, 8, 3, CAST(N'2024-05-01T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (424, 1, 8, 4, CAST(N'2024-05-19T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (425, 1, 8, 5, CAST(N'2024-11-15T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (426, 1, 8, 6, CAST(N'2024-09-12T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (427, 1, 8, 7, CAST(N'2024-10-08T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (428, 1, 8, 8, CAST(N'2024-07-03T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (429, 1, 8, 9, CAST(N'2024-07-11T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (430, 1, 8, 10, CAST(N'2024-04-17T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (431, 1, 8, 11, CAST(N'2024-03-07T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (432, 1, 8, 12, CAST(N'2024-05-04T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (433, 1, 8, 13, CAST(N'2024-06-07T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (434, 1, 8, 14, CAST(N'2024-05-04T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (435, 1, 8, 15, CAST(N'2024-10-19T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (436, 1, 8, 16, CAST(N'2024-02-21T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (437, 1, 8, 17, CAST(N'2024-11-09T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (438, 1, 8, 18, CAST(N'2024-04-21T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (439, 1, 8, 19, CAST(N'2024-02-22T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (440, 1, 8, 20, CAST(N'2024-07-17T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (441, 1, 8, 21, CAST(N'2024-06-08T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (442, 1, 8, 22, CAST(N'2024-08-24T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (443, 1, 8, 23, CAST(N'2024-08-01T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (444, 1, 8, 24, CAST(N'2024-07-19T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (445, 1, 8, 25, CAST(N'2024-10-24T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (446, 1, 8, 26, CAST(N'2024-08-16T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (447, 1, 8, 27, CAST(N'2024-06-27T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (448, 1, 8, 28, CAST(N'2024-11-23T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (449, 1, 8, 29, CAST(N'2024-03-15T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (450, 1, 8, 30, CAST(N'2024-09-27T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (451, 1, 8, 31, CAST(N'2024-09-19T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (452, 1, 8, 32, CAST(N'2024-03-18T00:00:00.000' AS DateTime), N'S', N'S', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (453, 1, 8, 33, CAST(N'2024-04-02T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (454, 1, 8, 34, CAST(N'2024-01-15T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (455, 1, 8, 35, CAST(N'2024-05-07T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (456, 1, 8, 36, CAST(N'2024-04-03T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (457, 1, 8, 37, CAST(N'2024-10-23T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (458, 1, 8, 38, CAST(N'2024-09-27T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (459, 1, 8, 39, CAST(N'2024-02-12T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (460, 1, 8, 40, CAST(N'2024-05-25T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (461, 1, 8, 41, CAST(N'2024-06-10T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (462, 1, 8, 42, CAST(N'2024-10-15T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (463, 1, 8, 43, CAST(N'2024-01-16T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (464, 1, 8, 44, CAST(N'2024-04-03T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (465, 1, 8, 45, CAST(N'2024-01-13T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (466, 1, 8, 46, CAST(N'2024-10-02T00:00:00.000' AS DateTime), N'S', N'N', 9)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (467, 1, 8, 47, CAST(N'2024-01-16T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (468, 1, 8, 48, CAST(N'2024-04-04T00:00:00.000' AS DateTime), N'S', N'N', 7)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (469, 1, 8, 49, CAST(N'2024-10-08T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (470, 1, 8, 50, CAST(N'2024-09-15T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (471, 1, 8, 51, CAST(N'2024-11-21T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (472, 1, 8, 52, CAST(N'2024-07-03T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (473, 1, 8, 53, CAST(N'2024-05-07T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (474, 1, 8, 54, CAST(N'2024-06-18T00:00:00.000' AS DateTime), N'S', N'N', 5)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (475, 1, 8, 55, CAST(N'2024-03-15T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (476, 1, 8, 56, CAST(N'2024-04-03T00:00:00.000' AS DateTime), N'S', N'N', 8)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (477, 1, 8, 57, CAST(N'2024-08-03T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (478, 1, 8, 58, CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'S', N'N', 6)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (479, 1, 8, 59, CAST(N'2024-10-06T00:00:00.000' AS DateTime), N'S', N'N', 4)
INSERT [dbo].[Evaluacion] ([id], [tipoevaluacion_id], [materiaplan_id], [alumno_id], [fecha], [aprobada_sn], [promovida_sn], [calificacion]) VALUES (480, 1, 8, 60, CAST(N'2024-07-21T00:00:00.000' AS DateTime), N'S', N'N', 8)
SET IDENTITY_INSERT [dbo].[Evaluacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Institucion] ON 

INSERT [dbo].[Institucion] ([id], [nombre], [domicilio]) VALUES (1, N'UTN Facultad Regional San NicolÃ¡s', N'ColÃ³n 332, San NicolÃ¡s, Buenos Aires (2900)')
SET IDENTITY_INSERT [dbo].[Institucion] OFF
GO
SET IDENTITY_INSERT [dbo].[MateriasPlan] ON 

INSERT [dbo].[MateriasPlan] ([id], [plan_id], [asignatura_id], [nivel_id], [cuatrimestre_id]) VALUES (1, 1, 1, 1, 1)
INSERT [dbo].[MateriasPlan] ([id], [plan_id], [asignatura_id], [nivel_id], [cuatrimestre_id]) VALUES (2, 1, 2, 1, 1)
INSERT [dbo].[MateriasPlan] ([id], [plan_id], [asignatura_id], [nivel_id], [cuatrimestre_id]) VALUES (3, 1, 3, 1, 1)
INSERT [dbo].[MateriasPlan] ([id], [plan_id], [asignatura_id], [nivel_id], [cuatrimestre_id]) VALUES (4, 1, 4, 1, 1)
INSERT [dbo].[MateriasPlan] ([id], [plan_id], [asignatura_id], [nivel_id], [cuatrimestre_id]) VALUES (5, 1, 5, 1, 2)
INSERT [dbo].[MateriasPlan] ([id], [plan_id], [asignatura_id], [nivel_id], [cuatrimestre_id]) VALUES (6, 1, 6, 1, 2)
INSERT [dbo].[MateriasPlan] ([id], [plan_id], [asignatura_id], [nivel_id], [cuatrimestre_id]) VALUES (7, 1, 7, 1, 2)
INSERT [dbo].[MateriasPlan] ([id], [plan_id], [asignatura_id], [nivel_id], [cuatrimestre_id]) VALUES (8, 1, 8, 1, 2)
INSERT [dbo].[MateriasPlan] ([id], [plan_id], [asignatura_id], [nivel_id], [cuatrimestre_id]) VALUES (9, 1, 9, 2, 1)
INSERT [dbo].[MateriasPlan] ([id], [plan_id], [asignatura_id], [nivel_id], [cuatrimestre_id]) VALUES (10, 1, 10, 2, 1)
INSERT [dbo].[MateriasPlan] ([id], [plan_id], [asignatura_id], [nivel_id], [cuatrimestre_id]) VALUES (11, 1, 11, 2, 1)
INSERT [dbo].[MateriasPlan] ([id], [plan_id], [asignatura_id], [nivel_id], [cuatrimestre_id]) VALUES (12, 1, 12, 2, 1)
INSERT [dbo].[MateriasPlan] ([id], [plan_id], [asignatura_id], [nivel_id], [cuatrimestre_id]) VALUES (13, 1, 13, 2, 2)
INSERT [dbo].[MateriasPlan] ([id], [plan_id], [asignatura_id], [nivel_id], [cuatrimestre_id]) VALUES (14, 1, 14, 2, 2)
INSERT [dbo].[MateriasPlan] ([id], [plan_id], [asignatura_id], [nivel_id], [cuatrimestre_id]) VALUES (15, 1, 15, 2, 2)
INSERT [dbo].[MateriasPlan] ([id], [plan_id], [asignatura_id], [nivel_id], [cuatrimestre_id]) VALUES (16, 1, 16, 2, 2)
INSERT [dbo].[MateriasPlan] ([id], [plan_id], [asignatura_id], [nivel_id], [cuatrimestre_id]) VALUES (17, 1, 17, 2, 2)
SET IDENTITY_INSERT [dbo].[MateriasPlan] OFF
GO
SET IDENTITY_INSERT [dbo].[ModalidadCarrera] ON 

INSERT [dbo].[ModalidadCarrera] ([id], [nombre]) VALUES (2, N'A distancia')
INSERT [dbo].[ModalidadCarrera] ([id], [nombre]) VALUES (1, N'Presencial')
SET IDENTITY_INSERT [dbo].[ModalidadCarrera] OFF
GO
SET IDENTITY_INSERT [dbo].[Nivel] ON 

INSERT [dbo].[Nivel] ([id], [numero], [descripcion]) VALUES (1, 1, N'Primer anio')
INSERT [dbo].[Nivel] ([id], [numero], [descripcion]) VALUES (2, 2, N'Segundo AÃ±o')
SET IDENTITY_INSERT [dbo].[Nivel] OFF
GO
SET IDENTITY_INSERT [dbo].[Persona] ON 

INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (1, N'Acosta', N'Fausto', 44867259)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (2, N'Alberoni', N'Azul', 47139322)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (3, N'Albitre', N'Maite', 44380799)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (4, N'Aragon', N'Joaquin', 45641180)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (5, N'Araya', N'Ariana', 42136261)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (6, N'Aroza', N'Aitor Manuel', 46093128)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (7, N'Bellomini', N'Nicolas', 43589383)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (8, N'Bogado', N'Nicolas', 45987825)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (9, N'Bracesco demassi', N'Lautaro matias', 40347408)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (10, N'Bruccilari', N'Valentino', 46093256)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (11, N'Bruchilari', N'Franco nahuel', 37076152)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (12, N'Buron', N'Benjamin', 35404199)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (13, N'Caceres', N'Aaron Nahuel', 44241242)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (14, N'Caraballo', N'Candela', 42780089)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (15, N'Ceriotti', N'Kevin', 45238938)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (16, N'Cicchese', N'Mirko', 45422900)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (17, N'Contreras', N'Martin', 43658432)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (18, N'Correa', N'Constanza', 42580309)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (19, N'Crocetti', N'Ignacio', 46191665)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (20, N'De bosis', N'Santino', 46263777)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (21, N'Delgado Ugarte', N'Mateo', 45806889)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (22, N'Dusso', N'Jorgelina', 31609644)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (23, N'Escobar ', N'Mateo', 46988698)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (24, N'FAZI', N'Franco David', 44114756)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (25, N'Fernandez', N'Tomas', 46191595)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (26, N'Fiorito', N'Greta', 43179666)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (27, N'Gabrielli', N'Belen', 41099895)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (28, N'Garrone', N'Santino', 46359298)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (29, N'Gimenez', N'Ignacio', 41942657)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (30, N'Godoy', N'Daiana', 34452097)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (31, N'Gomez', N'Nicolas', 42574517)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (32, N'Iribarria', N'Valentin', 46420610)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (33, N'Jaworski', N'Martin Jeremias', 47163100)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (34, N'Kern', N'Agustin', 43590356)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (35, N'Lacomba', N'Tomas', 43802529)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (36, N'Ladner', N'Maximo', 47139358)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (37, N'Lali', N'Antonella', 47117878)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (38, N'Lopez', N'Agustin bautista', 45987822)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (39, N'Lucero', N'Valentino', 44816850)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (40, N'Maldonado', N'Tomas', 46114413)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (41, N'Marraccini', N'Daniel', 41859543)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (42, N'Martin', N'Matias', 41453317)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (43, N'Martini', N'Lucas', 46330415)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (44, N'Meynet', N'Esteban', 45987888)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (45, N'Nardone', N'Tiziana', 45422909)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (46, N'Orfei', N'Ignacio', 46218480)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (47, N'Orsetti', N'Dante', 46041088)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (48, N'Passarelli', N'Bianca', 44604957)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (49, N'Peretto', N'Francisco', 34752679)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (50, N'Romani', N'Facundo', 35221396)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (51, N'Sager', N'Jorge', 0)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (52, N'Saldias', N'Josefina', 46093313)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (53, N'Sanchez', N'Melina', 45988474)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (54, N'Spitale', N'Agustin', 44574756)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (55, N'Tello', N'Juan Luis', 43802522)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (56, N'Toro', N'Nicolas', 43179687)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (57, N'Valido', N'Nicolino', 45879984)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (58, N'Vallini', N'Genaro', 43258761)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (59, N'Vazquez', N'Federico', 42574577)
INSERT [dbo].[Persona] ([id], [apellido], [nombre], [dni]) VALUES (60, N'Velozo', N'Joan Sebastian', 41567993)
SET IDENTITY_INSERT [dbo].[Persona] OFF
GO
SET IDENTITY_INSERT [dbo].[PlanEstudio] ON 

INSERT [dbo].[PlanEstudio] ([id], [nombre], [carrera_id], [fecha_inicio], [fecha_fin]) VALUES (1, N'Nuevo Plan 2018', 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[PlanEstudio] OFF
GO
SET IDENTITY_INSERT [dbo].[Regimen] ON 

INSERT [dbo].[Regimen] ([id], [nombre]) VALUES (1, N'Anual')
INSERT [dbo].[Regimen] ([id], [nombre]) VALUES (2, N'Cuatrimestral')
INSERT [dbo].[Regimen] ([id], [nombre]) VALUES (3, N'Proyecto Final')
SET IDENTITY_INSERT [dbo].[Regimen] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoCarrera] ON 

INSERT [dbo].[TipoCarrera] ([id], [nombre]) VALUES (3, N'FINAL')
INSERT [dbo].[TipoCarrera] ([id], [nombre]) VALUES (2, N'Ingenieria')
INSERT [dbo].[TipoCarrera] ([id], [nombre]) VALUES (1, N'Tecnicatura Universitaria')
SET IDENTITY_INSERT [dbo].[TipoCarrera] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoEvaluacion] ON 

INSERT [dbo].[TipoEvaluacion] ([id], [nombre]) VALUES (1, N'Final')
INSERT [dbo].[TipoEvaluacion] ([id], [nombre]) VALUES (2, N'Parcial')
INSERT [dbo].[TipoEvaluacion] ([id], [nombre]) VALUES (3, N'Trabajo Practico')
SET IDENTITY_INSERT [dbo].[TipoEvaluacion] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Area__72AFBCC6BB27D2A4]    Script Date: 4/6/2025 16:24:07 ******/
ALTER TABLE [dbo].[Area] ADD UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Area__72AFBCC6D7CD172A]    Script Date: 4/6/2025 16:24:07 ******/
ALTER TABLE [dbo].[Area] ADD UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Carrera__72AFBCC6D6A6994D]    Script Date: 4/6/2025 16:24:07 ******/
ALTER TABLE [dbo].[Carrera] ADD UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Carrera__72AFBCC6F240CC5D]    Script Date: 4/6/2025 16:24:07 ******/
ALTER TABLE [dbo].[Carrera] ADD UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [uix_coRrelativas]    Script Date: 4/6/2025 16:24:07 ******/
CREATE UNIQUE NONCLUSTERED INDEX [uix_coRrelativas] ON [dbo].[Correlativas]
(
	[asignatura_id] ASC,
	[correlativa_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Instituc__72AFBCC6611FBF66]    Script Date: 4/6/2025 16:24:07 ******/
ALTER TABLE [dbo].[Institucion] ADD UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Instituc__72AFBCC6F3C526F0]    Script Date: 4/6/2025 16:24:07 ******/
ALTER TABLE [dbo].[Institucion] ADD UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Modalida__72AFBCC64B21C380]    Script Date: 4/6/2025 16:24:07 ******/
ALTER TABLE [dbo].[ModalidadCarrera] ADD UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Modalida__72AFBCC695A67B0A]    Script Date: 4/6/2025 16:24:07 ******/
ALTER TABLE [dbo].[ModalidadCarrera] ADD UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Persona__D87608A74242CC87]    Script Date: 4/6/2025 16:24:07 ******/
ALTER TABLE [dbo].[Persona] ADD UNIQUE NONCLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Persona__D87608A76917C828]    Script Date: 4/6/2025 16:24:07 ******/
ALTER TABLE [dbo].[Persona] ADD UNIQUE NONCLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__PlanEstu__72AFBCC60A767C88]    Script Date: 4/6/2025 16:24:07 ******/
ALTER TABLE [dbo].[PlanEstudio] ADD UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__PlanEstu__72AFBCC683651AD3]    Script Date: 4/6/2025 16:24:07 ******/
ALTER TABLE [dbo].[PlanEstudio] ADD UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Regimen__72AFBCC6AFCD7F28]    Script Date: 4/6/2025 16:24:07 ******/
ALTER TABLE [dbo].[Regimen] ADD UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Regimen__72AFBCC6E88E0B6F]    Script Date: 4/6/2025 16:24:07 ******/
ALTER TABLE [dbo].[Regimen] ADD UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__TipoCarr__72AFBCC61FEEE4DE]    Script Date: 4/6/2025 16:24:07 ******/
ALTER TABLE [dbo].[TipoCarrera] ADD UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__TipoCarr__72AFBCC6A852BEF8]    Script Date: 4/6/2025 16:24:07 ******/
ALTER TABLE [dbo].[TipoCarrera] ADD UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__TipoEval__72AFBCC605C48109]    Script Date: 4/6/2025 16:24:07 ******/
ALTER TABLE [dbo].[TipoEvaluacion] ADD UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__TipoEval__72AFBCC6F2999287]    Script Date: 4/6/2025 16:24:07 ******/
ALTER TABLE [dbo].[TipoEvaluacion] ADD UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HistoricoEvaluacion] ADD  DEFAULT (suser_name()) FOR [usuario]
GO
ALTER TABLE [dbo].[HistoricoEvaluacion] ADD  DEFAULT (getdate()) FOR [fechaoperacion]
GO
ALTER TABLE [dbo].[Alumno]  WITH CHECK ADD FOREIGN KEY([persona_id])
REFERENCES [dbo].[Persona] ([id])
GO
ALTER TABLE [dbo].[Alumno]  WITH CHECK ADD FOREIGN KEY([persona_id])
REFERENCES [dbo].[Persona] ([id])
GO
ALTER TABLE [dbo].[Alumno]  WITH CHECK ADD FOREIGN KEY([planestudio_id])
REFERENCES [dbo].[PlanEstudio] ([id])
GO
ALTER TABLE [dbo].[Alumno]  WITH CHECK ADD FOREIGN KEY([planestudio_id])
REFERENCES [dbo].[PlanEstudio] ([id])
GO
ALTER TABLE [dbo].[Asignatura]  WITH CHECK ADD FOREIGN KEY([area_id])
REFERENCES [dbo].[Area] ([id])
GO
ALTER TABLE [dbo].[Asignatura]  WITH CHECK ADD FOREIGN KEY([area_id])
REFERENCES [dbo].[Area] ([id])
GO
ALTER TABLE [dbo].[Asignatura]  WITH CHECK ADD FOREIGN KEY([regimen_id])
REFERENCES [dbo].[Regimen] ([id])
GO
ALTER TABLE [dbo].[Asignatura]  WITH CHECK ADD FOREIGN KEY([regimen_id])
REFERENCES [dbo].[Regimen] ([id])
GO
ALTER TABLE [dbo].[Carrera]  WITH CHECK ADD FOREIGN KEY([institucion_id])
REFERENCES [dbo].[Institucion] ([id])
GO
ALTER TABLE [dbo].[Carrera]  WITH CHECK ADD FOREIGN KEY([institucion_id])
REFERENCES [dbo].[Institucion] ([id])
GO
ALTER TABLE [dbo].[Carrera]  WITH CHECK ADD FOREIGN KEY([modalidadcarrera_id])
REFERENCES [dbo].[ModalidadCarrera] ([id])
GO
ALTER TABLE [dbo].[Carrera]  WITH CHECK ADD FOREIGN KEY([modalidadcarrera_id])
REFERENCES [dbo].[ModalidadCarrera] ([id])
GO
ALTER TABLE [dbo].[Carrera]  WITH CHECK ADD FOREIGN KEY([tipocarrera_id])
REFERENCES [dbo].[TipoCarrera] ([id])
GO
ALTER TABLE [dbo].[Carrera]  WITH CHECK ADD FOREIGN KEY([tipocarrera_id])
REFERENCES [dbo].[TipoCarrera] ([id])
GO
ALTER TABLE [dbo].[Correlativas]  WITH CHECK ADD FOREIGN KEY([asignatura_id])
REFERENCES [dbo].[Asignatura] ([id])
GO
ALTER TABLE [dbo].[Correlativas]  WITH CHECK ADD FOREIGN KEY([asignatura_id])
REFERENCES [dbo].[Asignatura] ([id])
GO
ALTER TABLE [dbo].[Correlativas]  WITH CHECK ADD FOREIGN KEY([correlativa_id])
REFERENCES [dbo].[Asignatura] ([id])
GO
ALTER TABLE [dbo].[Correlativas]  WITH CHECK ADD FOREIGN KEY([correlativa_id])
REFERENCES [dbo].[Asignatura] ([id])
GO
ALTER TABLE [dbo].[Evaluacion]  WITH CHECK ADD FOREIGN KEY([alumno_id])
REFERENCES [dbo].[Alumno] ([id])
GO
ALTER TABLE [dbo].[Evaluacion]  WITH CHECK ADD FOREIGN KEY([materiaplan_id])
REFERENCES [dbo].[MateriasPlan] ([id])
GO
ALTER TABLE [dbo].[Evaluacion]  WITH CHECK ADD FOREIGN KEY([tipoevaluacion_id])
REFERENCES [dbo].[TipoEvaluacion] ([id])
GO
ALTER TABLE [dbo].[HistoricoEvaluacion]  WITH CHECK ADD FOREIGN KEY([alumno_id])
REFERENCES [dbo].[Alumno] ([id])
GO
ALTER TABLE [dbo].[HistoricoEvaluacion]  WITH CHECK ADD FOREIGN KEY([materiaplan_id])
REFERENCES [dbo].[MateriasPlan] ([id])
GO
ALTER TABLE [dbo].[HistoricoEvaluacion]  WITH CHECK ADD FOREIGN KEY([tipoevaluacion_id])
REFERENCES [dbo].[TipoEvaluacion] ([id])
GO
ALTER TABLE [dbo].[MateriasPlan]  WITH CHECK ADD FOREIGN KEY([asignatura_id])
REFERENCES [dbo].[Asignatura] ([id])
GO
ALTER TABLE [dbo].[MateriasPlan]  WITH CHECK ADD FOREIGN KEY([asignatura_id])
REFERENCES [dbo].[Asignatura] ([id])
GO
ALTER TABLE [dbo].[MateriasPlan]  WITH CHECK ADD FOREIGN KEY([cuatrimestre_id])
REFERENCES [dbo].[Cuatrimestre] ([id])
GO
ALTER TABLE [dbo].[MateriasPlan]  WITH CHECK ADD FOREIGN KEY([cuatrimestre_id])
REFERENCES [dbo].[Cuatrimestre] ([id])
GO
ALTER TABLE [dbo].[MateriasPlan]  WITH CHECK ADD FOREIGN KEY([nivel_id])
REFERENCES [dbo].[Nivel] ([id])
GO
ALTER TABLE [dbo].[MateriasPlan]  WITH CHECK ADD FOREIGN KEY([nivel_id])
REFERENCES [dbo].[Nivel] ([id])
GO
ALTER TABLE [dbo].[MateriasPlan]  WITH CHECK ADD FOREIGN KEY([plan_id])
REFERENCES [dbo].[PlanEstudio] ([id])
GO
ALTER TABLE [dbo].[MateriasPlan]  WITH CHECK ADD FOREIGN KEY([plan_id])
REFERENCES [dbo].[PlanEstudio] ([id])
GO
ALTER TABLE [dbo].[PlanEstudio]  WITH CHECK ADD FOREIGN KEY([carrera_id])
REFERENCES [dbo].[Carrera] ([id])
GO
ALTER TABLE [dbo].[PlanEstudio]  WITH CHECK ADD FOREIGN KEY([carrera_id])
REFERENCES [dbo].[Carrera] ([id])
GO
ALTER TABLE [dbo].[Profesor]  WITH CHECK ADD FOREIGN KEY([materiaplan_id])
REFERENCES [dbo].[MateriasPlan] ([id])
GO
ALTER TABLE [dbo].[Profesor]  WITH CHECK ADD FOREIGN KEY([materiaplan_id])
REFERENCES [dbo].[MateriasPlan] ([id])
GO
ALTER TABLE [dbo].[Profesor]  WITH CHECK ADD FOREIGN KEY([persona_id])
REFERENCES [dbo].[Persona] ([id])
GO
ALTER TABLE [dbo].[Profesor]  WITH CHECK ADD FOREIGN KEY([persona_id])
REFERENCES [dbo].[Persona] ([id])
GO
ALTER TABLE [dbo].[Correlativas]  WITH CHECK ADD CHECK  (([tipo_correlativa]='C' OR [tipo_correlativa]='A'))
GO
ALTER TABLE [dbo].[Correlativas]  WITH CHECK ADD CHECK  (([tipo_correlativa]='C' OR [tipo_correlativa]='A'))
GO
ALTER TABLE [dbo].[Correlativas]  WITH CHECK ADD CHECK  (([asignatura_id]<>[correlativa_id]))
GO
ALTER TABLE [dbo].[Correlativas]  WITH CHECK ADD CHECK  (([asignatura_id]<>[correlativa_id]))
GO
ALTER TABLE [dbo].[Cuatrimestre]  WITH CHECK ADD CHECK  (([numero]>=(0)))
GO
ALTER TABLE [dbo].[Cuatrimestre]  WITH CHECK ADD CHECK  (([numero]>=(0)))
GO
ALTER TABLE [dbo].[Evaluacion]  WITH CHECK ADD CHECK  (([aprobada_sn]='N' OR [aprobada_sn]='S'))
GO
ALTER TABLE [dbo].[Evaluacion]  WITH CHECK ADD CHECK  (([promovida_sn]='N' OR [promovida_sn]='S'))
GO
ALTER TABLE [dbo].[HistoricoEvaluacion]  WITH CHECK ADD CHECK  (([aprobada_sn]='N' OR [aprobada_sn]='S'))
GO
ALTER TABLE [dbo].[HistoricoEvaluacion]  WITH CHECK ADD CHECK  (([operacion]='D' OR [operacion]='U' OR [operacion]='I'))
GO
ALTER TABLE [dbo].[HistoricoEvaluacion]  WITH CHECK ADD CHECK  (([promovida_sn]='N' OR [promovida_sn]='S'))
GO
ALTER TABLE [dbo].[Nivel]  WITH CHECK ADD CHECK  (([numero]>=(0)))
GO
ALTER TABLE [dbo].[Nivel]  WITH CHECK ADD CHECK  (([numero]>=(0)))
GO
/****** Object:  StoredProcedure [dbo].[ActualizarNotaEvaluacionAlumno32]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: TuNombre
-- Create date: 2025-05-28
-- Description: Actualiza la calificación de evaluaciones para el alumno con ID 39
-- =============================================
CREATE PROCEDURE [dbo].[ActualizarNotaEvaluacionAlumno32]
	@EvaluacionID INT,
	@NuevaCalificacion FLOAT,
	@AprobadaSN CHAR(1) = NULL,
	@PromovidaSN CHAR(1) = NULL
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE Evaluacion
	SET 
		calificacion = @NuevaCalificacion,
		aprobada_sn = ISNULL(@AprobadaSN, aprobada_sn),
		promovida_sn = ISNULL(@PromovidaSN, promovida_sn)
	WHERE 
		id = @EvaluacionID AND alumno_id = 32;
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarNotaEvaluacionAlumno39]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: TuNombre
-- Create date: 2025-05-28
-- Description: Actualiza la calificación de evaluaciones para el alumno con ID 39
-- =============================================
CREATE PROCEDURE [dbo].[ActualizarNotaEvaluacionAlumno39]
	@EvaluacionID INT,
	@NuevaCalificacion FLOAT,
	@AprobadaSN CHAR(1) = NULL,
	@PromovidaSN CHAR(1) = NULL
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE Evaluacion
	SET 
		calificacion = @NuevaCalificacion,
		aprobada_sn = ISNULL(@AprobadaSN, aprobada_sn),
		promovida_sn = ISNULL(@PromovidaSN, promovida_sn)
	WHERE 
		id = @EvaluacionID AND alumno_id = 39;
END
GO
/****** Object:  StoredProcedure [dbo].[D_Alumno]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[D_Alumno]	@ID INTEGERASBEGIN	BEGIN TRY		DELETE FROM Alumno WHERE 
ID = @ID	END TRY	BEGIN CATCH		EXECUTE GetErrorInfo	END CATCHEND;
GO
/****** Object:  StoredProcedure [dbo].[D_Area]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[D_Area]	@ID INTEGERASBEGIN	BEGIN TRY		DELETE FROM Area WHERE 
ID = @ID	END TRY	BEGIN CATCH		EXECUTE GetErrorInfo	END CATCHEND;
GO
/****** Object:  StoredProcedure [dbo].[D_Asignatura]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[D_Asignatura]	@ID INTEGERASBEGIN	BEGIN TRY		DELETE FROM Asignatura WHERE 
ID = @ID	END TRY	BEGIN CATCH		EXECUTE GetErrorInfo	END CATCHEND;
GO
/****** Object:  StoredProcedure [dbo].[D_Carrera]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[D_Carrera]	@ID INTEGERASBEGIN	BEGIN TRY		DELETE FROM Carrera WHERE 
ID = @ID	END TRY	BEGIN CATCH		EXECUTE GetErrorInfo	END CATCHEND;
GO
/****** Object:  StoredProcedure [dbo].[D_Correlativas]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[D_Correlativas]	@ID INTEGERASBEGIN	BEGIN TRY		DELETE FROM Correlativas WHERE 
ID = @ID	END TRY	BEGIN CATCH		EXECUTE GetErrorInfo	END CATCHEND;
GO
/****** Object:  StoredProcedure [dbo].[D_Cuatrimestre]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[D_Cuatrimestre]	@ID INTEGERASBEGIN	BEGIN TRY		DELETE FROM Cuatrimestre WHERE 
ID = @ID	END TRY	BEGIN CATCH		EXECUTE GetErrorInfo	END CATCHEND;
GO
/****** Object:  StoredProcedure [dbo].[D_Evaluacion]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[D_Evaluacion]	@ID INTEGERASBEGIN	BEGIN TRY		DELETE FROM Evaluacion WHERE 
ID = @ID	END TRY	BEGIN CATCH		EXECUTE GetErrorInfo	END CATCHEND;
GO
/****** Object:  StoredProcedure [dbo].[D_Institucion]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[D_Institucion]	@ID INTEGERASBEGIN	BEGIN TRY		DELETE FROM Institucion WHERE 
ID = @ID	END TRY	BEGIN CATCH		EXECUTE GetErrorInfo	END CATCHEND;
GO
/****** Object:  StoredProcedure [dbo].[D_MateriasPlan]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[D_MateriasPlan]	@ID INTEGERASBEGIN	BEGIN TRY		DELETE FROM MateriasPlan WHERE 
ID = @ID	END TRY	BEGIN CATCH		EXECUTE GetErrorInfo	END CATCHEND;
GO
/****** Object:  StoredProcedure [dbo].[D_ModalidadCarrera]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[D_ModalidadCarrera]	@ID INTEGERASBEGIN	BEGIN TRY		DELETE FROM ModalidadCarrera WHERE 
ID = @ID	END TRY	BEGIN CATCH		EXECUTE GetErrorInfo	END CATCHEND;
GO
/****** Object:  StoredProcedure [dbo].[D_Nivel]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[D_Nivel]	@ID INTEGERASBEGIN	BEGIN TRY		DELETE FROM Nivel WHERE 
ID = @ID	END TRY	BEGIN CATCH		EXECUTE GetErrorInfo	END CATCHEND;
GO
/****** Object:  StoredProcedure [dbo].[D_Persona]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[D_Persona]	@ID INTEGERASBEGIN	BEGIN TRY		DELETE FROM Persona WHERE 
ID = @ID	END TRY	BEGIN CATCH		EXECUTE GetErrorInfo	END CATCHEND;
GO
/****** Object:  StoredProcedure [dbo].[D_PlanEstudio]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[D_PlanEstudio]	@ID INTEGERASBEGIN	BEGIN TRY		DELETE FROM PlanEstudio WHERE 
ID = @ID	END TRY	BEGIN CATCH		EXECUTE GetErrorInfo	END CATCHEND;
GO
/****** Object:  StoredProcedure [dbo].[D_Profesor]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[D_Profesor]	@ID INTEGERASBEGIN	BEGIN TRY		DELETE FROM Profesor WHERE 
ID = @ID	END TRY	BEGIN CATCH		EXECUTE GetErrorInfo	END CATCHEND;
GO
/****** Object:  StoredProcedure [dbo].[D_Regimen]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[D_Regimen]	@ID INTEGERASBEGIN	BEGIN TRY		DELETE FROM Regimen WHERE 
ID = @ID	END TRY	BEGIN CATCH		EXECUTE GetErrorInfo	END CATCHEND;
GO
/****** Object:  StoredProcedure [dbo].[D_TipoCarrera]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[D_TipoCarrera]	@ID INTEGERASBEGIN	BEGIN TRY		DELETE FROM TipoCarrera WHERE 
ID = @ID	END TRY	BEGIN CATCH		EXECUTE GetErrorInfo	END CATCHEND;
GO
/****** Object:  StoredProcedure [dbo].[D_TipoEvaluacion]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[D_TipoEvaluacion]	@ID INTEGERASBEGIN	BEGIN TRY		DELETE FROM TipoEvaluacion WHERE 
ID = @ID	END TRY	BEGIN CATCH		EXECUTE GetErrorInfo	END CATCHEND;
GO
/****** Object:  StoredProcedure [dbo].[gencreatedelete]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[gencreatedelete]
@tab varchar(128)
AS
BEGIN
 DECLARE @SQLTEXT NVARCHAR(1024)
 DECLARE @VALUES NVARCHAR(1024)
 DECLARE @WHERE NVARCHAR(1024)
DECLARE @SQLCMD NVARCHAR(4000)
DECLARE @DROPCMD NVARCHAR(4000)
SET @DROPCMD = CONCAT('IF OBJECT_ID(', CHAR(39), 'D_', @tab, CHAR(39), 
',', CHAR(39), 'P', CHAR(39) , ') IS NOT NULL', CHAR(13))
SET @DROPCMD = CONCAT(@DROPCMD,'BEGIN', CHAR(13))
SET @DROPCMD = CONCAT(@DROPCMD,CHAR(9),'DROP PROCEDURE D_', @tab, ';', 
CHAR(13))
SET @DROPCMD = CONCAT(@DROPCMD,'END', CHAR(13))
PRINT('Borrando Stored Procedure ' + 'D_' + @tab)
EXEC(@DROPCMD)
PRINT('Stored Procedure Borrada')
 SET @SQLCMD = CONCAT('CREATE PROCEDURE D_', @tab, CHAR(13))
 SET @SQLCMD = CONCAT(@SQLCMD, CHAR(9), '@ID INTEGER', CHAR(13))
 SET @SQLCMD = CONCAT(@SQLCMD, 'AS', CHAR(13))
 SET @SQLCMD = CONCAT(@SQLCMD, 'BEGIN', CHAR(13))
 SET @SQLCMD = CONCAT(@SQLCMD, CHAR(9),'BEGIN TRY', CHAR(13))
 SET @SQLCMD = CONCAT(@SQLCMD, CHAR(9),CHAR(9),'DELETE FROM ',@tab, ' WHERE 
ID = @ID', CHAR(13))
 SET @SQLCMD = CONCAT(@SQLCMD, CHAR(9),'END TRY', CHAR(13))
 SET @SQLCMD = CONCAT(@SQLCMD, CHAR(9),'BEGIN CATCH', CHAR(13))
 SET @SQLCMD = CONCAT(@SQLCMD, CHAR(9),CHAR(9),'EXECUTE GetErrorInfo', 
CHAR(13))
 SET @SQLCMD = CONCAT(@SQLCMD, CHAR(9),'END CATCH' , CHAR(13))
SET @SQLCMD = CONCAT(@SQLCMD, 'END;', CHAR(13))
PRINT('Creando Stored Procedure ' + 'D_' + @tab)
EXEC(@SQLCMD)
PRINT('Stored Procedure Creada')
END;

GO
/****** Object:  StoredProcedure [dbo].[gencreateinsert]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[gencreateinsert]
@tab varchar(128)
AS
BEGIN
 DECLARE @SQLTEXT NVARCHAR(1024)
 DECLARE @VALUES NVARCHAR(1024)
 DECLARE @WHERE NVARCHAR(1024)
DECLARE @SQLCMD NVARCHAR(4000)
DECLARE @DROPCMD NVARCHAR(4000)
 DECLARE C_COL CURSOR FOR
 SELECT 
 UPPER(c.name), 
 CASE y.name
 WHEN 'VARCHAR' then 'VARCHAR(' + RTRIM(STR(c.MAX_LENGTH)) + ')'
 WHEN 'CHAR' then 'CHAR(' + LTRIM(STR(c.MAX_LENGTH)) + ')'
 ELSE UPPER(y.name)
 END,
 i.is_primary_key
 FROM sys.tables t
 INNER JOIN sys.columns c
 ON c.object_id = t.object_id
 INNER JOIN sys.types y
 ON y.user_type_id = c.user_type_id
 LEFT JOIN sys.index_columns ic
 on ic.object_id = t.object_id
 and ic.column_id = c.column_id
 LEFT JOIN sys.indexes i
 ON i.object_id = t.object_id
 and i.index_id = ic.index_id
 WHERE t.name = @tab
 DECLARE @COLNAME VARCHAR(128)
 DECLARE @COLTYPE VARCHAR(128)
 DECLARE @ISPK INT
 DECLARE @CNT INTEGER
SET @DROPCMD = CONCAT('IF OBJECT_ID(' , CHAR(39) ,'I_', @tab,CHAR(39), ','
,CHAR(39) ,'P',CHAR(39) ,') IS NOT NULL',CHAR(13))
SET @DROPCMD = CONCAT(@DROPCMD,'BEGIN',CHAR(13))
SET @DROPCMD = CONCAT(@DROPCMD, CHAR(9),'DROP PROCEDURE I_', @tab, ';', 
CHAR(13))
SET @DROPCMD = CONCAT(@DROPCMD,'END',CHAR(13))
PRINT('Borrando Stored Procedure ' + 'I_' + @tab)
EXEC(@DROPCMD)
PRINT('Stored Procedure Borrada')
 SET @SQLCMD = CONCAT('CREATE PROCEDURE I_', @tab, CHAR(13))
 OPEN C_COL
 FETCH C_COL INTO @COLNAME, @COLTYPE, @ISPK
 SET @CNT = 0
 WHILE @@FETCH_STATUS = 0
 BEGIN
 BEGIN
 IF @ISPK = 1
 BEGIN
 IF @CNT = 0
 BEGIN
 SET @SQLCMD = CONCAT(@SQLCMD, CHAR(9), ' @', @COLNAME ,'
', @COLTYPE ,' OUTPUT', CHAR(13))
 SET @CNT = 1
 END
 ELSE
 SET @SQLCMD = CONCAT(@SQLCMD, CHAR(9), ',@', @COLNAME ,'
', @COLTYPE ,' OUTPUT', CHAR(13))
 END
 ELSE
 BEGIN
 IF @CNT = 0
 BEGIN
 SET @SQLCMD = CONCAT(@SQLCMD, CHAR(9),' @',@COLNAME,' ',
@COLTYPE , CHAR(13))
 SET @CNT = 1
 END
 ELSE
 SET @SQLCMD = CONCAT(@SQLCMD, CHAR(9),',@',@COLNAME,' ',
@COLTYPE , CHAR(13))
 END 
 END 
 FETCH C_COL INTO @COLNAME, @COLTYPE, @ISPK
 END
 CLOSE C_COL
 SET @SQLCMD = CONCAT(@SQLCMD,CHAR(13),'AS',CHAR(13),'BEGIN',CHAR(13))
 SET @SQLCMD = CONCAT(@SQLCMD,CHAR(9),'BEGIN TRY',CHAR(13))
 SET @SQLCMD = CONCAT(@SQLCMD,CHAR(9),CHAR(9),'INSERT INTO ',@tab)
 SET @CNT = 0
 OPEN C_COL
 FETCH C_COL INTO @COLNAME, @COLTYPE, @ISPK
 WHILE @@FETCH_STATUS = 0
 BEGIN
 IF @ISPK = 1
 BEGIN
 SET @WHERE = CONCAT(CHAR(9),'WHERE ',UPPER(@COLNAME),' = @', 
@COLNAME)
 END
 ELSE
 IF @CNT = 0
 BEGIN
 SET @SQLTEXT = CONCAT('(',UPPER(@COLNAME))
 SET @VALUES = CONCAT('(@', UPPER(@COLNAME))
 SET @CNT = 1
 END
 ELSE
 BEGIN
 SET @SQLTEXT = CONCAT(@SQLTEXT, ', ',UPPER(@COLNAME))
 SET @VALUES = CONCAT(@VALUES, ', @', UPPER(@COLNAME))
 END
 FETCH C_COL INTO @COLNAME, @COLTYPE, @ISPK
 END
 SET @SQLTEXT = CONCAT(@SQLTEXT, ')', CHAR(13))
 SET @VALUES = CONCAT(@VALUES, ')', CHAR(13))
SET @SQLCMD = CONCAT(@SQLCMD, @SQLTEXT)
 SET @SQLCMD = CONCAT(@SQLCMD,CHAR(9),CHAR(9),'VALUES',@VALUES)
CLOSE C_COL
 DEALLOCATE C_COL
 SET @SQLCMD = CONCAT(@SQLCMD,CHAR(9),CHAR(9),'SET @ID = 
@@IDENTITY',CHAR(13))
 SET @SQLCMD = CONCAT(@SQLCMD,CHAR(9),'END TRY',CHAR(13))
 SET @SQLCMD = CONCAT(@SQLCMD,CHAR(9),'BEGIN CATCH',CHAR(13))
 SET @SQLCMD = CONCAT(@SQLCMD,CHAR(9),CHAR(9),'EXECUTE 
GetErrorInfo',CHAR(13))
 SET @SQLCMD = CONCAT(@SQLCMD,CHAR(9),'END CATCH',CHAR(13))
 SET @SQLCMD = CONCAT(@SQLCMD,'END;', CHAR(13))
PRINT('Creando Stored Procedure ' + 'I_' + @tab)
EXEC(@SQLCMD)
PRINT('Stored Procedure Creada')
END;
GO
/****** Object:  StoredProcedure [dbo].[gencreateupdate]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[gencreateupdate]
@tab varchar(128)
AS
BEGIN
 DECLARE @SQLCMD NVARCHAR(4000)
 DECLARE @DROPCMD NVARCHAR(4000)
 DECLARE @SQLTEXT VARCHAR(1024)
 DECLARE @WHERE VARCHAR(1024)
 DECLARE C_COL CURSOR FOR
 SELECT 
 UPPER(c.name), 
 CASE y.name
 WHEN 'VARCHAR' then 'VARCHAR(' + RTRIM(STR(c.MAX_LENGTH)) + ')'
 WHEN 'CHAR' then 'CHAR(' + LTRIM(STR(c.MAX_LENGTH)) + ')'
 ELSE UPPER(y.name)
 END,
 i.is_primary_key
 FROM sys.tables t
 INNER JOIN sys.columns c
 ON c.object_id = t.object_id
 INNER JOIN sys.types y
 ON y.user_type_id = c.user_type_id
 LEFT JOIN sys.index_columns ic
 on ic.object_id = t.object_id
 and ic.column_id = c.column_id
 LEFT JOIN sys.indexes i
 ON i.object_id = t.object_id
 and i.index_id = ic.index_id
 WHERE t.name = @tab
 DECLARE @COLNAME VARCHAR(128)
 DECLARE @COLTYPE VARCHAR(128)
 DECLARE @ISPK INT
 DECLARE @CNT INTEGER
SET @DROPCMD = CONCAT(@DROPCMD, 'IF OBJECT_ID(',CHAR(39),'U_',@tab, 
CHAR(39), ',', CHAR(39), 'P', CHAR(39) + ') IS NOT NULL', CHAR(13))
SET @DROPCMD = CONCAT(@DROPCMD, 'BEGIN', CHAR(13))
SET @DROPCMD = CONCAT(@DROPCMD, CHAR(9), 'DROP PROCEDURE U_', @tab, 
CHAR(13))
SET @DROPCMD = CONCAT(@DROPCMD, 'END', CHAR(13))
PRINT('Borrando Stored Procedure U_' + @tab)
EXEC(@DROPCMD)
PRINT('Stored Procedure borrada')
 SET @SQLCMD = CONCAT('CREATE PROCEDURE U_',@tab, CHAR(13))
 OPEN C_COL
 FETCH C_COL INTO @COLNAME, @COLTYPE, @ISPK
 SET @CNT = 0
 WHILE @@FETCH_STATUS = 0
 BEGIN
 BEGIN
 IF @CNT = 0
 BEGIN
 SET @SQLCMD = CONCAT(@SQLCMD, CHAR(9), ' @', @COLNAME, ' ', 
@COLTYPE, ' = NULL', CHAR(13))
 SET @CNT = 1
 END
 ELSE
 SET @SQLCMD = CONCAT(@SQLCMD, CHAR(9), ',@', @COLNAME, ' ', 
@COLTYPE, ' = NULL', CHAR(13))
 END 
 FETCH C_COL INTO @COLNAME, @COLTYPE, @ISPK
 END
 CLOSE C_COL
 SET @SQLCMD = CONCAT(@SQLCMD,'AS',CHAR(13))
 SET @SQLCMD = CONCAT(@SQLCMD,'BEGIN',CHAR(13))
 SET @SQLCMD = CONCAT(@SQLCMD,CHAR(9),'BEGIN TRY',CHAR(13))
 SET @SQLCMD = CONCAT(@SQLCMD,CHAR(9),CHAR(9),'UPDATE ', @tab ,' SET ', 
CHAR(13))
 SET @CNT = 0
 OPEN C_COL
 FETCH C_COL INTO @COLNAME, @COLTYPE, @ISPK
 WHILE @@FETCH_STATUS = 0
 BEGIN
 IF @ISPK = 1
 BEGIN
 SET @WHERE = CONCAT('WHERE ' + UPPER(@COLNAME) + ' = @' + 
@COLNAME, CHAR(13))
 END
 ELSE
 IF @CNT = 0
 BEGIN
SET @SQLCMD = 
CONCAT(@SQLCMD,CHAR(9),CHAR(9),@COLNAME, ' = ISNULL(@', @COLNAME, ', ', @COLNAME
,')',CHAR(13))
 SET @CNT = 1
 END
 ELSE
SET @SQLCMD = CONCAT(@SQLCMD,CHAR(9),CHAR(9),',', 
@COLNAME, ' = ISNULL(@', @COLNAME, ', ', @COLNAME ,')',CHAR(13))
 FETCH C_COL INTO @COLNAME, @COLTYPE, @ISPK
 END
SET @SQLCMD = CONCAT(@SQLCMD,CHAR(9),CHAR(9),@WHERE,CHAR(13))
 CLOSE C_COL
 DEALLOCATE C_COL
 SET @SQLCMD = CONCAT(@SQLCMD, CHAR(9),'END TRY', CHAR(13))
 SET @SQLCMD = CONCAT(@SQLCMD,CHAR(9),'BEGIN CATCH',CHAR(13))
 SET @SQLCMD = CONCAT(@SQLCMD,CHAR(9), CHAR(9),'EXECUTE 
GetErrorInfo',CHAR(13))
 SET @SQLCMD = CONCAT(@SQLCMD,CHAR(9),'END CATCH',CHAR(13)) 
 SET @SQLCMD = CONCAT(@SQLCMD,'END;', CHAR(13))
PRINT('Creando Stored Procedure U_' + @tab)
EXEC(@SQLCMD)
PRINT('Stored Procedure Creada')
END;

GO
/****** Object:  StoredProcedure [dbo].[GenJson]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GenJson]
@tab varchar(128),
@id int = NULL
As
Begin
declare @cmd varchar(4000)
declare @cols varchar(1000)
declare ccols cursor for 
select c.column_id, c.name
from sys.tables t
inner join sys.columns c
on c.object_id = t.object_id 
where t.name = @tab
order by c.column_id;
declare @colid int
declare @colname varchar(128)
declare @pos int = 1
open ccols
fetch ccols into @colid, @colname
while @@fetch_status = 0
Begin
if @pos = 1
Begin
set @cols = @colname
set @pos = 2
END 
ELSE 
BEGIN 
set @cols = CONCAT(@cols,', ', @colname) 
END
fetch ccols into @colid, @colname
End
close ccols
deallocate ccols
set @cmd = concat('select json_query((select ', @cols, ' for JSON PATH, 
without_array_wrapper)) as jdata from ', @tab)
if @id is not null
Begin
set @cmd = concat(@cmd, ' where id = ', @id)
End
EXEC(@cmd)
End
GO
/****** Object:  StoredProcedure [dbo].[GenXml]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GenXml]
 @tab VARCHAR(64),
 @id INT = NULL
AS
BEGIN
    DECLARE @xml NVARCHAR(MAX);
    DECLARE @extxml NVARCHAR(MAX);

    DECLARE ccols CURSOR FOR
        SELECT c.column_id AS cid, c.name AS cname, y.name AS ctype
        FROM sys.tables t
        INNER JOIN sys.columns c ON c.object_id = t.object_id
        INNER JOIN sys.types y ON y.system_type_id = c.system_type_id AND y.user_type_id = c.user_type_id
        WHERE t.name = @tab;

    DECLARE @cid INT;
    DECLARE @cname VARCHAR(128);
    DECLARE @ctype VARCHAR(32);

    SET @xml = 'SELECT CONCAT(''' + '<' + LOWER(@tab) + '>' + ''',';

    OPEN ccols;
    FETCH NEXT FROM ccols INTO @cid, @cname, @ctype;
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @xml = @xml + '''<' + @cname + '>''' + ',' + @cname + ',' + '''</' + @cname + '>''' + ',';
        FETCH NEXT FROM ccols INTO @cid, @cname, @ctype;
    END
    CLOSE ccols;
    DEALLOCATE ccols;

    -- Quitar la última coma
    SET @xml = LEFT(@xml, LEN(@xml) - 1);

    SET @xml = @xml + ',''' + '</' + LOWER(@tab) + '>''' + ') FROM ' + QUOTENAME(@tab);

    IF @id IS NOT NULL
    BEGIN
        SET @xml = @xml + ' WHERE ID = ' + CAST(@id AS VARCHAR);
        EXEC(@xml);
    END
    ELSE
    BEGIN
        SET @extxml = 'SELECT ''' + '<lista-' + LOWER(@tab) + '>''' + CHAR(13) +
                      ' UNION ALL ' + CHAR(13) +
                      @xml + CHAR(13) +
                      ' UNION ALL ' + CHAR(13) +
                      'SELECT ''' + '</lista-' + LOWER(@tab) + '>''' + CHAR(13);
        EXEC(@extxml);
    END
END
GO
/****** Object:  StoredProcedure [dbo].[GetErrorInfo]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetErrorInfo]
as
Begin
 SELECT ERROR_NUMBER() AS ErrorNumber,
 ERROR_SEVERITY() AS ErrorSeverity,
 ERROR_STATE() AS ErrorState,
 ERROR_PROCEDURE() AS ErrorProcedure,
 ERROR_LINE() AS ErrorLine,
 ERROR_MESSAGE() AS ErrorMessage;
End;
GO
/****** Object:  StoredProcedure [dbo].[I_Alumno]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[I_Alumno]	 @ID
INT OUTPUT	,@PERSONA_ID INT	,@PLANESTUDIO_ID INT	,@LEGAJO INTASBEGIN	BEGIN TRY		INSERT INTO Alumno(PERSONA_ID, PLANESTUDIO_ID, LEGAJO)		VALUES(@PERSONA_ID, @PLANESTUDIO_ID, @LEGAJO)		SET @ID = 
@@IDENTITY	END TRY	BEGIN CATCH		EXECUTE 
GetErrorInfo	END CATCHEND;
GO
/****** Object:  StoredProcedure [dbo].[I_Asignatura]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[I_Asignatura]	 @ID
INT OUTPUT	,@AREA_ID INT	,@REGIMEN_ID INT	,@NOMBRE VARCHAR(       256)	,@HORASSEMANA INT	,@HORASCUATRIMESTRE INT	,@CREDITOS INTASBEGIN	BEGIN TRY		INSERT INTO Asignatura(AREA_ID, REGIMEN_ID, NOMBRE, HORASSEMANA, HORASCUATRIMESTRE, CREDITOS)		VALUES(@AREA_ID, @REGIMEN_ID, @NOMBRE, @HORASSEMANA, @HORASCUATRIMESTRE, @CREDITOS)		SET @ID = 
@@IDENTITY	END TRY	BEGIN CATCH		EXECUTE 
GetErrorInfo	END CATCHEND;
GO
/****** Object:  StoredProcedure [dbo].[I_Correlativas]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[I_Correlativas]	 @ID
INT OUTPUT	,@ASIGNATURA_ID INT	,@CORRELATIVA_ID INT	,@TIPO_CORRELATIVA CHAR(1)ASBEGIN	BEGIN TRY		INSERT INTO Correlativas(ASIGNATURA_ID, CORRELATIVA_ID, TIPO_CORRELATIVA)		VALUES(@ASIGNATURA_ID, @CORRELATIVA_ID, @TIPO_CORRELATIVA)		SET @ID = 
@@IDENTITY	END TRY	BEGIN CATCH		EXECUTE 
GetErrorInfo	END CATCHEND;
GO
/****** Object:  StoredProcedure [dbo].[I_Cuatrimestre]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[I_Cuatrimestre]	 @ID
INT OUTPUT	,@NUMERO INT	,@DESCRIPCION VARCHAR(       128)ASBEGIN	BEGIN TRY		INSERT INTO Cuatrimestre(NUMERO, DESCRIPCION)		VALUES(@NUMERO, @DESCRIPCION)		SET @ID = 
@@IDENTITY	END TRY	BEGIN CATCH		EXECUTE 
GetErrorInfo	END CATCHEND;
GO
/****** Object:  StoredProcedure [dbo].[I_Evaluacion]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[I_Evaluacion]	 @ID
INT OUTPUT	,@TIPOEVALUACION_ID INT	,@MATERIAPLAN_ID INT	,@FECHA DATETIME	,@APROBADA_SN CHAR(1)	,@CALIFICACION FLOAT	,@ALUMNO_ID INTASBEGIN	BEGIN TRY		INSERT INTO Evaluacion(TIPOEVALUACION_ID, MATERIAPLAN_ID, FECHA, APROBADA_SN, CALIFICACION, ALUMNO_ID)		VALUES(@TIPOEVALUACION_ID, @MATERIAPLAN_ID, @FECHA, @APROBADA_SN, @CALIFICACION, @ALUMNO_ID)		SET @ID = 
@@IDENTITY	END TRY	BEGIN CATCH		EXECUTE 
GetErrorInfo	END CATCHEND;
GO
/****** Object:  StoredProcedure [dbo].[I_MateriasPlan]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[I_MateriasPlan]	 @ID
INT OUTPUT	,@PLAN_ID INT	,@ASIGNATURA_ID INT	,@NIVEL_ID INT	,@CUATRIMESTRE_ID INTASBEGIN	BEGIN TRY		INSERT INTO MateriasPlan(PLAN_ID, ASIGNATURA_ID, NIVEL_ID, CUATRIMESTRE_ID)		VALUES(@PLAN_ID, @ASIGNATURA_ID, @NIVEL_ID, @CUATRIMESTRE_ID)		SET @ID = 
@@IDENTITY	END TRY	BEGIN CATCH		EXECUTE 
GetErrorInfo	END CATCHEND;
GO
/****** Object:  StoredProcedure [dbo].[I_Nivel]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[I_Nivel]	 @ID
INT OUTPUT	,@NUMERO INT	,@DESCRIPCION VARCHAR(       128)ASBEGIN	BEGIN TRY		INSERT INTO Nivel(NUMERO, DESCRIPCION)		VALUES(@NUMERO, @DESCRIPCION)		SET @ID = 
@@IDENTITY	END TRY	BEGIN CATCH		EXECUTE 
GetErrorInfo	END CATCHEND;
GO
/****** Object:  StoredProcedure [dbo].[I_Profesor]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[I_Profesor]	 @ID
INT OUTPUT	,@PERSONA_ID INT	,@MATERIAPLAN_ID INT	,@LEGAJO INTASBEGIN	BEGIN TRY		INSERT INTO Profesor(PERSONA_ID, MATERIAPLAN_ID, LEGAJO)		VALUES(@PERSONA_ID, @MATERIAPLAN_ID, @LEGAJO)		SET @ID = 
@@IDENTITY	END TRY	BEGIN CATCH		EXECUTE 
GetErrorInfo	END CATCHEND;
GO
/****** Object:  StoredProcedure [dbo].[U_Alumno]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[U_Alumno]	 @ID INT = NULL	,@PERSONA_ID INT = NULL	,@PLANESTUDIO_ID INT = NULL	,@LEGAJO INT = NULLASBEGIN	BEGIN TRY		UPDATE Alumno SET 		PERSONA_ID = ISNULL(@PERSONA_ID, PERSONA_ID)		,PLANESTUDIO_ID = ISNULL(@PLANESTUDIO_ID, PLANESTUDIO_ID)		,LEGAJO = ISNULL(@LEGAJO, LEGAJO)		WHERE ID = @ID	END TRY	BEGIN CATCH		EXECUTE 
GetErrorInfo	END CATCHEND;
GO
/****** Object:  StoredProcedure [dbo].[U_Asignatura]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[U_Asignatura]	 @ID INT = NULL	,@AREA_ID INT = NULL	,@REGIMEN_ID INT = NULL	,@NOMBRE VARCHAR(       256) = NULL	,@HORASSEMANA INT = NULL	,@HORASCUATRIMESTRE INT = NULL	,@CREDITOS INT = NULLASBEGIN	BEGIN TRY		UPDATE Asignatura SET 		AREA_ID = ISNULL(@AREA_ID, AREA_ID)		,REGIMEN_ID = ISNULL(@REGIMEN_ID, REGIMEN_ID)		,NOMBRE = ISNULL(@NOMBRE, NOMBRE)		,HORASSEMANA = ISNULL(@HORASSEMANA, HORASSEMANA)		,HORASCUATRIMESTRE = ISNULL(@HORASCUATRIMESTRE, HORASCUATRIMESTRE)		,CREDITOS = ISNULL(@CREDITOS, CREDITOS)		WHERE ID = @ID	END TRY	BEGIN CATCH		EXECUTE 
GetErrorInfo	END CATCHEND;
GO
/****** Object:  StoredProcedure [dbo].[U_Correlativas]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[U_Correlativas]	 @ID INT = NULL	,@ASIGNATURA_ID INT = NULL	,@CORRELATIVA_ID INT = NULL	,@TIPO_CORRELATIVA CHAR(1) = NULLASBEGIN	BEGIN TRY		UPDATE Correlativas SET 		ASIGNATURA_ID = ISNULL(@ASIGNATURA_ID, ASIGNATURA_ID)		,CORRELATIVA_ID = ISNULL(@CORRELATIVA_ID, CORRELATIVA_ID)		,TIPO_CORRELATIVA = ISNULL(@TIPO_CORRELATIVA, TIPO_CORRELATIVA)		WHERE ID = @ID	END TRY	BEGIN CATCH		EXECUTE 
GetErrorInfo	END CATCHEND;
GO
/****** Object:  StoredProcedure [dbo].[U_Cuatrimestre]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[U_Cuatrimestre]	 @ID INT = NULL	,@NUMERO INT = NULL	,@DESCRIPCION VARCHAR(       128) = NULLASBEGIN	BEGIN TRY		UPDATE Cuatrimestre SET 		NUMERO = ISNULL(@NUMERO, NUMERO)		,DESCRIPCION = ISNULL(@DESCRIPCION, DESCRIPCION)		WHERE ID = @ID	END TRY	BEGIN CATCH		EXECUTE 
GetErrorInfo	END CATCHEND;
GO
/****** Object:  StoredProcedure [dbo].[U_Evaluacion]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[U_Evaluacion]	 @ID INT = NULL	,@TIPOEVALUACION_ID INT = NULL	,@MATERIAPLAN_ID INT = NULL	,@FECHA DATETIME = NULL	,@APROBADA_SN CHAR(1) = NULL	,@CALIFICACION FLOAT = NULL	,@ALUMNO_ID INT = NULLASBEGIN	BEGIN TRY		UPDATE Evaluacion SET 		TIPOEVALUACION_ID = ISNULL(@TIPOEVALUACION_ID, TIPOEVALUACION_ID)		,MATERIAPLAN_ID = ISNULL(@MATERIAPLAN_ID, MATERIAPLAN_ID)		,FECHA = ISNULL(@FECHA, FECHA)		,APROBADA_SN = ISNULL(@APROBADA_SN, APROBADA_SN)		,CALIFICACION = ISNULL(@CALIFICACION, CALIFICACION)		,ALUMNO_ID = ISNULL(@ALUMNO_ID, ALUMNO_ID)		WHERE ID = @ID	END TRY	BEGIN CATCH		EXECUTE 
GetErrorInfo	END CATCHEND;
GO
/****** Object:  StoredProcedure [dbo].[U_MateriasPlan]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[U_MateriasPlan]	 @ID INT = NULL	,@PLAN_ID INT = NULL	,@ASIGNATURA_ID INT = NULL	,@NIVEL_ID INT = NULL	,@CUATRIMESTRE_ID INT = NULLASBEGIN	BEGIN TRY		UPDATE MateriasPlan SET 		PLAN_ID = ISNULL(@PLAN_ID, PLAN_ID)		,ASIGNATURA_ID = ISNULL(@ASIGNATURA_ID, ASIGNATURA_ID)		,NIVEL_ID = ISNULL(@NIVEL_ID, NIVEL_ID)		,CUATRIMESTRE_ID = ISNULL(@CUATRIMESTRE_ID, CUATRIMESTRE_ID)		WHERE ID = @ID	END TRY	BEGIN CATCH		EXECUTE 
GetErrorInfo	END CATCHEND;
GO
/****** Object:  StoredProcedure [dbo].[U_Nivel]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[U_Nivel]	 @ID INT = NULL	,@NUMERO INT = NULL	,@DESCRIPCION VARCHAR(       128) = NULLASBEGIN	BEGIN TRY		UPDATE Nivel SET 		NUMERO = ISNULL(@NUMERO, NUMERO)		,DESCRIPCION = ISNULL(@DESCRIPCION, DESCRIPCION)		WHERE ID = @ID	END TRY	BEGIN CATCH		EXECUTE 
GetErrorInfo	END CATCHEND;
GO
/****** Object:  StoredProcedure [dbo].[U_Profesor]    Script Date: 4/6/2025 16:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[U_Profesor]	 @ID INT = NULL	,@PERSONA_ID INT = NULL	,@MATERIAPLAN_ID INT = NULL	,@LEGAJO INT = NULLASBEGIN	BEGIN TRY		UPDATE Profesor SET 		PERSONA_ID = ISNULL(@PERSONA_ID, PERSONA_ID)		,MATERIAPLAN_ID = ISNULL(@MATERIAPLAN_ID, MATERIAPLAN_ID)		,LEGAJO = ISNULL(@LEGAJO, LEGAJO)		WHERE ID = @ID	END TRY	BEGIN CATCH		EXECUTE 
GetErrorInfo	END CATCHEND;
GO
USE [master]
GO
ALTER DATABASE [Plan2024] SET  READ_WRITE 
GO
