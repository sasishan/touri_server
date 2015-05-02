USE [NativusDB]
GO
/****** Object:  Table [dbo].[Attributes]    Script Date: 5/2/2015 2:55:49 AM ******/
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
/****** Object:  Table [dbo].[Connections]    Script Date: 5/2/2015 2:55:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Connections](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](200) NOT NULL,
	[connectionId] [nvarchar](400) NOT NULL,
	[lastConnected] [datetime] NOT NULL,
 CONSTRAINT [PK_Connections_1] PRIMARY KEY CLUSTERED 
(
	[connectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Expertises]    Script Date: 5/2/2015 2:55:49 AM ******/
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
/****** Object:  Table [dbo].[Fluency]    Script Date: 5/2/2015 2:55:49 AM ******/
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
/****** Object:  Table [dbo].[GuideExpertises]    Script Date: 5/2/2015 2:55:49 AM ******/
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
/****** Object:  Table [dbo].[GuideLanguages]    Script Date: 5/2/2015 2:55:49 AM ******/
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
/****** Object:  Table [dbo].[GuideLocations]    Script Date: 5/2/2015 2:55:49 AM ******/
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
/****** Object:  Table [dbo].[GuideProfile]    Script Date: 5/2/2015 2:55:49 AM ******/
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
 CONSTRAINT [PK_GuideProfile] PRIMARY KEY CLUSTERED 
(
	[guideId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_GuideProfile] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Languages]    Script Date: 5/2/2015 2:55:49 AM ******/
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
/****** Object:  Table [dbo].[ReviewedAttributes]    Script Date: 5/2/2015 2:55:49 AM ******/
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
/****** Object:  Table [dbo].[Reviews]    Script Date: 5/2/2015 2:55:49 AM ******/
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
/****** Object:  Table [dbo].[TouriImages]    Script Date: 5/2/2015 2:55:49 AM ******/
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
/****** Object:  Table [dbo].[TravellerProfile]    Script Date: 5/2/2015 2:55:49 AM ******/
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
