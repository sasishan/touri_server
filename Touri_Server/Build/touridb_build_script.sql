USE [master]
GO
/****** Object:  Database [TouriDB]    Script Date: 5/14/2015 3:28:16 AM ******/
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
/****** Object:  Table [dbo].[Attributes]    Script Date: 5/14/2015 3:28:16 AM ******/
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
/****** Object:  Table [dbo].[Connections]    Script Date: 5/14/2015 3:28:16 AM ******/
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
/****** Object:  Table [dbo].[Expertises]    Script Date: 5/14/2015 3:28:16 AM ******/
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
/****** Object:  Table [dbo].[Fluency]    Script Date: 5/14/2015 3:28:16 AM ******/
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
/****** Object:  Table [dbo].[GuideExpertises]    Script Date: 5/14/2015 3:28:16 AM ******/
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
/****** Object:  Table [dbo].[GuideLanguages]    Script Date: 5/14/2015 3:28:16 AM ******/
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
/****** Object:  Table [dbo].[GuideLocations]    Script Date: 5/14/2015 3:28:16 AM ******/
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
/****** Object:  Table [dbo].[GuideProfile]    Script Date: 5/14/2015 3:28:16 AM ******/
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
/****** Object:  Table [dbo].[GuideProfileImages]    Script Date: 5/14/2015 3:28:16 AM ******/
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
/****** Object:  Table [dbo].[Languages]    Script Date: 5/14/2015 3:28:16 AM ******/
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
/****** Object:  Table [dbo].[ReviewedAttributes]    Script Date: 5/14/2015 3:28:16 AM ******/
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
/****** Object:  Table [dbo].[Reviews]    Script Date: 5/14/2015 3:28:16 AM ******/
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
/****** Object:  Table [dbo].[TouriImages]    Script Date: 5/14/2015 3:28:16 AM ******/
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
/****** Object:  Table [dbo].[TravellerProfile]    Script Date: 5/14/2015 3:28:16 AM ******/
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

INSERT [dbo].[Expertises] ([expertiseId], [expertise], [description], [imageId]) VALUES (1, N'Hot Spots', N'Knowledge of interesting and fun spots around town', 5)
INSERT [dbo].[Expertises] ([expertiseId], [expertise], [description], [imageId]) VALUES (2, N'Museums', N'Knowledge of museum locations, history and ability to provide guidance', 7)
INSERT [dbo].[Expertises] ([expertiseId], [expertise], [description], [imageId]) VALUES (4, N'Restaurants', N'Knowledge of unique restaurants and foods in the area', 12)
INSERT [dbo].[Expertises] ([expertiseId], [expertise], [description], [imageId]) VALUES (5, N'Landmarks', N'Landmarks in area', 7)
INSERT [dbo].[Expertises] ([expertiseId], [expertise], [description], [imageId]) VALUES (6, N'Local life', N'Knowledge of local life', 2)
INSERT [dbo].[Expertises] ([expertiseId], [expertise], [description], [imageId]) VALUES (7, N'Outdoors', N'Ability to take people outdoors on adventures', 11)
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
INSERT [dbo].[GuideExpertises] ([id], [guideId], [expertiseId]) VALUES (6, 7, 7)
INSERT [dbo].[GuideExpertises] ([id], [guideId], [expertiseId]) VALUES (7, 7, 1)
INSERT [dbo].[GuideExpertises] ([id], [guideId], [expertiseId]) VALUES (8, 8, 1)
INSERT [dbo].[GuideExpertises] ([id], [guideId], [expertiseId]) VALUES (9, 8, 7)
INSERT [dbo].[GuideExpertises] ([id], [guideId], [expertiseId]) VALUES (10, 9, 1)
SET IDENTITY_INSERT [dbo].[GuideExpertises] OFF
SET IDENTITY_INSERT [dbo].[GuideLanguages] ON 

INSERT [dbo].[GuideLanguages] ([id], [guideId], [languageId], [fluency]) VALUES (3, 2, 1, 4)
INSERT [dbo].[GuideLanguages] ([id], [guideId], [languageId], [fluency]) VALUES (4, 3, 1, 4)
INSERT [dbo].[GuideLanguages] ([id], [guideId], [languageId], [fluency]) VALUES (5, 3, 5, 4)
INSERT [dbo].[GuideLanguages] ([id], [guideId], [languageId], [fluency]) VALUES (6, 7, 1, 4)
INSERT [dbo].[GuideLanguages] ([id], [guideId], [languageId], [fluency]) VALUES (7, 7, 6, 4)
INSERT [dbo].[GuideLanguages] ([id], [guideId], [languageId], [fluency]) VALUES (8, 8, 1, 4)
INSERT [dbo].[GuideLanguages] ([id], [guideId], [languageId], [fluency]) VALUES (9, 8, 3, 4)
INSERT [dbo].[GuideLanguages] ([id], [guideId], [languageId], [fluency]) VALUES (10, 8, 2, 4)
INSERT [dbo].[GuideLanguages] ([id], [guideId], [languageId], [fluency]) VALUES (11, 9, 1, 4)
INSERT [dbo].[GuideLanguages] ([id], [guideId], [languageId], [fluency]) VALUES (12, 9, 4, 4)
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
SET IDENTITY_INSERT [dbo].[GuideLocations] OFF
SET IDENTITY_INSERT [dbo].[GuideProfile] ON 

INSERT [dbo].[GuideProfile] ([guideId], [username], [firstName], [lastName], [phone], [address1], [address2], [description], [profileImage], [summary]) VALUES (2, N'guide3@gmail.com', N'John', N'Smith', NULL, N'', N'', N'I am an expert in the history of Toronto and GTA in general. 

I know the Toronto region very well and can take you through the area.
', 20, NULL)
INSERT [dbo].[GuideProfile] ([guideId], [username], [firstName], [lastName], [phone], [address1], [address2], [description], [profileImage], [summary]) VALUES (3, N'guide4@gmail.com', N'James', N'Johnson', NULL, N'', N'', N'Expert in the golden horseshoe area of Ontario', 14, NULL)
INSERT [dbo].[GuideProfile] ([guideId], [username], [firstName], [lastName], [phone], [address1], [address2], [description], [profileImage], [summary]) VALUES (7, N'guide5@gmail.com', N'Sasi', N'Theking', NULL, N'', N'', N'', 18, NULL)
INSERT [dbo].[GuideProfile] ([guideId], [username], [firstName], [lastName], [phone], [address1], [address2], [description], [profileImage], [summary]) VALUES (8, N'guide6@gmail.com', N'sasu', N'vv', NULL, N'', N'', N'', 1, NULL)
INSERT [dbo].[GuideProfile] ([guideId], [username], [firstName], [lastName], [phone], [address1], [address2], [description], [profileImage], [summary]) VALUES (9, N'igorsi@gmail.com', N'Igor', N'Si', NULL, N'', N'', N'', 1, NULL)
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
SET IDENTITY_INSERT [dbo].[TouriImages] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_GuideProfile]    Script Date: 5/14/2015 3:28:16 AM ******/
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
