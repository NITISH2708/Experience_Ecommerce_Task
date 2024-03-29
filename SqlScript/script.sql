USE [master]
GO
/****** Object:  Database [ExperienceEcommerceDB]    Script Date: 05/09/2020 11:05:59 ******/
CREATE DATABASE [ExperienceEcommerceDB] ON  PRIMARY 
( NAME = N'New Database', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\New Database.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'New Database_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\New Database.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ExperienceEcommerceDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExperienceEcommerceDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ExperienceEcommerceDB] SET ANSI_NULL_DEFAULT ON
GO
ALTER DATABASE [ExperienceEcommerceDB] SET ANSI_NULLS ON
GO
ALTER DATABASE [ExperienceEcommerceDB] SET ANSI_PADDING ON
GO
ALTER DATABASE [ExperienceEcommerceDB] SET ANSI_WARNINGS ON
GO
ALTER DATABASE [ExperienceEcommerceDB] SET ARITHABORT ON
GO
ALTER DATABASE [ExperienceEcommerceDB] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [ExperienceEcommerceDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ExperienceEcommerceDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ExperienceEcommerceDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ExperienceEcommerceDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ExperienceEcommerceDB] SET CURSOR_DEFAULT  LOCAL
GO
ALTER DATABASE [ExperienceEcommerceDB] SET CONCAT_NULL_YIELDS_NULL ON
GO
ALTER DATABASE [ExperienceEcommerceDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ExperienceEcommerceDB] SET QUOTED_IDENTIFIER ON
GO
ALTER DATABASE [ExperienceEcommerceDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ExperienceEcommerceDB] SET  DISABLE_BROKER
GO
ALTER DATABASE [ExperienceEcommerceDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ExperienceEcommerceDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ExperienceEcommerceDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ExperienceEcommerceDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ExperienceEcommerceDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ExperienceEcommerceDB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ExperienceEcommerceDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ExperienceEcommerceDB] SET  READ_WRITE
GO
ALTER DATABASE [ExperienceEcommerceDB] SET RECOVERY FULL
GO
ALTER DATABASE [ExperienceEcommerceDB] SET  MULTI_USER
GO
ALTER DATABASE [ExperienceEcommerceDB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ExperienceEcommerceDB] SET DB_CHAINING OFF
GO
USE [ExperienceEcommerceDB]
GO
/****** Object:  Table [dbo].[Reimbursement_Form]    Script Date: 05/09/2020 11:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Reimbursement_Form](
	[Rem_ID] [int] IDENTITY(1000,1) NOT NULL,
	[Month] [varchar](20) NULL,
	[Reimbursement_type] [varchar](20) NULL,
	[From_Date] [date] NULL,
	[To_Date] [date] NULL,
	[Purpose] [varchar](50) NULL,
	[Mode] [varchar](20) NULL,
	[km] [varchar](50) NULL,
	[InvNo] [varchar](50) NULL,
	[Amt] [money] NULL,
	[Attachment] [varchar](500) NULL,
	[Hotel_Name] [varchar](100) NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_Reimbursement_Form_1] PRIMARY KEY CLUSTERED 
(
	[Rem_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Excel_Import]    Script Date: 05/09/2020 11:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Excel_Import](
	[date] [date] NOT NULL,
	[employee id] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[working type] [varchar](50) NOT NULL,
	[start] [time](0) NOT NULL,
	[end] [time](0) NOT NULL,
	[store id] [varchar](50) NOT NULL,
	[store name] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  StoredProcedure [dbo].[Sp_InsertUpdate]    Script Date: 05/09/2020 11:06:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Sp_InsertUpdate]  
(  
   @date date,  
   @employee_id int,  
   @name VARCHAR(10),  
   @working_type varchar(20),  
   @start VARCHAR(20),  
   @end nvarchar(20) = '' ,
   @storeid VARCHAR(20),  
   @storename VARCHAR(20) 
)  
AS  
 

BEGIN  
insert into dbo.Excel_Import([date],[employee id],[name],[working type],[start],[end],[store id],[store name]) values( convert(varchar(50),@date,121), @employee_id, @name, @working_type, @start,@end,@storeid,@storename)  
END
GO
