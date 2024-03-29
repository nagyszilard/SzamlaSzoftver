USE [master]
GO
/****** Object:  Database [Billing]    Script Date: 2019. 10. 08. 14:58:13 ******/
CREATE DATABASE [Billing]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Billing', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.VIRTUALSERVER\MSSQL\DATA\Billing.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Billing_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.VIRTUALSERVER\MSSQL\DATA\Billing_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Billing] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Billing].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Billing] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Billing] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Billing] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Billing] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Billing] SET ARITHABORT OFF 
GO
ALTER DATABASE [Billing] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Billing] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Billing] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Billing] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Billing] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Billing] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Billing] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Billing] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Billing] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Billing] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Billing] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Billing] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Billing] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Billing] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Billing] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Billing] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Billing] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Billing] SET RECOVERY FULL 
GO
ALTER DATABASE [Billing] SET  MULTI_USER 
GO
ALTER DATABASE [Billing] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Billing] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Billing] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Billing] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Billing] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Billing', N'ON'
GO
ALTER DATABASE [Billing] SET QUERY_STORE = OFF
GO
USE [Billing]
GO
/****** Object:  Table [dbo].[Companys]    Script Date: 2019. 10. 08. 14:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companys](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Adress] [nvarchar](50) NULL,
	[AccountNumber] [nvarchar](24) NULL,
 CONSTRAINT [PK_Companys] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 2019. 10. 08. 14:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Adress] [nvarchar](50) NULL,
	[AccountNumber] [nvarchar](24) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceDetails]    Script Date: 2019. 10. 08. 14:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceDetails](
	[InvoiceDetailID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceID] [int] NULL,
	[ProductName] [nvarchar](50) NULL,
	[AmountUnit] [nvarchar](50) NULL,
	[Quantity] [float] NULL,
	[UnitPrice] [real] NULL,
 CONSTRAINT [PK_InvoiceDetails] PRIMARY KEY CLUSTERED 
(
	[InvoiceDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 2019. 10. 08. 14:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[InvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceNumber] [nvarchar](50) NULL,
	[CountryCode] [nvarchar](2) NULL,
	[InvoiceDate] [datetime] NULL,
	[DueDate] [datetime] NULL,
	[DateOfCompletion] [datetime] NULL,
	[Netto] [real] NULL,
	[Tax] [real] NULL,
	[Brutto] [real] NULL,
	[Note] [nvarchar](max) NULL,
	[CustomerID] [int] NULL,
	[CompanyID] [int] NULL,
 CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Companys] ON 

INSERT [dbo].[Companys] ([CompanyID], [Name], [Adress], [AccountNumber]) VALUES (1, N'Teszt Kft.', N'6000 Kecskemét Teve u. 12', N'123465897546123867924635')
INSERT [dbo].[Companys] ([CompanyID], [Name], [Adress], [AccountNumber]) VALUES (2, N'Alma Kft.', N'6000 Kecskemét Tinta u. 11.', N'10025004010400900000000')
INSERT [dbo].[Companys] ([CompanyID], [Name], [Adress], [AccountNumber]) VALUES (3, N'Mészáros Kft', N'6990 Győr Ferenc tér 25.', N'10025004010405400000000')
SET IDENTITY_INSERT [dbo].[Companys] OFF
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [Name], [Adress], [AccountNumber]) VALUES (1, N'Teszt Elek', N'6000 Kecskemét Alma u. 11', N'124356798541234576451952')
INSERT [dbo].[Customers] ([CustomerID], [Name], [Adress], [AccountNumber]) VALUES (4, N'Kis Elemér', N'6015 Tiszaalpár Kálvin tér 11', N'10025004010400900000000')
INSERT [dbo].[Customers] ([CustomerID], [Name], [Adress], [AccountNumber]) VALUES (5, N'Mészáros Tamás', N'6001 Hetény Kisvasút u. 21', N'10065504010404110000000')
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[InvoiceDetails] ON 

INSERT [dbo].[InvoiceDetails] ([InvoiceDetailID], [InvoiceID], [ProductName], [AmountUnit], [Quantity], [UnitPrice]) VALUES (12, 4, N'csavar', N'db', 30, 233)
INSERT [dbo].[InvoiceDetails] ([InvoiceDetailID], [InvoiceID], [ProductName], [AmountUnit], [Quantity], [UnitPrice]) VALUES (13, 4, N'fék', N'db', 10, 5563)
INSERT [dbo].[InvoiceDetails] ([InvoiceDetailID], [InvoiceID], [ProductName], [AmountUnit], [Quantity], [UnitPrice]) VALUES (14, 4, N'lámpa', N'db', 5, 22264)
INSERT [dbo].[InvoiceDetails] ([InvoiceDetailID], [InvoiceID], [ProductName], [AmountUnit], [Quantity], [UnitPrice]) VALUES (15, 4, N'kormány', N'db', 2, 57721)
INSERT [dbo].[InvoiceDetails] ([InvoiceDetailID], [InvoiceID], [ProductName], [AmountUnit], [Quantity], [UnitPrice]) VALUES (16, 2, N'kerék', N'db', 3, 48166)
INSERT [dbo].[InvoiceDetails] ([InvoiceDetailID], [InvoiceID], [ProductName], [AmountUnit], [Quantity], [UnitPrice]) VALUES (17, 2, N'izzó', N'db', 1, 11430)
INSERT [dbo].[InvoiceDetails] ([InvoiceDetailID], [InvoiceID], [ProductName], [AmountUnit], [Quantity], [UnitPrice]) VALUES (18, 3, N'kilincs', N'db', 6, 11000)
INSERT [dbo].[InvoiceDetails] ([InvoiceDetailID], [InvoiceID], [ProductName], [AmountUnit], [Quantity], [UnitPrice]) VALUES (19, 3, N'kulcs', N'db', 1, 9500)
INSERT [dbo].[InvoiceDetails] ([InvoiceDetailID], [InvoiceID], [ProductName], [AmountUnit], [Quantity], [UnitPrice]) VALUES (20, 3, N'gyertya', N'db', 4, 27795)
INSERT [dbo].[InvoiceDetails] ([InvoiceDetailID], [InvoiceID], [ProductName], [AmountUnit], [Quantity], [UnitPrice]) VALUES (21, 12, N'bovden', N'db', 1, 17000)
SET IDENTITY_INSERT [dbo].[InvoiceDetails] OFF
SET IDENTITY_INSERT [dbo].[Invoices] ON 

INSERT [dbo].[Invoices] ([InvoiceID], [InvoiceNumber], [CountryCode], [InvoiceDate], [DueDate], [DateOfCompletion], [Netto], [Tax], [Brutto], [Note], [CustomerID], [CompanyID]) VALUES (1, N'2019/0001                                         ', N'HU', CAST(N'2019-01-03T11:00:00.000' AS DateTime), CAST(N'2019-01-06T09:45:00.000' AS DateTime), CAST(N'2019-01-04T11:00:00.000' AS DateTime), 7000, 27, 8890, N'Köszönjük a vásárlást!                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ', 1, 1)
INSERT [dbo].[Invoices] ([InvoiceID], [InvoiceNumber], [CountryCode], [InvoiceDate], [DueDate], [DateOfCompletion], [Netto], [Tax], [Brutto], [Note], [CustomerID], [CompanyID]) VALUES (2, N'2019/0002                                         ', N'HU', CAST(N'2019-01-03T14:00:00.000' AS DateTime), CAST(N'2019-01-09T18:12:00.000' AS DateTime), CAST(N'2019-01-07T10:23:00.000' AS DateTime), 55638, 27, 70660, N'Köszönjük a vásárlást!                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ', 5, 2)
INSERT [dbo].[Invoices] ([InvoiceID], [InvoiceNumber], [CountryCode], [InvoiceDate], [DueDate], [DateOfCompletion], [Netto], [Tax], [Brutto], [Note], [CustomerID], [CompanyID]) VALUES (3, N'2019/0003                                         ', N'HU', CAST(N'2019-01-12T13:15:00.000' AS DateTime), CAST(N'2019-01-17T16:50:00.000' AS DateTime), CAST(N'2019-01-15T15:41:00.000' AS DateTime), 87654, 27, 111320, N'Köszönjük a vásárlást!                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ', 4, 3)
INSERT [dbo].[Invoices] ([InvoiceID], [InvoiceNumber], [CountryCode], [InvoiceDate], [DueDate], [DateOfCompletion], [Netto], [Tax], [Brutto], [Note], [CustomerID], [CompanyID]) VALUES (4, N'2019/0004                                         ', N'HU', CAST(N'2019-01-05T11:23:00.000' AS DateTime), CAST(N'2019-01-05T11:26:00.000' AS DateTime), CAST(N'2019-01-05T11:45:00.000' AS DateTime), 90900, 27, 115443, N'Köszönjük a vásárlást!                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ', 5, 1)
INSERT [dbo].[Invoices] ([InvoiceID], [InvoiceNumber], [CountryCode], [InvoiceDate], [DueDate], [DateOfCompletion], [Netto], [Tax], [Brutto], [Note], [CustomerID], [CompanyID]) VALUES (5, N'2019/0005                                         ', N'FR', CAST(N'2019-01-06T14:35:00.000' AS DateTime), CAST(N'2019-01-09T14:35:00.000' AS DateTime), CAST(N'2019-01-07T15:21:00.000' AS DateTime), 144500, 0, 144500, N'Köszönjük a vásárlást! Az áru áfa mentes.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ', 1, 1)
INSERT [dbo].[Invoices] ([InvoiceID], [InvoiceNumber], [CountryCode], [InvoiceDate], [DueDate], [DateOfCompletion], [Netto], [Tax], [Brutto], [Note], [CustomerID], [CompanyID]) VALUES (6, N'2019/0006                                         ', N'HU', CAST(N'2019-01-06T15:15:00.000' AS DateTime), CAST(N'2019-01-07T14:41:00.000' AS DateTime), CAST(N'2019-01-07T10:11:00.000' AS DateTime), 9000, 27, 11430, N'Köszönjük a vásárlást!                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ', 4, 1)
INSERT [dbo].[Invoices] ([InvoiceID], [InvoiceNumber], [CountryCode], [InvoiceDate], [DueDate], [DateOfCompletion], [Netto], [Tax], [Brutto], [Note], [CustomerID], [CompanyID]) VALUES (7, N'2019/0007                                         ', N'RO', CAST(N'2019-01-07T11:51:00.000' AS DateTime), CAST(N'2019-01-11T15:41:00.000' AS DateTime), CAST(N'2019-01-10T07:25:00.000' AS DateTime), 66000, 0, 66000, N'Köszönjük a vásárlást! Az áru áfa mentes.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ', 4, 1)
INSERT [dbo].[Invoices] ([InvoiceID], [InvoiceNumber], [CountryCode], [InvoiceDate], [DueDate], [DateOfCompletion], [Netto], [Tax], [Brutto], [Note], [CustomerID], [CompanyID]) VALUES (10, N'2019/0008                                         ', N'RO', CAST(N'2019-01-08T16:51:00.000' AS DateTime), CAST(N'2019-01-14T12:54:00.000' AS DateTime), CAST(N'2019-01-13T14:51:00.000' AS DateTime), 9500, 0, 9500, N'Köszönjük a vásárlást! Az áru áfa mentes.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ', 4, 2)
INSERT [dbo].[Invoices] ([InvoiceID], [InvoiceNumber], [CountryCode], [InvoiceDate], [DueDate], [DateOfCompletion], [Netto], [Tax], [Brutto], [Note], [CustomerID], [CompanyID]) VALUES (11, N'2019/0009                                         ', N'HU', CAST(N'2019-01-09T11:41:00.000' AS DateTime), CAST(N'2019-01-12T15:51:00.000' AS DateTime), CAST(N'2019-01-11T12:51:00.000' AS DateTime), 87545, 27, 111182, N'Köszönjük a vásárlást!                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ', 5, 1)
INSERT [dbo].[Invoices] ([InvoiceID], [InvoiceNumber], [CountryCode], [InvoiceDate], [DueDate], [DateOfCompletion], [Netto], [Tax], [Brutto], [Note], [CustomerID], [CompanyID]) VALUES (12, N'2019/0010                                         ', N'RO', CAST(N'2019-01-10T11:41:00.000' AS DateTime), CAST(N'2019-01-11T12:51:00.000' AS DateTime), CAST(N'2019-01-11T11:41:00.000' AS DateTime), 17000, 0, 17000, N'Köszönjük a vásárlást! Az árú áfa mentes.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ', 5, 2)
INSERT [dbo].[Invoices] ([InvoiceID], [InvoiceNumber], [CountryCode], [InvoiceDate], [DueDate], [DateOfCompletion], [Netto], [Tax], [Brutto], [Note], [CustomerID], [CompanyID]) VALUES (13, N'2019/0011', N'HU', CAST(N'2019-01-20T00:00:00.000' AS DateTime), CAST(N'2019-01-22T00:00:00.000' AS DateTime), CAST(N'2019-01-21T00:00:00.000' AS DateTime), 8500, 27, 10795, N'Köszönjük a vásárlást!', 5, 3)
INSERT [dbo].[Invoices] ([InvoiceID], [InvoiceNumber], [CountryCode], [InvoiceDate], [DueDate], [DateOfCompletion], [Netto], [Tax], [Brutto], [Note], [CustomerID], [CompanyID]) VALUES (14, N'2019/0012', N'FR', CAST(N'2019-02-01T00:00:00.000' AS DateTime), CAST(N'2019-02-05T00:00:00.000' AS DateTime), CAST(N'2019-02-03T00:00:00.000' AS DateTime), 14500, 0, 14500, N'Köszönjük a vásárlást! Az árú áfa mentes.', 4, 3)
SET IDENTITY_INSERT [dbo].[Invoices] OFF
ALTER TABLE [dbo].[InvoiceDetails]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceDetails_Invoices] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[Invoices] ([InvoiceID])
GO
ALTER TABLE [dbo].[InvoiceDetails] CHECK CONSTRAINT [FK_InvoiceDetails_Invoices]
GO
USE [master]
GO
ALTER DATABASE [Billing] SET  READ_WRITE 
GO
