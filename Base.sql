USE [master]
GO
/****** Object:  Database [user_05]    Script Date: 25.02.2022 10:20:12 ******/
CREATE DATABASE [user_05]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'user_05', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLWSR\MSSQL\DATA\user_05.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'user_05_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLWSR\MSSQL\DATA\user_05_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [user_05] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [user_05].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [user_05] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [user_05] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [user_05] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [user_05] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [user_05] SET ARITHABORT OFF 
GO
ALTER DATABASE [user_05] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [user_05] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [user_05] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [user_05] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [user_05] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [user_05] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [user_05] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [user_05] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [user_05] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [user_05] SET  DISABLE_BROKER 
GO
ALTER DATABASE [user_05] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [user_05] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [user_05] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [user_05] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [user_05] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [user_05] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [user_05] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [user_05] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [user_05] SET  MULTI_USER 
GO
ALTER DATABASE [user_05] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [user_05] SET DB_CHAINING OFF 
GO
ALTER DATABASE [user_05] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [user_05] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [user_05] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [user_05] SET QUERY_STORE = OFF
GO
USE [user_05]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 25.02.2022 10:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[Name] [varchar](150) NOT NULL,
	[Type] [varchar](25) NULL,
	[Image] [varchar](255) NULL,
	[Price] [money] NULL,
	[Count] [int] NULL,
	[MinCount] [int] NULL,
	[CountinPack] [int] NULL,
	[Unit] [varchar](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 25.02.2022 10:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[Name] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provider]    Script Date: 25.02.2022 10:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider](
	[Name] [varchar](150) NOT NULL,
	[Type] [varchar](10) NULL,
	[INN] [nchar](11) NULL,
	[Rating] [int] NULL,
	[BeginDateInWork] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProviderType]    Script Date: 25.02.2022 10:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProviderType](
	[Name] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 25.02.2022 10:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[Name_material] [varchar](150) NOT NULL,
	[Provider] [varchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Name_material] ASC,
	[Provider] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 25.02.2022 10:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[Name] [varchar](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Гранулы белый 1x2', N'Гранулы', NULL, 28326.0000, 265, 10, 10, N'л')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Гранулы белый 2x1', N'Гранулы', NULL, 49124.0000, 437, 40, 4, N'л')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Гранулы белый 2x2', N'Гранулы', NULL, 11843.0000, 232, 22, 9, N'л')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Гранулы белый 3x2', N'Гранулы', NULL, 36635.0000, 732, 50, 9, N'кг')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Гранулы зеленый 0x2', N'Гранулы', NULL, 46326.0000, 787, 40, 7, N'л')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Гранулы зеленый 0x3', N'Гранулы', NULL, 33037.0000, 937, 31, 10, N'л')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Гранулы зеленый 1x2', N'Гранулы', N'\materials\material_4.jpeg', 36121.0000, 2, 29, 9, N'л')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Гранулы зеленый 1x3', N'Гранулы', NULL, 48576.0000, 603, 5, 8, N'л')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Гранулы зеленый 2x0', N'Гранулы', NULL, 18961.0000, 708, 11, 2, N'л')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Гранулы зеленый 2x3', N'Гранулы', NULL, 19788.0000, 848, 18, 10, N'кг')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Гранулы серый 2x3', N'Гранулы', NULL, 30903.0000, 185, 22, 6, N'кг')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Гранулы серый 3x0', N'Гранулы', NULL, 50093.0000, 705, 34, 9, N'кг')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Гранулы синий 1x0', N'Гранулы', NULL, 19889.0000, 579, 12, 9, N'л')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Гранулы цветной 0x3', N'Гранулы', N'\materials\material_20.jpeg', 16202.0000, 641, 35, 3, N'кг')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Гранулы цветной 1x3', N'Гранулы', N'\materials\material_11.jpeg', 16651.0000, 20, 23, 4, N'кг')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Гранулы цветной 2x0', N'Гранулы', N'\materials\material_21.jpeg', 2670.0000, 309, 15, 9, N'л')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Гранулы цветной 2x1', N'Гранулы', NULL, 33885.0000, 757, 5, 1, N'л')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Гранулы цветной 3x0', N'Гранулы', NULL, 3273.0000, 151, 25, 4, N'л')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Гранулы цветной 3x1', N'Гранулы', N'\materials\material_1.jpeg', 21534.0000, 44, 45, 10, N'кг')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Нарезка белый 0x1', N'Нарезка', NULL, 32370.0000, 368, 16, 10, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Нарезка белый 0x3', N'Нарезка', NULL, 34619.0000, 444, 27, 5, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Нарезка белый 1x0', N'Нарезка', NULL, 16050.0000, 924, 33, 5, N'кг')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Нарезка белый 1x2', N'Нарезка', NULL, 39259.0000, 248, 27, 4, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Нарезка белый 2x2', N'Нарезка', N'\materials\material_26.jpeg', 39945.0000, 614, 7, 7, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Нарезка белый 3x1', N'Нарезка', NULL, 27374.0000, 439, 50, 8, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Нарезка зеленый 0x1', N'Нарезка', NULL, 53874.0000, 502, 36, 4, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Нарезка зеленый 0x3', N'Нарезка', NULL, 7884.0000, 943, 25, 4, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Нарезка зеленый 1x1', N'Нарезка', N'\materials\material_6.jpeg', 53096.0000, 883, 42, 7, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Нарезка зеленый 1x2', N'Нарезка', NULL, 45568.0000, 339, 8, 4, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Нарезка зеленый 3x0', N'Нарезка', N'\materials\material_7.jpeg', 25985.0000, 345, 30, 4, N'кг')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Нарезка зеленый 3x3', N'Нарезка', NULL, 30112.0000, 172, 20, 2, N'кг')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Нарезка серый 1x1', N'Нарезка', NULL, 36682.0000, 302, 41, 7, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Нарезка серый 2x0', N'Нарезка', NULL, 35548.0000, 858, 37, 6, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Нарезка серый 2x1', N'Нарезка', NULL, 7801.0000, 2, 50, 6, N'кг')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Нарезка серый 2x2', N'Нарезка', NULL, 30474.0000, 476, 5, 3, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Нарезка серый 3x3', N'Нарезка', NULL, 51486.0000, 149, 18, 5, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Нарезка синий 1x2', N'Нарезка', NULL, 40754.0000, 353, 5, 4, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Нарезка синий 2x0', N'Нарезка', NULL, 13380.0000, 899, 9, 8, N'кг')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Нарезка синий 2x1', N'Нарезка', NULL, 30327.0000, 82, 44, 7, N'кг')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Нарезка синий 2x2', N'Нарезка', NULL, 55748.0000, 845, 42, 3, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Нарезка синий 2x3', N'Нарезка', N'\materials\material_23.jpeg', 53097.0000, 44, 5, 5, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Нарезка синий 3x0', N'Нарезка', N'\materials\material_19.jpeg', 52955.0000, 696, 42, 8, N'кг')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Нарезка синий 3x1', N'Нарезка', NULL, 50887.0000, 631, 27, 6, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Нарезка цветной 0x0', N'Нарезка', NULL, 4018.0000, 311, 9, 6, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Нарезка цветной 2x0', N'Нарезка', NULL, 49221.0000, 118, 22, 7, N'кг')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Нарезка цветной 2x1', N'Нарезка', NULL, 9509.0000, 168, 40, 2, N'кг')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Нарезка цветной 2x2', N'Нарезка', N'\materials\material_9.jpeg', 41538.0000, 326, 34, 2, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Нарезка цветной 2x3', N'Нарезка', NULL, 32336.0000, 498, 45, 3, N'кг')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Рулон белый 0x1', N'Рулон', NULL, 50081.0000, 99, 8, 7, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Рулон белый 1x0', N'Рулон', N'\materials\material_18.jpeg', 37126.0000, 960, 35, 9, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Рулон белый 1x2', N'Рулон', NULL, 17952.0000, 599, 18, 2, N'кг')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Рулон белый 3x1', N'Рулон', NULL, 13360.0000, 613, 13, 10, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Рулон белый 3x2', N'Рулон', NULL, 17632.0000, 608, 5, 8, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Рулон зеленый 0x0', N'Рулон', N'\materials\material_25.jpeg', 43562.0000, 371, 32, 8, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Рулон зеленый 0x1', N'Рулон', NULL, 46510.0000, 60, 14, 2, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Рулон зеленый 0x2', N'Рулон', NULL, 50081.0000, 35, 10, 10, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Рулон зеленый 0x3', N'Рулон', NULL, 52323.0000, 913, 13, 4, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Рулон зеленый 1x0', N'Рулон', NULL, 41572.0000, 124, 5, 3, N'кг')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Рулон зеленый 1x1', N'Рулон', NULL, 28235.0000, 884, 5, 1, N'кг')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Рулон зеленый 1x3', N'Рулон', NULL, 12393.0000, 20, 17, 6, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Рулон зеленый 2x2', N'Рулон', NULL, 7610.0000, 94, 6, 4, N'кг')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Рулон зеленый 3x2', N'Рулон', N'\materials\material_2.jpeg', 40932.0000, 111, 37, 10, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Рулон серый 1x0', N'Рулон', N'\materials\material_12.jpeg', 1998.0000, 811, 26, 10, N'кг')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Рулон серый 3x0', N'Рулон', N'\materials\material_10.jpeg', 39760.0000, 34, 17, 8, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Рулон синий 0x3', N'Рулон', N'\materials\material_8.jpeg', 47343.0000, 243, 41, 4, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Рулон синий 1x0', N'Рулон', NULL, 49990.0000, 972, 40, 9, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Рулон синий 1x1', N'Рулон', N'\materials\material_14.jpeg', 40995.0000, 22, 37, 4, N'кг')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Рулон синий 2x1', N'Рулон', NULL, 32118.0000, 859, 5, 3, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Рулон синий 2x2', N'Рулон', NULL, 16303.0000, 426, 17, 4, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Рулон синий 2x3', N'Рулон', NULL, 15889.0000, 775, 42, 8, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Рулон цветной 1x3', N'Рулон', NULL, 45185.0000, 423, 48, 6, N'кг')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Спрессованный пак белый 0x2', N'Пресс', N'\materials\material_5.jpeg', 36343.0000, 601, 49, 7, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Спрессованный пак белый 1x1', N'Пресс', NULL, 16919.0000, 547, 35, 2, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Спрессованный пак белый 1x2', N'Пресс', N'\materials\material_16.jpeg', 21359.0000, 27, 28, 2, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Спрессованный пак белый 3x3', N'Пресс', NULL, 28510.0000, 158, 34, 10, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Спрессованный пак зеленый 0x3', N'Пресс', NULL, 18848.0000, 966, 7, 6, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Спрессованный пак зеленый 1x0', N'Пресс', N'\materials\material_17.jpeg', 18413.0000, 560, 17, 10, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Спрессованный пак зеленый 1x1', N'Пресс', NULL, 13911.0000, 577, 28, 7, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Спрессованный пак зеленый 1x2', N'Пресс', N'\materials\material_3.jpeg', 35304.0000, 1, 12, 4, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Спрессованный пак зеленый 2x0', N'Пресс', NULL, 25974.0000, 215, 25, 6, N'кг')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Спрессованный пак зеленый 3x2', N'Пресс', NULL, 18071.0000, 890, 5, 5, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Спрессованный пак серый 0x2', N'Пресс', NULL, 2540.0000, 497, 27, 7, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Спрессованный пак серый 0x3', N'Пресс', NULL, 40699.0000, 386, 34, 9, N'кг')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Спрессованный пак серый 1x3', N'Пресс', NULL, 375.0000, 805, 50, 7, N'кг')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Спрессованный пак серый 3x0', N'Пресс', NULL, 35304.0000, 391, 29, 7, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Спрессованный пак серый 3x1', N'Пресс', NULL, 10763.0000, 429, 22, 8, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Спрессованный пак синий 0x2', N'Пресс', N'\materials\material_24.jpeg', 47443.0000, 881, 14, 9, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Спрессованный пак синий 0x3', N'Пресс', NULL, 29128.0000, 349, 41, 4, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Спрессованный пак синий 2x0', N'Пресс', N'\materials\material_22.jpeg', 53857.0000, 744, 50, 9, N'кг')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Спрессованный пак синий 2x1', N'Пресс', NULL, 31625.0000, 921, 18, 10, N'кг')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Спрессованный пак цветной 0x1', N'Пресс', NULL, 21081.0000, 175, 50, 7, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Спрессованный пак цветной 0x2', N'Пресс', NULL, 24205.0000, 474, 30, 7, N'кг')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Спрессованный пак цветной 0x3', N'Пресс', NULL, 10544.0000, 610, 41, 2, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Спрессованный пак цветной 1x2', N'Пресс', N'\materials\material_15.jpeg', 1382.0000, 189, 31, 9, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Спрессованный пак цветной 2x0', N'Пресс', N'\materials\material_13.jpeg', 17965.0000, 211, 46, 5, N'кг')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Спрессованный пак цветной 2x1', N'Пресс', NULL, 20404.0000, 549, 21, 9, N'кг')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Спрессованный пак цветной 2x3', N'Пресс', NULL, 4347.0000, 746, 27, 10, N'кг')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Спрессованный пак цветной 3x0', N'Пресс', NULL, 36740.0000, 159, 42, 5, N'кг')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Спрессованный пак цветной 3x1', N'Пресс', NULL, 45318.0000, 146, 23, 8, N'м')
INSERT [dbo].[Material] ([Name], [Type], [Image], [Price], [Count], [MinCount], [CountinPack], [Unit]) VALUES (N'Спрессованный пак цветной 3x3', N'Пресс', NULL, 18048.0000, 932, 47, 5, N'м')
GO
INSERT [dbo].[MaterialType] ([Name]) VALUES (N'Гранулы')
INSERT [dbo].[MaterialType] ([Name]) VALUES (N'Нарезка')
INSERT [dbo].[MaterialType] ([Name]) VALUES (N'Пресс')
INSERT [dbo].[MaterialType] ([Name]) VALUES (N'Рулон')
GO
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'АлмазМикроМобайлПром', N'ООО', N'1664868343 ', 94, CAST(N'2016-03-06' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'БухИнфо', N'МКК', N'2192138211 ', 91, CAST(N'2017-12-17' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'Вектор', N'МКК', N'1009676137 ', 22, CAST(N'2012-06-20' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'Вод', N'ООО', N'1492095710 ', 63, CAST(N'2017-12-21' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'ВодОбл', N'ОАО', N'1987741499 ', 38, CAST(N'2019-04-25' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'Глав', N'ОАО', N'1859167660 ', 87, CAST(N'2012-05-24' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'ГлавСерви', N'ПАО', N'2112058447 ', 20, CAST(N'2016-11-05' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'ГлавСтрой', N'ОАО', N'1107467048 ', 77, CAST(N'2014-05-01' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'ГорТверьЛифт', N'ООО', N'1865606765 ', 50, CAST(N'2015-04-01' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'ДизайнТекстил', N'ООО', N'2093683523 ', 69, CAST(N'2012-12-16' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'ЖелДорСтройВекторКомплекс', N'ООО', N'2004254497 ', 97, CAST(N'2019-05-12' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'ЖелДорХ', N'ОАО', N'2004002859 ', 65, CAST(N'2015-05-03' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'ИнжСофт', N'МФО', N'2209210168 ', 99, CAST(N'2019-07-21' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'Инфо', N'ООО', N'1272826845 ', 33, CAST(N'2011-12-28' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'Компания МорКаза', N'ПАО', N'1177669508 ', 6, CAST(N'2016-05-28' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'Компания Нефть', N'ОАО', N'2173203619 ', 97, CAST(N'2010-08-09' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'Компания ТелекомРосКрепПром', N'ОАО', N'1124623718 ', 71, CAST(N'2012-06-17' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'Компания ТомскТверьТ', N'ООО', N'1341807682 ', 26, CAST(N'2015-12-25' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'КрепМетизВектор', N'ОАО', N'1209084074 ', 64, CAST(N'2016-06-04' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'Лифт', N'ООО', N'1226636245 ', 26, CAST(N'2013-12-02' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'МонтажНефтьОрион', N'ООО', N'1298208597 ', 45, CAST(N'2014-12-13' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'МонтажОр', N'ООО', N'1687338212 ', 6, CAST(N'2015-01-18' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'ОблВектор', N'МКК', N'1385540089 ', 40, CAST(N'2014-11-01' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'Омск', N'МКК', N'1567184813 ', 90, CAST(N'2016-12-01' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'ОрионБухМетал', N'ООО', N'2193222008 ', 52, CAST(N'2012-04-09' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'Радио', N'ОАО', N'1104637210 ', 27, CAST(N'2016-08-21' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'РечСофтРе', N'ОАО', N'1155044386 ', 77, CAST(N'2012-08-08' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'РечТранс', N'МФО', N'2237035085 ', 22, CAST(N'2019-10-12' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'РосЮпитер', N'МФО', N'2100448888 ', 23, CAST(N'2013-07-21' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'РыбВостокХоз', N'ОАО', N'1311161756 ', 47, CAST(N'2017-09-09' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'РыбИнфо', N'МФО', N'1418660803 ', 71, CAST(N'2013-05-23' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'РыбОбл', N'ОАО', N'2097643775 ', 80, CAST(N'2016-03-05' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'СервисБашкирКазТраст', N'МФО', N'1549832431 ', 36, CAST(N'2018-03-19' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'Строй', N'ОАО', N'2255810682 ', 54, CAST(N'2010-04-06' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'Тверь', N'ООО', N'1860530128 ', 17, CAST(N'2017-06-25' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'ТверьЛайт', N'ЗАО', N'1499654365 ', 14, CAST(N'2015-02-09' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'ТверьМор', N'МКК', N'2013469587 ', 61, CAST(N'2017-12-08' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'ТелекомМетизХмель', N'ООО', N'1001436679 ', 67, CAST(N'2013-06-14' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'ТелекомТра', N'ОАО', N'1144555605 ', 31, CAST(N'2010-08-26' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'Тех', N'МФО', N'2148577794 ', 28, CAST(N'2010-12-15' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'ТрансМясМясКомплекс', N'ООО', N'1184923897 ', 78, CAST(N'2019-07-14' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'Урал', N'МФО', N'1439263529 ', 21, CAST(N'2013-05-06' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'УралТексти', N'ОАО', N'1705799898 ', 54, CAST(N'2018-04-28' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'ФинансСервис', N'ООО', N'1499914719 ', 21, CAST(N'2016-05-27' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'ХозБашкирГла', N'ОАО', N'1708759159 ', 10, CAST(N'2010-09-07' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'ХозСервис', N'ОАО', N'1656715446 ', 99, CAST(N'2015-11-13' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'ЦементИнфоМонтаж', N'ОАО', N'1389100819 ', 46, CAST(N'2014-06-19' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'ЦементОрион', N'МКК', N'1536344749 ', 43, CAST(N'2016-02-06' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'Электро', N'ПАО', N'1827769521 ', 86, CAST(N'2015-05-03' AS Date))
INSERT [dbo].[Provider] ([Name], [Type], [INN], [Rating], [BeginDateInWork]) VALUES (N'ЭлектроВод', N'ЗАО', N'1521101623 ', 16, CAST(N'2017-05-27' AS Date))
GO
INSERT [dbo].[ProviderType] ([Name]) VALUES (N'ЗАО')
INSERT [dbo].[ProviderType] ([Name]) VALUES (N'МКК')
INSERT [dbo].[ProviderType] ([Name]) VALUES (N'МФО')
INSERT [dbo].[ProviderType] ([Name]) VALUES (N'ОАО')
INSERT [dbo].[ProviderType] ([Name]) VALUES (N'ООО')
INSERT [dbo].[ProviderType] ([Name]) VALUES (N'ПАО')
GO
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Гранулы белый 2x1', N'ЖелДорСтройВекторКомплекс')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Гранулы белый 2x1', N'Инфо')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Гранулы белый 2x1', N'РечТранс')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Гранулы белый 2x1', N'ТрансМясМясКомплекс')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Гранулы зеленый 0x2', N'РечТранс')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Гранулы зеленый 1x2', N'ХозСервис')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Гранулы синий 1x0', N'АлмазМикроМобайлПром')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Гранулы синий 1x0', N'ТрансМясМясКомплекс')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Гранулы цветной 0x3', N'РыбИнфо')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Гранулы цветной 0x3', N'Тверь')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Гранулы цветной 1x3', N'Компания МорКаза')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Гранулы цветной 1x3', N'ОрионБухМетал')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Гранулы цветной 2x0', N'ТелекомМетизХмель')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Гранулы цветной 3x0', N'Вод')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Гранулы цветной 3x0', N'Лифт')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Гранулы цветной 3x0', N'ХозБашкирГла')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Гранулы цветной 3x1', N'ЖелДорХ')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Гранулы цветной 3x1', N'ОблВектор')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Гранулы цветной 3x1', N'РечСофтРе')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Гранулы цветной 3x1', N'Электро')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Нарезка белый 1x2', N'УралТексти')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Нарезка белый 2x2', N'Компания МорКаза')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Нарезка белый 2x2', N'Компания ТомскТверьТ')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Нарезка белый 2x2', N'Лифт')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Нарезка белый 2x2', N'МонтажОр')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Нарезка белый 2x2', N'ТелекомТра')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Нарезка белый 2x2', N'УралТексти')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Нарезка зеленый 0x1', N'ГлавСерви')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Нарезка зеленый 0x3', N'Омск')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Нарезка зеленый 0x3', N'ТверьЛайт')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Нарезка зеленый 0x3', N'ЭлектроВод')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Нарезка зеленый 3x0', N'Компания Нефть')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Нарезка зеленый 3x0', N'КрепМетизВектор')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Нарезка зеленый 3x0', N'Радио')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Нарезка зеленый 3x0', N'ТверьМор')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Нарезка зеленый 3x0', N'Тех')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Нарезка зеленый 3x0', N'ХозБашкирГла')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Нарезка серый 2x0', N'ЖелДорХ')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Нарезка серый 2x0', N'ЦементИнфоМонтаж')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Нарезка серый 2x2', N'РечТранс')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Нарезка серый 2x2', N'РосЮпитер')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Нарезка синий 2x2', N'АлмазМикроМобайлПром')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Нарезка синий 2x2', N'Глав')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Нарезка синий 2x2', N'ФинансСервис')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Нарезка синий 2x3', N'ЭлектроВод')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Нарезка синий 3x0', N'ИнжСофт')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Нарезка синий 3x0', N'Компания Нефть')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Нарезка синий 3x0', N'Омск')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Нарезка цветной 0x0', N'Вод')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Нарезка цветной 0x0', N'ЖелДорСтройВекторКомплекс')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Нарезка цветной 0x0', N'РыбИнфо')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Нарезка цветной 0x0', N'Тверь')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Нарезка цветной 2x2', N'АлмазМикроМобайлПром')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Нарезка цветной 2x2', N'Компания МорКаза')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Нарезка цветной 2x2', N'МонтажНефтьОрион')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Рулон белый 1x0', N'ВодОбл')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Рулон белый 1x0', N'Компания ТелекомРосКрепПром')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Рулон белый 1x0', N'РечТранс')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Рулон белый 1x0', N'ТелекомТра')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Рулон белый 1x0', N'ФинансСервис')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Рулон белый 1x0', N'ЦементИнфоМонтаж')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Рулон белый 3x1', N'РыбВостокХоз')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Рулон зеленый 0x0', N'Компания ТелекомРосКрепПром')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Рулон зеленый 0x0', N'ОблВектор')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Рулон зеленый 0x2', N'Глав')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Рулон зеленый 2x2', N'ЖелДорСтройВекторКомплекс')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Рулон зеленый 2x2', N'РечТранс')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Рулон зеленый 3x2', N'Электро')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Рулон серый 3x0', N'ЖелДорСтройВекторКомплекс')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Рулон серый 3x0', N'ФинансСервис')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Рулон синий 0x3', N'Вод')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Рулон синий 0x3', N'ЭлектроВод')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Рулон синий 1x1', N'Компания Нефть')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Спрессованный пак белый 0x2', N'ЦементИнфоМонтаж')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Спрессованный пак белый 1x1', N'ОблВектор')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Спрессованный пак белый 1x1', N'ОрионБухМетал')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Спрессованный пак белый 1x1', N'ХозБашкирГла')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Спрессованный пак зеленый 1x0', N'Лифт')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Спрессованный пак зеленый 1x0', N'Омск')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Спрессованный пак зеленый 1x0', N'РечСофтРе')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Спрессованный пак зеленый 1x0', N'ХозСервис')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Спрессованный пак зеленый 1x2', N'Строй')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Спрессованный пак зеленый 1x2', N'ТелекомТра')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Спрессованный пак зеленый 2x0', N'Лифт')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Спрессованный пак зеленый 2x0', N'ХозСервис')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Спрессованный пак серый 0x3', N'Инфо')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Спрессованный пак синий 0x2', N'ДизайнТекстил')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Спрессованный пак синий 0x2', N'МонтажОр')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Спрессованный пак синий 0x2', N'ТверьЛайт')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Спрессованный пак синий 0x2', N'Электро')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Спрессованный пак синий 0x3', N'РыбВостокХоз')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Спрессованный пак синий 2x0', N'Омск')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Спрессованный пак синий 2x1', N'РыбВостокХоз')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Спрессованный пак синий 2x1', N'ФинансСервис')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Спрессованный пак цветной 2x0', N'ГлавСерви')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Спрессованный пак цветной 2x0', N'ХозСервис')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Спрессованный пак цветной 2x3', N'Лифт')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Спрессованный пак цветной 2x3', N'ТелекомТра')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Спрессованный пак цветной 2x3', N'ЦементИнфоМонтаж')
INSERT [dbo].[Supplier] ([Name_material], [Provider]) VALUES (N'Спрессованный пак цветной 3x1', N'ХозБашкирГла')
GO
INSERT [dbo].[Unit] ([Name]) VALUES (N'кг')
INSERT [dbo].[Unit] ([Name]) VALUES (N'л')
INSERT [dbo].[Unit] ([Name]) VALUES (N'м')
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD FOREIGN KEY([Type])
REFERENCES [dbo].[MaterialType] ([Name])
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD FOREIGN KEY([Unit])
REFERENCES [dbo].[Unit] ([Name])
GO
ALTER TABLE [dbo].[Provider]  WITH CHECK ADD FOREIGN KEY([Type])
REFERENCES [dbo].[ProviderType] ([Name])
GO
ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD FOREIGN KEY([Name_material])
REFERENCES [dbo].[Material] ([Name])
GO
ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD FOREIGN KEY([Provider])
REFERENCES [dbo].[Provider] ([Name])
GO
USE [master]
GO
ALTER DATABASE [user_05] SET  READ_WRITE 
GO
