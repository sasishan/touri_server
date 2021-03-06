USE [master]
GO
/****** Object:  Database [TouriDB]    Script Date: 5/31/2015 9:01:46 PM ******/
CREATE DATABASE [TouriDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TouriDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\TouriDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TouriDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\TouriDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TouriDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TouriDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TouriDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TouriDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TouriDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TouriDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TouriDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TouriDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TouriDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TouriDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TouriDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TouriDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TouriDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TouriDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TouriDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TouriDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TouriDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TouriDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TouriDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TouriDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TouriDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TouriDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TouriDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TouriDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TouriDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TouriDB] SET  MULTI_USER 
GO
ALTER DATABASE [TouriDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TouriDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TouriDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TouriDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TouriDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [TouriDB]
GO
/****** Object:  Table [dbo].[Attributes]    Script Date: 5/31/2015 9:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attributes](
	[AttributeId] [int] IDENTITY(1,1) NOT NULL,
	[AttributeName] [nvarchar](500) NOT NULL,
	[AttributeDescription] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ReviewAttributes] PRIMARY KEY CLUSTERED 
(
	[AttributeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Connections]    Script Date: 5/31/2015 9:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Connections](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](200) NOT NULL,
	[connectionId] [nvarchar](400) NULL,
	[lastConnected] [datetime] NOT NULL,
 CONSTRAINT [PK_Connections_1] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Expertises]    Script Date: 5/31/2015 9:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expertises](
	[expertiseId] [int] IDENTITY(1,1) NOT NULL,
	[expertise] [nvarchar](500) NOT NULL,
	[description] [nvarchar](500) NULL,
	[imageId] [int] NULL,
 CONSTRAINT [PK_Expertises] PRIMARY KEY CLUSTERED 
(
	[expertiseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Fluency]    Script Date: 5/31/2015 9:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fluency](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fluency] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Fluency] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GuideExpertises]    Script Date: 5/31/2015 9:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GuideExpertises](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[guideId] [int] NOT NULL,
	[expertiseId] [int] NOT NULL,
 CONSTRAINT [PK_GuideExpertises] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GuideLanguages]    Script Date: 5/31/2015 9:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GuideLanguages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[guideId] [int] NOT NULL,
	[languageId] [int] NOT NULL,
	[fluency] [int] NOT NULL,
 CONSTRAINT [PK_GuideLanguages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GuideLocations]    Script Date: 5/31/2015 9:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GuideLocations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[guideId] [int] NOT NULL,
	[cityServed] [nvarchar](1000) NOT NULL,
	[latitude] [float] NOT NULL,
	[longitude] [float] NOT NULL,
 CONSTRAINT [PK_GuideLocations_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GuideProfile]    Script Date: 5/31/2015 9:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GuideProfile](
	[guideId] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[firstName] [nvarchar](500) NULL,
	[lastName] [nvarchar](500) NULL,
	[phone] [nvarchar](50) NULL,
	[address1] [nvarchar](500) NULL,
	[address2] [nvarchar](500) NULL,
	[description] [nvarchar](max) NULL,
	[profileImage] [int] NOT NULL,
	[summary] [nvarchar](500) NULL,
 CONSTRAINT [PK_GuideProfile] PRIMARY KEY CLUSTERED 
(
	[guideId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GuideProfileImages]    Script Date: 5/31/2015 9:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GuideProfileImages](
	[guideId] [int] NOT NULL,
	[imageId] [int] NOT NULL,
 CONSTRAINT [PK_GuideProfileImages] PRIMARY KEY CLUSTERED 
(
	[guideId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Languages]    Script Date: 5/31/2015 9:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[LanguageId] [int] IDENTITY(1,1) NOT NULL,
	[Language] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Messages]    Script Date: 5/31/2015 9:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[toUser] [nvarchar](200) NOT NULL,
	[fromUser] [nvarchar](200) NOT NULL,
	[message] [nvarchar](max) NOT NULL,
	[Timestamp] [datetime] NOT NULL,
	[Downloaded] [nvarchar](4) NOT NULL,
	[LastDownloaded] [datetime] NULL CONSTRAINT [DF_Messages_LastDownloaded]  DEFAULT (NULL),
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReviewedAttributes]    Script Date: 5/31/2015 9:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReviewedAttributes](
	[ReviewId] [int] IDENTITY(1,1) NOT NULL,
	[AttributeId] [int] NOT NULL,
	[Rating] [int] NOT NULL,
	[ReviewComments] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ReviewedAttributes] PRIMARY KEY CLUSTERED 
(
	[ReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 5/31/2015 9:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[ReviewId] [int] IDENTITY(1,1) NOT NULL,
	[GuideId] [int] NOT NULL,
	[TravellerId] [int] NOT NULL,
	[ReviewDate] [date] NOT NULL,
	[GuideExperienceDate] [date] NOT NULL,
	[ReviewComments] [nvarchar](max) NULL,
 CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED 
(
	[ReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TouriImages]    Script Date: 5/31/2015 9:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TouriImages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[filename] [nvarchar](100) NOT NULL,
	[extension] [nvarchar](50) NOT NULL,
	[path] [nvarchar](500) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[dateuploaded] [date] NOT NULL,
	[category] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TravellerProfile]    Script Date: 5/31/2015 9:01:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TravellerProfile](
	[travellerId] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](100) NOT NULL,
	[firstName] [nvarchar](500) NULL,
	[lastName] [nvarchar](500) NULL,
	[phone] [nvarchar](100) NULL,
 CONSTRAINT [PK_TravellerProfile] PRIMARY KEY CLUSTERED 
(
	[travellerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Expertises] ON 

INSERT [dbo].[Expertises] ([expertiseId], [expertise], [description], [imageId]) VALUES (1, N'Cool and Unique', N'Knowledge of interesting and fun spots around town', 5)
INSERT [dbo].[Expertises] ([expertiseId], [expertise], [description], [imageId]) VALUES (2, N'Food, Drinks and Fun', N'Knowledge of museum locations, history and ability to provide guidance', 7)
INSERT [dbo].[Expertises] ([expertiseId], [expertise], [description], [imageId]) VALUES (4, N'Art and Museums', N'Knowledge of unique restaurants and foods in the area', 12)
INSERT [dbo].[Expertises] ([expertiseId], [expertise], [description], [imageId]) VALUES (5, N'History', N'Landmarks in area', 7)
INSERT [dbo].[Expertises] ([expertiseId], [expertise], [description], [imageId]) VALUES (6, N'Outdoors', N'Knowledge of local life', 2)
INSERT [dbo].[Expertises] ([expertiseId], [expertise], [description], [imageId]) VALUES (7, N'Special Events', N'Ability to take people outdoors on adventures', 11)
SET IDENTITY_INSERT [dbo].[Expertises] OFF
SET IDENTITY_INSERT [dbo].[Fluency] ON 

INSERT [dbo].[Fluency] ([id], [fluency], [description]) VALUES (1, N'Basic', N'Basic Fluency')
INSERT [dbo].[Fluency] ([id], [fluency], [description]) VALUES (2, N'Intermediate', N'Intermediate')
INSERT [dbo].[Fluency] ([id], [fluency], [description]) VALUES (3, N'Regular', N'Regular fluency')
INSERT [dbo].[Fluency] ([id], [fluency], [description]) VALUES (4, N'Fluent', N'Very advanced and fluent')
SET IDENTITY_INSERT [dbo].[Fluency] OFF
SET IDENTITY_INSERT [dbo].[GuideExpertises] ON 

INSERT [dbo].[GuideExpertises] ([id], [guideId], [expertiseId]) VALUES (1, 2, 2)
INSERT [dbo].[GuideExpertises] ([id], [guideId], [expertiseId]) VALUES (2, 2, 7)
INSERT [dbo].[GuideExpertises] ([id], [guideId], [expertiseId]) VALUES (3, 3, 1)
INSERT [dbo].[GuideExpertises] ([id], [guideId], [expertiseId]) VALUES (4, 3, 7)
INSERT [dbo].[GuideExpertises] ([id], [guideId], [expertiseId]) VALUES (5, 3, 6)
INSERT [dbo].[GuideExpertises] ([id], [guideId], [expertiseId]) VALUES (8, 8, 1)
INSERT [dbo].[GuideExpertises] ([id], [guideId], [expertiseId]) VALUES (9, 8, 7)
INSERT [dbo].[GuideExpertises] ([id], [guideId], [expertiseId]) VALUES (10, 9, 1)
INSERT [dbo].[GuideExpertises] ([id], [guideId], [expertiseId]) VALUES (11, 10, 7)
INSERT [dbo].[GuideExpertises] ([id], [guideId], [expertiseId]) VALUES (12, 10, 1)
INSERT [dbo].[GuideExpertises] ([id], [guideId], [expertiseId]) VALUES (13, 11, 1)
INSERT [dbo].[GuideExpertises] ([id], [guideId], [expertiseId]) VALUES (44, 12, 1)
INSERT [dbo].[GuideExpertises] ([id], [guideId], [expertiseId]) VALUES (45, 12, 2)
INSERT [dbo].[GuideExpertises] ([id], [guideId], [expertiseId]) VALUES (46, 12, 4)
INSERT [dbo].[GuideExpertises] ([id], [guideId], [expertiseId]) VALUES (47, 7, 1)
INSERT [dbo].[GuideExpertises] ([id], [guideId], [expertiseId]) VALUES (48, 7, 7)
INSERT [dbo].[GuideExpertises] ([id], [guideId], [expertiseId]) VALUES (49, 7, 4)
INSERT [dbo].[GuideExpertises] ([id], [guideId], [expertiseId]) VALUES (50, 7, 6)
SET IDENTITY_INSERT [dbo].[GuideExpertises] OFF
SET IDENTITY_INSERT [dbo].[GuideLanguages] ON 

INSERT [dbo].[GuideLanguages] ([id], [guideId], [languageId], [fluency]) VALUES (3, 2, 1, 4)
INSERT [dbo].[GuideLanguages] ([id], [guideId], [languageId], [fluency]) VALUES (4, 3, 1, 4)
INSERT [dbo].[GuideLanguages] ([id], [guideId], [languageId], [fluency]) VALUES (5, 3, 5, 4)
INSERT [dbo].[GuideLanguages] ([id], [guideId], [languageId], [fluency]) VALUES (8, 8, 1, 4)
INSERT [dbo].[GuideLanguages] ([id], [guideId], [languageId], [fluency]) VALUES (9, 8, 3, 4)
INSERT [dbo].[GuideLanguages] ([id], [guideId], [languageId], [fluency]) VALUES (10, 8, 2, 4)
INSERT [dbo].[GuideLanguages] ([id], [guideId], [languageId], [fluency]) VALUES (11, 9, 1, 4)
INSERT [dbo].[GuideLanguages] ([id], [guideId], [languageId], [fluency]) VALUES (12, 9, 4, 4)
INSERT [dbo].[GuideLanguages] ([id], [guideId], [languageId], [fluency]) VALUES (13, 10, 1, 4)
INSERT [dbo].[GuideLanguages] ([id], [guideId], [languageId], [fluency]) VALUES (14, 10, 3, 4)
INSERT [dbo].[GuideLanguages] ([id], [guideId], [languageId], [fluency]) VALUES (15, 10, 6, 4)
INSERT [dbo].[GuideLanguages] ([id], [guideId], [languageId], [fluency]) VALUES (16, 11, 1, 4)
INSERT [dbo].[GuideLanguages] ([id], [guideId], [languageId], [fluency]) VALUES (17, 11, 3, 4)
INSERT [dbo].[GuideLanguages] ([id], [guideId], [languageId], [fluency]) VALUES (18, 11, 5, 4)
INSERT [dbo].[GuideLanguages] ([id], [guideId], [languageId], [fluency]) VALUES (19, 11, 6, 4)
INSERT [dbo].[GuideLanguages] ([id], [guideId], [languageId], [fluency]) VALUES (27, 12, 1, 4)
INSERT [dbo].[GuideLanguages] ([id], [guideId], [languageId], [fluency]) VALUES (31, 7, 1, 4)
INSERT [dbo].[GuideLanguages] ([id], [guideId], [languageId], [fluency]) VALUES (32, 7, 6, 4)
SET IDENTITY_INSERT [dbo].[GuideLanguages] OFF
SET IDENTITY_INSERT [dbo].[GuideLocations] ON 

INSERT [dbo].[GuideLocations] ([id], [guideId], [cityServed], [latitude], [longitude]) VALUES (1, 2, N'Toronto, ON, Canada', 43.653226, -79.3831843)
INSERT [dbo].[GuideLocations] ([id], [guideId], [cityServed], [latitude], [longitude]) VALUES (2, 3, N'Niagara-on-the-Lake, ON, Canada', 43.2549988, -79.0772616)
INSERT [dbo].[GuideLocations] ([id], [guideId], [cityServed], [latitude], [longitude]) VALUES (3, 3, N'Niagara Falls, ON, Canada', 43.0895577, -79.0849436)
INSERT [dbo].[GuideLocations] ([id], [guideId], [cityServed], [latitude], [longitude]) VALUES (4, 7, N'Toronto, ON, Canada', 43.653226, -79.3831843)
INSERT [dbo].[GuideLocations] ([id], [guideId], [cityServed], [latitude], [longitude]) VALUES (5, 7, N'Pickering, ON, Canada', 43.8384117, -79.0867579)
INSERT [dbo].[GuideLocations] ([id], [guideId], [cityServed], [latitude], [longitude]) VALUES (6, 8, N'Toronto, ON, Canada', 43.653226, -79.3831843)
INSERT [dbo].[GuideLocations] ([id], [guideId], [cityServed], [latitude], [longitude]) VALUES (7, 8, N'Pickering, ON, Canada', 43.8384117, -79.0867579)
INSERT [dbo].[GuideLocations] ([id], [guideId], [cityServed], [latitude], [longitude]) VALUES (8, 9, N'Leslieville, Toronto, ON, Canada', 43.6658467, -79.3324733)
INSERT [dbo].[GuideLocations] ([id], [guideId], [cityServed], [latitude], [longitude]) VALUES (9, 9, N'Richmond Hill, ON, Canada', 43.8828401, -79.4402808)
INSERT [dbo].[GuideLocations] ([id], [guideId], [cityServed], [latitude], [longitude]) VALUES (10, 10, N'Phuket Thailand', 7.9519331, 98.3380884)
INSERT [dbo].[GuideLocations] ([id], [guideId], [cityServed], [latitude], [longitude]) VALUES (11, 10, N'Colombo, Western Province, Sri Lanka', 6.9270786, 79.861243)
INSERT [dbo].[GuideLocations] ([id], [guideId], [cityServed], [latitude], [longitude]) VALUES (12, 11, N'Leslieville, Toronto, ON, Canada', 43.6658467, -79.3324733)
INSERT [dbo].[GuideLocations] ([id], [guideId], [cityServed], [latitude], [longitude]) VALUES (13, 11, N'Toronto, ON, Canada', 43.653226, -79.3831843)
INSERT [dbo].[GuideLocations] ([id], [guideId], [cityServed], [latitude], [longitude]) VALUES (28, 12, N'Ajax, ON, Canada', 43.8508553, -79.0203732)
INSERT [dbo].[GuideLocations] ([id], [guideId], [cityServed], [latitude], [longitude]) VALUES (29, 12, N'Pickering, ON, Canada', 43.8384117, -79.0867579)
INSERT [dbo].[GuideLocations] ([id], [guideId], [cityServed], [latitude], [longitude]) VALUES (30, 12, N'Ottawa, ON, Canada', 45.4215296, -75.6971931)
INSERT [dbo].[GuideLocations] ([id], [guideId], [cityServed], [latitude], [longitude]) VALUES (31, 12, N'Toronto, ON, Canada', 43.653226, -79.3831843)
SET IDENTITY_INSERT [dbo].[GuideLocations] OFF
SET IDENTITY_INSERT [dbo].[GuideProfile] ON 

INSERT [dbo].[GuideProfile] ([guideId], [username], [firstName], [lastName], [phone], [address1], [address2], [description], [profileImage], [summary]) VALUES (2, N'guide3@gmail.com', N'John', N'Smith', NULL, N'', N'', N'I am an expert in the history of Toronto and GTA in general. 

I know the Toronto region very well and can take you through the area.
', 20, NULL)
INSERT [dbo].[GuideProfile] ([guideId], [username], [firstName], [lastName], [phone], [address1], [address2], [description], [profileImage], [summary]) VALUES (3, N'guide4@gmail.com', N'James', N'Johnson', NULL, N'', N'', N'Expert in the golden horseshoe area of Ontario', 14, NULL)
INSERT [dbo].[GuideProfile] ([guideId], [username], [firstName], [lastName], [phone], [address1], [address2], [description], [profileImage], [summary]) VALUES (7, N'guide5@gmail.com', N'Sasi', N'Theking', NULL, N'', N'', N'I''m very familiar with the GTA area and outlying suburbs. Happy to discuss cool must see places via chat.', 18, N'this is my summary')
INSERT [dbo].[GuideProfile] ([guideId], [username], [firstName], [lastName], [phone], [address1], [address2], [description], [profileImage], [summary]) VALUES (8, N'guide6@gmail.com', N'sasu', N'vv', NULL, N'', N'', N'', 1, NULL)
INSERT [dbo].[GuideProfile] ([guideId], [username], [firstName], [lastName], [phone], [address1], [address2], [description], [profileImage], [summary]) VALUES (9, N'igorsi@gmail.com', N'Igor', N'Si', NULL, N'', N'', N'', 1, NULL)
INSERT [dbo].[GuideProfile] ([guideId], [username], [firstName], [lastName], [phone], [address1], [address2], [description], [profileImage], [summary]) VALUES (10, N'guide7@gmail.com', N'Unes', N'Bala', NULL, N'', N'', N'I know sri lanka very well.', 21, N'')
INSERT [dbo].[GuideProfile] ([guideId], [username], [firstName], [lastName], [phone], [address1], [address2], [description], [profileImage], [summary]) VALUES (11, N'guide8@gmail.com', N'Bob', N'Hart', NULL, N'', N'', N'', 1, N'')
INSERT [dbo].[GuideProfile] ([guideId], [username], [firstName], [lastName], [phone], [address1], [address2], [description], [profileImage], [summary]) VALUES (12, N'guide20@gmail.com', N'Jude', N'Law', NULL, N'', N'', N'', 22, N'I am a guide')
SET IDENTITY_INSERT [dbo].[GuideProfile] OFF
SET IDENTITY_INSERT [dbo].[Languages] ON 

INSERT [dbo].[Languages] ([LanguageId], [Language]) VALUES (1, N'English')
INSERT [dbo].[Languages] ([LanguageId], [Language]) VALUES (2, N'French')
INSERT [dbo].[Languages] ([LanguageId], [Language]) VALUES (3, N'Tamil')
INSERT [dbo].[Languages] ([LanguageId], [Language]) VALUES (4, N'Macedonian')
INSERT [dbo].[Languages] ([LanguageId], [Language]) VALUES (5, N'Croatian')
INSERT [dbo].[Languages] ([LanguageId], [Language]) VALUES (6, N'Turkish')
INSERT [dbo].[Languages] ([LanguageId], [Language]) VALUES (7, N'Italian')
SET IDENTITY_INSERT [dbo].[Languages] OFF
SET IDENTITY_INSERT [dbo].[Messages] ON 

INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (6, N'guide5@gmail.com', N'traveller1@gmail.com', N'Hi guide.. could you help me find a good tims', CAST(N'2015-05-25 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-25 20:21:14.543' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (7, N'guide5@gmail.com', N'traveller1@gmail.com', N'my number is xxxxxxb', CAST(N'2015-05-25 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-25 20:21:14.543' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (8, N'traveller1@gmail.com', N'guide5@gmail.com', N'sure I''ll call u tonight', CAST(N'2015-05-25 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-25 21:10:18.493' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (9, N'traveller1@gmail.com', N'guide5@gmail.com', N'what time is good?', CAST(N'2015-05-25 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-25 21:10:18.493' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (10, N'guide5@gmail.com', N'traveller1@gmail.com', N'how about 330?', CAST(N'2015-05-25 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-25 21:43:06.873' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (11, N'guide5@gmail.com', N'traveller1@gmail.com', N'how about 33', CAST(N'2015-05-25 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-25 21:43:06.873' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (12, N'guide5@gmail.com', N'traveller1@gmail.com', N'hi', CAST(N'2015-05-25 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-25 21:43:06.873' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (13, N'guide5@gmail.com', N'traveller1@gmail.com', N'can you help me find a solid place to stay tonight', CAST(N'2015-05-25 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-25 21:43:06.873' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (14, N'guide5@gmail.com', N'traveller1@gmail.com', N'how about in pickering?', CAST(N'2015-05-25 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-25 21:43:06.873' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (15, N'guide5@gmail.com', N'traveller1@gmail.com', N'hi', CAST(N'2015-05-25 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-25 21:43:06.873' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (16, N'guide5@gmail.com', N'traveller1@gmail.com', N'time is now 942', CAST(N'2015-05-25 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-25 21:43:06.873' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (17, N'traveller1@gmail.com', N'guide5@gmail.com', N'its now 953pm', CAST(N'2015-05-25 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-25 22:19:45.347' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (18, N'traveller1@gmail.com', N'guide5@gmail.com', N'its 956pm now', CAST(N'2015-05-25 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-25 22:19:45.347' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (19, N'traveller1@gmail.com', N'guide5@gmail.com', N'it''s 959', CAST(N'2015-05-25 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-25 22:19:45.347' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (20, N'guide5@gmail.com', N'traveller1@gmail.com', N'hey what''s up', CAST(N'2015-05-25 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-25 22:20:40.360' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (21, N'traveller1@gmail.com', N'guide5@gmail.com', N'yo', CAST(N'2015-05-25 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-26 21:07:41.753' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (22, N'guide5@gmail.com', N'guide3@gmail.com', N'hi mab', CAST(N'2015-05-26 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-26 00:11:47.637' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (23, N'guide5@gmail.com', N'guide3@gmail.com', N'hope all is well?', CAST(N'2015-05-26 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-26 00:11:47.637' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (24, N'guide3@gmail.com', N'guide5@gmail.com', N'can''t complain', CAST(N'2015-05-26 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-26 20:03:23.787' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (25, N'guide5@gmail.com', N'guide3@gmail.com', N'yo', CAST(N'2015-05-26 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-26 20:57:45.010' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (26, N'guide5@gmail.com', N'guide3@gmail.com', N'hi', CAST(N'2015-05-26 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-26 20:57:45.010' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (27, N'guide5@gmail.com', N'guide3@gmail.com', N'akira', CAST(N'2015-05-26 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-26 20:57:45.010' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (28, N'guide5@gmail.com', N'guide3@gmail.com', N'let''s chat', CAST(N'2015-05-26 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-26 20:57:45.010' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (29, N'guide3@gmail.com', N'guide5@gmail.com', N'sure what''s a good time?', CAST(N'2015-05-26 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-26 22:01:10.730' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (30, N'guide3@gmail.com', N'guide5@gmail.com', N'how about 9pm?', CAST(N'2015-05-26 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-26 22:01:10.730' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (31, N'traveller1@gmail.com', N'guide5@gmail.com', N'hey', CAST(N'2015-05-26 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-26 21:07:41.753' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (32, N'guide3@gmail.com', N'guide5@gmail.com', N'I''ll be there at 10', CAST(N'2015-05-26 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-26 22:01:10.730' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (33, N'guide5@gmail.com', N'traveller1@gmail.com', N'shall we meet later tonight?', CAST(N'2015-05-26 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-26 21:45:33.140' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (34, N'guide5@gmail.com', N'traveller1@gmail.com', N'I can be free at 11pm', CAST(N'2015-05-26 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-26 21:45:33.140' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (35, N'guide6@gmail.com', N'traveller1@gmail.com', N'hi', CAST(N'2015-05-26 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-26 21:17:54.387' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (36, N'guide6@gmail.com', N'traveller1@gmail.com', N'sasi', CAST(N'2015-05-26 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-26 21:17:54.387' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (37, N'guide5@gmail.com', N'traveller1@gmail.com', N'need to get to downtown toronto', CAST(N'2015-05-26 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-26 21:48:41.270' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (38, N'guide5@gmail.com', N'traveller1@gmail.com', N'can u get me to royal York?', CAST(N'2015-05-26 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-26 21:48:41.270' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (39, N'guide5@gmail.com', N'traveller1@gmail.com', N'hiya ', CAST(N'2015-05-26 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-26 21:55:06.557' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (40, N'traveller1@gmail.com', N'guide5@gmail.com', N'hi ry', CAST(N'2015-05-26 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-26 21:56:09.350' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (41, N'traveller1@gmail.com', N'guide5@gmail.com', N'what''s up', CAST(N'2015-05-26 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-26 21:56:09.350' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (42, N'guide5@gmail.com', N'traveller1@gmail.com', N'hello', CAST(N'2015-05-26 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-26 21:58:16.757' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (43, N'ryhaanbz@hotmail.com', N'guide3@gmail.com', N'do you like the cavaliers', CAST(N'2015-05-26 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-26 22:05:14.910' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (44, N'guide5@gmail.com', N'ryhaanbz@hotmail.com', N'yo', CAST(N'2015-05-26 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-26 23:00:16.900' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (45, N'guide5@gmail.com', N'ryhaanbz@hotmail.com', N'hi', CAST(N'2015-05-26 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-26 23:00:53.937' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (46, N'guide3@gmail.com', N'traveller1@gmail.com', N'hi', CAST(N'2015-05-26 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-26 23:15:18.980' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (47, N'guide3@gmail.com', N'traveller1@gmail.com', N'hello', CAST(N'2015-05-26 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-26 23:15:18.980' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (48, N'guide3@gmail.com', N'traveller1@gmail.com', N'hi', CAST(N'2015-05-26 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-26 23:15:18.980' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (49, N'traveller1@gmail.com', N'guide3@gmail.com', N'sup', CAST(N'2015-05-26 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-26 23:20:22.120' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (50, N'guide3@gmail.com', N'traveller1@gmail.com', N'hi', CAST(N'2015-05-26 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-26 23:42:39.060' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (51, N'traveller1@gmail.com', N'guide3@gmail.com', N'jun', CAST(N'2015-05-26 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-26 23:45:51.813' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (52, N'guide6@gmail.com', N'guide5@gmail.com', N'hi', CAST(N'2015-05-26 00:00:00.000' AS DateTime), N'N', NULL)
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (53, N'guide6@gmail.com', N'guide5@gmail.com', N'test', CAST(N'2015-05-26 00:00:00.000' AS DateTime), N'N', NULL)
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (54, N'guide6@gmail.com', N'guide5@gmail.com', N'test', CAST(N'2015-05-26 00:00:00.000' AS DateTime), N'N', NULL)
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (55, N'guide6@gmail.com', N'guide5@gmail.com', N'lo', CAST(N'2015-05-26 00:00:00.000' AS DateTime), N'N', NULL)
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (56, N'guide6@gmail.com', N'guide5@gmail.com', N'hu', CAST(N'2015-05-27 00:00:00.000' AS DateTime), N'N', NULL)
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (57, N'guide6@gmail.com', N'guide5@gmail.com', N'hi', CAST(N'2015-05-27 00:00:00.000' AS DateTime), N'N', NULL)
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (58, N'guide6@gmail.com', N'guide5@gmail.com', N'yo', CAST(N'2015-05-27 00:00:00.000' AS DateTime), N'N', NULL)
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (59, N'guide5@gmail.com', N'traveller1@gmail.com', N'hey', CAST(N'2015-05-27 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-27 19:47:04.257' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (60, N'guide5@gmail.com', N'traveller1@gmail.com', N'what''s up', CAST(N'2015-05-27 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-27 19:47:04.257' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (61, N'guide5@gmail.com', N'traveller1@gmail.com', N'I''m thinking somewhere in downtown?', CAST(N'2015-05-27 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-27 20:08:53.960' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (62, N'guide5@gmail.com', N'traveller1@gmail.com', N'ok', CAST(N'2015-05-27 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-27 20:09:41.923' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (63, N'guide5@gmail.com', N'traveller1@gmail.com', N'sure..', CAST(N'2015-05-27 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-27 20:09:41.923' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (64, N'guide5@gmail.com', N'traveller1@gmail.com', N'OK let''s meet', CAST(N'2015-05-27 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-27 20:14:05.490' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (65, N'guide5@gmail.com', N'traveller1@gmail.com', N'what time', CAST(N'2015-05-27 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-27 20:15:15.777' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (66, N'guide5@gmail.com', N'traveller1@gmail.com', N'sure', CAST(N'2015-05-27 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-27 20:18:40.773' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (67, N'guide5@gmail.com', N'traveller1@gmail.com', N'had', CAST(N'2015-05-27 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-27 20:18:40.773' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (68, N'guide5@gmail.com', N'traveller1@gmail.com', N'hi', CAST(N'2015-05-27 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-27 20:19:28.420' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (69, N'guide5@gmail.com', N'traveller1@gmail.com', N'hi', CAST(N'2015-05-27 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-27 22:52:26.897' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (70, N'guide3@gmail.com', N'traveller1@gmail.com', N'hey', CAST(N'2015-05-27 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-27 22:50:17.750' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (71, N'traveller1@gmail.com', N'guide5@gmail.com', N'hi', CAST(N'2015-05-27 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-27 22:54:08.227' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (72, N'traveller1@gmail.com', N'guide5@gmail.com', N'what''s up', CAST(N'2015-05-27 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-27 22:54:08.227' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (73, N'guide5@gmail.com', N'guide5@gmail.com', N'hi', CAST(N'2015-05-28 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-28 00:16:17.190' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (74, N'guide5@gmail.com', N'guide5@gmail.com', N'hi', CAST(N'2015-05-28 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-28 00:22:48.253' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (75, N'guide5@gmail.com', N'traveller1@gmail.com', N'hi', CAST(N'2015-05-28 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-28 00:23:51.177' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (76, N'guide5@gmail.com', N'traveller1@gmail.com', N'yo', CAST(N'2015-05-28 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-28 00:23:51.177' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (77, N'guide5@gmail.com', N'traveller1@gmail.com', N'phi', CAST(N'2015-05-28 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-28 00:24:07.077' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (78, N'guide5@gmail.com', N'traveller1@gmail.com', N'hi', CAST(N'2015-05-28 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-28 00:26:14.837' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (79, N'guide5@gmail.com', N'traveller1@gmail.com', N'hi', CAST(N'2015-05-28 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-28 00:46:20.813' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (80, N'guide5@gmail.com', N'traveller1@gmail.com', N'sup', CAST(N'2015-05-28 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-28 00:46:20.813' AS DateTime))
INSERT [dbo].[Messages] ([id], [toUser], [fromUser], [message], [Timestamp], [Downloaded], [LastDownloaded]) VALUES (81, N'traveller1@gmail.com', N'guide5@gmail.com', N'hu', CAST(N'2015-05-28 00:00:00.000' AS DateTime), N'Y', CAST(N'2015-05-28 00:47:04.697' AS DateTime))
SET IDENTITY_INSERT [dbo].[Messages] OFF
SET IDENTITY_INSERT [dbo].[TouriImages] ON 

INSERT [dbo].[TouriImages] ([id], [filename], [extension], [path], [username], [dateuploaded], [category]) VALUES (1, N'defaultprofile', N'.jpg', N'images\application', N'default', CAST(N'2015-05-02' AS Date), N'defaults')
INSERT [dbo].[TouriImages] ([id], [filename], [extension], [path], [username], [dateuploaded], [category]) VALUES (2, N'coffee', N'.jpg', N'images\application', N'default', CAST(N'2015-05-02' AS Date), N'expertise')
INSERT [dbo].[TouriImages] ([id], [filename], [extension], [path], [username], [dateuploaded], [category]) VALUES (5, N'drinks_2', N'.jpg', N'images\application', N'default', CAST(N'2015-05-02' AS Date), N'expertise')
INSERT [dbo].[TouriImages] ([id], [filename], [extension], [path], [username], [dateuploaded], [category]) VALUES (6, N'landmarks_1', N'.jpg', N'images\application', N'default', CAST(N'2015-05-02' AS Date), N'expertise')
INSERT [dbo].[TouriImages] ([id], [filename], [extension], [path], [username], [dateuploaded], [category]) VALUES (7, N'museums_2', N'.jpg', N'images\application', N'default', CAST(N'2015-05-02' AS Date), N'expertise')
INSERT [dbo].[TouriImages] ([id], [filename], [extension], [path], [username], [dateuploaded], [category]) VALUES (9, N'museums', N'.jpg', N'images\application', N'default', CAST(N'2015-05-02' AS Date), N'expertise')
INSERT [dbo].[TouriImages] ([id], [filename], [extension], [path], [username], [dateuploaded], [category]) VALUES (10, N'nightlife_1', N'.jpg', N'images\application', N'default', CAST(N'2015-05-02' AS Date), N'expertise')
INSERT [dbo].[TouriImages] ([id], [filename], [extension], [path], [username], [dateuploaded], [category]) VALUES (11, N'outdoors_1', N'.jpg', N'images\application', N'default', CAST(N'2015-05-02' AS Date), N'expertise')
INSERT [dbo].[TouriImages] ([id], [filename], [extension], [path], [username], [dateuploaded], [category]) VALUES (12, N'restaurants_1', N'.jpg', N'images\application', N'default', CAST(N'2015-05-02' AS Date), N'expertise')
INSERT [dbo].[TouriImages] ([id], [filename], [extension], [path], [username], [dateuploaded], [category]) VALUES (13, N'ainga', N'.jpg', N'images', N'user1', CAST(N'2015-05-02' AS Date), N'guide')
INSERT [dbo].[TouriImages] ([id], [filename], [extension], [path], [username], [dateuploaded], [category]) VALUES (14, N'boj', N'.jpg', N'images', N'user2', CAST(N'2015-05-02' AS Date), N'guide')
INSERT [dbo].[TouriImages] ([id], [filename], [extension], [path], [username], [dateuploaded], [category]) VALUES (15, N'IMG-20150510-WA0001', N'.jpg', N'images', N'guide5@gmail.com', CAST(N'2015-05-12' AS Date), N'guide')
INSERT [dbo].[TouriImages] ([id], [filename], [extension], [path], [username], [dateuploaded], [category]) VALUES (16, N'IMG-20150510-WA0000', N'.jpg', N'images', N'guide5@gmail.com', CAST(N'2015-05-12' AS Date), N'guide')
INSERT [dbo].[TouriImages] ([id], [filename], [extension], [path], [username], [dateuploaded], [category]) VALUES (17, N'IMG_20150415_072739', N'.jpg', N'images', N'guide5@gmail.com', CAST(N'2015-05-12' AS Date), N'guide')
INSERT [dbo].[TouriImages] ([id], [filename], [extension], [path], [username], [dateuploaded], [category]) VALUES (18, N'IMG_20150503_163504', N'.jpg', N'images', N'guide5@gmail.com', CAST(N'2015-05-12' AS Date), N'guide')
INSERT [dbo].[TouriImages] ([id], [filename], [extension], [path], [username], [dateuploaded], [category]) VALUES (19, N'IMG_20150314_195347', N'.jpg', N'images', N'guide3@gmail.com', CAST(N'2015-05-12' AS Date), N'guide')
INSERT [dbo].[TouriImages] ([id], [filename], [extension], [path], [username], [dateuploaded], [category]) VALUES (20, N'IMG_20150306_185203', N'.jpg', N'images', N'guide3@gmail.com', CAST(N'2015-05-12' AS Date), N'guide')
INSERT [dbo].[TouriImages] ([id], [filename], [extension], [path], [username], [dateuploaded], [category]) VALUES (21, N'IMG_20150516_220635', N'.jpg', N'images', N'guide7@gmail.com', CAST(N'2015-05-16' AS Date), N'guide')
INSERT [dbo].[TouriImages] ([id], [filename], [extension], [path], [username], [dateuploaded], [category]) VALUES (22, N'IMG_20150515_122733', N'.jpg', N'images', N'guide20@gmail.com', CAST(N'2015-05-28' AS Date), N'guide')
SET IDENTITY_INSERT [dbo].[TouriImages] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_GuideProfile]    Script Date: 5/31/2015 9:01:46 PM ******/
ALTER TABLE [dbo].[GuideProfile] ADD  CONSTRAINT [IX_GuideProfile] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GuideExpertises]  WITH CHECK ADD  CONSTRAINT [FK_GuideExpertises_Expertises] FOREIGN KEY([expertiseId])
REFERENCES [dbo].[Expertises] ([expertiseId])
GO
ALTER TABLE [dbo].[GuideExpertises] CHECK CONSTRAINT [FK_GuideExpertises_Expertises]
GO
ALTER TABLE [dbo].[GuideExpertises]  WITH CHECK ADD  CONSTRAINT [FK_GuideExpertises_GuideExpertises] FOREIGN KEY([guideId])
REFERENCES [dbo].[GuideProfile] ([guideId])
GO
ALTER TABLE [dbo].[GuideExpertises] CHECK CONSTRAINT [FK_GuideExpertises_GuideExpertises]
GO
ALTER TABLE [dbo].[GuideLanguages]  WITH CHECK ADD  CONSTRAINT [FK_GuideLanguages_Fluency] FOREIGN KEY([fluency])
REFERENCES [dbo].[Fluency] ([id])
GO
ALTER TABLE [dbo].[GuideLanguages] CHECK CONSTRAINT [FK_GuideLanguages_Fluency]
GO
ALTER TABLE [dbo].[GuideLanguages]  WITH CHECK ADD  CONSTRAINT [FK_GuideLanguages_GuideProfile] FOREIGN KEY([guideId])
REFERENCES [dbo].[GuideProfile] ([guideId])
GO
ALTER TABLE [dbo].[GuideLanguages] CHECK CONSTRAINT [FK_GuideLanguages_GuideProfile]
GO
ALTER TABLE [dbo].[GuideLanguages]  WITH CHECK ADD  CONSTRAINT [FK_GuideLanguages_Languages] FOREIGN KEY([languageId])
REFERENCES [dbo].[Languages] ([LanguageId])
GO
ALTER TABLE [dbo].[GuideLanguages] CHECK CONSTRAINT [FK_GuideLanguages_Languages]
GO
ALTER TABLE [dbo].[GuideLocations]  WITH CHECK ADD  CONSTRAINT [FK_GuideLocations_GuideProfile] FOREIGN KEY([guideId])
REFERENCES [dbo].[GuideProfile] ([guideId])
GO
ALTER TABLE [dbo].[GuideLocations] CHECK CONSTRAINT [FK_GuideLocations_GuideProfile]
GO
ALTER TABLE [dbo].[GuideProfile]  WITH CHECK ADD  CONSTRAINT [FK_GuideProfile_Images] FOREIGN KEY([profileImage])
REFERENCES [dbo].[TouriImages] ([id])
GO
ALTER TABLE [dbo].[GuideProfile] CHECK CONSTRAINT [FK_GuideProfile_Images]
GO
ALTER TABLE [dbo].[ReviewedAttributes]  WITH CHECK ADD  CONSTRAINT [FK_ReviewedAttributes_Attribute] FOREIGN KEY([AttributeId])
REFERENCES [dbo].[Attributes] ([AttributeId])
GO
ALTER TABLE [dbo].[ReviewedAttributes] CHECK CONSTRAINT [FK_ReviewedAttributes_Attribute]
GO
ALTER TABLE [dbo].[ReviewedAttributes]  WITH CHECK ADD  CONSTRAINT [FK_ReviewedAttributes_Review] FOREIGN KEY([ReviewId])
REFERENCES [dbo].[Reviews] ([ReviewId])
GO
ALTER TABLE [dbo].[ReviewedAttributes] CHECK CONSTRAINT [FK_ReviewedAttributes_Review]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_GuideId] FOREIGN KEY([GuideId])
REFERENCES [dbo].[GuideProfile] ([guideId])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_GuideId]
GO
USE [master]
GO
ALTER DATABASE [TouriDB] SET  READ_WRITE 
GO


USE [TouriDB]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 6/1/2015 3:53:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 6/1/2015 3:53:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 6/1/2015 3:53:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 6/1/2015 3:53:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 6/1/2015 3:53:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 6/1/2015 3:53:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
USE [TouriDB]
GO
/****** Object:  Table [dbo].[UserLastMessage]    Script Date: 7/1/2015 1:27:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLastMessage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LastDateTime] [datetime] NOT NULL,
	[Username] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_UserLastMessage] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

