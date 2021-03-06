USE [master]
GO
/****** Object:  Database [Database]    Script Date: 09/06/2020 14:53:13 ******/
CREATE DATABASE [Database]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Database', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Database.mdf' , SIZE = 7168KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Database_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Database_log.ldf' , SIZE = 3456KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Database] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Database].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Database] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Database] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Database] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Database] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Database] SET ARITHABORT OFF 
GO
ALTER DATABASE [Database] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Database] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Database] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Database] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Database] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Database] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Database] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Database] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Database] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Database] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Database] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Database] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Database] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Database] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Database] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Database] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Database] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Database] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Database] SET  MULTI_USER 
GO
ALTER DATABASE [Database] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Database] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Database] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Database] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Database] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Database]
GO
/****** Object:  Table [dbo].[CarFields]    Script Date: 09/06/2020 14:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CarFields](
	[LicensePlateNumber] [int] NOT NULL,
	[CarTypeID] [int] NOT NULL,
	[CurrentKilometrage] [int] NOT NULL,
	[Picture] [varchar](max) NULL,
	[IsRepaired] [bit] NOT NULL,
	[IsAvailable] [bit] NOT NULL,
	[Branch] [nvarchar](50) NULL,
 CONSTRAINT [PK_CarFields] PRIMARY KEY CLUSTERED 
(
	[LicensePlateNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CarRentalFields]    Script Date: 09/06/2020 14:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarRentalFields](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[LicensePlateNumber] [int] NOT NULL,
	[RentalStartDate] [nvarchar](50) NOT NULL,
	[ReturnCarDate] [nvarchar](50) NOT NULL,
	[ReturnCarDateApproval] [nvarchar](50) NULL,
 CONSTRAINT [PK_CarRentalFields] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CarTypes]    Script Date: 09/06/2020 14:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarTypes](
	[ID] [nchar](10) NULL,
	[CarTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ManufacturerName] [nvarchar](50) NOT NULL,
	[Model] [nvarchar](50) NOT NULL,
	[DailyCost] [int] NOT NULL,
	[DailyMonetaryFine] [int] NOT NULL,
	[ManufactureYear] [int] NOT NULL,
	[GearBox] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CarTypes] PRIMARY KEY CLUSTERED 
(
	[CarTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserFields]    Script Date: 09/06/2020 14:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserFields](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DriverLicense] [int] NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Birthdate] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Thumbnail] [varchar](max) NULL,
	[Rank] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserFields] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[CarFields] ([LicensePlateNumber], [CarTypeID], [CurrentKilometrage], [Picture], [IsRepaired], [IsAvailable], [Branch]) VALUES (1121515, 6, 20000, N'assets/pictures/Honda.jpg', 0, 0, N'ראשי')
INSERT [dbo].[CarFields] ([LicensePlateNumber], [CarTypeID], [CurrentKilometrage], [Picture], [IsRepaired], [IsAvailable], [Branch]) VALUES (1123254, 2, 50000, N'assets/pictures/Audi.jpg', 1, 1, N'ראשי')
INSERT [dbo].[CarFields] ([LicensePlateNumber], [CarTypeID], [CurrentKilometrage], [Picture], [IsRepaired], [IsAvailable], [Branch]) VALUES (1132353, 5, 30000, N'assets/pictures/Ford.jpg', 0, 0, N'ראשי')
INSERT [dbo].[CarFields] ([LicensePlateNumber], [CarTypeID], [CurrentKilometrage], [Picture], [IsRepaired], [IsAvailable], [Branch]) VALUES (1133123, 1, 20000, N'assets/pictures/Alfa Romeo.jpg', 0, 1, N'ראשי')
INSERT [dbo].[CarFields] ([LicensePlateNumber], [CarTypeID], [CurrentKilometrage], [Picture], [IsRepaired], [IsAvailable], [Branch]) VALUES (1133311, 1, 5030, N'assets/pictures/Alfa Romeo.jpg', 0, 0, N'ראשי')
INSERT [dbo].[CarFields] ([LicensePlateNumber], [CarTypeID], [CurrentKilometrage], [Picture], [IsRepaired], [IsAvailable], [Branch]) VALUES (1155554, 2, 120000, N'assets/pictures/Audi.jpg', 1, 0, N'ראשי')
INSERT [dbo].[CarFields] ([LicensePlateNumber], [CarTypeID], [CurrentKilometrage], [Picture], [IsRepaired], [IsAvailable], [Branch]) VALUES (1177711, 3, 40000, N'assets/pictures/BMW.jpg', 0, 1, N'ראשי')
INSERT [dbo].[CarFields] ([LicensePlateNumber], [CarTypeID], [CurrentKilometrage], [Picture], [IsRepaired], [IsAvailable], [Branch]) VALUES (1239874, 11, 20000, N'assets/pictures/Toyota.jpg', 0, 0, N'ראשי')
INSERT [dbo].[CarFields] ([LicensePlateNumber], [CarTypeID], [CurrentKilometrage], [Picture], [IsRepaired], [IsAvailable], [Branch]) VALUES (1355122, 4, 26000, N'assets/pictures/Fiat.jpg', 0, 0, N'ראשי')
INSERT [dbo].[CarFields] ([LicensePlateNumber], [CarTypeID], [CurrentKilometrage], [Picture], [IsRepaired], [IsAvailable], [Branch]) VALUES (1355599, 4, 26000, N'assets/pictures/Fiat.jpg', 0, 1, N'ראשי')
INSERT [dbo].[CarFields] ([LicensePlateNumber], [CarTypeID], [CurrentKilometrage], [Picture], [IsRepaired], [IsAvailable], [Branch]) VALUES (4432353, 5, 30000, N'assets/pictures/Ford.jpg', 0, 1, N'ראשי')
INSERT [dbo].[CarFields] ([LicensePlateNumber], [CarTypeID], [CurrentKilometrage], [Picture], [IsRepaired], [IsAvailable], [Branch]) VALUES (4565545, 6, 20000, N'assets/pictures/Honda.jpg', 0, 1, N'ראשי')
INSERT [dbo].[CarFields] ([LicensePlateNumber], [CarTypeID], [CurrentKilometrage], [Picture], [IsRepaired], [IsAvailable], [Branch]) VALUES (4981889, 7, 15000, N'assets/pictures/Hyundai.jpg', 0, 1, N'ראשי')
INSERT [dbo].[CarFields] ([LicensePlateNumber], [CarTypeID], [CurrentKilometrage], [Picture], [IsRepaired], [IsAvailable], [Branch]) VALUES (5615615, 8, 80000, N'assets/pictures/Kia.jpg', 0, 1, N'ראשי')
INSERT [dbo].[CarFields] ([LicensePlateNumber], [CarTypeID], [CurrentKilometrage], [Picture], [IsRepaired], [IsAvailable], [Branch]) VALUES (5616182, 9, 35000, N'assets/pictures/Lamborghini.jpg', 0, 1, N'ראשי')
INSERT [dbo].[CarFields] ([LicensePlateNumber], [CarTypeID], [CurrentKilometrage], [Picture], [IsRepaired], [IsAvailable], [Branch]) VALUES (6030360, 10, 20000, N'assets/pictures/Mazda.jpg', 0, 1, N'ראשי')
INSERT [dbo].[CarFields] ([LicensePlateNumber], [CarTypeID], [CurrentKilometrage], [Picture], [IsRepaired], [IsAvailable], [Branch]) VALUES (6666666, 11, 80000, N'assets/pictures/Toyota.jpg', 0, 1, N'ראשי')
SET IDENTITY_INSERT [dbo].[CarRentalFields] ON 

INSERT [dbo].[CarRentalFields] ([ID], [UserID], [LicensePlateNumber], [RentalStartDate], [ReturnCarDate], [ReturnCarDateApproval]) VALUES (1, 5, 1121515, N'2020-01-30', N'2020-03-01', N'2020-03-01')
INSERT [dbo].[CarRentalFields] ([ID], [UserID], [LicensePlateNumber], [RentalStartDate], [ReturnCarDate], [ReturnCarDateApproval]) VALUES (2, 2, 1123254, N'2020-01-01', N'2020-05-01', N'2020-05-01')
INSERT [dbo].[CarRentalFields] ([ID], [UserID], [LicensePlateNumber], [RentalStartDate], [ReturnCarDate], [ReturnCarDateApproval]) VALUES (3, 4, 1132353, N'2020-01-01', N'2020-01-01', N'2020-01-01')
INSERT [dbo].[CarRentalFields] ([ID], [UserID], [LicensePlateNumber], [RentalStartDate], [ReturnCarDate], [ReturnCarDateApproval]) VALUES (4, 9, 1133123, N'2020-01-01', N'2020-05-20', N'2020-05-20')
INSERT [dbo].[CarRentalFields] ([ID], [UserID], [LicensePlateNumber], [RentalStartDate], [ReturnCarDate], [ReturnCarDateApproval]) VALUES (5, 1, 1133311, N'2020-01-12', N'2020-07-12', NULL)
INSERT [dbo].[CarRentalFields] ([ID], [UserID], [LicensePlateNumber], [RentalStartDate], [ReturnCarDate], [ReturnCarDateApproval]) VALUES (6, 2, 1155554, N'2020-05-01', N'2020-07-12', NULL)
INSERT [dbo].[CarRentalFields] ([ID], [UserID], [LicensePlateNumber], [RentalStartDate], [ReturnCarDate], [ReturnCarDateApproval]) VALUES (7, 3, 1355122, N'2020-05-01', N'2020-07-12', NULL)
INSERT [dbo].[CarRentalFields] ([ID], [UserID], [LicensePlateNumber], [RentalStartDate], [ReturnCarDate], [ReturnCarDateApproval]) VALUES (8, 1, 1239874, N'2020-02-01', N'2020-07-12', NULL)
INSERT [dbo].[CarRentalFields] ([ID], [UserID], [LicensePlateNumber], [RentalStartDate], [ReturnCarDate], [ReturnCarDateApproval]) VALUES (9, 5, 1132353, N'2020-01-01', N'2020-05-20', NULL)
INSERT [dbo].[CarRentalFields] ([ID], [UserID], [LicensePlateNumber], [RentalStartDate], [ReturnCarDate], [ReturnCarDateApproval]) VALUES (10, 6, 1121515, N'2020-04-01', N'2020-05-25', NULL)
SET IDENTITY_INSERT [dbo].[CarRentalFields] OFF
SET IDENTITY_INSERT [dbo].[CarTypes] ON 

INSERT [dbo].[CarTypes] ([ID], [CarTypeID], [ManufacturerName], [Model], [DailyCost], [DailyMonetaryFine], [ManufactureYear], [GearBox]) VALUES (NULL, 1, N'Alfa Romeo', N'4C', 250, 300, 2015, N'אוטומטית')
INSERT [dbo].[CarTypes] ([ID], [CarTypeID], [ManufacturerName], [Model], [DailyCost], [DailyMonetaryFine], [ManufactureYear], [GearBox]) VALUES (NULL, 2, N'Audi', N'Q3', 250, 300, 2020, N'אוטומטית')
INSERT [dbo].[CarTypes] ([ID], [CarTypeID], [ManufacturerName], [Model], [DailyCost], [DailyMonetaryFine], [ManufactureYear], [GearBox]) VALUES (NULL, 3, N'BMW', N'i8', 250, 300, 2015, N'ידנית')
INSERT [dbo].[CarTypes] ([ID], [CarTypeID], [ManufacturerName], [Model], [DailyCost], [DailyMonetaryFine], [ManufactureYear], [GearBox]) VALUES (NULL, 4, N'Fiat', N'Hatchback', 180, 230, 2019, N'אוטומטית')
INSERT [dbo].[CarTypes] ([ID], [CarTypeID], [ManufacturerName], [Model], [DailyCost], [DailyMonetaryFine], [ManufactureYear], [GearBox]) VALUES (NULL, 5, N'Ford', N'Old Ford GT', 130, 180, 1970, N'אוטומטית')
INSERT [dbo].[CarTypes] ([ID], [CarTypeID], [ManufacturerName], [Model], [DailyCost], [DailyMonetaryFine], [ManufactureYear], [GearBox]) VALUES (NULL, 6, N'Honda', N'Civic', 150, 200, 2015, N'ידנית')
INSERT [dbo].[CarTypes] ([ID], [CarTypeID], [ManufacturerName], [Model], [DailyCost], [DailyMonetaryFine], [ManufactureYear], [GearBox]) VALUES (NULL, 7, N'Hyundai', N'Azera', 180, 230, 2017, N'אוטומטית')
INSERT [dbo].[CarTypes] ([ID], [CarTypeID], [ManufacturerName], [Model], [DailyCost], [DailyMonetaryFine], [ManufactureYear], [GearBox]) VALUES (NULL, 8, N'Kia', N'Sorento SUV', 160, 210, 2002, N'אוטומטית')
INSERT [dbo].[CarTypes] ([ID], [CarTypeID], [ManufacturerName], [Model], [DailyCost], [DailyMonetaryFine], [ManufactureYear], [GearBox]) VALUES (NULL, 9, N'Lamborghini', N'Veneno Roadster', 250, 300, 2019, N'אוטומטית')
INSERT [dbo].[CarTypes] ([ID], [CarTypeID], [ManufacturerName], [Model], [DailyCost], [DailyMonetaryFine], [ManufactureYear], [GearBox]) VALUES (NULL, 10, N'Mazda', N'6', 100, 150, 2013, N'אוטומטית')
INSERT [dbo].[CarTypes] ([ID], [CarTypeID], [ManufacturerName], [Model], [DailyCost], [DailyMonetaryFine], [ManufactureYear], [GearBox]) VALUES (NULL, 11, N'Toyota', N'Hybrid', 100, 150, 2015, N'ידנית')
SET IDENTITY_INSERT [dbo].[CarTypes] OFF
SET IDENTITY_INSERT [dbo].[UserFields] ON 

INSERT [dbo].[UserFields] ([ID], [DriverLicense], [Username], [Password], [FullName], [Birthdate], [Gender], [Email], [Thumbnail], [Rank]) VALUES (1, 123456789, N'Car', N'123', N'Employee1', N'1987-07-12', N'זכר', N'Employee1@car.com', NULL, N'1')
INSERT [dbo].[UserFields] ([ID], [DriverLicense], [Username], [Password], [FullName], [Birthdate], [Gender], [Email], [Thumbnail], [Rank]) VALUES (2, 987654321, N'Car2', N'123', N'Employee2', N'1985-04-12', N'נקבה', N'Employee2@car.com', NULL, N'1')
INSERT [dbo].[UserFields] ([ID], [DriverLicense], [Username], [Password], [FullName], [Birthdate], [Gender], [Email], [Thumbnail], [Rank]) VALUES (4, 978465123, N'Vlad', N'a123', N'Vladimir Putin', N'1950-04-01', N'זכר', N'putin@hotmail.com', NULL, N'0')
INSERT [dbo].[UserFields] ([ID], [DriverLicense], [Username], [Password], [FullName], [Birthdate], [Gender], [Email], [Thumbnail], [Rank]) VALUES (5, 194567894, N'Bill', N'b234', N'Bill Gates', N'1960-07-11', N'זכר', N'bill@microsoft.com', NULL, N'0')
INSERT [dbo].[UserFields] ([ID], [DriverLicense], [Username], [Password], [FullName], [Birthdate], [Gender], [Email], [Thumbnail], [Rank]) VALUES (6, 198654654, N'Gali', N'd456', N'Galileo', N'1820-11-01', N'זכר', N'Gali@gmail.com', NULL, N'0')
INSERT [dbo].[UserFields] ([ID], [DriverLicense], [Username], [Password], [FullName], [Birthdate], [Gender], [Email], [Thumbnail], [Rank]) VALUES (7, 485614986, N'Nikola', N'e567', N'Nikola Tesla ', N'1840-12-30', N'זכר', N'Nikola@gmail.com', NULL, N'0')
INSERT [dbo].[UserFields] ([ID], [DriverLicense], [Username], [Password], [FullName], [Birthdate], [Gender], [Email], [Thumbnail], [Rank]) VALUES (8, 561618563, N'Thomas', N'f678', N'Thomas Edison', N'1700-12-30', N'זכר', N'Thomas@gmail.com', NULL, N'0')
INSERT [dbo].[UserFields] ([ID], [DriverLicense], [Username], [Password], [FullName], [Birthdate], [Gender], [Email], [Thumbnail], [Rank]) VALUES (23, 123456789, N'Admin', N'1234', N'Joseph Waldman', N'2020-05-29', N'זכר', N'yosi_wa@hotmail.com', NULL, N'2')
SET IDENTITY_INSERT [dbo].[UserFields] OFF
USE [master]
GO
ALTER DATABASE [Database] SET  READ_WRITE 
GO
