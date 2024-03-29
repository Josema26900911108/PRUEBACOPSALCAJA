USE [master]
GO

/****** Object:  Database [CARTELERA]    Script Date: 26/01/2024 8:52:39 ******/
CREATE DATABASE [CARTELERA] ON  PRIMARY 
( NAME = N'CARTELERA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQL4\MSSQL\DATA\CARTELERA.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CARTELERA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQL4\MSSQL\DATA\CARTELERA_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CARTELERA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [CARTELERA] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [CARTELERA] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [CARTELERA] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [CARTELERA] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [CARTELERA] SET ARITHABORT OFF 
GO

ALTER DATABASE [CARTELERA] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [CARTELERA] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [CARTELERA] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [CARTELERA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [CARTELERA] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [CARTELERA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [CARTELERA] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [CARTELERA] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [CARTELERA] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [CARTELERA] SET  DISABLE_BROKER 
GO

ALTER DATABASE [CARTELERA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [CARTELERA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [CARTELERA] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [CARTELERA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [CARTELERA] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [CARTELERA] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [CARTELERA] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [CARTELERA] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [CARTELERA] SET  MULTI_USER 
GO

ALTER DATABASE [CARTELERA] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [CARTELERA] SET DB_CHAINING OFF 
GO

ALTER DATABASE [CARTELERA] SET  READ_WRITE 
GO


USE [CARTELERA]
GO

/****** Object:  Table [dbo].[CA_PE_intermedia]    Script Date: 26/01/2024 8:53:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CA_PE_intermedia](
	[PCiD] [int] IDENTITY(1,1) NOT NULL,
	[PfkId] [int] NOT NULL,
	[CAfkId] [int] NOT NULL,
 CONSTRAINT [PK_CA_PE_intermedia] PRIMARY KEY CLUSTERED 
(
	[PCiD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CA_PE_intermedia]  WITH CHECK ADD  CONSTRAINT [FK_CA_PE_intermedia_CA_PE_intermedia] FOREIGN KEY([PCiD])
REFERENCES [dbo].[CA_PE_intermedia] ([PCiD])
GO

ALTER TABLE [dbo].[CA_PE_intermedia] CHECK CONSTRAINT [FK_CA_PE_intermedia_CA_PE_intermedia]
GO

USE [CARTELERA]
GO

/****** Object:  Table [dbo].[CATEGORIAS]    Script Date: 26/01/2024 8:53:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CATEGORIAS](
	[CAId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nchar](100) NOT NULL,
 CONSTRAINT [PK_CATEGORIAS] PRIMARY KEY CLUSTERED 
(
	[CAId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [CARTELERA]
GO

/****** Object:  Table [dbo].[PELICULA]    Script Date: 26/01/2024 8:53:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PELICULA](
	[PiD] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nchar](100) NULL,
	[Descripcion] [text] NULL,
 CONSTRAINT [PK_PELICULA] PRIMARY KEY CLUSTERED 
(
	[PiD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

USE [CARTELERA]
GO

/****** Object:  Table [dbo].[PUNTAJES]    Script Date: 26/01/2024 8:53:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PUNTAJES](
	[Cid] [int] IDENTITY(1,1) NOT NULL,
	[punteo] [int] NOT NULL,
	[fechaIngreso] [date] NOT NULL,
 CONSTRAINT [PK_PUNTAJES] PRIMARY KEY CLUSTERED 
(
	[Cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [CARTELERA]
GO

/****** Object:  StoredProcedure [dbo].[EditarPeliculas]    Script Date: 26/01/2024 8:53:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[EditarPeliculas]
@nombre nvarchar (100),
@descrip text,
@id int
as
update PELICULA set Nombre=@nombre, Descripcion=@descrip where PId=@id
GO

USE [CARTELERA]
GO

/****** Object:  StoredProcedure [dbo].[EliminarPelicula]    Script Date: 26/01/2024 8:54:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[EliminarPelicula]
@idpro int
as
delete from PELICULA where PId=@idpro
GO

USE [CARTELERA]
GO

/****** Object:  StoredProcedure [dbo].[InsetarCategoria]    Script Date: 26/01/2024 8:54:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[InsetarCategoria]
@nombre nvarchar (100)
as
insert into CATEGORIAS values (@nombre)
GO

USE [CARTELERA]
GO

/****** Object:  StoredProcedure [dbo].[InsetarPeliculas]    Script Date: 26/01/2024 8:54:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[InsetarPeliculas]
@nombre nvarchar (100),
@descrip text,
@idcat int
as
insert into [PELICULA] values (@nombre,@descrip);
DECLARE @var1 INT;
SELECT  @var1=@@IDENTITY
insert into C_PE_intermedia values (cast(@var1 as int),1);

select * from C_PE_intermedia

GO

USE [CARTELERA]
GO

/****** Object:  StoredProcedure [dbo].[MostrarCategoria]    Script Date: 26/01/2024 8:54:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[MostrarCategoria]
as
select *from [dbo].[CATEGORIAS]
GO

USE [CARTELERA]
GO

/****** Object:  StoredProcedure [dbo].[MostrarPelicula]    Script Date: 26/01/2024 8:54:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[MostrarPelicula]
as
select *from PELICULA
GO

USE [CARTELERA]
GO

/****** Object:  StoredProcedure [dbo].[MostrarPeliculaNombre]    Script Date: 26/01/2024 8:54:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[MostrarPeliculaNombre]
@nombre nvarchar (100)
as
select *from [dbo].[PELICULA] where Nombre like '%'+@nombre+'%'
GO

USE [CARTELERA]
GO

/****** Object:  StoredProcedure [dbo].[MostrarPELICULAS]    Script Date: 26/01/2024 8:55:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[MostrarPELICULAS]
as
select *from [PELICULA]
GO


