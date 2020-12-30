USE [languageClasses]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Student]') AND type in (N'U'))
ALTER TABLE [dbo].[Student] DROP CONSTRAINT IF EXISTS [FK_Student_Group]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Group]') AND type in (N'U'))
ALTER TABLE [dbo].[Group] DROP CONSTRAINT IF EXISTS [FK_Group_Course]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 2020-12-29 11:15:34 PM ******/
DROP TABLE IF EXISTS [dbo].[Student]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 2020-12-29 11:15:34 PM ******/
DROP TABLE IF EXISTS [dbo].[Group]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 2020-12-29 11:15:34 PM ******/
DROP TABLE IF EXISTS [dbo].[Course]
GO
USE [master]
GO
/****** Object:  Database [languageClasses]    Script Date: 2020-12-29 11:15:34 PM ******/
DROP DATABASE IF EXISTS [languageClasses]
GO
/****** Object:  Database [languageClasses]    Script Date: 2020-12-29 11:15:34 PM ******/
CREATE DATABASE [languageClasses]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'languageClasses', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER_2019\MSSQL\DATA\languageClasses.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'languageClasses_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER_2019\MSSQL\DATA\languageClasses_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [languageClasses] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [languageClasses].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [languageClasses] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [languageClasses] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [languageClasses] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [languageClasses] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [languageClasses] SET ARITHABORT OFF 
GO
ALTER DATABASE [languageClasses] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [languageClasses] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [languageClasses] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [languageClasses] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [languageClasses] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [languageClasses] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [languageClasses] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [languageClasses] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [languageClasses] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [languageClasses] SET  ENABLE_BROKER 
GO
ALTER DATABASE [languageClasses] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [languageClasses] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [languageClasses] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [languageClasses] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [languageClasses] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [languageClasses] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [languageClasses] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [languageClasses] SET RECOVERY FULL 
GO
ALTER DATABASE [languageClasses] SET  MULTI_USER 
GO
ALTER DATABASE [languageClasses] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [languageClasses] SET DB_CHAINING OFF 
GO
ALTER DATABASE [languageClasses] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [languageClasses] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [languageClasses] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [languageClasses] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'languageClasses', N'ON'
GO
ALTER DATABASE [languageClasses] SET QUERY_STORE = OFF
GO
USE [languageClasses]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 2020-12-29 11:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [varchar](50) NOT NULL,
	[Language] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 2020-12-29 11:15:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[GroupId] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [varchar](50) NOT NULL,
	[Level] [int] NOT NULL,
	[ClassDay1] [int] NOT NULL,
	[ClassDay2] [int] NULL,
	[ClassDay3] [int] NULL,
	[CourseId] [int] NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 2020-12-29 11:15:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[Gender] [int] NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[EmailAddress] [varchar](50) NOT NULL,
	[Enrolled] [bit] NOT NULL,
	[HourlyClassPrice] [decimal](5, 2) NOT NULL,
	[GroupId] [int] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Course] ON 
GO
INSERT [dbo].[Course] ([CourseId], [CourseName], [Language]) VALUES (1, N'Canadian English', N'English')
GO
INSERT [dbo].[Course] ([CourseId], [CourseName], [Language]) VALUES (2, N'French Immersion', N'French')
GO
INSERT [dbo].[Course] ([CourseId], [CourseName], [Language]) VALUES (3, N'IELTS', N'English')
GO
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
SET IDENTITY_INSERT [dbo].[Group] ON 
GO
INSERT [dbo].[Group] ([GroupId], [GroupName], [Level], [ClassDay1], [ClassDay2], [ClassDay3], [CourseId]) VALUES (1, N'Mateus Sartori', 0, 6, NULL, NULL, 1)
GO
INSERT [dbo].[Group] ([GroupId], [GroupName], [Level], [ClassDay1], [ClassDay2], [ClassDay3], [CourseId]) VALUES (2, N'Vishu Patel', 1, 1, 3, NULL, 1)
GO
INSERT [dbo].[Group] ([GroupId], [GroupName], [Level], [ClassDay1], [ClassDay2], [ClassDay3], [CourseId]) VALUES (3, N'Pereira', 0, 1, 3, NULL, 1)
GO
INSERT [dbo].[Group] ([GroupId], [GroupName], [Level], [ClassDay1], [ClassDay2], [ClassDay3], [CourseId]) VALUES (4, N'Julio/Mara', 0, 6, NULL, NULL, 1)
GO
INSERT [dbo].[Group] ([GroupId], [GroupName], [Level], [ClassDay1], [ClassDay2], [ClassDay3], [CourseId]) VALUES (5, N'Lone Wolf', 2, 2, 4, NULL, 3)
GO
INSERT [dbo].[Group] ([GroupId], [GroupName], [Level], [ClassDay1], [ClassDay2], [ClassDay3], [CourseId]) VALUES (6, N'Juan Carlos', 1, 5, 6, NULL, 1)
GO
INSERT [dbo].[Group] ([GroupId], [GroupName], [Level], [ClassDay1], [ClassDay2], [ClassDay3], [CourseId]) VALUES (7, N'Henrique Silva', 2, 6, NULL, NULL, 1)
GO
INSERT [dbo].[Group] ([GroupId], [GroupName], [Level], [ClassDay1], [ClassDay2], [ClassDay3], [CourseId]) VALUES (8, N'Luan Botelho', 2, 6, NULL, NULL, 3)
GO
INSERT [dbo].[Group] ([GroupId], [GroupName], [Level], [ClassDay1], [ClassDay2], [ClassDay3], [CourseId]) VALUES (9, N'Trio', 2, 1, 3, 5, 1)
GO
SET IDENTITY_INSERT [dbo].[Group] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [StartDate], [Gender], [Country], [EmailAddress], [Enrolled], [HourlyClassPrice], [GroupId]) VALUES (1, N'Mateus', N'Sartori', CAST(N'2020-05-23T00:00:00.0000000' AS DateTime2), 0, N'Brazil', N'sartori2014@hotmail.com', 1, CAST(75.00 AS Decimal(5, 2)), 1)
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [StartDate], [Gender], [Country], [EmailAddress], [Enrolled], [HourlyClassPrice], [GroupId]) VALUES (2, N'Vishu', N'Patel', CAST(N'2019-02-01T00:00:00.0000000' AS DateTime2), 1, N'India', N'patel.vishu0990@yahoo.ca', 1, CAST(70.00 AS Decimal(5, 2)), 2)
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [StartDate], [Gender], [Country], [EmailAddress], [Enrolled], [HourlyClassPrice], [GroupId]) VALUES (3, N'Sarah', N'Pereira', CAST(N'2020-07-10T00:00:00.0000000' AS DateTime2), 1, N'Brazil', N'p.sarah@gulliver.com.br', 1, CAST(50.00 AS Decimal(5, 2)), 3)
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [StartDate], [Gender], [Country], [EmailAddress], [Enrolled], [HourlyClassPrice], [GroupId]) VALUES (4, N'Maury', N'Pereira', CAST(N'2020-07-10T00:00:00.0000000' AS DateTime2), 0, N'Brazil', N'maury22pereira@hotmail.com', 1, CAST(50.00 AS Decimal(5, 2)), 3)
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [StartDate], [Gender], [Country], [EmailAddress], [Enrolled], [HourlyClassPrice], [GroupId]) VALUES (5, N'Juliano', N'Barbonaglia', CAST(N'2020-08-15T00:00:00.0000000' AS DateTime2), 0, N'Brazil', N'jujubb1@gmail.com', 1, CAST(50.00 AS Decimal(5, 2)), 3)
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [StartDate], [Gender], [Country], [EmailAddress], [Enrolled], [HourlyClassPrice], [GroupId]) VALUES (6, N'David', N'Pereira', CAST(N'2020-07-10T00:00:00.0000000' AS DateTime2), 0, N'Brazil', N'davidlimapereira91@gmail.com', 1, CAST(50.00 AS Decimal(5, 2)), 3)
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [StartDate], [Gender], [Country], [EmailAddress], [Enrolled], [HourlyClassPrice], [GroupId]) VALUES (7, N'Julio', N'Tanure', CAST(N'2020-03-25T00:00:00.0000000' AS DateTime2), 0, N'Brazil', N'tanurecarros@hotmail.com', 1, CAST(65.00 AS Decimal(5, 2)), 4)
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [StartDate], [Gender], [Country], [EmailAddress], [Enrolled], [HourlyClassPrice], [GroupId]) VALUES (8, N'Mara', N'Goncalves', CAST(N'2020-03-25T00:00:00.0000000' AS DateTime2), 1, N'Brazil', N'silva.mara33g@gmail.com', 1, CAST(65.00 AS Decimal(5, 2)), 4)
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [StartDate], [Gender], [Country], [EmailAddress], [Enrolled], [HourlyClassPrice], [GroupId]) VALUES (9, N'Isabela', N'Dantas', CAST(N'2017-01-05T00:00:00.0000000' AS DateTime2), 2, N'Brazil', N'dantas.isa@ufrj.com.br', 1, CAST(70.00 AS Decimal(5, 2)), 5)
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [StartDate], [Gender], [Country], [EmailAddress], [Enrolled], [HourlyClassPrice], [GroupId]) VALUES (10, N'Juan', N'Carlos', CAST(N'2020-11-23T00:00:00.0000000' AS DateTime2), 0, N'Brazil', N'carlos.juan.lima1993@gmail.com', 1, CAST(80.00 AS Decimal(5, 2)), 6)
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [StartDate], [Gender], [Country], [EmailAddress], [Enrolled], [HourlyClassPrice], [GroupId]) VALUES (11, N'Henrique', N'Silva', CAST(N'2019-11-11T00:00:00.0000000' AS DateTime2), 0, N'Brazil', N'2121hsilva@hotmail.com', 1, CAST(75.00 AS Decimal(5, 2)), 7)
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [StartDate], [Gender], [Country], [EmailAddress], [Enrolled], [HourlyClassPrice], [GroupId]) VALUES (12, N'Luan', N'Botelho', CAST(N'2020-01-07T00:00:00.0000000' AS DateTime2), 0, N'Brazil', N'luan.botelho@gmail.com', 1, CAST(75.00 AS Decimal(5, 2)), 8)
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [StartDate], [Gender], [Country], [EmailAddress], [Enrolled], [HourlyClassPrice], [GroupId]) VALUES (13, N'Helena', N'Rojas', CAST(N'2019-09-07T00:00:00.0000000' AS DateTime2), 1, N'Spain', N'helenroro2@yahoo.ca', 1, CAST(75.00 AS Decimal(5, 2)), 9)
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [StartDate], [Gender], [Country], [EmailAddress], [Enrolled], [HourlyClassPrice], [GroupId]) VALUES (14, N'Ruy', N'Galante', CAST(N'2019-09-07T00:00:00.0000000' AS DateTime2), 0, N'Spain', N'ruygalante2014@gmail.com', 1, CAST(75.00 AS Decimal(5, 2)), 9)
GO
INSERT [dbo].[Student] ([StudentId], [FirstName], [LastName], [StartDate], [Gender], [Country], [EmailAddress], [Enrolled], [HourlyClassPrice], [GroupId]) VALUES (15, N'David', N'Rojas', CAST(N'2019-09-07T00:00:00.0000000' AS DateTime2), 0, N'Spain', N'davidgameplay@gmail.com', 1, CAST(75.00 AS Decimal(5, 2)), 9)
GO
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([CourseId])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Course]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([GroupId])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Group]
GO
USE [master]
GO
ALTER DATABASE [languageClasses] SET  READ_WRITE 
GO
