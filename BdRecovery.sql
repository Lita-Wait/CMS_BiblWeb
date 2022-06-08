USE [CMS_BiblWebDB]
GO
/****** Object:  Table [dbo].[cmsContentNu]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentNu](
	[nodeId] [int] NOT NULL,
	[published] [bit] NOT NULL,
	[data] [ntext] NULL,
	[rv] [bigint] NOT NULL,
	[dataRaw] [varbinary](max) NULL,
 CONSTRAINT [PK_cmsContentNu] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC,
	[published] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsContentType]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[alias] [nvarchar](255) NULL,
	[icon] [nvarchar](255) NULL,
	[thumbnail] [nvarchar](255) NOT NULL,
	[description] [nvarchar](1500) NULL,
	[isContainer] [bit] NOT NULL,
	[isElement] [bit] NOT NULL,
	[allowAtRoot] [bit] NOT NULL,
	[variations] [int] NOT NULL,
 CONSTRAINT [PK_cmsContentType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsContentType2ContentType]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentType2ContentType](
	[parentContentTypeId] [int] NOT NULL,
	[childContentTypeId] [int] NOT NULL,
 CONSTRAINT [PK_cmsContentType2ContentType] PRIMARY KEY CLUSTERED 
(
	[parentContentTypeId] ASC,
	[childContentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsContentTypeAllowedContentType]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentTypeAllowedContentType](
	[Id] [int] NOT NULL,
	[AllowedId] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_cmsContentTypeAllowedContentType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[AllowedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsDictionary]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDictionary](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[parent] [uniqueidentifier] NULL,
	[key] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_cmsDictionary] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsDocumentType]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDocumentType](
	[contentTypeNodeId] [int] NOT NULL,
	[templateNodeId] [int] NOT NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_cmsDocumentType] PRIMARY KEY CLUSTERED 
(
	[contentTypeNodeId] ASC,
	[templateNodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsLanguageText]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsLanguageText](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[languageId] [int] NOT NULL,
	[UniqueId] [uniqueidentifier] NOT NULL,
	[value] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_cmsLanguageText] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsMacro]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMacro](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uniqueId] [uniqueidentifier] NOT NULL,
	[macroUseInEditor] [bit] NOT NULL,
	[macroRefreshRate] [int] NOT NULL,
	[macroAlias] [nvarchar](255) NOT NULL,
	[macroName] [nvarchar](255) NULL,
	[macroCacheByPage] [bit] NOT NULL,
	[macroCachePersonalized] [bit] NOT NULL,
	[macroDontRender] [bit] NOT NULL,
	[macroSource] [nvarchar](255) NOT NULL,
	[macroType] [int] NOT NULL,
 CONSTRAINT [PK_cmsMacro] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsMacroProperty]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMacroProperty](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uniquePropertyId] [uniqueidentifier] NOT NULL,
	[editorAlias] [nvarchar](255) NOT NULL,
	[macro] [int] NOT NULL,
	[macroPropertySortOrder] [int] NOT NULL,
	[macroPropertyAlias] [nvarchar](50) NOT NULL,
	[macroPropertyName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_cmsMacroProperty] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsMember]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMember](
	[nodeId] [int] NOT NULL,
	[Email] [nvarchar](1000) NOT NULL,
	[LoginName] [nvarchar](1000) NOT NULL,
	[Password] [nvarchar](1000) NOT NULL,
	[passwordConfig] [nvarchar](500) NULL,
	[securityStampToken] [nvarchar](255) NULL,
	[emailConfirmedDate] [datetime] NULL,
 CONSTRAINT [PK_cmsMember] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsMember2MemberGroup]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMember2MemberGroup](
	[Member] [int] NOT NULL,
	[MemberGroup] [int] NOT NULL,
 CONSTRAINT [PK_cmsMember2MemberGroup] PRIMARY KEY CLUSTERED 
(
	[Member] ASC,
	[MemberGroup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsMemberType]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMemberType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[NodeId] [int] NOT NULL,
	[propertytypeId] [int] NOT NULL,
	[memberCanEdit] [bit] NOT NULL,
	[viewOnProfile] [bit] NOT NULL,
	[isSensitive] [bit] NOT NULL,
 CONSTRAINT [PK_cmsMemberType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsPropertyType]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dataTypeId] [int] NOT NULL,
	[contentTypeId] [int] NOT NULL,
	[propertyTypeGroupId] [int] NULL,
	[Alias] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[sortOrder] [int] NOT NULL,
	[mandatory] [bit] NOT NULL,
	[mandatoryMessage] [nvarchar](500) NULL,
	[validationRegExp] [nvarchar](255) NULL,
	[validationRegExpMessage] [nvarchar](500) NULL,
	[Description] [nvarchar](2000) NULL,
	[labelOnTop] [bit] NOT NULL,
	[variations] [int] NOT NULL,
	[UniqueID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_cmsPropertyType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsPropertyTypeGroup]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyTypeGroup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uniqueID] [uniqueidentifier] NOT NULL,
	[contenttypeNodeId] [int] NOT NULL,
	[type] [int] NOT NULL,
	[text] [nvarchar](255) NOT NULL,
	[alias] [nvarchar](255) NOT NULL,
	[sortorder] [int] NOT NULL,
 CONSTRAINT [PK_cmsPropertyTypeGroup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsTagRelationship]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTagRelationship](
	[nodeId] [int] NOT NULL,
	[tagId] [int] NOT NULL,
	[propertyTypeId] [int] NOT NULL,
 CONSTRAINT [PK_cmsTagRelationship] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC,
	[propertyTypeId] ASC,
	[tagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsTags]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTags](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[group] [nvarchar](100) NOT NULL,
	[languageId] [int] NULL,
	[tag] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_cmsTags] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsTemplate]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTemplate](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[alias] [nvarchar](100) NULL,
 CONSTRAINT [PK_cmsTemplate] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UFDataSource]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UFDataSource](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Definition] [ntext] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Updated] [datetime] NOT NULL,
 CONSTRAINT [PK_UFDataSource] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UFFolders]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UFFolders](
	[ParentKey] [uniqueidentifier] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Definition] [ntext] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Updated] [datetime] NOT NULL,
 CONSTRAINT [PK_UFFolders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UFForms]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UFForms](
	[FolderKey] [uniqueidentifier] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Definition] [ntext] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Updated] [datetime] NOT NULL,
 CONSTRAINT [PK_UFForms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UFPrevalueSource]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UFPrevalueSource](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Definition] [ntext] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Updated] [datetime] NOT NULL,
 CONSTRAINT [PK_UFPrevalueSource] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UFRecordAudit]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UFRecordAudit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Record] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_UFRecordAudit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UFRecordDataBit]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UFRecordDataBit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [uniqueidentifier] NOT NULL,
	[Value] [bit] NULL,
 CONSTRAINT [PK_UFRecordDataBit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UFRecordDataDateTime]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UFRecordDataDateTime](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [uniqueidentifier] NOT NULL,
	[Value] [datetime] NULL,
 CONSTRAINT [PK_UFRecordDataDateTime] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UFRecordDataInteger]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UFRecordDataInteger](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [uniqueidentifier] NOT NULL,
	[Value] [int] NULL,
 CONSTRAINT [PK_UFRecordDataInteger] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UFRecordDataLongString]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UFRecordDataLongString](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [uniqueidentifier] NOT NULL,
	[Value] [ntext] NULL,
 CONSTRAINT [PK_UFRecordDataLongString] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UFRecordDataString]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UFRecordDataString](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [uniqueidentifier] NOT NULL,
	[Value] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_UFRecordDataString] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UFRecordFields]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UFRecordFields](
	[Key] [uniqueidentifier] NOT NULL,
	[FieldId] [uniqueidentifier] NOT NULL,
	[Record] [int] NOT NULL,
	[Alias] [nvarchar](255) NOT NULL,
	[DataType] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_UFRecordFields] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UFRecords]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UFRecords](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Form] [uniqueidentifier] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Updated] [datetime] NOT NULL,
	[CurrentPage] [uniqueidentifier] NULL,
	[UmbracoPageId] [int] NULL,
	[IP] [nvarchar](255) NULL,
	[MemberKey] [nvarchar](255) NULL,
	[UniqueId] [uniqueidentifier] NOT NULL,
	[State] [nvarchar](50) NULL,
	[RecordData] [ntext] NOT NULL,
 CONSTRAINT [PK_UFRecords] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UFUserFormSecurity]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UFUserFormSecurity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User] [nvarchar](50) NOT NULL,
	[Form] [uniqueidentifier] NOT NULL,
	[HasAccess] [bit] NOT NULL,
	[AllowInEditor] [bit] NOT NULL,
	[SecurityType] [int] NOT NULL,
 CONSTRAINT [PK_UFUserFormSecurity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UFUserGroupFormSecurity]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UFUserGroupFormSecurity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserGroupId] [int] NOT NULL,
	[Form] [uniqueidentifier] NOT NULL,
	[HasAccess] [bit] NOT NULL,
	[AllowInEditor] [bit] NOT NULL,
	[SecurityType] [int] NOT NULL,
 CONSTRAINT [PK_UserGroupFormSecurity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UFUserGroupSecurity]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UFUserGroupSecurity](
	[UserGroupId] [int] NOT NULL,
	[ManageDataSources] [bit] NOT NULL,
	[ManagePreValueSources] [bit] NOT NULL,
	[ManageWorkflows] [bit] NOT NULL,
	[ManageForms] [bit] NOT NULL,
	[ViewEntries] [bit] NOT NULL,
	[EditEntries] [bit] NOT NULL,
 CONSTRAINT [PK_UFUserGroupSecurity] PRIMARY KEY CLUSTERED 
(
	[UserGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UFUserGroupStartFolders]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UFUserGroupStartFolders](
	[UserGroupId] [int] NOT NULL,
	[FolderKey] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_UFUserGroupStartFolders] PRIMARY KEY CLUSTERED 
(
	[UserGroupId] ASC,
	[FolderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UFUserSecurity]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UFUserSecurity](
	[User] [nvarchar](50) NOT NULL,
	[ManageDataSources] [bit] NOT NULL,
	[ManagePreValueSources] [bit] NOT NULL,
	[ManageWorkflows] [bit] NOT NULL,
	[ManageForms] [bit] NOT NULL,
	[ViewEntries] [bit] NOT NULL,
	[EditEntries] [bit] NOT NULL,
 CONSTRAINT [PK_UFUserSecurity] PRIMARY KEY CLUSTERED 
(
	[User] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UFUserStartFolders]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UFUserStartFolders](
	[UserId] [int] NOT NULL,
	[FolderKey] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_UFUserStartFolders] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[FolderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UFWorkflows]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UFWorkflows](
	[FormId] [uniqueidentifier] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Definition] [ntext] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Updated] [datetime] NOT NULL,
 CONSTRAINT [PK_UFWorkflows] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoAccess]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoAccess](
	[id] [uniqueidentifier] NOT NULL,
	[nodeId] [int] NOT NULL,
	[loginNodeId] [int] NOT NULL,
	[noAccessNodeId] [int] NOT NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoAccess] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoAccessRule]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoAccessRule](
	[id] [uniqueidentifier] NOT NULL,
	[accessId] [uniqueidentifier] NOT NULL,
	[ruleValue] [nvarchar](255) NOT NULL,
	[ruleType] [nvarchar](255) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoAccessRule] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoAudit]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoAudit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[performingUserId] [int] NOT NULL,
	[performingDetails] [nvarchar](1024) NULL,
	[performingIp] [nvarchar](64) NULL,
	[eventDateUtc] [datetime] NOT NULL,
	[affectedUserId] [int] NOT NULL,
	[affectedDetails] [nvarchar](1024) NULL,
	[eventType] [nvarchar](256) NOT NULL,
	[eventDetails] [nvarchar](1024) NULL,
 CONSTRAINT [PK_umbracoAudit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoCacheInstruction]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoCacheInstruction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[utcStamp] [datetime] NOT NULL,
	[jsonInstruction] [ntext] NOT NULL,
	[originated] [nvarchar](500) NOT NULL,
	[instructionCount] [int] NOT NULL,
 CONSTRAINT [PK_umbracoCacheInstruction] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoConsent]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoConsent](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[current] [bit] NOT NULL,
	[source] [nvarchar](512) NOT NULL,
	[context] [nvarchar](128) NOT NULL,
	[action] [nvarchar](512) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[state] [int] NOT NULL,
	[comment] [nvarchar](255) NULL,
 CONSTRAINT [PK_umbracoConsent] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoContent]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoContent](
	[nodeId] [int] NOT NULL,
	[contentTypeId] [int] NOT NULL,
 CONSTRAINT [PK_umbracoContent] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoContentSchedule]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoContentSchedule](
	[id] [uniqueidentifier] NOT NULL,
	[nodeId] [int] NOT NULL,
	[languageId] [int] NULL,
	[date] [datetime] NOT NULL,
	[action] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoContentSchedule] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoContentVersion]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoContentVersion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[versionDate] [datetime] NOT NULL,
	[userId] [int] NULL,
	[current] [bit] NOT NULL,
	[text] [nvarchar](255) NULL,
	[preventCleanup] [bit] NOT NULL,
 CONSTRAINT [PK_umbracoContentVersion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoContentVersionCleanupPolicy]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoContentVersionCleanupPolicy](
	[contentTypeId] [int] NOT NULL,
	[preventCleanup] [bit] NOT NULL,
	[keepAllVersionsNewerThanDays] [int] NULL,
	[keepLatestVersionPerDayForDays] [int] NULL,
	[updated] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoContentVersionCultureVariation]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoContentVersionCultureVariation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[versionId] [int] NOT NULL,
	[languageId] [int] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[date] [datetime] NOT NULL,
	[availableUserId] [int] NULL,
 CONSTRAINT [PK_umbracoContentVersionCultureVariation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoCreatedPackageSchema]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoCreatedPackageSchema](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[value] [nvarchar](max) NOT NULL,
	[updateDate] [datetime] NOT NULL,
	[packageId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_umbracoCreatedPackageSchema] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoDataType]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDataType](
	[nodeId] [int] NOT NULL,
	[propertyEditorAlias] [nvarchar](255) NOT NULL,
	[dbType] [nvarchar](50) NOT NULL,
	[config] [ntext] NULL,
 CONSTRAINT [PK_umbracoDataType] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoDocument]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDocument](
	[nodeId] [int] NOT NULL,
	[published] [bit] NOT NULL,
	[edited] [bit] NOT NULL,
 CONSTRAINT [PK_umbracoDocument] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoDocumentCultureVariation]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDocumentCultureVariation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[languageId] [int] NOT NULL,
	[edited] [bit] NOT NULL,
	[available] [bit] NOT NULL,
	[published] [bit] NOT NULL,
	[name] [nvarchar](255) NULL,
 CONSTRAINT [PK_umbracoDocumentCultureVariation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoDocumentVersion]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDocumentVersion](
	[id] [int] NOT NULL,
	[templateId] [int] NULL,
	[published] [bit] NOT NULL,
 CONSTRAINT [PK_umbracoDocumentVersion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoDomain]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDomain](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[domainDefaultLanguage] [int] NULL,
	[domainRootStructureID] [int] NULL,
	[domainName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoDomain] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoExternalLogin]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoExternalLogin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userOrMemberKey] [uniqueidentifier] NOT NULL,
	[loginProvider] [nvarchar](400) NOT NULL,
	[providerKey] [nvarchar](4000) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[userData] [ntext] NULL,
 CONSTRAINT [PK_umbracoExternalLogin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoExternalLoginToken]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoExternalLoginToken](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[externalLoginId] [int] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[value] [nvarchar](max) NOT NULL,
	[createDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoExternalLoginToken] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoKeyValue]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoKeyValue](
	[key] [nvarchar](256) NOT NULL,
	[value] [nvarchar](255) NULL,
	[updated] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoKeyValue] PRIMARY KEY CLUSTERED 
(
	[key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoLanguage]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLanguage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[languageISOCode] [nvarchar](14) NULL,
	[languageCultureName] [nvarchar](100) NULL,
	[isDefaultVariantLang] [bit] NOT NULL,
	[mandatory] [bit] NOT NULL,
	[fallbackLanguageId] [int] NULL,
 CONSTRAINT [PK_umbracoLanguage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoLock]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLock](
	[id] [int] NOT NULL,
	[value] [int] NOT NULL,
	[name] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_umbracoLock] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoLog]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[NodeId] [int] NOT NULL,
	[entityType] [nvarchar](50) NULL,
	[Datestamp] [datetime] NOT NULL,
	[logHeader] [nvarchar](50) NOT NULL,
	[logComment] [nvarchar](4000) NULL,
	[parameters] [nvarchar](500) NULL,
 CONSTRAINT [PK_umbracoLog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoLogViewerQuery]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLogViewerQuery](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[query] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoLogViewerQuery] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoMediaVersion]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoMediaVersion](
	[id] [int] NOT NULL,
	[path] [nvarchar](255) NULL,
 CONSTRAINT [PK_umbracoMediaVersion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoNode]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoNode](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uniqueId] [uniqueidentifier] NOT NULL,
	[parentId] [int] NOT NULL,
	[level] [int] NOT NULL,
	[path] [nvarchar](150) NOT NULL,
	[sortOrder] [int] NOT NULL,
	[trashed] [bit] NOT NULL,
	[nodeUser] [int] NULL,
	[text] [nvarchar](255) NULL,
	[nodeObjectType] [uniqueidentifier] NULL,
	[createDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoNode] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoPropertyData]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoPropertyData](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[versionId] [int] NOT NULL,
	[propertyTypeId] [int] NOT NULL,
	[languageId] [int] NULL,
	[segment] [nvarchar](256) NULL,
	[intValue] [int] NULL,
	[decimalValue] [decimal](38, 6) NULL,
	[dateValue] [datetime] NULL,
	[varcharValue] [nvarchar](512) NULL,
	[textValue] [ntext] NULL,
 CONSTRAINT [PK_umbracoPropertyData] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoRedirectUrl]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRedirectUrl](
	[id] [uniqueidentifier] NOT NULL,
	[contentKey] [uniqueidentifier] NOT NULL,
	[createDateUtc] [datetime] NOT NULL,
	[url] [nvarchar](255) NOT NULL,
	[culture] [nvarchar](255) NULL,
	[urlHash] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_umbracoRedirectUrl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoRelation]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRelation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parentId] [int] NOT NULL,
	[childId] [int] NOT NULL,
	[relType] [int] NOT NULL,
	[datetime] [datetime] NOT NULL,
	[comment] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_umbracoRelation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoRelationType]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRelationType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[typeUniqueId] [uniqueidentifier] NOT NULL,
	[dual] [bit] NOT NULL,
	[parentObjectType] [uniqueidentifier] NULL,
	[childObjectType] [uniqueidentifier] NULL,
	[name] [nvarchar](255) NOT NULL,
	[alias] [nvarchar](100) NOT NULL,
	[isDependency] [bit] NOT NULL,
 CONSTRAINT [PK_umbracoRelationType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoServer]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoServer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](500) NOT NULL,
	[computerName] [nvarchar](255) NOT NULL,
	[registeredDate] [datetime] NOT NULL,
	[lastNotifiedDate] [datetime] NOT NULL,
	[isActive] [bit] NOT NULL,
	[isSchedulingPublisher] [bit] NOT NULL,
 CONSTRAINT [PK_umbracoServer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoTwoFactorLogin]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoTwoFactorLogin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userOrMemberKey] [uniqueidentifier] NOT NULL,
	[providerName] [nvarchar](400) NOT NULL,
	[secret] [nvarchar](400) NOT NULL,
 CONSTRAINT [PK_umbracoTwoFactorLogin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUser]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userDisabled] [bit] NOT NULL,
	[userNoConsole] [bit] NOT NULL,
	[userName] [nvarchar](255) NOT NULL,
	[userLogin] [nvarchar](125) NOT NULL,
	[userPassword] [nvarchar](500) NOT NULL,
	[passwordConfig] [nvarchar](500) NULL,
	[userEmail] [nvarchar](255) NOT NULL,
	[userLanguage] [nvarchar](10) NULL,
	[securityStampToken] [nvarchar](255) NULL,
	[failedLoginAttempts] [int] NULL,
	[lastLockoutDate] [datetime] NULL,
	[lastPasswordChangeDate] [datetime] NULL,
	[lastLoginDate] [datetime] NULL,
	[emailConfirmedDate] [datetime] NULL,
	[invitedDate] [datetime] NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
	[avatar] [nvarchar](500) NULL,
	[tourData] [ntext] NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUser2NodeNotify]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser2NodeNotify](
	[userId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[action] [nchar](1) NOT NULL,
 CONSTRAINT [PK_umbracoUser2NodeNotify] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[nodeId] ASC,
	[action] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUser2UserGroup]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser2UserGroup](
	[userId] [int] NOT NULL,
	[userGroupId] [int] NOT NULL,
 CONSTRAINT [PK_user2userGroup] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[userGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUserGroup]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserGroup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userGroupAlias] [nvarchar](200) NOT NULL,
	[userGroupName] [nvarchar](200) NOT NULL,
	[userGroupDefaultPermissions] [nvarchar](50) NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
	[icon] [nvarchar](255) NULL,
	[startContentId] [int] NULL,
	[startMediaId] [int] NULL,
 CONSTRAINT [PK_umbracoUserGroup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUserGroup2App]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserGroup2App](
	[userGroupId] [int] NOT NULL,
	[app] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_userGroup2App] PRIMARY KEY CLUSTERED 
(
	[userGroupId] ASC,
	[app] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUserGroup2Node]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserGroup2Node](
	[userGroupId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
 CONSTRAINT [PK_umbracoUserGroup2Node] PRIMARY KEY CLUSTERED 
(
	[userGroupId] ASC,
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUserGroup2NodePermission]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserGroup2NodePermission](
	[userGroupId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[permission] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoUserGroup2NodePermission] PRIMARY KEY CLUSTERED 
(
	[userGroupId] ASC,
	[nodeId] ASC,
	[permission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUserLogin]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserLogin](
	[sessionId] [uniqueidentifier] NOT NULL,
	[userId] [int] NOT NULL,
	[loggedInUtc] [datetime] NOT NULL,
	[lastValidatedUtc] [datetime] NOT NULL,
	[loggedOutUtc] [datetime] NULL,
	[ipAddress] [nvarchar](255) NULL,
 CONSTRAINT [PK_umbracoUserLogin] PRIMARY KEY CLUSTERED 
(
	[sessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUserStartNode]    Script Date: 08.06.2022 5:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserStartNode](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[startNode] [int] NOT NULL,
	[startNodeType] [int] NOT NULL,
 CONSTRAINT [PK_userStartNode] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1074, 0, NULL, 0, 0x92C70362CD0C2AC60000089EF30393DE0015AB6865616465725469746C6590AA0D0043657874901900B3496D61676590AC776F726B0D00327390AB0E00724E616D657390AA0D00A15370656390AA646F63734B00307390A90C00804C696E6B7390A6694500F12F739193A0A0DA02475B7B226B6579223A2265326262333033352D386533322D343031332D386530302D363866353665353833363566222C226D656469614B3200F41837376561663137322D336531652D343135352D396132662D343134656534626431643131227D2C6100FA1538313633393764632D393363392D343833342D393630332D3530646430343333383165386100F71539346265633061642D373063362D346433642D626465352D6531626138356335353034356100FA1534333730343838352D336234322D346364332D613230352D6139343232613732616131356100F71561363961366233382D323263652D343034312D396334612D3065613230393831356132666100D065613765303838662D653561332F00FA04662D616633612D3439323836333935313133316100F71564303531666135342D386235662D343033612D623361652D3332643338323162353730326100FB1431373663636335662D353165392D343463622D393438332D66623134393639363864392301F71565363030373330332D636365312D346638652D386232312D3131636661653131636338626100FA1536346132666230392D343762322D343763612D613030332D663266306361353734333761C200F01A30386631656136312D636662332D343737382D626633362D393336303232663833636432227D5DAD74B302F03550726F6A656374739193A0A0D9CDD094D0B5D0BDD18C20D0B7D0B0D189D0B8D182D18B20D0B4D0B5D182D0B5D0B9F09F8C9F3B0AD090D182D0BED0BCD0B3D180D0B0D0B42300DFA0D0BED181D181D0B8D0B83B0A47005B119F8600C1B7D0B4D0BDD0B8D0BA20D0BBAF0089B0AE737461747573E2001074D900F109D0B2D0B5D180D188D191D0BD3B0AD0BFD0BED0B4D0B3D0BED6005FB2D0BAD0B01600060E3E000E1200F907B0D0BAD182D183D0B0D0BBD18CD0BDD0BEAC747970658700F000354576656E74733B0A436F6E7465730A00F21553746F636B3B0A45786869626974696F6E733B0A486F6C69646179733B0A4F74686572AD07047047616C6C657279B20144DA01245BAD03FB1562353432643064622D643334382D346538612D383966622D6232613336646464303261342902F714616661346431662D633230312D343464652D616233652D3937366362343462653538658A02FB1466633130646534302D646432392D346634612D623937332D3934616535656562313037EB020F61001CFF1561626165623965662D306136622D343832322D626161382D353966363561376331376264C20021225DAC39016C536C696465723801FB1435363635316563342D666366392D343232322D383462342D37313635316230623263306103F00C65313630386136312D396531362D346132642D386334312D63326461035739323031393801FA1561646135313539642D383465632D343335362D613932362D616235326334373066643230D700F71532306532663538302D306234372D343131372D616635352D3832363235393031646133616100FB1432383734656238382D343237342D343035612D393032642D32396564643431626162669901F01564363361633766342D626634312D346133352D613537352D373831643162623534656639230402DC0607390141D988D0A623043582D180E102E1B0D18F20D0B1D0B8D0B1D0BBD0B8480313B54603319FD0BE060330B7D0B04704A0BBD18F20D180D0B5D0B1450003240011A28E0310806D0421D0BE0800148F2C00015D003083D187460320D0B93B0030B0D0B1610078D18BAB746578749A00B464D09DD0BED0B2D0BED1839C00B0D181D0BAD0BED0B3D0BE20050020D180EA0308150091BED0BAD180D183D0B3F30311A78300C0B0D0B920D0B2D0BCD0B5D181F6043120D1818800A2D0BCD0B821AE6C6173740F0142546578744C0211DF830431B5D0B4040500420010B28404018F0425B5204A0008020105C7003120D0B85E0007E600016F05108F7B00013B0113BD5600CFB82E203C6272202F3E0AD0926F010141B520D0B86C00508ED182D181930190BDD0B5D0BED0B1D185F700001D0020D18BCF005183D181D0BB2B01076A01045B00000D0510BB6F0121D186C20002790100000104A200312DD0B8EA0512BBF20044D0B2D0B0AC000370010FC3001323D1876F0100200200670011BC7606003A0100340130BED0B687003120D0BFB70112B2C40091D182D18C20D0B2D18B9C0100690110BA410125B8201C0100F10130BDD184540200C10072D186D0B8D0B82C470031B5D0B714003282D0B01800003A0021D18235025180D187D0B5C10001B50131B2D0B51100C280D0B02EAD73657276696365990900F401F100D948D09ED0BDD0BBD0B0D0B9D0BD2D550651BB3B0AD09C140113B812010249061194C0013083D0B3390700F70101980112BC8900D10AB174657374696D6F6E69616C2B0A02600015C3D705A064636136663430302D656C05FA07346465612D393139622D3037666135316562613333653E04F71538306333653165662D393634662D343231612D623830642D3333653338643530613830633E04C037626631623162302D6333316608FA0534342D623435312D3630646233363763306234616100F71939656333373862612D623534612D346334392D623766312D366664373030313636333965227D5DB0DB00002D0302DA003098D09C01013020D0BE6001026D0800750211BDB50351B2D0B8D0BB310100E7010FE7020231213B0A700330B8D1886F04009F0301EB0110B1CF0701F00340BC20D0BD7004003A02071908612C20D0B1D18B340020D0B2E20111BE450288BED180D0B3D0B521AF00019A0B0189015140D094D0B0CA0340BB20D0919F0261D18FD0BAD0B83A083295D0BAEB0100B604027400509CD0B0D180A00400BD02A0D0B2D0B080A4686F6D65)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1074, 1, NULL, 0, 0x92C70362CD0C2AC60000089EF30393DE0015AB6865616465725469746C6590AA0D0043657874901900B3496D61676590AC776F726B0D00327390AB0E00724E616D657390AA0D00A15370656390AA646F63734B00307390A90C00804C696E6B7390A6694500F12F739193A0A0DA02475B7B226B6579223A2265326262333033352D386533322D343031332D386530302D363866353665353833363566222C226D656469614B3200F41837376561663137322D336531652D343135352D396132662D343134656534626431643131227D2C6100FA1538313633393764632D393363392D343833342D393630332D3530646430343333383165386100F71539346265633061642D373063362D346433642D626465352D6531626138356335353034356100FA1534333730343838352D336234322D346364332D613230352D6139343232613732616131356100F71561363961366233382D323263652D343034312D396334612D3065613230393831356132666100D065613765303838662D653561332F00FA04662D616633612D3439323836333935313133316100F71564303531666135342D386235662D343033612D623361652D3332643338323162353730326100FB1431373663636335662D353165392D343463622D393438332D66623134393639363864392301F71565363030373330332D636365312D346638652D386232312D3131636661653131636338626100FA1536346132666230392D343762322D343763612D613030332D663266306361353734333761C200F01A30386631656136312D636662332D343737382D626633362D393336303232663833636432227D5DAD74B302F03550726F6A656374739193A0A0D9CDD094D0B5D0BDD18C20D0B7D0B0D189D0B8D182D18B20D0B4D0B5D182D0B5D0B9F09F8C9F3B0AD090D182D0BED0BCD0B3D180D0B0D0B42300DFA0D0BED181D181D0B8D0B83B0A47005B119F8600C1B7D0B4D0BDD0B8D0BA20D0BBAF0089B0AE737461747573E2001074D900F109D0B2D0B5D180D188D191D0BD3B0AD0BFD0BED0B4D0B3D0BED6005FB2D0BAD0B01600060E3E000E1200F907B0D0BAD182D183D0B0D0BBD18CD0BDD0BEAC747970658700F000354576656E74733B0A436F6E7465730A00F21553746F636B3B0A45786869626974696F6E733B0A486F6C69646179733B0A4F74686572AD07047047616C6C657279B20144DA01245BAD03FB1562353432643064622D643334382D346538612D383966622D6232613336646464303261342902F714616661346431662D633230312D343464652D616233652D3937366362343462653538658A02FB1466633130646534302D646432392D346634612D623937332D3934616535656562313037EB020F61001CFF1561626165623965662D306136622D343832322D626161382D353966363561376331376264C20021225DAC39016C536C696465723801FB1435363635316563342D666366392D343232322D383462342D37313635316230623263306103F00C65313630386136312D396531362D346132642D386334312D63326461035739323031393801FA1561646135313539642D383465632D343335362D613932362D616235326334373066643230D700F71532306532663538302D306234372D343131372D616635352D3832363235393031646133616100FB1432383734656238382D343237342D343035612D393032642D32396564643431626162669901F01564363361633766342D626634312D346133352D613537352D373831643162623534656639230402DC0607390141D988D0A623043582D180E102E1B0D18F20D0B1D0B8D0B1D0BBD0B8480313B54603319FD0BE060330B7D0B04704A0BBD18F20D180D0B5D0B1450003240011A28E0310806D0421D0BE0800148F2C00015D003083D187460320D0B93B0030B0D0B1610078D18BAB746578749A00B464D09DD0BED0B2D0BED1839C00B0D181D0BAD0BED0B3D0BE20050020D180EA0308150091BED0BAD180D183D0B3F30311A78300C0B0D0B920D0B2D0BCD0B5D181F6043120D1818800A2D0BCD0B821AE6C6173740F0142546578744C0211DF830431B5D0B4040500420010B28404018F0425B5204A0008020105C7003120D0B85E0007E600016F05108F7B00013B0113BD5600CFB82E203C6272202F3E0AD0926F010141B520D0B86C00508ED182D181930190BDD0B5D0BED0B1D185F700001D0020D18BCF005183D181D0BB2B01076A01045B00000D0510BB6F0121D186C20002790100000104A200312DD0B8EA0512BBF20044D0B2D0B0AC000370010FC3001323D1876F0100200200670011BC7606003A0100340130BED0B687003120D0BFB70112B2C40091D182D18C20D0B2D18B9C0100690110BA410125B8201C0100F10130BDD184540200C10072D186D0B8D0B82C470031B5D0B714003282D0B01800003A0021D18235025180D187D0B5C10001B50131B2D0B51100C280D0B02EAD73657276696365990900F401F100D948D09ED0BDD0BBD0B0D0B9D0BD2D550651BB3B0AD09C140113B812010249061194C0013083D0B3390700F70101980112BC8900D10AB174657374696D6F6E69616C2B0A02600015C3D705A064636136663430302D656C05FA07346465612D393139622D3037666135316562613333653E04F71538306333653165662D393634662D343231612D623830642D3333653338643530613830633E04C037626631623162302D6333316608FA0534342D623435312D3630646233363763306234616100F71939656333373862612D623534612D346334392D623766312D366664373030313636333965227D5DB0DB00002D0302DA003098D09C01013020D0BE6001026D0800750211BDB50351B2D0B8D0BB310100E7010FE7020231213B0A700330B8D1886F04009F0301EB0110B1CF0701F00340BC20D0BD7004003A02071908612C20D0B1D18B340020D0B2E20111BE450288BED180D0B3D0B521AF00019A0B0189015140D094D0B0CA0340BB20D0919F0261D18FD0BAD0B83A083295D0BAEB0100B604027400509CD0B0D180A00400BD02A0D0B2D0B080A4686F6D65)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1079, 0, NULL, 0, 0x92C70362CD085BC6000005CEF31C9388AB6865616465725469746C659193A0A0B7D09E20D091D0B8D0B1D0BBD0B8D0BED182D0B5D0BAD0B5AA28003065787427003FDA0310260000F01CB020D0BED181D183D189D0B5D181D182D0B2D0BBD18FD0B5D18220D0B8D0BDD184D0BED180D0BCD0B0D1865C00F013D0BDD0BDD183D18E20D0BFD0BED0B4D0B4D0B5D180D0B6D0BAD18320D0BCD0BED0BB1700F118D191D0B6D0B820D0B220D183D187D0B5D0B1D0BDD0BE2DD0BED0B1D180D0B0D0B7D0BED0B2D0B0A90030BBD18C1D00A1D0BC20D0B820D181D0B047000F2A000C71BFD180D0BED186B3009081D0B52C20D0BED0BA590062D18BD0B2D0B0BF0002250002C10079B8D0B5D0BDD182C700118B390073BFD181D0B8D185BB0030B3D0B8B10061D181D0BAD0B820000F8A000640D18BD0B5E000A081D0BBD183D0B3D0B83B4B01D880D0B3D0B0D0BDD0B8D0B7D18388003081D0B20F0024D0B8F600006400024B0120B8200A00A0D0BBD18CD182D183D1801001322DD0B4990120D0B32D01012900013C0110B1E1019ED1832E20D09220D0B1F60107260040D0B0D18EC801001C01019A016120313520D0BAB00010B15600017B0090BED0B1D18AD0B5D0B4F00100270141D0B8D0B9E0010202021182E30112B59B01412E20D09F7C0113847C0102140210B0BD00011301003A000A52013120D0B25E0004530201690077B2D0B8D0B4D183390010B59A0030BED0BD8D02004E0001BF0000740212B88C0001D70010B7E20221D1876A0013BCE20101F70210B5A30230D0BC2C6D0000EB0001A50268D189D0B8D0BC9802808BD18520D0BBD18EB80233D0B92E4A0341496D61674A03F129D9625B7B226B6579223A2265393663363836362D626265332D343966302D386165632D363734353439353833646530222C226D656469614B32005039386133352D00F314333633312D346532372D626634392D663665663437613662376165227D5DAC776F726B7400117398032501247600FA1531313763363266312D353063322D346464352D383736332D3539313134363939633863367600F41835306563383866332D653839322D343038662D613733342D373838633938366237336232227D2CD700F00E66386336353532342D643233622D343634342D616361382D64333364380F003A3832346100F71561323930326137312D313431302D343632652D393032382D3365633030303765386132346100FA1565633861363938372D323861352D343464362D396634332D3532626139333335333935356100F21937663537316137642D653231332D343363342D626564322D303834666437646330653834227D5DAB3801324E616D3701B4D947D098D0B2D0B0D0BD20090000D302283B0A0E0070D0B020D09DD0B0D90426D18F1B0009320012AA590040537065638F0181D940D181D0BFD0B57C0250B0D0BBD0B83E002F3B0A16001751AA646F63739E0501A90050DA01B1D0A344004FD0B0D0B2B3030152B83B0AD0A1120301220401140501310010B2840320BE20030401170353B4D0B0D1801A0031B5D0BDF20061B920D180D0B5B9043081D182260301BA00005500919AD0BED0BFD0B8D18F230022D188DD03000F003183D187360015B48F04108F690080D181D0BED0B7D0B45601027A0309D104045B000BAF042FD18B6C000900C30000210451B7D0BDD0B00D06001D0561B820D180D183F20300B1030A88000845050F740009309CD183A80001F00014BF4B0450D0BED0B520380005C70011B5810000E90401230603DD0008BC058120D0B220323032316A0100980410A9C301414C696E6BC20130D9DD2F1000C22F75737461762E7274663B0A1100754F47524E2E70641000D04B6F70696A615F72657368656E0A00F2046F5F736F7A64616E69695F75636872657A686419007F6B756C747572793D000C606E617A6E61634C00F40F695F72756B6F766F646974656C6A615F4261756D73687465696E2E6A70679000F0004D756E69736970616C6E6F655F7A61790091655F6E615F6F6B617A0C008075736C75675F765FED00505F676F647581009080A761626F75747573)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1079, 1, NULL, 0, 0x92C70362CD085BC6000005CEF31C9388AB6865616465725469746C659193A0A0B7D09E20D091D0B8D0B1D0BBD0B8D0BED182D0B5D0BAD0B5AA28003065787427003FDA0310260000F01CB020D0BED181D183D189D0B5D181D182D0B2D0BBD18FD0B5D18220D0B8D0BDD184D0BED180D0BCD0B0D1865C00F013D0BDD0BDD183D18E20D0BFD0BED0B4D0B4D0B5D180D0B6D0BAD18320D0BCD0BED0BB1700F118D191D0B6D0B820D0B220D183D187D0B5D0B1D0BDD0BE2DD0BED0B1D180D0B0D0B7D0BED0B2D0B0A90030BBD18C1D00A1D0BC20D0B820D181D0B047000F2A000C71BFD180D0BED186B3009081D0B52C20D0BED0BA590062D18BD0B2D0B0BF0002250002C10079B8D0B5D0BDD182C700118B390073BFD181D0B8D185BB0030B3D0B8B10061D181D0BAD0B820000F8A000640D18BD0B5E000A081D0BBD183D0B3D0B83B4B01D880D0B3D0B0D0BDD0B8D0B7D18388003081D0B20F0024D0B8F600006400024B0120B8200A00A0D0BBD18CD182D183D1801001322DD0B4990120D0B32D01012900013C0110B1E1019ED1832E20D09220D0B1F60107260040D0B0D18EC801001C01019A016120313520D0BAB00010B15600017B0090BED0B1D18AD0B5D0B4F00100270141D0B8D0B9E0010202021182E30112B59B01412E20D09F7C0113847C0102140210B0BD00011301003A000A52013120D0B25E0004530201690077B2D0B8D0B4D183390010B59A0030BED0BD8D02004E0001BF0000740212B88C0001D70010B7E20221D1876A0013BCE20101F70210B5A30230D0BC2C6D0000EB0001A50268D189D0B8D0BC9802808BD18520D0BBD18EB80233D0B92E4A0341496D61674A03F129D9625B7B226B6579223A2265393663363836362D626265332D343966302D386165632D363734353439353833646530222C226D656469614B32005039386133352D00F314333633312D346532372D626634392D663665663437613662376165227D5DAC776F726B7400117398032501247600FA1531313763363266312D353063322D346464352D383736332D3539313134363939633863367600F41835306563383866332D653839322D343038662D613733342D373838633938366237336232227D2CD700F00E66386336353532342D643233622D343634342D616361382D64333364380F003A3832346100F71561323930326137312D313431302D343632652D393032382D3365633030303765386132346100FA1565633861363938372D323861352D343464362D396634332D3532626139333335333935356100F21937663537316137642D653231332D343363342D626564322D303834666437646330653834227D5DAB3801324E616D3701B4D947D098D0B2D0B0D0BD20090000D302283B0A0E0070D0B020D09DD0B0D90426D18F1B0009320012AA590040537065638F0181D940D181D0BFD0B57C0250B0D0BBD0B83E002F3B0A16001751AA646F63739E0501A90050DA01B1D0A344004FD0B0D0B2B3030152B83B0AD0A1120301220401140501310010B2840320BE20030401170353B4D0B0D1801A0031B5D0BDF20061B920D180D0B5B9043081D182260301BA00005500919AD0BED0BFD0B8D18F230022D188DD03000F003183D187360015B48F04108F690080D181D0BED0B7D0B45601027A0309D104045B000BAF042FD18B6C000900C30000210451B7D0BDD0B00D06001D0561B820D180D183F20300B1030A88000845050F740009309CD183A80001F00014BF4B0450D0BED0B520380005C70011B5810000E90401230603DD0008BC058120D0B220323032316A0100980410A9C301414C696E6BC20130D9DD2F1000C22F75737461762E7274663B0A1100754F47524E2E70641000D04B6F70696A615F72657368656E0A00F2046F5F736F7A64616E69695F75636872657A686419007F6B756C747572793D000C606E617A6E61634C00F40F695F72756B6F766F646974656C6A615F4261756D73687465696E2E6A70679000F0004D756E69736970616C6E6F655F7A61790091655F6E615F6F6B617A0C008075736C75675F765FED00505F676F647581009080A761626F75747573)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1088, 0, NULL, 1, 0x93C70662CD04B7CD03D7C60000037AF2379385A6696D616765739193A0A0DA02A85B7B226B6579223A2237343266386362372D313632652D343564312D613830622D316166613236376432303665222C226D656469614B3200F417376561663137322D336531652D343135352D396132662D343134656534626431643131227D2C6100FA1530653332333234652D386663312D343832322D383430312D6130623362366461303637366100F71539346265633061642D373063362D346433642D626465352D6531626138356335353034356100FA1532663034366233302D393266642D346438302D383338352D3566623130633733376666666100F71564303531666135342D386235662D343033612D623361652D3332643338323162353730326100FA1561393866333337322D643461372D346630382D623834342D6263633935666335333633326100F81561363961366233382D323263652D343034312D396334612D3065613230393831356132666100F002646332396437632D373931342D343730345201EA632D6333363932656564356430316100F71565363030373330332D636365312D346638652D386232312D3131636661653131636338626100FA1565643636376537352D376462632D346339322D383631332D6633386138313266333837646100F71530386631656136312D636662332D343737382D626633362D3933363032326638336364326100FA1562616539343033352D663133372D343965302D383566392D6238326162653661333266626100C032376162323536392D3061642301F11531312D383234382D663038363636346134326362227D5DAD7469746C6550726F6A656374BD02F029D9EDD094D0B5D0BDD18C20D0B7D0B0D189D0B8D182D18B20D0B4D0B5D182D0B5D0B9F09F8C9F3B0AD090D182D0BED0BCD0B3D180D0B0D0B42300DFA0D0BED181D181D0B8D0B83B0A47005B119F8600C1B7D0B4D0BDD0B8D0BA20D0BBAF00F100B03B0AD09FD0B5D180D0B2D18BD0B9C60002DC0003200079AE73746174757302011088F90020D0B23700F103D188D191D0BD3B0AD0BFD0BED0B4D0B3D0BEF60031B2D0BA5B000F1600030E3E000E1200FF02B0D0BAD182D183D0B0D0BBD18CD0BDD0BE1400014AAC7479709D01F0003C4576656E74733B0A436F6E7465730A00F31453746F636B3B0A45786869626974696F6E733B0A486F6C69646179733B0A4F74686572070012ADA304B047616C6C6572799193A0A0C60000033DF12ADA03CB5B7B226B6579223A2234333864376535312D373865382D343363362D393138652D313138656566656537636566222C226D656469614B3200F41830616661346431662D633230312D343464652D616233652D393736636234346265353865227D2C6100FA1538653835326431632D383733372D346535312D613039612D6366616639353464646536356100F71566313933303636352D343037312D343564322D623032642D6434613639323466663432396100FA1535303663343465332D656333342D346331632D626366372D6632386330376331323831646100F71535613639393063302D313535362D343538302D393864372D6637303136383865303761616100FA1563646166343234392D663363392D343334372D616564662D3031626466396534393536636100F71561363463356562652D656465632D343436342D383036622D3533323663373062333631356100FA1538326231666363652D653138342D343835332D613635662D6137346533343035643834336100B032613537653864362D64398401F8056264392D623061372D66636433343163346130658401FA1566383936356662322D313632662D346638312D393961622D6431343463383361326336616100F71534326335633765652D653632392D343164342D386364642D336230346637373631376364C2008065653330613662627A01FA09382D346366612D613236632D6135373235373738346339376100F71530383036303834652D366561652D346431342D616661352D3461373164653337303530616100FA1535383038353238322D336338332D346637662D623131362D6164316430303365336238656100F71561656562393463632D623235322D343830302D623236312D3361366365623364663365386100FB1430333831346465362D393934382D343035332D383536662D3532613539613939393138E501F81430616663626339652D396138622D346161632D623938302D3562363663323962656537E501FA1534646263363266662D376564652D343534392D393236622D373639366463326264353238C200F02163646564363933352D333030382D346533322D386632312D646532393266623035323335227D5D80A770726F6A656374)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1088, 1, NULL, 1, 0x93C70662CD04B7CD03D7C60000037AF2379385A6696D616765739193A0A0DA02A85B7B226B6579223A2237343266386362372D313632652D343564312D613830622D316166613236376432303665222C226D656469614B3200F417376561663137322D336531652D343135352D396132662D343134656534626431643131227D2C6100FA1530653332333234652D386663312D343832322D383430312D6130623362366461303637366100F71539346265633061642D373063362D346433642D626465352D6531626138356335353034356100FA1532663034366233302D393266642D346438302D383338352D3566623130633733376666666100F71564303531666135342D386235662D343033612D623361652D3332643338323162353730326100FA1561393866333337322D643461372D346630382D623834342D6263633935666335333633326100F81561363961366233382D323263652D343034312D396334612D3065613230393831356132666100F002646332396437632D373931342D343730345201EA632D6333363932656564356430316100F71565363030373330332D636365312D346638652D386232312D3131636661653131636338626100FA1565643636376537352D376462632D346339322D383631332D6633386138313266333837646100F71530386631656136312D636662332D343737382D626633362D3933363032326638336364326100FA1562616539343033352D663133372D343965302D383566392D6238326162653661333266626100C032376162323536392D3061642301F11531312D383234382D663038363636346134326362227D5DAD7469746C6550726F6A656374BD02F029D9EDD094D0B5D0BDD18C20D0B7D0B0D189D0B8D182D18B20D0B4D0B5D182D0B5D0B9F09F8C9F3B0AD090D182D0BED0BCD0B3D180D0B0D0B42300DFA0D0BED181D181D0B8D0B83B0A47005B119F8600C1B7D0B4D0BDD0B8D0BA20D0BBAF00F100B03B0AD09FD0B5D180D0B2D18BD0B9C60002DC0003200079AE73746174757302011088F90020D0B23700F103D188D191D0BD3B0AD0BFD0BED0B4D0B3D0BEF60031B2D0BA5B000F1600030E3E000E1200FF02B0D0BAD182D183D0B0D0BBD18CD0BDD0BE1400014AAC7479709D01F0003C4576656E74733B0A436F6E7465730A00F31453746F636B3B0A45786869626974696F6E733B0A486F6C69646179733B0A4F74686572070012ADA304B047616C6C6572799193A0A0C60000033DF12ADA03CB5B7B226B6579223A2234333864376535312D373865382D343363362D393138652D313138656566656537636566222C226D656469614B3200F41830616661346431662D633230312D343464652D616233652D393736636234346265353865227D2C6100FA1538653835326431632D383733372D346535312D613039612D6366616639353464646536356100F71566313933303636352D343037312D343564322D623032642D6434613639323466663432396100FA1535303663343465332D656333342D346331632D626366372D6632386330376331323831646100F71535613639393063302D313535362D343538302D393864372D6637303136383865303761616100FA1563646166343234392D663363392D343334372D616564662D3031626466396534393536636100F71561363463356562652D656465632D343436342D383036622D3533323663373062333631356100FA1538326231666363652D653138342D343835332D613635662D6137346533343035643834336100B032613537653864362D64398401F8056264392D623061372D66636433343163346130658401FA1566383936356662322D313632662D346638312D393961622D6431343463383361326336616100F71534326335633765652D653632392D343164342D386364642D336230346637373631376364C2008065653330613662627A01FA09382D346366612D613236632D6135373235373738346339376100F71530383036303834652D366561652D346431342D616661352D3461373164653337303530616100FA1535383038353238322D336338332D346637662D623131362D6164316430303365336238656100F71561656562393463632D623235322D343830302D623236312D3361366365623364663365386100FB1430333831346465362D393934382D343035332D383536662D3532613539613939393138E501F81430616663626339652D396138622D346161632D623938302D3562363663323962656537E501FA1534646263363266662D376564652D343534392D393236622D373639366463326264353238C200F02163646564363933352D333030382D346533322D386632312D646532393266623035323335227D5D80A770726F6A656374)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1089, 0, NULL, 1, 0x92D4620BC60000000CB0938080A773657276696365)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1089, 1, NULL, 0, 0x92D4620BC60000000CB0938080A773657276696365)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1090, 0, NULL, 1, 0x92D46208C60000000980938080A46E657773)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1090, 1, NULL, 0, 0x92D46208C60000000980938080A46E657773)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1091, 0, NULL, 1, 0x92D4620BC60000000CB0938080A7636F6E74616374)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1091, 1, NULL, 0, 0x92D4620BC60000000CB0938080A7636F6E74616374)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1149, 0, NULL, 1, 0x92D46209C60000000A90938080A5696E646578)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1149, 1, NULL, 1, 0x92D46209C60000000A90938080A5696E646578)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1151, 0, NULL, 0, 0x92D562CC9CC600000086F3299385AB756D627261636F46696C659193A0A0D9237B22737263223A222F6D656469612F6C33316E74306E332F636F7665722E6A7067227DAC3500505769647468360063D20000076CAD160063486569676874170024012C2D00504279746573160083A6313931373037B02F0090457874656E73696F6E1C00B0A36A706780A5636F766572)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1152, 0, NULL, 0, 0x92D562CC9DC600000085F32A9385AB756D627261636F46696C659193A0A0D9247B22737263223A222F6D656469612F627374673465626C2F6C6F616465722E676966227DAC3600505769647468370063D200000040AD1600654865696768741700042D00504279746573160073A53332353439B02E0090457874656E73696F6E1B00C0A367696680A66C6F61646572)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1153, 0, NULL, 0, 0x92D562CC98C600000080F3289385AB756D627261636F46696C659193A0A0D9227B22737263223A222F6D656469612F6D6C6E67737079322F6C6F676F2E706E67227DAC3400505769647468350063D200000040AD1600654865696768741700042D00504279746573160063A434353238B02D0090457874656E73696F6E1A00A0A3706E6780A46C6F676F)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1154, 0, NULL, 0, 0x92D562CC9AC600000082F3299385AB756D627261636F46696C659193A0A0D9237B22737263223A222F6D656469612F6C33656135356B322F6C6F676F322E706E67227DAC3500505769647468360063D200000040AD1600654865696768741700042D00504279746573160063A432353833B02D0090457874656E73696F6E1A00B0A3706E6780A56C6F676F32)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1155, 0, NULL, 0, 0x92D562CC9AC600000082F3299385AB756D627261636F46696C659193A0A0D9237B22737263223A222F6D656469612F6866696476696E782F6C6F676F332E706E67227DAC3500505769647468360063D200000040AD1600654865696768741700042D00504279746573160063A431353731B02D0090457874656E73696F6E1A00B0A3706E6780A56C6F676F33)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1156, 0, NULL, 0, 0x92D562CC9AC600000082F3299385AB756D627261636F46696C659193A0A0D9237B22737263223A222F6D656469612F6B7A326E757077332F6C6F676F342E706E67227DAC3500505769647468360063D200000040AD1600654865696768741700042D00504279746573160063A435303937B02D0090457874656E73696F6E1A00B0A3706E6780A56C6F676F34)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1157, 0, NULL, 0, 0x92D562CCA5C60000008DF32F9385AB756D627261636F46696C659193A0A0D9297B22737263223A222F6D656469612F6A616E66636469322F77686974657371756172652E706E67227DAC3B005057696474683C0063D20000000FAD1600654865696768741700042D00504279746573160053A3313339B02C0091457874656E73696F6E1900F001706E6780AB7768697465737175617265)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1158, 0, NULL, 0, 0x92D46209C60000000A90938080A56173696465)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1159, 0, NULL, 0, 0x92D562CC91C60000007BF3249385AB756D627261636F46696C659193A0A0BF7B22737263223A222F6D656469612F77776F646F666E6B2F312E6A7067227DAC3000505769647468310063D200000032AD1600654865696768741700042D00504279746573160063A432373631B02D00F005457874656E73696F6E9193A0A0A36A706780A131)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1160, 0, NULL, 0, 0x92D562CC91C60000007BF3249385AB756D627261636F46696C659193A0A0BF7B22737263223A222F6D656469612F347A756C3173646A2F322E6A7067227DAC3000505769647468310063D200000032AD1600654865696768741700042D00504279746573160063A432363636B02D00F005457874656E73696F6E9193A0A0A36A706780A132)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1161, 0, NULL, 0, 0x92D562CC91C60000007BF3249385AB756D627261636F46696C659193A0A0BF7B22737263223A222F6D656469612F7A6E706C74306E322F332E6A7067227DAC3000505769647468310063D200000032AD1600654865696768741700042D00504279746573160063A432303933B02D00F005457874656E73696F6E9193A0A0A36A706780A133)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1162, 0, NULL, 0, 0x92D562CC9EC600000086F32B9385AB756D627261636F46696C659193A0A0D9257B22737263223A222F6D656469612F74666D6F7371736A2F726563656E74312E706E67227DAC3700505769647468380063D200000032AD1600654865696768741700042D00504279746573160063A431393433B02D0090457874656E73696F6E1A00D0A3706E6780A7726563656E7431)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1163, 0, NULL, 0, 0x92D562CC9EC600000086F32B9385AB756D627261636F46696C659193A0A0D9257B22737263223A222F6D656469612F6161696A6278306F2F726563656E74322E706E67227DAC3700505769647468380063D200000032AD1600654865696768741700042D00504279746573160063A432313237B02D0090457874656E73696F6E1A00D0A3706E6780A7726563656E7432)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1164, 0, NULL, 0, 0x92D562CC9EC600000086F32B9385AB756D627261636F46696C659193A0A0D9257B22737263223A222F6D656469612F66707266623061652F726563656E74332E706E67227DAC3700505769647468380063D200000032AD1600654865696768741700042D00504279746573160063A432313538B02D0090457874656E73696F6E1A00D0A3706E6780A7726563656E7433)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1165, 0, NULL, 0, 0x92D46208C60000000980938080A4646F6373)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1166, 0, NULL, 0, 0x92D562CC98C600000082F3289385AB756D627261636F46696C659193A0A0D9227B22737263223A222F6D656469612F6D696164666978702F646F63312E706E67227DAC3400F30057696474689193A0A0D200000080AD1600654865696768741700042D00504279746573160063A431343438B02D0090457874656E73696F6E1A00A0A3706E6780A4646F6331)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1167, 0, NULL, 0, 0x92D46209C60000000A90938080A5666C616773)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1168, 0, NULL, 0, 0x92D562CC99C600000081F3299385AB756D627261636F46696C659193A0A0D9237B22737263223A222F6D656469612F716B336A7077767A2F666C6167312E706E67227DAC3500505769647468360063D200000014AD1600644865696768741700140D2D00504279746573160053A3383136B02C0091457874656E73696F6E1900A0706E6780A5666C616731)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1169, 0, NULL, 0, 0x92D562CC99C600000081F3299385AB756D627261636F46696C659193A0A0D9237B22737263223A222F6D656469612F3475666C7A30626D2F666C6167322E706E67227DAC3500505769647468360063D200000014AD1600644865696768741700140D2D00504279746573160053A3373631B02C0091457874656E73696F6E1900A0706E6780A5666C616732)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1170, 0, NULL, 0, 0x92D562CC99C600000081F3299385AB756D627261636F46696C659193A0A0D9237B22737263223A222F6D656469612F746F6770786867762F666C6167332E706E67227DAC3500505769647468360063D200000014AD1600644865696768741700140D2D00504279746573160053A3383033B02C0091457874656E73696F6E1900A0706E6780A5666C616733)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1171, 0, NULL, 0, 0x92D562CC99C600000081F3299385AB756D627261636F46696C659193A0A0D9237B22737263223A222F6D656469612F677676636D75686A2F666C6167342E706E67227DAC3500505769647468360063D200000014AD1600644865696768741700140D2D00504279746573160053A3383534B02C0091457874656E73696F6E1900A0706E6780A5666C616734)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1172, 0, NULL, 0, 0x92D4620BC60000000CB0938080A767616C6C657279)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1173, 0, NULL, 0, 0x92D562CC94C600000080F3249385AB756D627261636F46696C659193A0A0BF7B22737263223A222F6D656469612F64666770756371622F312E6A7067227DAC3000505769647468310063D200000A00AD160063486569676874170024097A2D00504279746573160093A732323030333932B03000F005457874656E73696F6E9193A0A0A36A706780A131)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1174, 0, NULL, 0, 0x92D562CC96C600000082F3269385AB756D627261636F46696C659193A0A0D9207B22737263223A222F6D656469612F6D6D646A68326C722F31302E6A7067227DAC3200505769647468330063D2000007C3AD16006348656967687417002406082D00504279746573160083A6373730333438B02F00F006457874656E73696F6E9193A0A0A36A706780A23130)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1175, 0, NULL, 0, 0x92D562CC94C600000080F3249385AB756D627261636F46696C659193A0A0BF7B22737263223A222F6D656469612F79306967737773772F322E6A7067227DAC3000505769647468310063D200000A00AD16006348656967687417002407802D00504279746573160093A732303233363135B03000F005457874656E73696F6E9193A0A0A36A706780A132)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1176, 0, NULL, 0, 0x92D562CC94C600000080F3249385AB756D627261636F46696C659193A0A0BF7B22737263223A222F6D656469612F786270657A6A786D2F332E6A7067227DAC3000505769647468310063D200000A00AD16006348656967687417002407802D00504279746573160093A732303737393136B03000F005457874656E73696F6E9193A0A0A36A706780A133)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1177, 0, NULL, 0, 0x92D562CC94C600000080F3249385AB756D627261636F46696C659193A0A0BF7B22737263223A222F6D656469612F6A6165616D63666F2F342E6A7067227DAC3000505769647468310063D200000A00AD16006348656967687417002407802D00504279746573160093A732323732303035B03000F005457874656E73696F6E9193A0A0A36A706780A134)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1178, 0, NULL, 0, 0x92D562CC94C600000080F3249385AB756D627261636F46696C659193A0A0BF7B22737263223A222F6D656469612F3364646E6B71726A2F352E6A7067227DAC3000505769647468310063D200000654AD16006348656967687417002408702D00504279746573160093A731343036313931B03000F005457874656E73696F6E9193A0A0A36A706780A135)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1179, 0, NULL, 0, 0x92D562CC93C60000007FF3249385AB756D627261636F46696C659193A0A0BF7B22737263223A222F6D656469612F7A6B6B6F786C73732F362E6A7067227DAC3000505769647468310063D20000032AAD16006348656967687417002404382D00504279746573160083A6353033303333B02F00F005457874656E73696F6E9193A0A0A36A706780A136)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1180, 0, NULL, 0, 0x92D562CC94C600000080F3249385AB756D627261636F46696C659193A0A0BF7B22737263223A222F6D656469612F306475666F6B71622F372E6A7067227DAC3000505769647468310063D200000A00AD16006348656967687417002407802D00504279746573160093A731333031393732B03000F005457874656E73696F6E9193A0A0A36A706780A137)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1181, 0, NULL, 0, 0x92D562CC94C600000080F3249385AB756D627261636F46696C659193A0A0BF7B22737263223A222F6D656469612F746334707963756C2F382E6A7067227DAC3000505769647468310063D200000A00AD16006348656967687417002407802D00504279746573160093A731373234393834B03000F005457874656E73696F6E9193A0A0A36A706780A138)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1182, 0, NULL, 0, 0x92D562CC93C60000007FF3249385AB756D627261636F46696C659193A0A0BF7B22737263223A222F6D656469612F676E7570317469692F392E6A7067227DAC3000505769647468310063D20000032AAD16006348656967687417002404382D00504279746573160083A6353033303333B02F00F005457874656E73696F6E9193A0A0A36A706780A139)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1183, 0, NULL, 0, 0x92D46208C60000000980938080A46E657773)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1184, 0, NULL, 0, 0x92D562CC99C600000082F3289385AB756D627261636F46696C659193A0A0D9227B22737263223A222F6D656469612F676969706F3161762F6E6577312E6A7067227DAC3400505769647468350063D20000012CAD160064486569676874170014402D00504279746573160073A53238393639B02E0090457874656E73696F6E1B00A0A36A706780A46E657731)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1185, 0, NULL, 0, 0x92D562CC9AC600000084F3289385AB756D627261636F46696C659193A0A0D9227B22737263223A222F6D656469612F70646162626F34302F6E6577322E6A7067227DAC3400505769647468350063D200000443AD16006348656967687417002402D82D00504279746573160083A6313339373535B02F0090457874656E73696F6E1C00A0A36A706780A46E657732)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1186, 0, NULL, 0, 0x92D562CC99C600000082F3289385AB756D627261636F46696C659193A0A0D9227B22737263223A222F6D656469612F336F6666316C6C772F6E6577332E6A7067227DAC3400505769647468350063D2000001F4AD1600644865696768741700144D2D00504279746573160073A53734373437B02E0090457874656E73696F6E1B00A0A36A706780A46E657733)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1187, 0, NULL, 0, 0x92D562CCABC60000008CF3329385AB756D627261636F46696C659193A0A0D92C7B22737263223A222F6D656469612F796C3267713376722F7265706C79696E64696361746F722E706E67227DAC3E005057696474683F0063D200000050AD5400654865696768741700042D00504279746573160053A3313633B02C0091457874656E73696F6E190055706E6780AE7100506361746F72)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1188, 0, NULL, 0, 0x92D4620CC60000000DC0938080A870726F6A65637473)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1189, 0, NULL, 0, 0x92D562CCA2C60000008CF32C9385AB756D627261636F46696C659193A0A0D9267B22737263223A222F6D656469612F6F747970753379342F70726F6A656374312E6A7067227DAC3800505769647468390063D200000320AD16006348656967687417002402582D00504279746573160083A6323035373937B02F0090457874656E73696F6E1C00E0A36A706780A870726F6A65637431)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1190, 0, NULL, 0, 0x92D562CCA2C60000008CF32C9385AB756D627261636F46696C659193A0A0D9267B22737263223A222F6D656469612F7670616C336667672F70726F6A656374322E6A7067227DAC3800505769647468390063D200000320AD16006348656967687417002402582D00504279746573160083A6313538343234B02F0090457874656E73696F6E1C00E0A36A706780A870726F6A65637432)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1191, 0, NULL, 0, 0x92D562CCA2C60000008CF32C9385AB756D627261636F46696C659193A0A0D9267B22737263223A222F6D656469612F687A766A766A776F2F70726F6A656374332E6A7067227DAC3800505769647468390063D200000320AD16006348656967687417002402582D00504279746573160083A6313733343838B02F0090457874656E73696F6E1C00E0A36A706780A870726F6A65637433)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1192, 0, NULL, 0, 0x92D562CCA2C60000008CF32C9385AB756D627261636F46696C659193A0A0D9267B22737263223A222F6D656469612F6B6C3366647563352F70726F6A656374342E6A7067227DAC3800505769647468390063D200000320AD16006348656967687417002402582D00504279746573160083A6313438393434B02F0090457874656E73696F6E1C00E0A36A706780A870726F6A65637434)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1193, 0, NULL, 0, 0x92D562CCA2C60000008CF32C9385AB756D627261636F46696C659193A0A0D9267B22737263223A222F6D656469612F61767A62627A78622F70726F6A656374352E6A7067227DAC3800505769647468390063D200000320AD16006348656967687417002402582D00504279746573160083A6323231353439B02F0090457874656E73696F6E1C00E0A36A706780A870726F6A65637435)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1194, 0, NULL, 0, 0x92D562CCA2C60000008CF32C9385AB756D627261636F46696C659193A0A0D9267B22737263223A222F6D656469612F6D357670636366742F70726F6A656374362E6A7067227DAC3800505769647468390063D200000320AD16006348656967687417002402582D00504279746573160083A6323439303939B02F0090457874656E73696F6E1C00E0A36A706780A870726F6A65637436)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1195, 0, NULL, 0, 0x92D562CCA3C60000008DF32C9385AB756D627261636F46696C659193A0A0D9267B22737263223A222F6D656469612F6E32736C776A34342F70726F6A656374372E6A7067227DAC3800505769647468390063D200000A00AD16006348656967687417002407802D00504279746573160093A731373538393637B0300090457874656E73696F6E1D00E0A36A706780A870726F6A65637437)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1196, 0, NULL, 0, 0x92D4620BC60000000CB0938080A7736C6964657273)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1197, 0, NULL, 0, 0x92D562CC9DC600000086F32A9385AB756D627261636F46696C659193A0A0D9247B22737263223A222F6D656469612F7375336C6F68346B2F6176617461722E706E67227DAC3600505769647468370063D200000050AD160064486569676874170014552D00504279746573160073A53137323834B02E0090457874656E73696F6E1B00C0A3706E6780A6617661746172)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1198, 0, NULL, 0, 0x92D562CC97C60000007FF3289385AB756D627261636F46696C659193A0A0D9227B22737263223A222F6D656469612F74783169716768632F69636F312E706E67227DAC3400505769647468350063D200000038AD160064486569676874170014362D00504279746573160053A3333235B02C0091457874656E73696F6E190090706E6780A469636F31)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1199, 0, NULL, 0, 0x92D562CC97C60000007FF3289385AB756D627261636F46696C659193A0A0D9227B22737263223A222F6D656469612F73743168766271732F69636F322E706E67227DAC3400505769647468350063D200000038AD1600644865696768741700142E2D00504279746573160053A3343539B02C0091457874656E73696F6E190090706E6780A469636F32)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1200, 0, NULL, 0, 0x92D562CC97C60000007FF3289385AB756D627261636F46696C659193A0A0D9227B22737263223A222F6D656469612F306474706D67616D2F69636F332E706E67227DAC3400505769647468350063D200000038AD1600644865696768741700142E2D00504279746573160053A3323138B02C0091457874656E73696F6E190090706E6780A469636F33)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1201, 0, NULL, 0, 0x92D562CC98C600000084F3279385AB756D627261636F46696C659193A0A0D9217B22737263223A222F6D656469612F64303567633175742F6D616E2E706E67227DAC3300F30057696474689193A0A0D200000198AD16006348656967687417002402642D00504279746573160083A6323338313137B02F0090457874656E73696F6E1C0090A3706E6780A36D616E)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1202, 0, NULL, 0, 0x92D562CC9BC600000084F3299385AB756D627261636F46696C659193A0A0D9237B22737263223A222F6D656469612F69347867746863692F70686F746F2E706E67227DAC3500505769647468360063D200000085AD1600644865696768741700148D2D00504279746573160073A53434343937B02E0090457874656E73696F6E1B00B0A3706E6780A570686F746F)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1203, 0, NULL, 0, 0x92D562CC9EC600000088F32A9385AB756D627261636F46696C659193A0A0D9247B22737263223A222F6D656469612F6D346667627969772F736C696465312E6A7067227DAC3600505769647468370063D200000780AD16006348656967687417002405002D00504279746573160083A6393338313731B02F0090457874656E73696F6E1C00C0A36A706780A6736C69646531)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1204, 0, NULL, 0, 0x92D562CC9FC600000089F32A9385AB756D627261636F46696C659193A0A0D9247B22737263223A222F6D656469612F71313070656963682F736C696465322E6A7067227DAC3600505769647468370063D2000007CFAD16006348656967687417002405352D00504279746573160093A731353638323138B0300090457874656E73696F6E1D00C0A36A706780A6736C69646532)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1205, 0, NULL, 0, 0x92D562CC9EC600000088F32A9385AB756D627261636F46696C659193A0A0D9247B22737263223A222F6D656469612F346C6464767673622F736C696465332E6A7067227DAC3600505769647468370063D200000780AD16006348656967687417002404382D00504279746573160083A6353839303334B02F0090457874656E73696F6E1C00C0A36A706780A6736C69646533)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1206, 0, NULL, 0, 0x92D4620FC600000011F000938080AB74657374696D6F6E69616C)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1207, 0, NULL, 0, 0x92D562CC99C600000081F3299385AB756D627261636F46696C659193A0A0D9237B22737263223A222F6D656469612F30757A686B7576682F6172726F772E706E67227DAC3500505769647468360063D20000002AAD160064486569676874170014152D00504279746573160053A3323132B02C0091457874656E73696F6E1900A0706E6780A56172726F77)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1208, 0, NULL, 0, 0x92D562CCA6C600000091F32E9385AB756D627261636F46696C659193A0A0D9287B22737263223A222F6D656469612F33687A6D6675636B2F6261636B67726F756E642E706E67227DAC3A005057696474683B0063D200000271AD160063486569676874170024018F2D00504279746573160083A6313037383036B02F0090457874656E73696F6E1C00F001A3706E6780AA6261636B67726F756E64)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1209, 0, NULL, 0, 0x92D562CC9BC600000084F3299385AB756D627261636F46696C659193A0A0D9237B22737263223A222F6D656469612F3368716E686163702F74657374312E6A7067227DAC3500505769647468360063D200000320AD160063486569676874170015022D00504279746573160073A53632343538B02E0090457874656E73696F6E1B00B0A36A706780A57465737431)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1210, 0, NULL, 0, 0x92D562CC9BC600000085F3299385AB756D627261636F46696C659193A0A0D9237B22737263223A222F6D656469612F7872326D6868736B2F74657374322E6A7067227DAC3500505769647468360063D200000320AD16006348656967687417002402172D00504279746573160073A53737393736B02E0090457874656E73696F6E1B00B0A36A706780A57465737432)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1211, 0, NULL, 0, 0x92D4620BC60000000CB0938080A7776F726B657273)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1212, 0, NULL, 0, 0x92D562CCA2C60000008CF32C9385AB756D627261636F46696C659193A0A0D9267B22737263223A222F6D656469612F32766E6C686762722F61626F75742D75732E6A7067227DAC3800505769647468390063D200000320AD16006348656967687417002402B72D00504279746573160083A6313735383139B02F0090457874656E73696F6E1C00E0A36A706780A861626F75742D7573)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1213, 0, NULL, 0, 0x92D562CC9AC600000083F3289385AB756D627261636F46696C659193A0A0D9227B22737263223A222F6D656469612F3477656F797565732F6D656D312E706E67227DAC3400505769647468350063D20000010EAD160064486569676874170014722D00504279746573160083A6313534373230B02F0090457874656E73696F6E1C00A0A3706E6780A46D656D31)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1214, 0, NULL, 0, 0x92D562CC9AC600000083F3289385AB756D627261636F46696C659193A0A0D9227B22737263223A222F6D656469612F6F32766A626971712F6D656D322E706E67227DAC3400505769647468350063D20000010EAD160064486569676874170014722D00504279746573160083A6313133363130B02F0090457874656E73696F6E1C00A0A3706E6780A46D656D32)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1215, 0, NULL, 0, 0x92D562CC9AC600000083F3289385AB756D627261636F46696C659193A0A0D9227B22737263223A222F6D656469612F706D6E666F3579742F6D656D332E706E67227DAC3400505769647468350063D20000010EAD160064486569676874170014722D00504279746573160083A6313534373230B02F0090457874656E73696F6E1C00A0A3706E6780A46D656D33)
GO
SET IDENTITY_INSERT [dbo].[cmsContentType] ON 

INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (531, 1044, N'Member', N'icon-user', N'icon-user', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (532, 1031, N'Folder', N'icon-folder', N'icon-folder', NULL, 0, 0, 1, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (533, 1032, N'Image', N'icon-picture', N'icon-picture', NULL, 0, 0, 1, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (534, 1033, N'File', N'icon-document', N'icon-document', NULL, 0, 0, 1, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (540, 1034, N'umbracoMediaVideo', N'icon-video', N'icon-video', NULL, 0, 0, 1, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (541, 1035, N'umbracoMediaAudio', N'icon-sound-waves', N'icon-sound-waves', NULL, 0, 0, 1, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (542, 1036, N'umbracoMediaArticle', N'icon-article', N'icon-article', NULL, 0, 0, 1, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (543, 1037, N'umbracoMediaVectorGraphics', N'icon-picture', N'icon-picture', NULL, 0, 0, 1, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (548, 1073, N'mainView', N'icon-home color-blue', N'folder.png', NULL, 0, 0, 1, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (549, 1078, N'aboutsUs', N'icon-phone color-deep-orange', N'folder.png', NULL, 0, 0, 1, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (550, 1081, N'project', N'icon-certificate color-deep-orange', N'folder.png', NULL, 0, 0, 1, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (551, 1083, N'service', N'icon-bill-dollar color-deep-orange', N'folder.png', NULL, 0, 0, 1, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (552, 1085, N'news', N'icon-newspaper-alt color-deep-orange', N'folder.png', NULL, 0, 0, 1, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (553, 1087, N'contact', N'icon-documents color-deep-orange', N'folder.png', NULL, 0, 0, 1, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (555, 1148, N'index', N'icon-document color-deep-orange', N'folder.png', NULL, 0, 0, 1, 0)
SET IDENTITY_INSERT [dbo].[cmsContentType] OFF
GO
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1078, 1073)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1081, 1073)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1083, 1073)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1085, 1073)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1087, 1073)
GO
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1031, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1032, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1033, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1034, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1035, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1036, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1037, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1073, 1078, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1073, 1081, 1)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1073, 1083, 2)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1073, 1085, 3)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1073, 1087, 4)
GO
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1073, 1075, 0)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1073, 1147, 0)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1078, 1077, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1081, 1080, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1083, 1082, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1085, 1084, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1087, 1086, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1148, 1147, 1)
GO
SET IDENTITY_INSERT [dbo].[cmsMacro] ON 

INSERT [dbo].[cmsMacro] ([id], [uniqueId], [macroUseInEditor], [macroRefreshRate], [macroAlias], [macroName], [macroCacheByPage], [macroCachePersonalized], [macroDontRender], [macroSource], [macroType]) VALUES (2, N'9e6e05db-bc2e-4f9f-8ac7-cf70979a11dd', 0, 0, N'Aside', N'Aside', 0, 0, 0, N'~/Views/MacroPartials/Aside.cshtml', 7)
INSERT [dbo].[cmsMacro] ([id], [uniqueId], [macroUseInEditor], [macroRefreshRate], [macroAlias], [macroName], [macroCacheByPage], [macroCachePersonalized], [macroDontRender], [macroSource], [macroType]) VALUES (3, N'480075d7-3f9d-4190-9356-11978ddbb8cf', 1, 0, N'renderUmbracoForm', N'Insert Form with Theme', 0, 0, 0, N'~/Views/MacroPartials/InsertUmbracoFormWithTheme.cshtml', 7)
SET IDENTITY_INSERT [dbo].[cmsMacro] OFF
GO
SET IDENTITY_INSERT [dbo].[cmsMacroProperty] ON 

INSERT [dbo].[cmsMacroProperty] ([id], [uniquePropertyId], [editorAlias], [macro], [macroPropertySortOrder], [macroPropertyAlias], [macroPropertyName]) VALUES (1, N'6aea3d9a-eea6-47af-8c58-fa37cc49f414', N'UmbracoForms.FormPicker', 3, 0, N'FormGuid', N'Choose a form')
INSERT [dbo].[cmsMacroProperty] ([id], [uniquePropertyId], [editorAlias], [macro], [macroPropertySortOrder], [macroPropertyAlias], [macroPropertyName]) VALUES (2, N'83c70339-98a0-4111-853c-2f0d4014a4fc', N'UmbracoForms.ThemePicker', 3, 1, N'FormTheme', N'Theme')
INSERT [dbo].[cmsMacroProperty] ([id], [uniquePropertyId], [editorAlias], [macro], [macroPropertySortOrder], [macroPropertyAlias], [macroPropertyName]) VALUES (3, N'2d5fdda2-e19f-4103-b43e-269186fda969', N'Umbraco.TrueFalse', 3, 2, N'ExcludeScripts', N'Exclude Scripts')
SET IDENTITY_INSERT [dbo].[cmsMacroProperty] OFF
GO
SET IDENTITY_INSERT [dbo].[cmsPropertyType] ON 

INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (6, 1043, 1032, 3, N'umbracoFile', N'Image', 0, 1, NULL, NULL, NULL, NULL, 0, 0, N'00000006-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (7, -91, 1032, 3, N'umbracoWidth', N'Width', 0, 0, NULL, NULL, NULL, N'in pixels', 0, 0, N'00000007-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (8, -91, 1032, 3, N'umbracoHeight', N'Height', 0, 0, NULL, NULL, NULL, N'in pixels', 0, 0, N'00000008-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (9, -93, 1032, 3, N'umbracoBytes', N'Size', 0, 0, NULL, NULL, NULL, N'in bytes', 0, 0, N'00000009-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (10, -92, 1032, 3, N'umbracoExtension', N'Type', 0, 0, NULL, NULL, NULL, NULL, 0, 0, N'0000000a-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (24, -90, 1033, 4, N'umbracoFile', N'File', 0, 1, NULL, NULL, NULL, NULL, 0, 0, N'00000018-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (25, -92, 1033, 4, N'umbracoExtension', N'Type', 0, 0, NULL, NULL, NULL, NULL, 0, 0, N'00000019-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (26, -93, 1033, 4, N'umbracoBytes', N'Size', 0, 0, NULL, NULL, NULL, N'in bytes', 0, 0, N'0000001a-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (28, -89, 1044, 11, N'umbracoMemberComments', N'Comments', 0, 0, NULL, NULL, NULL, NULL, 0, 0, N'0000001c-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (29, -91, 1044, 11, N'umbracoMemberFailedPasswordAttempts', N'Failed Password Attempts', 1, 0, NULL, NULL, NULL, NULL, 0, 0, N'0000001d-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (30, -49, 1044, 11, N'umbracoMemberApproved', N'Is Approved', 2, 0, NULL, NULL, NULL, NULL, 0, 0, N'0000001e-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (31, -49, 1044, 11, N'umbracoMemberLockedOut', N'Is Locked Out', 3, 0, NULL, NULL, NULL, NULL, 0, 0, N'0000001f-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (32, -94, 1044, 11, N'umbracoMemberLastLockoutDate', N'Last Lockout Date', 4, 0, NULL, NULL, NULL, NULL, 0, 0, N'00000020-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (33, -94, 1044, 11, N'umbracoMemberLastLogin', N'Last Login Date', 5, 0, NULL, NULL, NULL, NULL, 0, 0, N'00000021-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (34, -94, 1044, 11, N'umbracoMemberLastPasswordChangeDate', N'Last Password Change Date', 6, 0, NULL, NULL, NULL, NULL, 0, 0, N'00000022-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (40, -100, 1034, 52, N'umbracoFile', N'Video', 0, 1, NULL, NULL, NULL, NULL, 0, 0, N'00000028-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (41, -92, 1034, 52, N'umbracoExtension', N'Type', 0, 0, NULL, NULL, NULL, NULL, 0, 0, N'00000029-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (42, -93, 1034, 52, N'umbracoBytes', N'Size', 0, 0, NULL, NULL, NULL, N'in bytes', 0, 0, N'0000002a-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (43, -101, 1035, 53, N'umbracoFile', N'Audio', 0, 1, NULL, NULL, NULL, NULL, 0, 0, N'0000002b-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (44, -92, 1035, 53, N'umbracoExtension', N'Type', 0, 0, NULL, NULL, NULL, NULL, 0, 0, N'0000002c-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (45, -93, 1035, 53, N'umbracoBytes', N'Size', 0, 0, NULL, NULL, NULL, N'in bytes', 0, 0, N'0000002d-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (46, -102, 1036, 54, N'umbracoFile', N'Article', 0, 1, NULL, NULL, NULL, NULL, 0, 0, N'0000002e-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (47, -92, 1036, 54, N'umbracoExtension', N'Type', 0, 0, NULL, NULL, NULL, NULL, 0, 0, N'0000002f-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (48, -93, 1036, 54, N'umbracoBytes', N'Size', 0, 0, NULL, NULL, NULL, N'in bytes', 0, 0, N'00000030-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (49, -103, 1037, 55, N'umbracoFile', N'Vector Graphics', 0, 1, NULL, NULL, NULL, NULL, 0, 0, N'00000031-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (50, -92, 1037, 55, N'umbracoExtension', N'Type', 0, 0, NULL, NULL, NULL, NULL, 0, 0, N'00000032-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (51, -93, 1037, 55, N'umbracoBytes', N'Size', 0, 0, NULL, NULL, NULL, N'in bytes', 0, 0, N'00000033-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (84, 1054, 1081, 65, N'images', N'Images', 0, 0, NULL, NULL, NULL, NULL, 0, 0, N'48148885-494f-4ac1-8290-d483eef1ae03')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (85, -89, 1081, 65, N'titleProjects', N'TitleProjects', 0, 0, NULL, NULL, NULL, NULL, 0, 0, N'ceadaa2c-f5e8-47c8-b7b7-b99e356d4b71')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (86, -89, 1081, 65, N'statusProjects', N'StatusProjects', 0, 0, NULL, NULL, NULL, NULL, 0, 0, N'e0bd5f25-b8b8-4b0c-a9fd-bd114025e921')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (87, -89, 1081, 65, N'typeProjects', N'TypeProjects', 0, 0, NULL, NULL, NULL, NULL, 0, 0, N'a1eacd93-0317-49b2-b994-ed194c9d6d52')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (88, 1054, 1081, 66, N'imagesGallery', N'ImagesGallery', 0, 0, NULL, NULL, NULL, NULL, 0, 0, N'2ac0a2d0-ab43-48f0-89c3-b0093ecc87c9')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (89, 1054, 1073, 67, N'imagesSlider', N'ImagesSlider', 0, 0, NULL, NULL, NULL, NULL, 0, 0, N'e937d6ef-91cf-4a42-b720-20f85b35abfe')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (90, -89, 1073, 67, N'headersSlider', N'HeadersSlider', 1, 0, NULL, NULL, NULL, NULL, 0, 0, N'3b90708a-3ad4-4576-8e87-7bba39d5de54')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (91, -89, 1073, 67, N'textsSlider', N'TextsSlider', 2, 0, NULL, NULL, NULL, NULL, 0, 0, N'555adc77-6250-42a9-9721-68c76165f79c')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (92, 1150, 1073, 67, N'lastSliderText', N'LastSliderText', 3, 0, NULL, NULL, NULL, NULL, 0, 0, N'536287f1-218e-4f77-9e16-67b096729c4b')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (93, -89, 1073, 68, N'serviceTitles', N'ServiceTitles', 0, 0, NULL, NULL, NULL, NULL, 0, 0, N'751bb9fb-d14d-4b19-b743-f6f45e9beaa8')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (94, 1054, 1073, 69, N'testimonialImages', N'testimonialImages', 0, 0, NULL, NULL, NULL, NULL, 0, 0, N'c9f7befc-0ec2-4f83-90ff-b979d48d74f9')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (95, -89, 1073, 69, N'testimonialTexts', N'testimonialTexts', 1, 0, NULL, NULL, NULL, NULL, 0, 0, N'204b06e7-4293-4325-9184-387e8b329e08')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (96, -89, 1073, 69, N'testimonialNames', N'testimonialNames', 2, 0, NULL, NULL, NULL, NULL, 0, 0, N'a233ce02-2895-47ab-98cf-8c07ffc6cc60')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (97, -89, 1078, 70, N'headerTitle', N'HeaderTitle', 0, 0, NULL, NULL, NULL, NULL, 0, 0, N'078759b0-17e7-4ee9-b1bf-e2094eaabf89')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (98, -89, 1078, 70, N'headerText', N'HeaderText', 1, 0, NULL, NULL, NULL, NULL, 0, 0, N'eabe218e-9001-4bef-a226-ef63f6c091bb')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (99, 1053, 1078, 70, N'headerImage', N'HeaderImage', 2, 0, NULL, NULL, NULL, NULL, 0, 0, N'a3d86d5a-a980-40f6-b572-728ff3886a58')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (100, 1054, 1078, 71, N'workerImages', N'WorkerImages', 0, 0, NULL, NULL, NULL, NULL, 0, 0, N'a4e1750a-0e7b-46cb-8bdf-e0d7c28efe65')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (101, -89, 1078, 71, N'workerNames', N'WorkerNames', 1, 0, NULL, NULL, NULL, NULL, 0, 0, N'87fec6f1-c4cd-4d37-a934-440164026741')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (102, -89, 1078, 71, N'workerSpec', N'WorkerSpec', 2, 0, NULL, NULL, NULL, NULL, 0, 0, N'792e022a-3423-4e26-aee3-5eb76b06f6f4')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (103, -89, 1078, 72, N'docsTitles', N'DocsTitles', 0, 0, NULL, NULL, NULL, NULL, 0, 0, N'ea8d4904-104e-442e-96f3-0a7eecdf8806')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (104, -89, 1078, 72, N'docsLinks', N'DocsLinks', 1, 0, NULL, NULL, NULL, NULL, 0, 0, N'f2c383dc-4318-46be-aaf1-cbb05c1d340e')
SET IDENTITY_INSERT [dbo].[cmsPropertyType] OFF
GO
SET IDENTITY_INSERT [dbo].[cmsPropertyTypeGroup] ON 

INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (3, N'79ed4d07-254a-42cf-8fa9-ebe1c116a596', 1032, 0, N'Image', N'image', 1)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (4, N'50899f9c-023a-4466-b623-aba9049885fe', 1033, 0, N'File', N'file', 1)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (11, N'0756729d-d665-46e3-b84a-37aceaa614f8', 1044, 0, N'Membership', N'membership', 1)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (52, N'2f0a61b6-cf92-4ff4-b437-751ab35eb254', 1034, 0, N'Video', N'video', 1)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (53, N'335fb495-0a87-4e82-b902-30eb367b767c', 1035, 0, N'Audio', N'audio', 1)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (54, N'9af3bd65-f687-4453-9518-5f180d1898ec', 1036, 0, N'Article', N'article', 1)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (55, N'f199b4d7-9e84-439f-8531-f87d9af37711', 1037, 0, N'Vector Graphics', N'vectorGraphics', 1)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (65, N'c6ec062a-5de3-4705-882c-f0af79af62ad', 1081, 0, N'Projects', N'projects', 0)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (66, N'afc188d7-8670-42d1-820a-d0e31c5cb730', 1081, 0, N'Gallery', N'gallery', 1)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (67, N'dc231288-9014-489a-989e-5f78d630dcbf', 1073, 0, N'Slider', N'slider', 2)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (68, N'c42a1d64-5fc6-4ce5-8068-8fb4622d7c4c', 1073, 0, N'Services', N'services', 3)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (69, N'9c04d0a4-de54-470a-bb19-be5071d6eac9', 1073, 0, N'Testimonial', N'testimonial', 4)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (70, N'f7c9aeeb-3467-4dba-8fbe-cc524050115a', 1078, 0, N'Header', N'header', 0)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (71, N'2fcab735-4814-448a-b639-8c6f32d628f2', 1078, 0, N'Workers', N'workers', 1)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (72, N'e923d3db-494a-4203-a478-512c00aa4fa2', 1078, 0, N'Docs', N'docs', 2)
SET IDENTITY_INSERT [dbo].[cmsPropertyTypeGroup] OFF
GO
SET IDENTITY_INSERT [dbo].[cmsTemplate] ON 

INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (10, 1075, N'Master')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (12, 1077, N'AboutsUs')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (13, 1080, N'Project')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (14, 1082, N'Service')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (15, 1084, N'News')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (16, 1086, N'Contact')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (17, 1147, N'Index')
SET IDENTITY_INSERT [dbo].[cmsTemplate] OFF
GO
INSERT [dbo].[UFUserSecurity] ([User], [ManageDataSources], [ManagePreValueSources], [ManageWorkflows], [ManageForms], [ViewEntries], [EditEntries]) VALUES (N'-1', 1, 1, 1, 1, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[umbracoAudit] ON 

INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1, 0, N'User "SYSTEM" ', N'::1', CAST(N'2022-06-03T09:58:29.147' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/save', N'updating Email, Name, Username, UpdateDate, SecurityStamp')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (2, 0, N'User "SYSTEM" ', N'::1', CAST(N'2022-06-03T09:58:29.353' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/save', N'updating LastPasswordChangeDate, RawPasswordValue, SecurityStamp, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (3, -1, N'User "admin" <super.yttt2017@yandex.ru>', N'::1', CAST(N'2022-06-03T09:58:29.360' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/password/reset', N'password reset')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (4, 0, N'User "SYSTEM" ', N'::1', CAST(N'2022-06-03T09:58:45.803' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (5, -1, N'User "admin" <super.yttt2017@yandex.ru>', N'::1', CAST(N'2022-06-03T09:58:45.810' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (6, -1, N'User "admin" <super.yttt2017@yandex.ru>', N'::1', CAST(N'2022-06-03T09:59:56.497' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/save', N'updating TourData, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (7, 0, N'User "SYSTEM" ', N'::1', CAST(N'2022-06-03T11:09:27.890' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/save', N'updating FailedPasswordAttempts, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (8, -1, N'User "admin" <super.yttt2017@yandex.ru>', N'::1', CAST(N'2022-06-03T11:09:27.920' AS DateTime), 0, N'', N'umbraco/user/sign-in/failed', N'login failed')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (9, 0, N'User "SYSTEM" ', N'::1', CAST(N'2022-06-03T11:09:42.943' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/save', N'updating FailedPasswordAttempts, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (10, -1, N'User "admin" <super.yttt2017@yandex.ru>', N'::1', CAST(N'2022-06-03T11:09:42.950' AS DateTime), 0, N'', N'umbraco/user/sign-in/failed', N'login failed')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (11, 0, N'User "SYSTEM" ', N'::1', CAST(N'2022-06-03T11:09:46.970' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/save', N'updating FailedPasswordAttempts, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (12, -1, N'User "admin" <super.yttt2017@yandex.ru>', N'::1', CAST(N'2022-06-03T11:09:46.973' AS DateTime), 0, N'', N'umbraco/user/sign-in/failed', N'login failed')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (13, 0, N'User "SYSTEM" ', N'::1', CAST(N'2022-06-03T11:09:51.893' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/save', N'updating FailedPasswordAttempts, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (14, 0, N'User "SYSTEM" ', N'::1', CAST(N'2022-06-03T11:09:51.917' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (15, -1, N'User "admin" <super.yttt2017@yandex.ru>', N'::1', CAST(N'2022-06-03T11:09:51.923' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (16, -1, N'User "admin" <super.yttt2017@yandex.ru>', N'::1', CAST(N'2022-06-03T11:09:51.963' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (17, -1, N'User "admin" <super.yttt2017@yandex.ru>', N'::1', CAST(N'2022-06-03T11:09:51.967' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (18, 0, N'User "SYSTEM" ', N'::1', CAST(N'2022-06-03T14:34:38.353' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (19, -1, N'User "admin" <super.yttt2017@yandex.ru>', N'::1', CAST(N'2022-06-03T14:34:38.387' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (20, -1, N'User "admin" <super.yttt2017@yandex.ru>', N'::1', CAST(N'2022-06-03T14:34:38.423' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (21, -1, N'User "admin" <super.yttt2017@yandex.ru>', N'::1', CAST(N'2022-06-03T14:34:38.423' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (22, -1, N'User "admin" <super.yttt2017@yandex.ru>', N'::1', CAST(N'2022-06-03T14:34:39.953' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/save', N'updating TourData, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (23, 0, N'User "SYSTEM" ', N'::1', CAST(N'2022-06-04T17:53:55.387' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (24, -1, N'User "admin" <super.yttt2017@yandex.ru>', N'::1', CAST(N'2022-06-04T17:53:55.493' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (25, 0, N'User "SYSTEM" ', N'::1', CAST(N'2022-06-04T18:13:53.807' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (26, -1, N'User "admin" <super.yttt2017@yandex.ru>', N'::1', CAST(N'2022-06-04T18:13:53.830' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (27, -1, N'User "admin" <super.yttt2017@yandex.ru>', N'::1', CAST(N'2022-06-04T18:13:53.867' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (28, -1, N'User "admin" <super.yttt2017@yandex.ru>', N'::1', CAST(N'2022-06-04T18:13:53.870' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (29, 0, N'User "SYSTEM" ', N'::1', CAST(N'2022-06-07T17:01:34.177' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (30, -1, N'User "admin" <super.yttt2017@yandex.ru>', N'::1', CAST(N'2022-06-07T17:01:34.230' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (31, -1, N'User "admin" <super.yttt2017@yandex.ru>', N'::1', CAST(N'2022-06-07T17:01:34.297' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (32, -1, N'User "admin" <super.yttt2017@yandex.ru>', N'::1', CAST(N'2022-06-07T17:01:34.300' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (33, -1, N'User "admin" <super.yttt2017@yandex.ru>', N'::1', CAST(N'2022-06-07T22:36:15.560' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (34, -1, N'User "admin" <super.yttt2017@yandex.ru>', N'::1', CAST(N'2022-06-07T22:36:15.647' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (35, -1, N'User "admin" <super.yttt2017@yandex.ru>', N'::1', CAST(N'2022-06-07T22:36:15.680' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (36, -1, N'User "admin" <super.yttt2017@yandex.ru>', N'::1', CAST(N'2022-06-07T22:36:15.680' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (37, 0, N'User "SYSTEM" ', N'::1', CAST(N'2022-06-07T23:03:32.233' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/save', N'updating FailedPasswordAttempts, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (38, -1, N'User "admin" <super.yttt2017@yandex.ru>', N'::1', CAST(N'2022-06-07T23:03:32.260' AS DateTime), 0, N'', N'umbraco/user/sign-in/failed', N'login failed')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (39, 0, N'User "SYSTEM" ', N'::1', CAST(N'2022-06-07T23:03:35.300' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/save', N'updating FailedPasswordAttempts, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (40, 0, N'User "SYSTEM" ', N'::1', CAST(N'2022-06-07T23:03:35.313' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (41, -1, N'User "admin" <super.yttt2017@yandex.ru>', N'::1', CAST(N'2022-06-07T23:03:35.317' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (42, -1, N'User "admin" <super.yttt2017@yandex.ru>', N'::1', CAST(N'2022-06-07T23:03:35.330' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (43, -1, N'User "admin" <super.yttt2017@yandex.ru>', N'::1', CAST(N'2022-06-07T23:03:35.347' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (44, 0, N'User "SYSTEM" ', N'::1', CAST(N'2022-06-07T23:42:28.597' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (45, -1, N'User "admin" <super.yttt2017@yandex.ru>', N'::1', CAST(N'2022-06-07T23:42:28.600' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (46, -1, N'User "admin" <super.yttt2017@yandex.ru>', N'::1', CAST(N'2022-06-07T23:42:28.617' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (47, -1, N'User "admin" <super.yttt2017@yandex.ru>', N'::1', CAST(N'2022-06-07T23:42:28.617' AS DateTime), -1, N'User "admin" <super.yttt2017@yandex.ru>', N'umbraco/user/sign-in/login', N'login success')
SET IDENTITY_INSERT [dbo].[umbracoAudit] OFF
GO
SET IDENTITY_INSERT [dbo].[umbracoCacheInstruction] ON 

INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (274, CAST(N'2022-06-07T17:01:34.727' AS DateTime), N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29504/D1] D27520626F7A45C5A2FFD97CCAA1E6EB', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (275, CAST(N'2022-06-07T17:03:33.120' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1073,\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29504/D1] D27520626F7A45C5A2FFD97CCAA1E6EB', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (276, CAST(N'2022-06-07T17:04:53.320' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1147]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29504/D1] D27520626F7A45C5A2FFD97CCAA1E6EB', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (277, CAST(N'2022-06-07T17:04:57.373' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29504/D1] D27520626F7A45C5A2FFD97CCAA1E6EB', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (278, CAST(N'2022-06-07T17:05:12.263' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1147]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29504/D1] D27520626F7A45C5A2FFD97CCAA1E6EB', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (279, CAST(N'2022-06-07T17:05:24.613' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29504/D1] D27520626F7A45C5A2FFD97CCAA1E6EB', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (280, CAST(N'2022-06-07T17:05:41.203' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29504/D1] D27520626F7A45C5A2FFD97CCAA1E6EB', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (281, CAST(N'2022-06-07T17:05:54.887' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1147]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29504/D1] D27520626F7A45C5A2FFD97CCAA1E6EB', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (282, CAST(N'2022-06-07T17:06:01.500' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1147]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29504/D1] D27520626F7A45C5A2FFD97CCAA1E6EB', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (283, CAST(N'2022-06-07T17:06:18.383' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29504/D1] D27520626F7A45C5A2FFD97CCAA1E6EB', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (284, CAST(N'2022-06-07T17:07:31.200' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29504/D1] D27520626F7A45C5A2FFD97CCAA1E6EB', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (285, CAST(N'2022-06-07T17:07:46.740' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29504/D1] D27520626F7A45C5A2FFD97CCAA1E6EB', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (286, CAST(N'2022-06-07T17:08:00.307' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29504/D1] D27520626F7A45C5A2FFD97CCAA1E6EB', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (287, CAST(N'2022-06-07T17:08:56.580' AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1150,\"Key\":\"f197135a-070b-4cc8-8104-723f3c4b683f\",\"Removed\":false}]"},{"RefreshType":4,"RefresherId":"d28a1dbb-2308-4918-9a92-2f8689b6cbfe","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1150,\"Key\":\"f197135a-070b-4cc8-8104-723f3c4b683f\",\"Removed\":false}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29504/D1] D27520626F7A45C5A2FFD97CCAA1E6EB', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (288, CAST(N'2022-06-07T17:09:12.673' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1073,\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29504/D1] D27520626F7A45C5A2FFD97CCAA1E6EB', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (289, CAST(N'2022-06-07T17:10:06.143' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29504/D1] D27520626F7A45C5A2FFD97CCAA1E6EB', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (290, CAST(N'2022-06-07T17:18:10.313' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1073,\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29504/D1] D27520626F7A45C5A2FFD97CCAA1E6EB', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (291, CAST(N'2022-06-07T17:18:51.360' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29504/D1] D27520626F7A45C5A2FFD97CCAA1E6EB', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (292, CAST(N'2022-06-07T17:19:31.977' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1147]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29504/D1] D27520626F7A45C5A2FFD97CCAA1E6EB', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (293, CAST(N'2022-06-07T17:20:41.313' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29504/D1] D27520626F7A45C5A2FFD97CCAA1E6EB', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (294, CAST(N'2022-06-07T17:32:23.013' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1137,\"Key\":\"e4a4ce92-b012-43df-a9a1-c2f30b3adee3\",\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (295, CAST(N'2022-06-07T17:32:39.893' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1139,\"Key\":\"43f3b00e-7522-4520-91fd-4d7afba787d9\",\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (296, CAST(N'2022-06-07T17:32:47.347' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1092,\"Key\":\"494b2dfb-6be0-452b-842f-66bde538f43d\",\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (297, CAST(N'2022-06-07T17:32:56.483' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1093,\"Key\":\"e884c655-4079-43c4-99ec-49a493dc797c\",\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (298, CAST(N'2022-06-07T17:33:01.330' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1093,\"Key\":\"e884c655-4079-43c4-99ec-49a493dc797c\",\"ChangeTypes\":8}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (299, CAST(N'2022-06-07T17:33:04.653' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1132,\"Key\":\"b0d29f22-94c5-4fba-8254-f7b1089e9116\",\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (300, CAST(N'2022-06-07T17:33:10.440' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1130,\"Key\":\"bb5ac1fb-0b51-4dcf-a1a4-d68e08243a51\",\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (301, CAST(N'2022-06-07T17:33:10.520' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1125,\"Key\":\"ed367815-b06b-4259-a75e-91a450822338\",\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (302, CAST(N'2022-06-07T17:33:10.660' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1117,\"Key\":\"a38b1b65-50f6-435b-a3ae-3e351cf75956\",\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (303, CAST(N'2022-06-07T17:33:10.770' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1107,\"Key\":\"c81a457c-6ae4-4242-8c09-8f5e0bf27f41\",\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (304, CAST(N'2022-06-07T17:33:10.823' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1104,\"Key\":\"922ea280-cf35-4811-8367-c73efb51ba85\",\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (305, CAST(N'2022-06-07T17:33:10.897' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1099,\"Key\":\"5c9590f0-8e29-444f-a0e7-01f833ff9c67\",\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (306, CAST(N'2022-06-07T17:33:10.933' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1094,\"Key\":\"6c83c321-502e-440e-bf6b-e5f5439afa4f\",\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (307, CAST(N'2022-06-07T17:33:10.967' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1095,\"Key\":\"b9ca9c65-c290-49a7-88bb-196f159a96c9\",\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (308, CAST(N'2022-06-07T17:33:11.003' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1096,\"Key\":\"8a7343a8-0cdb-4e73-a0ae-6eb81f586e10\",\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (309, CAST(N'2022-06-07T17:33:11.033' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1097,\"Key\":\"5b62bf10-760c-40b2-b2ae-4c95510479de\",\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (310, CAST(N'2022-06-07T17:33:11.063' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1098,\"Key\":\"68aef7a9-bb0b-4a1e-94c8-4994bc727c2c\",\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (311, CAST(N'2022-06-07T17:33:29.177' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1137,\"Key\":\"e4a4ce92-b012-43df-a9a1-c2f30b3adee3\",\"ChangeTypes\":8},{\"Id\":1139,\"Key\":\"43f3b00e-7522-4520-91fd-4d7afba787d9\",\"ChangeTypes\":8},{\"Id\":1092,\"Key\":\"494b2dfb-6be0-452b-842f-66bde538f43d\",\"ChangeTypes\":8},{\"Id\":1132,\"Key\":\"b0d29f22-94c5-4fba-8254-f7b1089e9116\",\"ChangeTypes\":8},{\"Id\":1130,\"Key\":\"bb5ac1fb-0b51-4dcf-a1a4-d68e08243a51\",\"ChangeTypes\":8},{\"Id\":1125,\"Key\":\"ed367815-b06b-4259-a75e-91a450822338\",\"ChangeTypes\":8},{\"Id\":1117,\"Key\":\"a38b1b65-50f6-435b-a3ae-3e351cf75956\",\"ChangeTypes\":8},{\"Id\":1107,\"Key\":\"c81a457c-6ae4-4242-8c09-8f5e0bf27f41\",\"ChangeTypes\":8},{\"Id\":1104,\"Key\":\"922ea280-cf35-4811-8367-c73efb51ba85\",\"ChangeTypes\":8},{\"Id\":1099,\"Key\":\"5c9590f0-8e29-444f-a0e7-01f833ff9c67\",\"ChangeTypes\":8},{\"Id\":1094,\"Key\":\"6c83c321-502e-440e-bf6b-e5f5439afa4f\",\"ChangeTypes\":8},{\"Id\":1095,\"Key\":\"b9ca9c65-c290-49a7-88bb-196f159a96c9\",\"ChangeTypes\":8},{\"Id\":1096,\"Key\":\"8a7343a8-0cdb-4e73-a0ae-6eb81f586e10\",\"ChangeTypes\":8},{\"Id\":1097,\"Key\":\"5b62bf10-760c-40b2-b2ae-4c95510479de\",\"ChangeTypes\":8},{\"Id\":1098,\"Key\":\"68aef7a9-bb0b-4a1e-94c8-4994bc727c2c\",\"ChangeTypes\":8}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (312, CAST(N'2022-06-07T17:34:03.803' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1151,\"Key\":\"e9c97759-4bbd-4ef1-8c47-f2ea722ebd1c\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (313, CAST(N'2022-06-07T17:34:03.877' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1152,\"Key\":\"106fa60a-ac2b-4317-a4a4-d3ccb4211551\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (314, CAST(N'2022-06-07T17:34:03.927' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1153,\"Key\":\"3f69da64-041c-4c25-93d4-407323965b28\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (315, CAST(N'2022-06-07T17:34:03.983' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1154,\"Key\":\"fd0f4859-475c-46ce-aeb1-098583a5ad13\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (316, CAST(N'2022-06-07T17:34:04.027' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1155,\"Key\":\"a12a513f-97b7-4f57-b344-0cab890da23a\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (317, CAST(N'2022-06-07T17:34:04.063' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1156,\"Key\":\"3eda7850-2ddd-4370-b941-08da0a1bbe31\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (318, CAST(N'2022-06-07T17:34:04.103' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1157,\"Key\":\"0d511b4e-7f1c-4205-842c-378c8e76fb09\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (319, CAST(N'2022-06-07T17:34:04.167' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1158,\"Key\":\"55dd2784-af81-4972-985f-58dfb7d5654e\",\"ChangeTypes\":2}]"},{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1159,\"Key\":\"15279db3-0eaa-4d4e-9235-9f6ec1f52b06\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (320, CAST(N'2022-06-07T17:34:04.213' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1160,\"Key\":\"c8bd69f0-7569-48c6-8319-d9aed7777735\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (321, CAST(N'2022-06-07T17:34:04.253' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1161,\"Key\":\"e9b95fcd-ebbc-4d8e-9f8e-58c1d0617a6d\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (322, CAST(N'2022-06-07T17:34:04.307' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1162,\"Key\":\"42e9589f-c949-4dfd-a35f-75ae3e154aeb\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (323, CAST(N'2022-06-07T17:34:04.360' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1163,\"Key\":\"df901006-914e-49c4-a8a8-c28c39a9033e\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (324, CAST(N'2022-06-07T17:34:04.397' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1164,\"Key\":\"e850e32d-f204-4f11-a008-c40a087a3cd3\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (325, CAST(N'2022-06-07T17:34:04.443' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1165,\"Key\":\"accb17a9-4102-436c-94ac-c5cf51efffb1\",\"ChangeTypes\":2}]"},{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1166,\"Key\":\"a2320164-a6ef-4db5-b5a7-0abbeb9f0f82\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (326, CAST(N'2022-06-07T17:34:04.493' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1167,\"Key\":\"3613281f-2ebc-497b-ad6d-15f448a0c3e3\",\"ChangeTypes\":2}]"},{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1168,\"Key\":\"da87bb84-42b9-4a93-b228-ba68534908ee\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (327, CAST(N'2022-06-07T17:34:04.533' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1169,\"Key\":\"e8ac0bf3-ac2c-442c-b85e-2e1b7854b909\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (328, CAST(N'2022-06-07T17:34:04.573' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1170,\"Key\":\"9ceb8d9d-2cd5-4ca6-8c72-701247ae3d72\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (329, CAST(N'2022-06-07T17:34:04.613' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1171,\"Key\":\"50266a33-8ae9-4c59-850c-bbf99d30c617\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (330, CAST(N'2022-06-07T17:34:04.710' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1172,\"Key\":\"e4ba1c0c-ba67-4562-8f9c-ebdd47603068\",\"ChangeTypes\":2}]"},{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1173,\"Key\":\"0afa4d1f-c201-44de-ab3e-976cb44be58e\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (331, CAST(N'2022-06-07T17:34:04.767' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1174,\"Key\":\"f1930665-4071-45d2-b02d-d4a6924ff429\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (332, CAST(N'2022-06-07T17:34:04.970' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1175,\"Key\":\"5a6990c0-1556-4580-98d7-f701688e07aa\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (333, CAST(N'2022-06-07T17:34:05.043' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1176,\"Key\":\"a64c5ebe-edec-4464-806b-5326c70b3615\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (334, CAST(N'2022-06-07T17:34:05.120' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1177,\"Key\":\"0806084e-6eae-4d14-afa5-4a71de37050a\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (335, CAST(N'2022-06-07T17:34:05.183' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1178,\"Key\":\"42c5c7ee-e629-41d4-8cdd-3b04f77617cd\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (336, CAST(N'2022-06-07T17:34:05.243' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1179,\"Key\":\"aeeb94cc-b252-4800-b261-3a6ceb3df3e8\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (337, CAST(N'2022-06-07T17:34:05.310' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1180,\"Key\":\"2a57e8d6-d901-4bd9-b0a7-fcd341c4a0ee\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (338, CAST(N'2022-06-07T17:34:05.480' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1181,\"Key\":\"0afcbc9e-9a8b-4aac-b980-5b66c29bee75\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (339, CAST(N'2022-06-07T17:34:05.533' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1182,\"Key\":\"cded6935-3008-4e32-8f21-de292fb05235\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (340, CAST(N'2022-06-07T17:34:05.610' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1183,\"Key\":\"16bfe9ef-fb9f-44a6-a044-1b9101bf039c\",\"ChangeTypes\":2}]"},{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1184,\"Key\":\"6ce71134-b115-4a85-b95d-0c888aa72a55\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (341, CAST(N'2022-06-07T17:34:05.660' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1185,\"Key\":\"bb00c17e-f1da-4fb4-b97c-1e111f402021\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (342, CAST(N'2022-06-07T17:34:05.717' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1186,\"Key\":\"ad5d8bed-b776-4959-be2d-dd873845d132\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (343, CAST(N'2022-06-07T17:34:05.760' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1187,\"Key\":\"7668f8c4-73b1-40d6-adaf-7689ea10d722\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (344, CAST(N'2022-06-07T17:34:05.830' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1188,\"Key\":\"7602f85b-acf8-4d66-85f8-c73b8b2e8178\",\"ChangeTypes\":2}]"},{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1189,\"Key\":\"77eaf172-3e1e-4155-9a2f-414ee4bd1d11\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (345, CAST(N'2022-06-07T17:34:05.877' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1190,\"Key\":\"94bec0ad-70c6-4d3d-bde5-e1ba85c55045\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (346, CAST(N'2022-06-07T17:34:05.933' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1191,\"Key\":\"a69a6b38-22ce-4041-9c4a-0ea209815a2f\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (347, CAST(N'2022-06-07T17:34:05.980' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1192,\"Key\":\"d051fa54-8b5f-403a-b3ae-32d3821b5702\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (348, CAST(N'2022-06-07T17:34:06.027' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1193,\"Key\":\"e6007303-cce1-4f8e-8b21-11cfae11cc8b\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (349, CAST(N'2022-06-07T17:34:06.073' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1194,\"Key\":\"08f1ea61-cfb3-4778-bf36-936022f83cd2\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (350, CAST(N'2022-06-07T17:34:06.183' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1195,\"Key\":\"27ab2569-0ade-4011-8248-f086664a42cb\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (351, CAST(N'2022-06-07T17:34:06.237' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1196,\"Key\":\"35955b95-d9db-40d6-9b8e-08b09be40bb9\",\"ChangeTypes\":2}]"},{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1197,\"Key\":\"1fa73b93-9dca-4ea5-9d96-bbf9a0d36e02\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (352, CAST(N'2022-06-07T17:34:06.273' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1198,\"Key\":\"1888f69b-d3e2-4cc8-8a09-5ef741a8ff12\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (353, CAST(N'2022-06-07T17:34:06.310' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1199,\"Key\":\"866af792-c212-438c-9475-108ebda3aa2d\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (354, CAST(N'2022-06-07T17:34:06.350' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1200,\"Key\":\"18e6e7d6-230c-407b-91d7-2ad217daeabe\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (355, CAST(N'2022-06-07T17:34:06.493' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1201,\"Key\":\"6e61be18-0093-4e05-9a9f-8efbcc809d98\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (356, CAST(N'2022-06-07T17:34:06.563' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1202,\"Key\":\"9c69ae41-1548-4035-b236-a45b732d0dce\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (357, CAST(N'2022-06-07T17:34:06.643' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1203,\"Key\":\"e1608a61-9e16-4a2d-8c41-c2d022f92019\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (358, CAST(N'2022-06-07T17:34:06.717' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1204,\"Key\":\"20e2f580-0b47-4117-af55-82625901da3a\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (359, CAST(N'2022-06-07T17:34:06.770' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1205,\"Key\":\"d63ac7f4-bf41-4a35-a575-781d1bb54ef9\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (360, CAST(N'2022-06-07T17:34:06.820' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1206,\"Key\":\"681305c0-6c12-435e-bda6-edde85cd19e6\",\"ChangeTypes\":2}]"},{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1207,\"Key\":\"527533d3-a8a7-4f5d-b3de-cf0f243d0243\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (361, CAST(N'2022-06-07T17:34:06.877' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1208,\"Key\":\"d0c2f2ef-b44a-4704-b724-6489ddd9c6e0\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (362, CAST(N'2022-06-07T17:34:06.917' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1209,\"Key\":\"80c3e1ef-964f-421a-b80d-33e38d50a80c\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (363, CAST(N'2022-06-07T17:34:06.963' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1210,\"Key\":\"9ec378ba-b54a-4c49-b7f1-6fd70016639e\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (364, CAST(N'2022-06-07T17:34:07.020' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1211,\"Key\":\"f4ba36a4-d6f1-476b-a210-ba1856cdacec\",\"ChangeTypes\":2}]"},{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1212,\"Key\":\"98a35be3-3631-4e27-bf49-f6ef47a6b7ae\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (365, CAST(N'2022-06-07T17:34:07.080' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1213,\"Key\":\"50ec88f3-e892-408f-a734-788c986b73b2\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (366, CAST(N'2022-06-07T17:34:07.147' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1214,\"Key\":\"a2902a71-1410-462e-9028-3ec0007e8a24\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (367, CAST(N'2022-06-07T17:34:07.193' AS DateTime), N'[{"RefreshType":4,"RefresherId":"b29286dd-2d40-4ddb-b325-681226589fec","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1215,\"Key\":\"7f571a7d-e213-43c4-bed2-084fd7dc0e84\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (368, CAST(N'2022-06-07T17:37:01.493' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1073,\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (369, CAST(N'2022-06-07T17:37:24.297' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (370, CAST(N'2022-06-07T17:38:11.013' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1147]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (371, CAST(N'2022-06-07T17:38:13.923' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (372, CAST(N'2022-06-07T17:41:07.827' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
GO
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (373, CAST(N'2022-06-07T17:41:46.177' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (374, CAST(N'2022-06-07T17:42:11.543' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1073,\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (375, CAST(N'2022-06-07T17:44:00.467' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (376, CAST(N'2022-06-07T17:53:14.537' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1147]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (377, CAST(N'2022-06-07T17:53:38.383' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1147]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (378, CAST(N'2022-06-07T17:53:54.440' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1147]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (379, CAST(N'2022-06-07T17:56:40.057' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1147]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (380, CAST(N'2022-06-07T18:00:55.643' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1147]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (381, CAST(N'2022-06-07T18:01:50.767' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1073,\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (382, CAST(N'2022-06-07T18:02:08.593' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (383, CAST(N'2022-06-07T18:02:25.640' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1147]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (384, CAST(N'2022-06-07T18:03:55.753' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1147]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (385, CAST(N'2022-06-07T18:05:40.407' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1147]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P24640/D1] DAB866041B38420CA40CC655A4A8601F', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (386, CAST(N'2022-06-07T18:11:00.147' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1147]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (387, CAST(N'2022-06-07T18:12:51.007' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (388, CAST(N'2022-06-07T18:13:48.607' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (389, CAST(N'2022-06-07T18:18:19.687' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1073,\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (390, CAST(N'2022-06-07T18:19:16.250' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (391, CAST(N'2022-06-07T18:20:04.333' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1073,\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (392, CAST(N'2022-06-07T18:21:11.007' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1073,\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (393, CAST(N'2022-06-07T18:21:20.933' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1073,\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (394, CAST(N'2022-06-07T18:22:03.770' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (395, CAST(N'2022-06-07T18:22:05.893' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (396, CAST(N'2022-06-07T18:23:15.913' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1147]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (397, CAST(N'2022-06-07T18:23:23.533' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1147]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (398, CAST(N'2022-06-07T18:24:13.203' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1147]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (399, CAST(N'2022-06-07T18:24:45.957' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (400, CAST(N'2022-06-07T18:24:47.793' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (401, CAST(N'2022-06-07T18:24:48.677' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (402, CAST(N'2022-06-07T18:25:49.013' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (403, CAST(N'2022-06-07T18:25:50.563' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (404, CAST(N'2022-06-07T18:29:02.263' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1078,\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (405, CAST(N'2022-06-07T18:30:01.487' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1079,\"Key\":\"c976cff5-9336-42be-9fed-92055853e24c\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (406, CAST(N'2022-06-07T18:31:16.463' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1079,\"Key\":\"c976cff5-9336-42be-9fed-92055853e24c\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (407, CAST(N'2022-06-07T18:31:28.977' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1078,\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (408, CAST(N'2022-06-07T18:31:44.490' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1079,\"Key\":\"c976cff5-9336-42be-9fed-92055853e24c\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (409, CAST(N'2022-06-07T18:38:24.937' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (410, CAST(N'2022-06-07T18:40:40.460' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (411, CAST(N'2022-06-07T18:41:19.647' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (412, CAST(N'2022-06-07T18:41:56.343' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (413, CAST(N'2022-06-07T18:42:14.520' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (414, CAST(N'2022-06-07T18:42:24.733' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (415, CAST(N'2022-06-07T18:42:59.077' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (416, CAST(N'2022-06-07T18:45:18.090' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (417, CAST(N'2022-06-07T18:45:38.393' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (418, CAST(N'2022-06-07T18:45:44.377' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (419, CAST(N'2022-06-07T18:46:18.990' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (420, CAST(N'2022-06-07T18:46:39.470' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (421, CAST(N'2022-06-07T18:46:53.223' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (422, CAST(N'2022-06-07T18:47:13.913' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (423, CAST(N'2022-06-07T18:47:19.637' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (424, CAST(N'2022-06-07T18:48:06.530' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (425, CAST(N'2022-06-07T18:48:34.107' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (426, CAST(N'2022-06-07T18:48:45.547' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (427, CAST(N'2022-06-07T18:49:57.943' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (428, CAST(N'2022-06-07T18:50:19.720' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P29524/D1] 8E221FF8FDD342C08B1BF07564D943FF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (429, CAST(N'2022-06-07T18:54:19.903' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (430, CAST(N'2022-06-07T18:58:18.363' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (431, CAST(N'2022-06-07T19:05:16.167' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1078,\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (432, CAST(N'2022-06-07T19:05:51.410' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1079,\"Key\":\"c976cff5-9336-42be-9fed-92055853e24c\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (433, CAST(N'2022-06-07T19:07:02.257' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (434, CAST(N'2022-06-07T19:07:21.307' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (435, CAST(N'2022-06-07T19:07:35.507' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (436, CAST(N'2022-06-07T19:07:44.283' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (437, CAST(N'2022-06-07T19:08:13.687' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (438, CAST(N'2022-06-07T19:12:43.713' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (439, CAST(N'2022-06-07T19:14:21.697' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (440, CAST(N'2022-06-07T19:14:33.953' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1079,\"Key\":\"c976cff5-9336-42be-9fed-92055853e24c\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (441, CAST(N'2022-06-07T19:15:22.883' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1078,\"ChangeTypes\":2},{\"ItemType\":\"IContentType\",\"Id\":1073,\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (442, CAST(N'2022-06-07T19:15:30.953' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (443, CAST(N'2022-06-07T19:16:48.427' AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1043,\"Key\":\"1df9f033-e6d4-451f-b8d2-e0cbc50a836f\",\"Removed\":false}]"},{"RefreshType":4,"RefresherId":"d28a1dbb-2308-4918-9a92-2f8689b6cbfe","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1043,\"Key\":\"1df9f033-e6d4-451f-b8d2-e0cbc50a836f\",\"Removed\":false}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (444, CAST(N'2022-06-07T19:17:29.023' AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1043,\"Key\":\"1df9f033-e6d4-451f-b8d2-e0cbc50a836f\",\"Removed\":false}]"},{"RefreshType":4,"RefresherId":"d28a1dbb-2308-4918-9a92-2f8689b6cbfe","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1043,\"Key\":\"1df9f033-e6d4-451f-b8d2-e0cbc50a836f\",\"Removed\":false}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (445, CAST(N'2022-06-07T19:17:47.390' AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1043,\"Key\":\"1df9f033-e6d4-451f-b8d2-e0cbc50a836f\",\"Removed\":false}]"},{"RefreshType":4,"RefresherId":"d28a1dbb-2308-4918-9a92-2f8689b6cbfe","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1043,\"Key\":\"1df9f033-e6d4-451f-b8d2-e0cbc50a836f\",\"Removed\":false}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (446, CAST(N'2022-06-07T19:17:49.067' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1078,\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (447, CAST(N'2022-06-07T19:18:19.707' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1079,\"Key\":\"c976cff5-9336-42be-9fed-92055853e24c\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (448, CAST(N'2022-06-07T19:18:36.973' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (449, CAST(N'2022-06-07T19:21:37.267' AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1043,\"Key\":\"1df9f033-e6d4-451f-b8d2-e0cbc50a836f\",\"Removed\":false}]"},{"RefreshType":4,"RefresherId":"d28a1dbb-2308-4918-9a92-2f8689b6cbfe","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1043,\"Key\":\"1df9f033-e6d4-451f-b8d2-e0cbc50a836f\",\"Removed\":false}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (450, CAST(N'2022-06-07T19:21:39.327' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1078,\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (451, CAST(N'2022-06-07T19:23:20.920' AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1043,\"Key\":\"1df9f033-e6d4-451f-b8d2-e0cbc50a836f\",\"Removed\":false}]"},{"RefreshType":4,"RefresherId":"d28a1dbb-2308-4918-9a92-2f8689b6cbfe","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1043,\"Key\":\"1df9f033-e6d4-451f-b8d2-e0cbc50a836f\",\"Removed\":false}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (452, CAST(N'2022-06-07T19:23:56.770' AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1043,\"Key\":\"1df9f033-e6d4-451f-b8d2-e0cbc50a836f\",\"Removed\":false}]"},{"RefreshType":4,"RefresherId":"d28a1dbb-2308-4918-9a92-2f8689b6cbfe","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1043,\"Key\":\"1df9f033-e6d4-451f-b8d2-e0cbc50a836f\",\"Removed\":false}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (453, CAST(N'2022-06-07T19:24:02.110' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1078,\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (454, CAST(N'2022-06-07T19:24:39.353' AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1043,\"Key\":\"1df9f033-e6d4-451f-b8d2-e0cbc50a836f\",\"Removed\":false}]"},{"RefreshType":4,"RefresherId":"d28a1dbb-2308-4918-9a92-2f8689b6cbfe","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1043,\"Key\":\"1df9f033-e6d4-451f-b8d2-e0cbc50a836f\",\"Removed\":false}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (455, CAST(N'2022-06-07T19:24:50.037' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1078,\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (456, CAST(N'2022-06-07T19:27:22.437' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1078,\"ChangeTypes\":2},{\"ItemType\":\"IContentType\",\"Id\":1073,\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (457, CAST(N'2022-06-07T19:27:43.703' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1078,\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (458, CAST(N'2022-06-07T19:27:59.083' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1079,\"Key\":\"c976cff5-9336-42be-9fed-92055853e24c\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (459, CAST(N'2022-06-07T19:28:26.557' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (460, CAST(N'2022-06-07T19:28:51.807' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (461, CAST(N'2022-06-07T19:29:23.140' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (462, CAST(N'2022-06-07T19:42:44.347' AS DateTime), N'[{"RefreshType":4,"RefresherId":"35b16c25-a17e-45d7-bc8f-edab1dcc28d2","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1043,\"Key\":\"1df9f033-e6d4-451f-b8d2-e0cbc50a836f\",\"Removed\":false}]"},{"RefreshType":4,"RefresherId":"d28a1dbb-2308-4918-9a92-2f8689b6cbfe","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1043,\"Key\":\"1df9f033-e6d4-451f-b8d2-e0cbc50a836f\",\"Removed\":false}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (463, CAST(N'2022-06-07T19:42:55.920' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1078,\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (464, CAST(N'2022-06-07T19:43:04.990' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (465, CAST(N'2022-06-07T19:44:27.227' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1081,\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (466, CAST(N'2022-06-07T19:44:53.877' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1088,\"Key\":\"f638b90b-1f7a-45ed-98b7-87a5ea867cae\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (467, CAST(N'2022-06-07T19:45:20.610' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1080]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (468, CAST(N'2022-06-07T19:47:25.493' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1080]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (469, CAST(N'2022-06-07T19:54:00.420' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1080]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (470, CAST(N'2022-06-07T19:54:45.947' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1080]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (471, CAST(N'2022-06-07T19:54:53.970' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1080]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (472, CAST(N'2022-06-07T19:56:20.557' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1080]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
GO
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (473, CAST(N'2022-06-07T19:56:44.093' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1088,\"Key\":\"f638b90b-1f7a-45ed-98b7-87a5ea867cae\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (474, CAST(N'2022-06-07T19:57:29.140' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1088,\"Key\":\"f638b90b-1f7a-45ed-98b7-87a5ea867cae\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (475, CAST(N'2022-06-07T19:58:40.497' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1079,\"Key\":\"c976cff5-9336-42be-9fed-92055853e24c\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (476, CAST(N'2022-06-07T20:02:12.650' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1080]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (477, CAST(N'2022-06-07T20:05:11.327' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1081,\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (478, CAST(N'2022-06-07T20:06:13.793' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1088,\"Key\":\"f638b90b-1f7a-45ed-98b7-87a5ea867cae\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (479, CAST(N'2022-06-07T20:06:53.200' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1088,\"Key\":\"f638b90b-1f7a-45ed-98b7-87a5ea867cae\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (480, CAST(N'2022-06-07T20:07:23.493' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1088,\"Key\":\"f638b90b-1f7a-45ed-98b7-87a5ea867cae\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (481, CAST(N'2022-06-07T20:08:18.190' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1080]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (482, CAST(N'2022-06-07T20:08:55.627' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1080]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (483, CAST(N'2022-06-07T20:09:21.997' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1080]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (484, CAST(N'2022-06-07T20:10:26.220' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1080]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (485, CAST(N'2022-06-07T20:10:39.540' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1080]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (486, CAST(N'2022-06-07T20:10:48.367' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1080]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (487, CAST(N'2022-06-07T20:11:25.550' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1080]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (488, CAST(N'2022-06-07T20:11:53.323' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1088,\"Key\":\"f638b90b-1f7a-45ed-98b7-87a5ea867cae\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (489, CAST(N'2022-06-07T20:12:33.317' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1088,\"Key\":\"f638b90b-1f7a-45ed-98b7-87a5ea867cae\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (490, CAST(N'2022-06-07T20:12:39.410' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1088,\"Key\":\"f638b90b-1f7a-45ed-98b7-87a5ea867cae\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (491, CAST(N'2022-06-07T20:14:22.207' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1081,\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (492, CAST(N'2022-06-07T20:15:08.513' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1088,\"Key\":\"f638b90b-1f7a-45ed-98b7-87a5ea867cae\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (493, CAST(N'2022-06-07T20:16:00.860' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1080]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (494, CAST(N'2022-06-07T20:18:08.217' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1080]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (495, CAST(N'2022-06-07T20:30:35.507' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1080]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (496, CAST(N'2022-06-07T20:31:35.340' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1088,\"Key\":\"f638b90b-1f7a-45ed-98b7-87a5ea867cae\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (497, CAST(N'2022-06-07T20:35:17.253' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1088,\"Key\":\"f638b90b-1f7a-45ed-98b7-87a5ea867cae\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (498, CAST(N'2022-06-07T20:35:53.580' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1088,\"Key\":\"f638b90b-1f7a-45ed-98b7-87a5ea867cae\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (499, CAST(N'2022-06-07T20:37:22.800' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1081,\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (500, CAST(N'2022-06-07T20:38:14.977' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1088,\"Key\":\"f638b90b-1f7a-45ed-98b7-87a5ea867cae\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (501, CAST(N'2022-06-07T20:40:23.957' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1080]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (502, CAST(N'2022-06-07T20:42:59.937' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1078,\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (503, CAST(N'2022-06-07T20:47:11.660' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1073,\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (504, CAST(N'2022-06-07T20:48:08.420' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (505, CAST(N'2022-06-07T20:50:15.373' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (506, CAST(N'2022-06-07T20:50:25.670' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (507, CAST(N'2022-06-07T20:56:50.917' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (508, CAST(N'2022-06-07T20:56:51.847' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (509, CAST(N'2022-06-07T20:58:16.383' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (510, CAST(N'2022-06-07T20:58:17.787' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (511, CAST(N'2022-06-07T20:58:52.177' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (512, CAST(N'2022-06-07T20:58:53.373' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (513, CAST(N'2022-06-07T21:06:13.903' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (514, CAST(N'2022-06-07T21:06:44.630' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (515, CAST(N'2022-06-07T21:07:56.037' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (516, CAST(N'2022-06-07T21:12:02.503' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (517, CAST(N'2022-06-07T21:12:04.790' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (518, CAST(N'2022-06-07T21:14:03.257' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (519, CAST(N'2022-06-07T21:14:04.907' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (520, CAST(N'2022-06-07T21:15:11.320' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1073,\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (521, CAST(N'2022-06-07T21:15:19.430' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (522, CAST(N'2022-06-07T21:15:48.690' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (523, CAST(N'2022-06-07T21:15:49.767' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (524, CAST(N'2022-06-07T21:16:28.157' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (525, CAST(N'2022-06-07T21:20:15.037' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1073,\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (526, CAST(N'2022-06-07T21:20:30.533' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (527, CAST(N'2022-06-07T21:21:31.843' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1147]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (528, CAST(N'2022-06-07T21:21:51.747' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (529, CAST(N'2022-06-07T21:22:06.383' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (530, CAST(N'2022-06-07T21:22:08.243' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (531, CAST(N'2022-06-07T21:24:27.173' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1147]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (532, CAST(N'2022-06-07T21:24:29.513' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1147]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (533, CAST(N'2022-06-07T21:24:35.870' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1147]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (534, CAST(N'2022-06-07T21:25:58.813' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1147]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (535, CAST(N'2022-06-07T21:26:46.037' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1147]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (536, CAST(N'2022-06-07T21:26:53.920' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1147]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (537, CAST(N'2022-06-07T21:27:56.060' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1073,\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (538, CAST(N'2022-06-07T21:28:14.417' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (539, CAST(N'2022-06-07T21:33:17.560' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1073,\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (540, CAST(N'2022-06-07T21:34:13.063' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1073,\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (541, CAST(N'2022-06-07T21:34:51.967' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (542, CAST(N'2022-06-07T21:35:26.033' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1147]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (543, CAST(N'2022-06-07T21:41:35.820' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (544, CAST(N'2022-06-07T21:42:30.833' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1074,\"Key\":\"d9322b14-c414-4562-902e-428e7bc294e6\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (545, CAST(N'2022-06-07T21:44:19.173' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (546, CAST(N'2022-06-07T21:44:45.970' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (547, CAST(N'2022-06-07T21:45:20.987' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (548, CAST(N'2022-06-07T21:48:07.123' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1078,\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (549, CAST(N'2022-06-07T21:49:53.913' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1078,\"ChangeTypes\":4}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (550, CAST(N'2022-06-07T21:51:30.170' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1079,\"Key\":\"c976cff5-9336-42be-9fed-92055853e24c\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (551, CAST(N'2022-06-07T21:51:45.867' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1079,\"Key\":\"c976cff5-9336-42be-9fed-92055853e24c\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (552, CAST(N'2022-06-07T21:53:50.760' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1079,\"Key\":\"c976cff5-9336-42be-9fed-92055853e24c\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (553, CAST(N'2022-06-07T21:55:19.787' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (554, CAST(N'2022-06-07T21:55:24.870' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (555, CAST(N'2022-06-07T22:05:31.010' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (556, CAST(N'2022-06-07T22:05:34.593' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (557, CAST(N'2022-06-07T22:05:51.613' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1079,\"Key\":\"c976cff5-9336-42be-9fed-92055853e24c\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (558, CAST(N'2022-06-07T22:09:33.543' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1079,\"Key\":\"c976cff5-9336-42be-9fed-92055853e24c\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (559, CAST(N'2022-06-07T22:09:33.907' AS DateTime), N'[{"RefreshType":4,"RefresherId":"900a4fbe-df3c-41e6-bb77-be896cd158ea","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"Id\":1079,\"Key\":\"c976cff5-9336-42be-9fed-92055853e24c\",\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (560, CAST(N'2022-06-07T22:12:18.297' AS DateTime), N'[{"RefreshType":4,"RefresherId":"6902e22c-9c10-483c-91f3-66b7cae9e2f5","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":null,"JsonIdCount":1,"JsonPayload":"[{\"ItemType\":\"IContentType\",\"Id\":1078,\"ChangeTypes\":2},{\"ItemType\":\"IContentType\",\"Id\":1073,\"ChangeTypes\":2}]"}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (561, CAST(N'2022-06-07T22:14:24.983' AS DateTime), N'[{"RefreshType":3,"RefresherId":"dd12b6a0-14b9-46e8-8800-c154f74047c8","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[1077]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (562, CAST(N'2022-06-07T22:36:15.690' AS DateTime), N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 2)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (563, CAST(N'2022-06-07T23:03:32.293' AS DateTime), N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 1)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (564, CAST(N'2022-06-07T23:03:35.360' AS DateTime), N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 3)
INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (565, CAST(N'2022-06-07T23:42:28.627' AS DateTime), N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null},{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb [P32492/D1] 1590A9FFF5CB448A8D6E5FB1ED7063DF', 2)
SET IDENTITY_INSERT [dbo].[umbracoCacheInstruction] OFF
GO
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1074, 1073)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1079, 1078)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1088, 1081)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1089, 1083)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1090, 1085)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1091, 1087)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1149, 1148)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1151, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1152, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1153, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1154, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1155, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1156, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1157, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1158, 1031)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1159, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1160, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1161, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1162, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1163, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1164, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1165, 1031)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1166, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1167, 1031)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1168, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1169, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1170, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1171, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1172, 1031)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1173, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1174, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1175, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1176, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1177, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1178, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1179, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1180, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1181, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1182, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1183, 1031)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1184, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1185, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1186, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1187, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1188, 1031)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1189, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1190, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1191, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1192, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1193, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1194, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1195, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1196, 1031)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1197, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1198, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1199, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1200, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1201, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1202, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1203, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1204, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1205, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1206, 1031)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1207, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1208, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1209, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1210, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1211, 1031)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1212, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1213, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1214, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1215, 1032)
GO
SET IDENTITY_INSERT [dbo].[umbracoContentVersion] ON 

INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (15, 1074, CAST(N'2022-06-03T16:20:57.773' AS DateTime), -1, 0, N'Библиотека', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (16, 1074, CAST(N'2022-06-03T16:22:01.530' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (17, 1074, CAST(N'2022-06-03T16:22:56.287' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (18, 1074, CAST(N'2022-06-03T17:33:32.697' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (19, 1079, CAST(N'2022-06-03T17:15:19.940' AS DateTime), -1, 0, N'AboutUs', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (20, 1079, CAST(N'2022-06-07T23:31:16.373' AS DateTime), -1, 0, N'AboutUs', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (21, 1088, CAST(N'2022-06-03T17:32:11.287' AS DateTime), -1, 0, N'Project', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (22, 1088, CAST(N'2022-06-03T17:51:36.033' AS DateTime), -1, 0, N'Project', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (23, 1089, CAST(N'2022-06-03T17:32:26.573' AS DateTime), -1, 0, N'Service', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (24, 1089, CAST(N'2022-06-03T17:51:05.010' AS DateTime), -1, 1, N'Service', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (25, 1090, CAST(N'2022-06-03T17:32:33.630' AS DateTime), -1, 0, N'News', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (26, 1090, CAST(N'2022-06-03T17:51:11.407' AS DateTime), -1, 1, N'News', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (27, 1091, CAST(N'2022-06-03T17:32:40.420' AS DateTime), -1, 0, N'Contact', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (28, 1091, CAST(N'2022-06-03T17:51:24.297' AS DateTime), -1, 1, N'Contact', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (29, 1074, CAST(N'2022-06-03T18:04:30.273' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (30, 1088, CAST(N'2022-06-08T00:44:53.720' AS DateTime), -1, 0, N'Project', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (82, 1074, CAST(N'2022-06-03T18:10:15.283' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (83, 1074, CAST(N'2022-06-03T18:14:41.153' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (84, 1074, CAST(N'2022-06-03T18:27:45.717' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (87, 1149, CAST(N'2022-06-03T18:25:48.240' AS DateTime), -1, 0, N'Index', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (88, 1149, CAST(N'2022-06-03T18:25:50.530' AS DateTime), -1, 0, N'Index', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (89, 1149, CAST(N'2022-06-03T18:25:50.530' AS DateTime), -1, 1, N'Index', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (90, 1074, CAST(N'2022-06-03T18:28:04.757' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (91, 1074, CAST(N'2022-06-03T18:28:23.593' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (92, 1074, CAST(N'2022-06-07T22:06:18.170' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (93, 1074, CAST(N'2022-06-07T22:07:31.070' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (94, 1074, CAST(N'2022-06-07T22:07:46.707' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (95, 1074, CAST(N'2022-06-07T22:08:00.280' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (96, 1074, CAST(N'2022-06-07T22:10:06.040' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (97, 1074, CAST(N'2022-06-07T22:18:51.267' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (98, 1074, CAST(N'2022-06-07T22:20:41.200' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (99, 1074, CAST(N'2022-06-07T22:37:24.023' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (100, 1151, CAST(N'2022-06-07T22:34:03.710' AS DateTime), NULL, 1, N'Cover', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (101, 1152, CAST(N'2022-06-07T22:34:03.863' AS DateTime), NULL, 1, N'Loader', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (102, 1153, CAST(N'2022-06-07T22:34:03.913' AS DateTime), NULL, 1, N'Logo', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (103, 1154, CAST(N'2022-06-07T22:34:03.953' AS DateTime), NULL, 1, N'Logo2', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (104, 1155, CAST(N'2022-06-07T22:34:04.013' AS DateTime), NULL, 1, N'Logo3', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (105, 1156, CAST(N'2022-06-07T22:34:04.047' AS DateTime), NULL, 1, N'Logo4', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (106, 1157, CAST(N'2022-06-07T22:34:04.090' AS DateTime), NULL, 1, N'Whitesquare', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (107, 1158, CAST(N'2022-06-07T22:34:04.127' AS DateTime), NULL, 1, N'aside', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (108, 1159, CAST(N'2022-06-07T22:34:04.150' AS DateTime), NULL, 1, N'1', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (109, 1160, CAST(N'2022-06-07T22:34:04.200' AS DateTime), NULL, 1, N'2', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (110, 1161, CAST(N'2022-06-07T22:34:04.243' AS DateTime), NULL, 1, N'3', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (111, 1162, CAST(N'2022-06-07T22:34:04.297' AS DateTime), NULL, 1, N'Recent1', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (112, 1163, CAST(N'2022-06-07T22:34:04.337' AS DateTime), NULL, 1, N'Recent2', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (113, 1164, CAST(N'2022-06-07T22:34:04.390' AS DateTime), NULL, 1, N'Recent3', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (114, 1165, CAST(N'2022-06-07T22:34:04.410' AS DateTime), NULL, 1, N'docs', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (115, 1166, CAST(N'2022-06-07T22:34:04.433' AS DateTime), NULL, 1, N'Doc1', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (116, 1167, CAST(N'2022-06-07T22:34:04.457' AS DateTime), NULL, 1, N'flags', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (117, 1168, CAST(N'2022-06-07T22:34:04.477' AS DateTime), NULL, 1, N'Flag1', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (118, 1169, CAST(N'2022-06-07T22:34:04.520' AS DateTime), NULL, 1, N'Flag2', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (119, 1170, CAST(N'2022-06-07T22:34:04.560' AS DateTime), NULL, 1, N'Flag3', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (120, 1171, CAST(N'2022-06-07T22:34:04.600' AS DateTime), NULL, 1, N'Flag4', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (121, 1172, CAST(N'2022-06-07T22:34:04.670' AS DateTime), NULL, 1, N'gallery', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (122, 1173, CAST(N'2022-06-07T22:34:04.697' AS DateTime), NULL, 1, N'1', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (123, 1174, CAST(N'2022-06-07T22:34:04.757' AS DateTime), NULL, 1, N'10', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (124, 1175, CAST(N'2022-06-07T22:34:04.957' AS DateTime), NULL, 1, N'2', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (125, 1176, CAST(N'2022-06-07T22:34:05.033' AS DateTime), NULL, 1, N'3', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (126, 1177, CAST(N'2022-06-07T22:34:05.110' AS DateTime), NULL, 1, N'4', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (127, 1178, CAST(N'2022-06-07T22:34:05.173' AS DateTime), NULL, 1, N'5', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (128, 1179, CAST(N'2022-06-07T22:34:05.227' AS DateTime), NULL, 1, N'6', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (129, 1180, CAST(N'2022-06-07T22:34:05.297' AS DateTime), NULL, 1, N'7', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (130, 1181, CAST(N'2022-06-07T22:34:05.463' AS DateTime), NULL, 1, N'8', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (131, 1182, CAST(N'2022-06-07T22:34:05.523' AS DateTime), NULL, 1, N'9', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (132, 1183, CAST(N'2022-06-07T22:34:05.547' AS DateTime), NULL, 1, N'news', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (133, 1184, CAST(N'2022-06-07T22:34:05.597' AS DateTime), NULL, 1, N'New1', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (134, 1185, CAST(N'2022-06-07T22:34:05.647' AS DateTime), NULL, 1, N'New2', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (135, 1186, CAST(N'2022-06-07T22:34:05.707' AS DateTime), NULL, 1, N'New3', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (136, 1187, CAST(N'2022-06-07T22:34:05.743' AS DateTime), NULL, 1, N'Replyindicator', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (137, 1188, CAST(N'2022-06-07T22:34:05.793' AS DateTime), NULL, 1, N'projects', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (138, 1189, CAST(N'2022-06-07T22:34:05.820' AS DateTime), NULL, 1, N'Project1', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (139, 1190, CAST(N'2022-06-07T22:34:05.867' AS DateTime), NULL, 1, N'Project2', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (140, 1191, CAST(N'2022-06-07T22:34:05.917' AS DateTime), NULL, 1, N'Project3', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (141, 1192, CAST(N'2022-06-07T22:34:05.967' AS DateTime), NULL, 1, N'Project4', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (142, 1193, CAST(N'2022-06-07T22:34:06.017' AS DateTime), NULL, 1, N'Project5', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (143, 1194, CAST(N'2022-06-07T22:34:06.060' AS DateTime), NULL, 1, N'Project6', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (144, 1195, CAST(N'2022-06-07T22:34:06.173' AS DateTime), NULL, 1, N'Project7', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (145, 1196, CAST(N'2022-06-07T22:34:06.203' AS DateTime), NULL, 1, N'sliders', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (146, 1197, CAST(N'2022-06-07T22:34:06.227' AS DateTime), NULL, 1, N'Avatar', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (147, 1198, CAST(N'2022-06-07T22:34:06.260' AS DateTime), NULL, 1, N'Ico1', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (148, 1199, CAST(N'2022-06-07T22:34:06.297' AS DateTime), NULL, 1, N'Ico2', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (149, 1200, CAST(N'2022-06-07T22:34:06.337' AS DateTime), NULL, 1, N'Ico3', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (150, 1201, CAST(N'2022-06-07T22:34:06.460' AS DateTime), NULL, 1, N'Man', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (151, 1202, CAST(N'2022-06-07T22:34:06.553' AS DateTime), NULL, 1, N'Photo', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (152, 1203, CAST(N'2022-06-07T22:34:06.613' AS DateTime), NULL, 1, N'Slide1', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (153, 1204, CAST(N'2022-06-07T22:34:06.700' AS DateTime), NULL, 1, N'Slide2', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (154, 1205, CAST(N'2022-06-07T22:34:06.757' AS DateTime), NULL, 1, N'Slide3', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (155, 1206, CAST(N'2022-06-07T22:34:06.783' AS DateTime), NULL, 1, N'testimonial', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (156, 1207, CAST(N'2022-06-07T22:34:06.807' AS DateTime), NULL, 1, N'Arrow', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (157, 1208, CAST(N'2022-06-07T22:34:06.860' AS DateTime), NULL, 1, N'Background', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (158, 1209, CAST(N'2022-06-07T22:34:06.903' AS DateTime), NULL, 1, N'Test1', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (159, 1210, CAST(N'2022-06-07T22:34:06.950' AS DateTime), NULL, 1, N'Test2', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (160, 1211, CAST(N'2022-06-07T22:34:06.983' AS DateTime), NULL, 1, N'workers', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (161, 1212, CAST(N'2022-06-07T22:34:07.010' AS DateTime), NULL, 1, N'About Us', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (162, 1213, CAST(N'2022-06-07T22:34:07.060' AS DateTime), NULL, 1, N'Mem1', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (163, 1214, CAST(N'2022-06-07T22:34:07.133' AS DateTime), NULL, 1, N'Mem2', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (164, 1215, CAST(N'2022-06-07T22:34:07.180' AS DateTime), NULL, 1, N'Mem3', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (165, 1074, CAST(N'2022-06-07T22:38:13.783' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (166, 1074, CAST(N'2022-06-07T22:41:07.697' AS DateTime), -1, 0, N'Home', 0)
GO
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (167, 1074, CAST(N'2022-06-07T22:41:46.050' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (168, 1074, CAST(N'2022-06-07T22:44:00.330' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (169, 1074, CAST(N'2022-06-07T23:02:08.520' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (170, 1074, CAST(N'2022-06-07T23:12:50.393' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (171, 1074, CAST(N'2022-06-07T23:13:48.427' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (172, 1074, CAST(N'2022-06-07T23:19:16.107' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (173, 1074, CAST(N'2022-06-07T23:22:05.843' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (174, 1074, CAST(N'2022-06-07T23:24:48.633' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (175, 1074, CAST(N'2022-06-07T23:25:50.517' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (176, 1074, CAST(N'2022-06-08T01:50:25.463' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (177, 1079, CAST(N'2022-06-07T23:31:44.453' AS DateTime), -1, 0, N'AboutUs', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (178, 1079, CAST(N'2022-06-08T00:05:51.210' AS DateTime), -1, 0, N'AboutUs', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (179, 1079, CAST(N'2022-06-08T00:14:33.873' AS DateTime), -1, 0, N'AboutUs', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (180, 1079, CAST(N'2022-06-08T00:18:19.607' AS DateTime), -1, 0, N'AboutUs', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (181, 1079, CAST(N'2022-06-08T00:27:59.027' AS DateTime), -1, 0, N'AboutUs', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (182, 1079, CAST(N'2022-06-08T00:58:40.403' AS DateTime), -1, 0, N'AboutUs', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (183, 1088, CAST(N'2022-06-08T00:56:43.970' AS DateTime), -1, 0, N'Project', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (184, 1088, CAST(N'2022-06-08T00:57:29.103' AS DateTime), -1, 0, N'Project', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (185, 1088, CAST(N'2022-06-08T01:07:23.450' AS DateTime), -1, 0, N'Project', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (186, 1079, CAST(N'2022-06-08T02:53:50.613' AS DateTime), -1, 0, N'AboutUs', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (187, 1088, CAST(N'2022-06-08T01:11:53.160' AS DateTime), -1, 0, N'Project', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (188, 1088, CAST(N'2022-06-08T01:15:08.437' AS DateTime), -1, 0, N'Project', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (189, 1088, CAST(N'2022-06-08T01:35:17.120' AS DateTime), -1, 0, N'Project', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (190, 1088, CAST(N'2022-06-08T01:35:53.540' AS DateTime), -1, 0, N'Project', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (191, 1088, CAST(N'2022-06-08T01:38:14.830' AS DateTime), -1, 0, N'Project', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (192, 1088, CAST(N'2022-06-08T01:38:14.830' AS DateTime), -1, 1, N'Project', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (193, 1074, CAST(N'2022-06-08T01:56:51.690' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (194, 1074, CAST(N'2022-06-08T01:58:17.737' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (195, 1074, CAST(N'2022-06-08T01:58:53.333' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (196, 1074, CAST(N'2022-06-08T02:12:04.750' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (197, 1074, CAST(N'2022-06-08T02:14:04.867' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (198, 1074, CAST(N'2022-06-08T02:15:19.363' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (199, 1074, CAST(N'2022-06-08T02:15:49.720' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (200, 1074, CAST(N'2022-06-08T02:16:28.123' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (201, 1074, CAST(N'2022-06-08T02:21:51.617' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (202, 1074, CAST(N'2022-06-08T02:22:08.087' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (203, 1074, CAST(N'2022-06-08T02:28:14.333' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (204, 1074, CAST(N'2022-06-08T02:34:51.883' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (205, 1074, CAST(N'2022-06-08T02:41:35.697' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (206, 1074, CAST(N'2022-06-08T02:42:30.700' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (207, 1074, CAST(N'2022-06-08T02:42:30.700' AS DateTime), -1, 1, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (208, 1079, CAST(N'2022-06-08T03:05:51.457' AS DateTime), -1, 0, N'AboutUs', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (209, 1079, CAST(N'2022-06-08T03:09:33.863' AS DateTime), -1, 0, N'AboutUs', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (210, 1079, CAST(N'2022-06-08T03:09:33.863' AS DateTime), -1, 1, N'AboutUs', 0)
SET IDENTITY_INSERT [dbo].[umbracoContentVersion] OFF
GO
INSERT [dbo].[umbracoContentVersionCleanupPolicy] ([contentTypeId], [preventCleanup], [keepAllVersionsNewerThanDays], [keepLatestVersionPerDayForDays], [updated]) VALUES (1073, 0, NULL, NULL, CAST(N'2022-06-08T02:34:10.533' AS DateTime))
INSERT [dbo].[umbracoContentVersionCleanupPolicy] ([contentTypeId], [preventCleanup], [keepAllVersionsNewerThanDays], [keepLatestVersionPerDayForDays], [updated]) VALUES (1078, 0, NULL, NULL, CAST(N'2022-06-08T03:12:17.983' AS DateTime))
INSERT [dbo].[umbracoContentVersionCleanupPolicy] ([contentTypeId], [preventCleanup], [keepAllVersionsNewerThanDays], [keepLatestVersionPerDayForDays], [updated]) VALUES (1081, 0, NULL, NULL, CAST(N'2022-06-08T01:37:22.463' AS DateTime))
INSERT [dbo].[umbracoContentVersionCleanupPolicy] ([contentTypeId], [preventCleanup], [keepAllVersionsNewerThanDays], [keepLatestVersionPerDayForDays], [updated]) VALUES (1083, 0, NULL, NULL, CAST(N'2022-06-03T17:29:42.943' AS DateTime))
INSERT [dbo].[umbracoContentVersionCleanupPolicy] ([contentTypeId], [preventCleanup], [keepAllVersionsNewerThanDays], [keepLatestVersionPerDayForDays], [updated]) VALUES (1087, 0, NULL, NULL, CAST(N'2022-06-03T17:30:35.210' AS DateTime))
INSERT [dbo].[umbracoContentVersionCleanupPolicy] ([contentTypeId], [preventCleanup], [keepAllVersionsNewerThanDays], [keepLatestVersionPerDayForDays], [updated]) VALUES (1085, 0, NULL, NULL, CAST(N'2022-06-03T17:29:33.487' AS DateTime))
INSERT [dbo].[umbracoContentVersionCleanupPolicy] ([contentTypeId], [preventCleanup], [keepAllVersionsNewerThanDays], [keepLatestVersionPerDayForDays], [updated]) VALUES (1148, 0, NULL, NULL, CAST(N'2022-06-03T18:23:43.993' AS DateTime))
GO
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-103, N'Umbraco.UploadField', N'Nvarchar', N'{"fileExtensions":[{"id":0, "value":"svg"}]}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-102, N'Umbraco.UploadField', N'Nvarchar', N'{"fileExtensions":[{"id":0, "value":"pdf"}, {"id":1, "value":"docx"}, {"id":2, "value":"doc"}]}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-101, N'Umbraco.UploadField', N'Nvarchar', N'{"fileExtensions":[{"id":0, "value":"mp3"}, {"id":1, "value":"weba"}, {"id":2, "value":"oga"}, {"id":3, "value":"opus"}]}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-100, N'Umbraco.UploadField', N'Nvarchar', N'{"fileExtensions":[{"id":0, "value":"mp4"}, {"id":1, "value":"webm"}, {"id":2, "value":"ogv"}]}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-99, N'Umbraco.Label', N'Decimal', N'{"umbracoDataValueType":"DECIMAL"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-98, N'Umbraco.Label', N'Date', N'{"umbracoDataValueType":"TIME"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-97, N'Umbraco.ListView', N'Nvarchar', N'{"pageSize":10, "orderBy":"username", "orderDirection":"asc", "includeProperties":[{"alias":"username","isSystem":1},{"alias":"email","isSystem":1},{"alias":"updateDate","header":"Last edited","isSystem":1}]}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-96, N'Umbraco.ListView', N'Nvarchar', N'{"pageSize":100, "orderBy":"updateDate", "orderDirection":"desc", "layouts":[{"name": "Grid","path": "views/propertyeditors/listview/layouts/grid/grid.html", "icon": "icon-thumbnails-small", "isSystem": 1, "selected": true},{"name": "List","path": "views/propertyeditors/listview/layouts/list/list.html","icon": "icon-list", "isSystem": 1,"selected": true}], "includeProperties":[{"alias":"updateDate","header":"Last edited","isSystem":1},{"alias":"owner","header":"Updated by","isSystem":1}]}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-95, N'Umbraco.ListView', N'Nvarchar', N'{"pageSize":100, "orderBy":"updateDate", "orderDirection":"desc", "layouts":[{"name": "Grid","path": "views/propertyeditors/listview/layouts/grid/grid.html", "icon": "icon-thumbnails-small", "isSystem": 1, "selected": true},{"name": "List","path": "views/propertyeditors/listview/layouts/list/list.html","icon": "icon-list", "isSystem": 1,"selected": true}], "includeProperties":[{"alias":"updateDate","header":"Last edited","isSystem":1},{"alias":"owner","header":"Updated by","isSystem":1}]}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-94, N'Umbraco.Label', N'Date', N'{"umbracoDataValueType":"DATETIME"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-93, N'Umbraco.Label', N'Nvarchar', N'{"umbracoDataValueType":"BIGINT"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-92, N'Umbraco.Label', N'Nvarchar', N'{"umbracoDataValueType":"STRING"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-91, N'Umbraco.Label', N'Integer', N'{"umbracoDataValueType":"INT"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-90, N'Umbraco.UploadField', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-89, N'Umbraco.TextArea', N'Ntext', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-88, N'Umbraco.TextBox', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-87, N'Umbraco.TinyMCE', N'Ntext', N'{"value":",code,undo,redo,cut,copy,mcepasteword,stylepicker,bold,italic,bullist,numlist,outdent,indent,mcelink,unlink,mceinsertanchor,mceimage,umbracomacro,mceinserttable,umbracoembed,mcecharmap,|1|1,2,3,|0|500,400|1049,|true|"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-51, N'Umbraco.Integer', N'Integer', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-49, N'Umbraco.TrueFalse', N'Integer', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-43, N'Umbraco.CheckBoxList', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-42, N'Umbraco.DropDown.Flexible', N'Nvarchar', N'{"multiple":true}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-41, N'Umbraco.DateTime', N'Date', N'{"format":"YYYY-MM-DD"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-40, N'Umbraco.RadioButtonList', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-39, N'Umbraco.DropDown.Flexible', N'Nvarchar', N'{"multiple":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-37, N'Umbraco.ColorPicker', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-36, N'Umbraco.DateTime', N'Date', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1041, N'Umbraco.Tags', N'Ntext', N'{"group":"default", "storageType":"Json"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1043, N'Umbraco.ImageCropper', N'Ntext', N'{"crops":[{"alias":"aboutUs","width":270,"height":370}]}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1046, N'Umbraco.ContentPicker', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1047, N'Umbraco.MemberPicker', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1048, N'Umbraco.MediaPicker', N'Ntext', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1049, N'Umbraco.MediaPicker', N'Ntext', N'{"multiPicker":1}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1050, N'Umbraco.MultiUrlPicker', N'Ntext', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1051, N'Umbraco.MediaPicker3', N'Ntext', N'{"multiple": false, "validationLimit":{"min":0,"max":1}}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1052, N'Umbraco.MediaPicker3', N'Ntext', N'{"multiple": true}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1053, N'Umbraco.MediaPicker3', N'Ntext', N'{"filter":"Image", "multiple": false, "validationLimit":{"min":0,"max":1}}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1054, N'Umbraco.MediaPicker3', N'Ntext', N'{"filter":"Image", "multiple": true}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1143, N'Umbraco.Slider', N'Nvarchar', N'{"enableRange":false,"initVal1":0.0,"initVal2":0.0,"minVal":0.0,"maxVal":0.0,"step":0.0}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1144, N'Umbraco.TextArea', N'Ntext', N'{}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1150, N'Umbraco.MarkdownEditor', N'Ntext', N'{"preview":true,"overlaySize":"small"}')
GO
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1074, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1079, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1088, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1089, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1090, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1091, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1149, 1, 0)
GO
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (15, NULL, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (16, NULL, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (17, NULL, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (18, NULL, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (19, 1077, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (20, 1077, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (21, 1080, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (22, 1080, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (23, 1082, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (24, 1082, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (25, 1084, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (26, 1084, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (27, 1086, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (28, 1086, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (29, NULL, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (30, 1080, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (82, NULL, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (83, NULL, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (84, 1147, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (87, 1147, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (88, 1147, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (89, 1147, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (90, 1075, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (91, 1147, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (92, 1147, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (93, 1147, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (94, 1147, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (95, 1147, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (96, 1147, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (97, 1147, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (98, 1147, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (99, 1147, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (165, 1147, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (166, 1147, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (167, 1147, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (168, 1147, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (169, 1147, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (170, 1147, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (171, 1147, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (172, 1147, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (173, 1147, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (174, 1147, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (175, 1147, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (176, 1147, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (177, 1077, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (178, 1077, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (179, 1077, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (180, 1077, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (181, 1077, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (182, 1077, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (183, 1080, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (184, 1080, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (185, 1080, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (186, 1077, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (187, 1080, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (188, 1080, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (189, 1080, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (190, 1080, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (191, 1080, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (192, 1080, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (193, 1147, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (194, 1147, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (195, 1147, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (196, 1147, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (197, 1147, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (198, 1147, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (199, 1147, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (200, 1147, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (201, 1147, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (202, 1147, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (203, 1147, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (204, 1147, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (205, 1147, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (206, 1147, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (207, 1147, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (208, 1077, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (209, 1077, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (210, 1077, 0)
GO
SET IDENTITY_INSERT [dbo].[umbracoDomain] ON 

INSERT [dbo].[umbracoDomain] ([id], [domainDefaultLanguage], [domainRootStructureID], [domainName]) VALUES (1, 2, 1088, N'*1088')
SET IDENTITY_INSERT [dbo].[umbracoDomain] OFF
GO
INSERT [dbo].[umbracoKeyValue] ([key], [value], [updated]) VALUES (N'Umbraco.Core.Upgrader.State+Umbraco.Core', N'{DED98755-4059-41BB-ADBD-3FEAB12D1D7B}', CAST(N'2022-06-03T14:58:28.607' AS DateTime))
INSERT [dbo].[umbracoKeyValue] ([key], [value], [updated]) VALUES (N'Umbraco.Core.Upgrader.State+UmbracoForms', N'7c7bc5ee-4c5b-42dc-9576-5ce6dfbddb8e', CAST(N'2022-06-07T22:25:12.447' AS DateTime))
INSERT [dbo].[umbracoKeyValue] ([key], [value], [updated]) VALUES (N'Umbraco.Web.PublishedCache.NuCache.Serializer', N'MessagePack', CAST(N'2022-06-08T03:12:18.103' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[umbracoLanguage] ON 

INSERT [dbo].[umbracoLanguage] ([id], [languageISOCode], [languageCultureName], [isDefaultVariantLang], [mandatory], [fallbackLanguageId]) VALUES (1, N'en-US', N'English (United States)', 0, 0, NULL)
INSERT [dbo].[umbracoLanguage] ([id], [languageISOCode], [languageCultureName], [isDefaultVariantLang], [mandatory], [fallbackLanguageId]) VALUES (2, N'ru', N'русский', 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[umbracoLanguage] OFF
GO
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-1000, 1, N'MainDom')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-341, 1, N'ScheduledPublishing')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-340, -1, N'Languages')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-339, 1, N'KeyValues')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-338, 1, N'Domains')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-337, 1, N'MemberTypes')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-336, 1, N'MediaTypes')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-335, 1, N'MemberTree')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-334, 1, N'MediaTree')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-333, 1, N'ContentTree')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-332, 1, N'ContentTypes')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-331, 1, N'Servers')
GO
SET IDENTITY_INSERT [dbo].[umbracoLog] ON 

INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1, -1, 2, N'Language', CAST(N'2022-06-03T15:04:32.610' AS DateTime), N'Save', N'Save Language', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2, -1, 2, N'Language', CAST(N'2022-06-03T15:04:42.253' AS DateTime), N'Save', N'Save Language', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (3, -1, 2, N'Language', CAST(N'2022-06-03T15:04:52.097' AS DateTime), N'Save', N'Save Language', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (4, -1, 1055, N'Template', CAST(N'2022-06-03T15:13:02.297' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (5, -1, 1056, N'DocumentType', CAST(N'2022-06-03T15:13:02.457' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (6, -1, 1056, N'DocumentType', CAST(N'2022-06-03T15:14:51.950' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (7, -1, 1057, N'Document', CAST(N'2022-06-03T15:15:15.813' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (8, -1, 1057, N'Document', CAST(N'2022-06-03T15:15:20.423' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (9, -1, 1057, N'Document', CAST(N'2022-06-03T15:15:49.810' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (10, -1, 1057, N'Document', CAST(N'2022-06-03T15:15:57.477' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (11, -1, 1055, N'Template', CAST(N'2022-06-03T15:20:59.257' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (12, -1, 1055, N'Template', CAST(N'2022-06-03T15:22:23.720' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (13, -1, 1056, N'DocumentType', CAST(N'2022-06-03T15:22:51.687' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (14, -1, 1056, N'DocumentType', CAST(N'2022-06-03T15:22:59.190' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (15, -1, 1056, N'DocumentType', CAST(N'2022-06-03T15:23:05.533' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (16, -1, 1055, N'Template', CAST(N'2022-06-03T15:23:45.473' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (17, -1, 1055, N'Template', CAST(N'2022-06-03T15:26:58.617' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (18, -1, 1055, N'Template', CAST(N'2022-06-03T15:27:48.930' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (19, -1, 1055, N'Template', CAST(N'2022-06-03T15:28:59.893' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (20, -1, 1055, N'Template', CAST(N'2022-06-03T15:29:34.283' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (21, -1, 1056, N'DocumentType', CAST(N'2022-06-03T15:29:54.507' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (22, -1, -1, N'Document', CAST(N'2022-06-03T15:30:02.820' AS DateTime), N'Delete', N'Delete content of type 1056', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (23, -1, 1056, N'DocumentType', CAST(N'2022-06-03T15:30:02.877' AS DateTime), N'Delete', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (24, -1, 1058, N'Template', CAST(N'2022-06-03T15:30:26.247' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (25, -1, 1059, N'DocumentType', CAST(N'2022-06-03T15:30:26.263' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (26, -1, 1059, N'DocumentType', CAST(N'2022-06-03T15:30:28.700' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (27, -1, 1059, N'DocumentType', CAST(N'2022-06-03T15:30:34.440' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (28, -1, 1058, N'Template', CAST(N'2022-06-03T15:31:01.147' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (29, -1, 1055, N'Template', CAST(N'2022-06-03T15:31:07.000' AS DateTime), N'Delete', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (30, -1, 1060, N'Document', CAST(N'2022-06-03T15:31:46.317' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (31, -1, 1060, N'Document', CAST(N'2022-06-03T15:31:59.277' AS DateTime), N'Move', N'Moved to recycle bin', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (32, -1, 1060, N'Document', CAST(N'2022-06-03T15:31:59.420' AS DateTime), N'Delete', N'Trashed content with Id: 1060 related to original parent content with Id: -1', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (33, -1, 1061, N'Document', CAST(N'2022-06-03T15:32:10.260' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (34, -1, 1058, N'Template', CAST(N'2022-06-03T15:32:45.487' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (35, -1, -1, N'PartialViewMacro', CAST(N'2022-06-03T15:34:09.890' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (36, -1, -1, N'Macro', CAST(N'2022-06-03T15:34:09.953' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (37, -1, 1058, N'Template', CAST(N'2022-06-03T15:36:45.187' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (38, -1, 1058, N'Template', CAST(N'2022-06-03T15:36:49.343' AS DateTime), N'Delete', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (39, -1, 1061, N'Document', CAST(N'2022-06-03T15:36:54.723' AS DateTime), N'Move', N'Moved to recycle bin', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (40, -1, 1061, N'Document', CAST(N'2022-06-03T15:36:54.770' AS DateTime), N'Delete', N'Trashed content with Id: 1061 related to original parent content with Id: -1', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (41, -1, -1, N'Document', CAST(N'2022-06-03T15:37:04.410' AS DateTime), N'Delete', N'Delete content of type 1059', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (42, -1, 1059, N'DocumentType', CAST(N'2022-06-03T15:37:04.443' AS DateTime), N'Delete', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (43, -1, 1062, N'Template', CAST(N'2022-06-03T15:42:12.497' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (44, -1, 1063, N'DocumentType', CAST(N'2022-06-03T15:42:12.520' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (45, -1, -1, N'Macro', CAST(N'2022-06-03T15:42:43.653' AS DateTime), N'Delete', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (46, -1, 1062, N'Template', CAST(N'2022-06-03T15:42:53.290' AS DateTime), N'Delete', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (47, -1, 1064, N'Template', CAST(N'2022-06-03T15:43:06.363' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (48, -1, 1064, N'Template', CAST(N'2022-06-03T15:45:49.697' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (49, -1, 1065, N'Template', CAST(N'2022-06-03T15:45:58.643' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (50, -1, 1065, N'Template', CAST(N'2022-06-03T15:46:22.833' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (51, -1, 1065, N'Template', CAST(N'2022-06-03T15:46:24.977' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (52, -1, 1063, N'DocumentType', CAST(N'2022-06-03T15:47:09.663' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (53, -1, 1066, N'Document', CAST(N'2022-06-03T15:47:20.853' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (54, -1, 1066, N'Document', CAST(N'2022-06-03T15:47:29.453' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (55, -1, 1066, N'Document', CAST(N'2022-06-03T15:47:32.883' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (56, -1, 1065, N'Template', CAST(N'2022-06-03T15:48:16.957' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (57, -1, 1067, N'Template', CAST(N'2022-06-03T15:48:35.817' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (58, -1, 1063, N'DocumentType', CAST(N'2022-06-03T15:50:37.297' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (59, -1, 1063, N'DocumentType', CAST(N'2022-06-03T15:52:41.357' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (60, -1, 1066, N'Document', CAST(N'2022-06-03T15:53:08.830' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (61, -1, 1065, N'Template', CAST(N'2022-06-03T15:55:21.223' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (62, -1, 1068, N'Template', CAST(N'2022-06-03T15:56:13.553' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (63, -1, 1068, N'Template', CAST(N'2022-06-03T15:56:20.253' AS DateTime), N'Delete', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (64, -1, 1067, N'Template', CAST(N'2022-06-03T15:56:28.227' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (65, -1, 1067, N'Template', CAST(N'2022-06-03T15:57:12.180' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (66, -1, 1063, N'DocumentType', CAST(N'2022-06-03T15:57:49.883' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (67, -1, 1066, N'Document', CAST(N'2022-06-03T16:10:08.023' AS DateTime), N'Move', N'Moved to recycle bin', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (68, -1, 1066, N'Document', CAST(N'2022-06-03T16:10:08.207' AS DateTime), N'Delete', N'Trashed content with Id: 1066 related to original parent content with Id: -1', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (69, -1, 1063, N'DocumentType', CAST(N'2022-06-03T16:11:03.927' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (70, -1, 1067, N'Template', CAST(N'2022-06-03T16:11:40.803' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (71, -1, 1063, N'DocumentType', CAST(N'2022-06-03T16:12:22.213' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (72, -1, 1066, N'Document', CAST(N'2022-06-03T16:12:28.693' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (73, -1, 1066, N'Document', CAST(N'2022-06-03T16:12:47.397' AS DateTime), N'Move', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (74, -1, 1066, N'Document', CAST(N'2022-06-03T16:12:56.490' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (75, -1, 1063, N'DocumentType', CAST(N'2022-06-03T16:13:12.353' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (76, -1, 1067, N'Template', CAST(N'2022-06-03T16:13:19.993' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (77, -1, 1066, N'Document', CAST(N'2022-06-03T16:13:36.717' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (78, -1, 1065, N'Template', CAST(N'2022-06-03T16:14:32.610' AS DateTime), N'Delete', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (79, -1, 1066, N'Document', CAST(N'2022-06-03T16:14:38.273' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (80, -1, 1066, N'Document', CAST(N'2022-06-03T16:15:12.370' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (81, -1, 1066, N'Document', CAST(N'2022-06-03T16:15:13.913' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (82, -1, 1067, N'Template', CAST(N'2022-06-03T16:15:28.727' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (83, -1, 1067, N'Template', CAST(N'2022-06-03T16:15:30.437' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (84, -1, 1067, N'Template', CAST(N'2022-06-03T16:15:38.973' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (85, -1, 1063, N'DocumentType', CAST(N'2022-06-03T16:16:00.380' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (86, -1, 1069, N'Document', CAST(N'2022-06-03T16:16:22.840' AS DateTime), N'Save', N'Saved content template: Home', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (87, -1, 1070, N'Template', CAST(N'2022-06-03T16:16:43.020' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (88, -1, 1071, N'DocumentType', CAST(N'2022-06-03T16:16:43.063' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (89, -1, 1071, N'DocumentType', CAST(N'2022-06-03T16:16:49.513' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (90, -1, 1066, N'Document', CAST(N'2022-06-03T16:17:01.723' AS DateTime), N'Move', N'Moved to recycle bin', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (91, -1, 1066, N'Document', CAST(N'2022-06-03T16:17:01.783' AS DateTime), N'Delete', N'Trashed content with Id: 1066 related to original parent content with Id: -1', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (92, -1, -20, N'Document', CAST(N'2022-06-03T16:17:05.547' AS DateTime), N'Delete', N'Recycle bin emptied', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (93, -1, -1, N'Document', CAST(N'2022-06-03T16:17:11.780' AS DateTime), N'Delete', N'Delete content of type 1063', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (94, -1, 1063, N'DocumentType', CAST(N'2022-06-03T16:17:11.833' AS DateTime), N'Delete', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (95, -1, -1, N'Document', CAST(N'2022-06-03T16:17:15.083' AS DateTime), N'Delete', N'Delete content of type 1071', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (96, -1, 1071, N'DocumentType', CAST(N'2022-06-03T16:17:15.090' AS DateTime), N'Delete', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (97, -1, -1, N'PartialViewMacro', CAST(N'2022-06-03T16:18:06.010' AS DateTime), N'Delete', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (98, -1, -1, N'Script', CAST(N'2022-06-03T16:18:16.303' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (99, -1, -1, N'Script', CAST(N'2022-06-03T16:18:18.897' AS DateTime), N'Save', NULL, NULL)
GO
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (100, -1, 1070, N'Template', CAST(N'2022-06-03T16:19:40.687' AS DateTime), N'Delete', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (101, -1, 1072, N'Template', CAST(N'2022-06-03T16:20:30.163' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (102, -1, 1073, N'DocumentType', CAST(N'2022-06-03T16:20:30.200' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (103, -1, 1074, N'Document', CAST(N'2022-06-03T16:20:57.800' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (104, -1, 1072, N'Template', CAST(N'2022-06-03T16:21:25.103' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (105, -1, 1067, N'Template', CAST(N'2022-06-03T16:21:28.623' AS DateTime), N'Delete', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (106, -1, 1072, N'Template', CAST(N'2022-06-03T16:21:33.583' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (107, -1, 1074, N'Document', CAST(N'2022-06-03T16:22:01.567' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (108, -1, 1073, N'DocumentType', CAST(N'2022-06-03T16:22:10.027' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (109, -1, 1072, N'Template', CAST(N'2022-06-03T16:22:38.820' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (110, -1, 1064, N'Template', CAST(N'2022-06-03T16:22:43.493' AS DateTime), N'Delete', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (111, -1, 1072, N'Template', CAST(N'2022-06-03T16:22:52.550' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (112, -1, 1074, N'Document', CAST(N'2022-06-03T16:22:56.310' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (113, -1, 1072, N'Template', CAST(N'2022-06-03T16:23:15.967' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (114, -1, 1072, N'Template', CAST(N'2022-06-03T16:24:03.173' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (115, -1, 1072, N'Template', CAST(N'2022-06-03T16:24:26.300' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (116, -1, 1075, N'Template', CAST(N'2022-06-03T16:24:39.947' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (117, -1, 1075, N'Template', CAST(N'2022-06-03T16:24:46.403' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (118, -1, 1072, N'Template', CAST(N'2022-06-03T16:25:38.050' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (119, -1, 1072, N'Template', CAST(N'2022-06-03T16:26:17.723' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (120, -1, -1, N'Script', CAST(N'2022-06-03T16:31:53.417' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (121, -1, 1072, N'Template', CAST(N'2022-06-03T16:32:31.613' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (122, -1, -1, N'Script', CAST(N'2022-06-03T16:33:22.750' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (123, -1, 1075, N'Template', CAST(N'2022-06-03T16:37:59.500' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (124, -1, -1, N'Script', CAST(N'2022-06-03T16:42:15.437' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (125, -1, -1, N'Script', CAST(N'2022-06-03T16:42:37.877' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (126, -1, -1, N'PartialView', CAST(N'2022-06-03T16:43:26.957' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (127, -1, -1, N'PartialView', CAST(N'2022-06-03T16:44:40.973' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (128, -1, -1, N'PartialView', CAST(N'2022-06-03T16:44:43.653' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (129, -1, -1, N'PartialView', CAST(N'2022-06-03T16:45:58.260' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (130, -1, -1, N'PartialView', CAST(N'2022-06-03T16:46:16.717' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (131, -1, -1, N'PartialView', CAST(N'2022-06-03T16:56:59.223' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (132, -1, -1, N'PartialView', CAST(N'2022-06-03T16:57:41.703' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (133, -1, -1, N'PartialView', CAST(N'2022-06-03T16:58:20.190' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (134, -1, -1, N'PartialView', CAST(N'2022-06-03T16:58:28.533' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (135, -1, -1, N'PartialView', CAST(N'2022-06-03T16:59:41.670' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (136, -1, -1, N'PartialView', CAST(N'2022-06-03T16:59:48.217' AS DateTime), N'Delete', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (137, -1, -1, N'PartialView', CAST(N'2022-06-03T17:01:05.237' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (138, -1, -1, N'PartialView', CAST(N'2022-06-03T17:01:14.320' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (139, -1, -1, N'PartialView', CAST(N'2022-06-03T17:01:16.627' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (140, -1, -1, N'PartialView', CAST(N'2022-06-03T17:01:46.210' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (141, -1, -1, N'PartialView', CAST(N'2022-06-03T17:01:46.437' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (142, -1, -1, N'PartialView', CAST(N'2022-06-03T17:01:58.797' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (143, -1, -1, N'PartialView', CAST(N'2022-06-03T17:02:20.703' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (144, -1, -1, N'PartialView', CAST(N'2022-06-03T17:02:44.163' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (145, -1, -1, N'PartialView', CAST(N'2022-06-03T17:02:58.273' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (146, -1, -1, N'PartialView', CAST(N'2022-06-03T17:03:07.013' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (147, -1, 1076, N'Template', CAST(N'2022-06-03T17:08:59.583' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (148, -1, 1076, N'Template', CAST(N'2022-06-03T17:13:30.473' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (149, -1, 1077, N'Template', CAST(N'2022-06-03T17:14:09.117' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (150, -1, 1078, N'DocumentType', CAST(N'2022-06-03T17:14:09.187' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (151, -1, 1076, N'Template', CAST(N'2022-06-03T17:14:31.387' AS DateTime), N'Delete', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (152, -1, 1077, N'Template', CAST(N'2022-06-03T17:14:36.047' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (153, -1, 1077, N'Template', CAST(N'2022-06-03T17:14:42.273' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (154, -1, 1073, N'DocumentType', CAST(N'2022-06-03T17:15:02.277' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (155, -1, 1079, N'Document', CAST(N'2022-06-03T17:15:20.017' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (156, -1, -1, N'PartialViewMacro', CAST(N'2022-06-03T17:16:06.017' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (157, -1, -1, N'Macro', CAST(N'2022-06-03T17:16:06.060' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (158, -1, -1, N'PartialViewMacro', CAST(N'2022-06-03T17:16:10.307' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (159, -1, 1077, N'Template', CAST(N'2022-06-03T17:16:34.930' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (160, -1, 1077, N'Template', CAST(N'2022-06-03T17:20:32.023' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (161, -1, 1077, N'Template', CAST(N'2022-06-03T17:20:46.750' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (162, -1, 1072, N'Template', CAST(N'2022-06-03T17:20:55.853' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (163, -1, 1072, N'Template', CAST(N'2022-06-03T17:20:58.223' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (164, -1, 1072, N'Template', CAST(N'2022-06-03T17:21:08.510' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (165, -1, 1077, N'Template', CAST(N'2022-06-03T17:21:13.210' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (166, -1, 1077, N'Template', CAST(N'2022-06-03T17:21:46.810' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (167, -1, 1072, N'Template', CAST(N'2022-06-03T17:22:07.160' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (168, -1, 1072, N'Template', CAST(N'2022-06-03T17:22:18.517' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (169, -1, 1072, N'Template', CAST(N'2022-06-03T17:22:24.700' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (170, -1, 1072, N'Template', CAST(N'2022-06-03T17:22:54.110' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (171, -1, 1078, N'DocumentType', CAST(N'2022-06-03T17:24:28.967' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (172, -1, 1073, N'DocumentType', CAST(N'2022-06-03T17:24:37.920' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (173, -1, 1080, N'Template', CAST(N'2022-06-03T17:25:39.507' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (174, -1, 1081, N'DocumentType', CAST(N'2022-06-03T17:25:39.533' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (175, -1, 1081, N'DocumentType', CAST(N'2022-06-03T17:25:39.983' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (176, -1, 1073, N'DocumentType', CAST(N'2022-06-03T17:25:50.203' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (177, -1, 1080, N'Template', CAST(N'2022-06-03T17:26:08.333' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (178, -1, 1080, N'Template', CAST(N'2022-06-03T17:26:21.680' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (179, -1, 1082, N'Template', CAST(N'2022-06-03T17:27:03.640' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (180, -1, 1083, N'DocumentType', CAST(N'2022-06-03T17:27:03.677' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (181, -1, 1073, N'DocumentType', CAST(N'2022-06-03T17:27:18.163' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (182, -1, 1082, N'Template', CAST(N'2022-06-03T17:27:23.027' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (183, -1, 1082, N'Template', CAST(N'2022-06-03T17:27:42.303' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (184, -1, 1084, N'Template', CAST(N'2022-06-03T17:28:45.277' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (185, -1, 1085, N'DocumentType', CAST(N'2022-06-03T17:28:45.300' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (186, -1, 1085, N'DocumentType', CAST(N'2022-06-03T17:28:47.747' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (187, -1, 1085, N'DocumentType', CAST(N'2022-06-03T17:29:18.903' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (188, -1, 1085, N'DocumentType', CAST(N'2022-06-03T17:29:33.570' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (189, -1, 1083, N'DocumentType', CAST(N'2022-06-03T17:29:42.960' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (190, -1, 1073, N'DocumentType', CAST(N'2022-06-03T17:29:53.603' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (191, -1, 1086, N'Template', CAST(N'2022-06-03T17:30:35.180' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (192, -1, 1087, N'DocumentType', CAST(N'2022-06-03T17:30:35.213' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (193, -1, 1073, N'DocumentType', CAST(N'2022-06-03T17:30:45.163' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (194, -1, 1086, N'Template', CAST(N'2022-06-03T17:30:50.197' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (195, -1, 1086, N'Template', CAST(N'2022-06-03T17:31:01.063' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (196, -1, 1084, N'Template', CAST(N'2022-06-03T17:31:06.513' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (197, -1, 1084, N'Template', CAST(N'2022-06-03T17:31:21.890' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (198, -1, 1088, N'Document', CAST(N'2022-06-03T17:32:11.323' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (199, -1, 1089, N'Document', CAST(N'2022-06-03T17:32:26.580' AS DateTime), N'Publish', NULL, NULL)
GO
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (200, -1, 1090, N'Document', CAST(N'2022-06-03T17:32:33.637' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (201, -1, 1091, N'Document', CAST(N'2022-06-03T17:32:40.447' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (202, -1, 1079, N'Document', CAST(N'2022-06-03T17:33:24.193' AS DateTime), N'Move', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (203, -1, 1074, N'Document', CAST(N'2022-06-03T17:33:32.713' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (204, -1, 1073, N'DocumentType', CAST(N'2022-06-03T17:34:15.420' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (205, -1, 1073, N'DocumentType', CAST(N'2022-06-03T17:34:37.803' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (206, -1, 1073, N'DocumentType', CAST(N'2022-06-03T17:35:15.293' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (207, -1, 1073, N'DocumentType', CAST(N'2022-06-03T17:35:46.287' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (208, -1, 1073, N'DocumentType', CAST(N'2022-06-03T17:36:32.400' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (209, -1, -1, N'PartialView', CAST(N'2022-06-03T17:38:30.337' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (210, -1, 1077, N'Template', CAST(N'2022-06-03T17:39:49.473' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (211, -1, 0, N'Document', CAST(N'2022-06-03T17:50:01.417' AS DateTime), N'Sort', N'Sorting content performed by user', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (212, -1, 1088, N'Document', CAST(N'2022-06-03T17:50:57.663' AS DateTime), N'Move', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (213, -1, 1089, N'Document', CAST(N'2022-06-03T17:51:05.020' AS DateTime), N'Move', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (214, -1, 1090, N'Document', CAST(N'2022-06-03T17:51:11.417' AS DateTime), N'Move', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (215, -1, 1091, N'Document', CAST(N'2022-06-03T17:51:24.340' AS DateTime), N'Move', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (216, -1, 1079, N'Document', CAST(N'2022-06-03T17:51:30.247' AS DateTime), N'Move', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (217, -1, 1088, N'Document', CAST(N'2022-06-03T17:51:36.047' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (218, -1, 1073, N'DocumentType', CAST(N'2022-06-03T17:55:40.147' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (219, -1, 1073, N'DocumentType', CAST(N'2022-06-03T17:56:25.140' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (220, -1, 1092, N'Media', CAST(N'2022-06-03T17:57:30.953' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (221, -1, -1, N'PartialView', CAST(N'2022-06-03T17:58:55.007' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (222, -1, 1093, N'Media', CAST(N'2022-06-03T17:59:57.057' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (223, -1, 1094, N'Media', CAST(N'2022-06-03T17:59:57.113' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (224, -1, 1095, N'Media', CAST(N'2022-06-03T17:59:57.157' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (225, -1, 1096, N'Media', CAST(N'2022-06-03T17:59:57.197' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (226, -1, 1097, N'Media', CAST(N'2022-06-03T17:59:57.250' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (227, -1, 1098, N'Media', CAST(N'2022-06-03T18:00:00.070' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (228, -1, 1099, N'Media', CAST(N'2022-06-03T18:00:16.453' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (229, -1, 1100, N'Media', CAST(N'2022-06-03T18:00:16.490' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (230, -1, 1101, N'Media', CAST(N'2022-06-03T18:00:16.547' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (231, -1, 1102, N'Media', CAST(N'2022-06-03T18:00:16.593' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (232, -1, 1103, N'Media', CAST(N'2022-06-03T18:00:16.643' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (233, -1, 1104, N'Media', CAST(N'2022-06-03T18:00:19.200' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (234, -1, 1105, N'Media', CAST(N'2022-06-03T18:00:19.240' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (235, -1, 1106, N'Media', CAST(N'2022-06-03T18:00:19.317' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (236, -1, 1107, N'Media', CAST(N'2022-06-03T18:00:22.520' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (237, -1, 1108, N'Media', CAST(N'2022-06-03T18:00:22.550' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (238, -1, 1109, N'Media', CAST(N'2022-06-03T18:00:22.597' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (239, -1, 1110, N'Media', CAST(N'2022-06-03T18:00:22.647' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (240, -1, 1111, N'Media', CAST(N'2022-06-03T18:00:22.693' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (241, -1, 1112, N'Media', CAST(N'2022-06-03T18:00:22.740' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (242, -1, 1113, N'Media', CAST(N'2022-06-03T18:00:22.783' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (243, -1, 1114, N'Media', CAST(N'2022-06-03T18:00:22.853' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (244, -1, 1115, N'Media', CAST(N'2022-06-03T18:00:22.910' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (245, -1, 1116, N'Media', CAST(N'2022-06-03T18:00:22.973' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (246, -1, 1117, N'Media', CAST(N'2022-06-03T18:00:30.043' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (247, -1, 1118, N'Media', CAST(N'2022-06-03T18:00:30.080' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (248, -1, 1119, N'Media', CAST(N'2022-06-03T18:00:30.143' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (249, -1, 1120, N'Media', CAST(N'2022-06-03T18:00:30.190' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (250, -1, 1121, N'Media', CAST(N'2022-06-03T18:00:30.243' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (251, -1, 1122, N'Media', CAST(N'2022-06-03T18:00:30.287' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (252, -1, 1123, N'Media', CAST(N'2022-06-03T18:00:30.347' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (253, -1, 1124, N'Media', CAST(N'2022-06-03T18:00:30.413' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (254, -1, 1125, N'Media', CAST(N'2022-06-03T18:00:32.113' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (255, -1, 1126, N'Media', CAST(N'2022-06-03T18:00:32.140' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (256, -1, 1127, N'Media', CAST(N'2022-06-03T18:00:32.193' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (257, -1, 1128, N'Media', CAST(N'2022-06-03T18:00:32.243' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (258, -1, 1129, N'Media', CAST(N'2022-06-03T18:00:32.300' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (259, -1, 1130, N'Media', CAST(N'2022-06-03T18:00:34.020' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (260, -1, 1131, N'Media', CAST(N'2022-06-03T18:00:34.050' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (261, -1, 1132, N'Media', CAST(N'2022-06-03T18:00:36.173' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (262, -1, 1133, N'Media', CAST(N'2022-06-03T18:00:36.203' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (263, -1, 1134, N'Media', CAST(N'2022-06-03T18:00:36.240' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (264, -1, 1135, N'Media', CAST(N'2022-06-03T18:00:36.283' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (265, -1, 1136, N'Media', CAST(N'2022-06-03T18:00:36.327' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (266, -1, 1137, N'Media', CAST(N'2022-06-03T18:00:38.153' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (267, -1, 1138, N'Media', CAST(N'2022-06-03T18:00:38.180' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (268, -1, 1139, N'Media', CAST(N'2022-06-03T18:00:39.987' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (269, -1, 1140, N'Media', CAST(N'2022-06-03T18:00:40.037' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (270, -1, 1141, N'Media', CAST(N'2022-06-03T18:00:40.100' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (271, -1, 1142, N'Media', CAST(N'2022-06-03T18:00:40.160' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (272, -1, 1073, N'DocumentType', CAST(N'2022-06-03T18:03:13.063' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (273, -1, 1073, N'DocumentType', CAST(N'2022-06-03T18:03:22.257' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (274, -1, 1143, N'DataType', CAST(N'2022-06-03T18:03:44.063' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (275, -1, 1073, N'DocumentType', CAST(N'2022-06-03T18:03:58.130' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (276, -1, 1074, N'Document', CAST(N'2022-06-03T18:04:30.423' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (277, -1, 1080, N'Template', CAST(N'2022-06-03T18:05:01.543' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (278, -1, 1082, N'Template', CAST(N'2022-06-03T18:05:15.227' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (279, -1, 1077, N'Template', CAST(N'2022-06-03T18:05:26.443' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (280, -1, 1082, N'Template', CAST(N'2022-06-03T18:05:30.800' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (281, -1, 1072, N'Template', CAST(N'2022-06-03T18:06:45.507' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (282, -1, 1072, N'Template', CAST(N'2022-06-03T18:07:59.440' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (283, -1, 1072, N'Template', CAST(N'2022-06-03T18:08:29.513' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (284, -1, 1075, N'Template', CAST(N'2022-06-03T18:09:16.117' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (285, -1, 1074, N'Document', CAST(N'2022-06-03T18:10:14.453' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (286, -1, 1074, N'Document', CAST(N'2022-06-03T18:10:15.300' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (287, -1, 1075, N'Template', CAST(N'2022-06-03T18:10:34.600' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (288, -1, 1075, N'Template', CAST(N'2022-06-03T18:11:13.180' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (289, -1, 1144, N'DataType', CAST(N'2022-06-03T18:13:00.320' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (290, -1, 1073, N'DocumentType', CAST(N'2022-06-03T18:13:09.000' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (291, -1, 1075, N'Template', CAST(N'2022-06-03T18:13:49.787' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (292, -1, 1074, N'Document', CAST(N'2022-06-03T18:14:41.217' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (293, -1, 1075, N'Template', CAST(N'2022-06-03T18:15:37.257' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (294, -1, 1075, N'Template', CAST(N'2022-06-03T18:16:13.077' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (295, -1, 1075, N'Template', CAST(N'2022-06-03T18:16:23.287' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (296, -1, 1075, N'Template', CAST(N'2022-06-03T18:16:59.470' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (297, -1, 1075, N'Template', CAST(N'2022-06-03T18:17:28.060' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (298, -1, 1073, N'DocumentType', CAST(N'2022-06-03T18:17:32.923' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (299, -1, 1077, N'Template', CAST(N'2022-06-03T18:18:30.970' AS DateTime), N'Save', NULL, NULL)
GO
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (300, -1, 1075, N'Template', CAST(N'2022-06-03T18:18:33.547' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (301, -1, 1075, N'Template', CAST(N'2022-06-03T18:18:37.240' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (302, -1, 1145, N'DocumentType', CAST(N'2022-06-03T18:19:57.327' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (303, -1, 1145, N'DocumentType', CAST(N'2022-06-03T18:20:29.357' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (304, -1, 1073, N'DocumentType', CAST(N'2022-06-03T18:20:36.577' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (305, -1, 1146, N'Document', CAST(N'2022-06-03T18:20:59.677' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (306, -1, 1072, N'Template', CAST(N'2022-06-03T18:21:32.357' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (307, -1, -1, N'Document', CAST(N'2022-06-03T18:23:06.297' AS DateTime), N'Delete', N'Delete content of type 1145', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (308, -1, 1145, N'DocumentType', CAST(N'2022-06-03T18:23:06.387' AS DateTime), N'Delete', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (309, -1, 1072, N'Template', CAST(N'2022-06-03T18:23:22.130' AS DateTime), N'Delete', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (310, -1, 1147, N'Template', CAST(N'2022-06-03T18:23:43.917' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (311, -1, 1148, N'DocumentType', CAST(N'2022-06-03T18:23:44.003' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (312, -1, 1073, N'DocumentType', CAST(N'2022-06-03T18:24:41.467' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (313, -1, 1147, N'Template', CAST(N'2022-06-03T18:25:02.593' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (314, -1, 1147, N'Template', CAST(N'2022-06-03T18:25:17.773' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (315, -1, 1149, N'Document', CAST(N'2022-06-03T18:25:48.303' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (316, -1, 1149, N'Document', CAST(N'2022-06-03T18:25:50.547' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (317, -1, 1073, N'DocumentType', CAST(N'2022-06-03T18:27:05.797' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (318, -1, 1073, N'DocumentType', CAST(N'2022-06-03T18:27:38.667' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (319, -1, 1074, N'Document', CAST(N'2022-06-03T18:27:45.737' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (320, -1, 1074, N'Document', CAST(N'2022-06-03T18:28:04.783' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (321, -1, 1074, N'Document', CAST(N'2022-06-03T18:28:23.603' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (322, -1, 1147, N'Template', CAST(N'2022-06-03T18:28:56.183' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (323, -1, 1147, N'Template', CAST(N'2022-06-03T18:30:20.770' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (324, -1, 1084, N'Template', CAST(N'2022-06-03T18:33:42.070' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (325, -1, 1084, N'Template', CAST(N'2022-06-03T18:33:52.953' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (326, -1, -1, N'Script', CAST(N'2022-06-03T18:38:48.417' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (327, -1, -1, N'PartialView', CAST(N'2022-06-03T18:40:09.467' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (328, -1, -1, N'PartialView', CAST(N'2022-06-03T18:40:42.750' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (329, -1, 1073, N'DocumentType', CAST(N'2022-06-07T22:03:32.700' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (330, -1, 1147, N'Template', CAST(N'2022-06-07T22:04:53.307' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (331, -1, 1074, N'Document', CAST(N'2022-06-07T22:04:57.277' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (332, -1, 1147, N'Template', CAST(N'2022-06-07T22:05:12.257' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (333, -1, 1074, N'Document', CAST(N'2022-06-07T22:05:24.567' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (334, -1, 1074, N'Document', CAST(N'2022-06-07T22:05:41.180' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (335, -1, 1147, N'Template', CAST(N'2022-06-07T22:05:54.880' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (336, -1, 1147, N'Template', CAST(N'2022-06-07T22:06:01.487' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (337, -1, 1074, N'Document', CAST(N'2022-06-07T22:06:18.290' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (338, -1, 1074, N'Document', CAST(N'2022-06-07T22:07:31.110' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (339, -1, 1074, N'Document', CAST(N'2022-06-07T22:07:46.717' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (340, -1, 1074, N'Document', CAST(N'2022-06-07T22:08:00.287' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (341, -1, 1150, N'DataType', CAST(N'2022-06-07T22:08:56.540' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (342, -1, 1073, N'DocumentType', CAST(N'2022-06-07T22:09:12.417' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (343, -1, 1074, N'Document', CAST(N'2022-06-07T22:10:06.093' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (344, -1, 1073, N'DocumentType', CAST(N'2022-06-07T22:18:10.057' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (345, -1, 1074, N'Document', CAST(N'2022-06-07T22:18:51.303' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (346, -1, 1147, N'Template', CAST(N'2022-06-07T22:19:31.967' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (347, -1, 1074, N'Document', CAST(N'2022-06-07T22:20:41.257' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (348, -1, -1, N'Macro', CAST(N'2022-06-07T22:25:11.743' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (349, -1, 1137, N'Media', CAST(N'2022-06-07T22:32:22.533' AS DateTime), N'Move', N'Move Media to recycle bin', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (350, -1, 1137, N'Media', CAST(N'2022-06-07T22:32:22.673' AS DateTime), N'Delete', N'Trashed media with Id: 1137 related to original parent media item with Id: -1', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (351, -1, 1138, N'Media', CAST(N'2022-06-07T22:32:22.680' AS DateTime), N'Delete', N'Trashed media with Id: 1138 related to original parent media item with Id: 1137', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (352, -1, 1139, N'Media', CAST(N'2022-06-07T22:32:39.853' AS DateTime), N'Move', N'Move Media to recycle bin', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (353, -1, 1139, N'Media', CAST(N'2022-06-07T22:32:39.867' AS DateTime), N'Delete', N'Trashed media with Id: 1139 related to original parent media item with Id: -1', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (354, -1, 1140, N'Media', CAST(N'2022-06-07T22:32:39.870' AS DateTime), N'Delete', N'Trashed media with Id: 1140 related to original parent media item with Id: 1139', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (355, -1, 1141, N'Media', CAST(N'2022-06-07T22:32:39.873' AS DateTime), N'Delete', N'Trashed media with Id: 1141 related to original parent media item with Id: 1139', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (356, -1, 1142, N'Media', CAST(N'2022-06-07T22:32:39.877' AS DateTime), N'Delete', N'Trashed media with Id: 1142 related to original parent media item with Id: 1139', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (357, -1, 1092, N'Media', CAST(N'2022-06-07T22:32:47.293' AS DateTime), N'Move', N'Move Media to recycle bin', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (358, -1, 1092, N'Media', CAST(N'2022-06-07T22:32:47.330' AS DateTime), N'Delete', N'Trashed media with Id: 1092 related to original parent media item with Id: -1', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (359, -1, 1093, N'Media', CAST(N'2022-06-07T22:32:56.463' AS DateTime), N'Move', N'Move Media to recycle bin', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (360, -1, 1093, N'Media', CAST(N'2022-06-07T22:32:56.477' AS DateTime), N'Delete', N'Trashed media with Id: 1093 related to original parent media item with Id: -1', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (361, -1, 1093, N'Media', CAST(N'2022-06-07T22:33:01.273' AS DateTime), N'Delete', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (362, -1, 1132, N'Media', CAST(N'2022-06-07T22:33:04.620' AS DateTime), N'Move', N'Move Media to recycle bin', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (363, -1, 1132, N'Media', CAST(N'2022-06-07T22:33:04.637' AS DateTime), N'Delete', N'Trashed media with Id: 1132 related to original parent media item with Id: -1', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (364, -1, 1133, N'Media', CAST(N'2022-06-07T22:33:04.637' AS DateTime), N'Delete', N'Trashed media with Id: 1133 related to original parent media item with Id: 1132', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (365, -1, 1134, N'Media', CAST(N'2022-06-07T22:33:04.640' AS DateTime), N'Delete', N'Trashed media with Id: 1134 related to original parent media item with Id: 1132', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (366, -1, 1135, N'Media', CAST(N'2022-06-07T22:33:04.643' AS DateTime), N'Delete', N'Trashed media with Id: 1135 related to original parent media item with Id: 1132', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (367, -1, 1136, N'Media', CAST(N'2022-06-07T22:33:04.647' AS DateTime), N'Delete', N'Trashed media with Id: 1136 related to original parent media item with Id: 1132', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (368, -1, 1130, N'Media', CAST(N'2022-06-07T22:33:10.417' AS DateTime), N'Move', N'Move Media to recycle bin', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (369, -1, 1130, N'Media', CAST(N'2022-06-07T22:33:10.430' AS DateTime), N'Delete', N'Trashed media with Id: 1130 related to original parent media item with Id: -1', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (370, -1, 1131, N'Media', CAST(N'2022-06-07T22:33:10.433' AS DateTime), N'Delete', N'Trashed media with Id: 1131 related to original parent media item with Id: 1130', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (371, -1, 1125, N'Media', CAST(N'2022-06-07T22:33:10.483' AS DateTime), N'Move', N'Move Media to recycle bin', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (372, -1, 1125, N'Media', CAST(N'2022-06-07T22:33:10.497' AS DateTime), N'Delete', N'Trashed media with Id: 1125 related to original parent media item with Id: -1', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (373, -1, 1126, N'Media', CAST(N'2022-06-07T22:33:10.500' AS DateTime), N'Delete', N'Trashed media with Id: 1126 related to original parent media item with Id: 1125', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (374, -1, 1127, N'Media', CAST(N'2022-06-07T22:33:10.503' AS DateTime), N'Delete', N'Trashed media with Id: 1127 related to original parent media item with Id: 1125', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (375, -1, 1128, N'Media', CAST(N'2022-06-07T22:33:10.507' AS DateTime), N'Delete', N'Trashed media with Id: 1128 related to original parent media item with Id: 1125', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (376, -1, 1129, N'Media', CAST(N'2022-06-07T22:33:10.510' AS DateTime), N'Delete', N'Trashed media with Id: 1129 related to original parent media item with Id: 1125', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (377, -1, 1117, N'Media', CAST(N'2022-06-07T22:33:10.577' AS DateTime), N'Move', N'Move Media to recycle bin', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (378, -1, 1117, N'Media', CAST(N'2022-06-07T22:33:10.593' AS DateTime), N'Delete', N'Trashed media with Id: 1117 related to original parent media item with Id: -1', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (379, -1, 1118, N'Media', CAST(N'2022-06-07T22:33:10.597' AS DateTime), N'Delete', N'Trashed media with Id: 1118 related to original parent media item with Id: 1117', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (380, -1, 1119, N'Media', CAST(N'2022-06-07T22:33:10.597' AS DateTime), N'Delete', N'Trashed media with Id: 1119 related to original parent media item with Id: 1117', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (381, -1, 1120, N'Media', CAST(N'2022-06-07T22:33:10.600' AS DateTime), N'Delete', N'Trashed media with Id: 1120 related to original parent media item with Id: 1117', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (382, -1, 1121, N'Media', CAST(N'2022-06-07T22:33:10.603' AS DateTime), N'Delete', N'Trashed media with Id: 1121 related to original parent media item with Id: 1117', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (383, -1, 1122, N'Media', CAST(N'2022-06-07T22:33:10.607' AS DateTime), N'Delete', N'Trashed media with Id: 1122 related to original parent media item with Id: 1117', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (384, -1, 1123, N'Media', CAST(N'2022-06-07T22:33:10.610' AS DateTime), N'Delete', N'Trashed media with Id: 1123 related to original parent media item with Id: 1117', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (385, -1, 1124, N'Media', CAST(N'2022-06-07T22:33:10.610' AS DateTime), N'Delete', N'Trashed media with Id: 1124 related to original parent media item with Id: 1117', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (386, -1, 1107, N'Media', CAST(N'2022-06-07T22:33:10.717' AS DateTime), N'Move', N'Move Media to recycle bin', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (387, -1, 1107, N'Media', CAST(N'2022-06-07T22:33:10.730' AS DateTime), N'Delete', N'Trashed media with Id: 1107 related to original parent media item with Id: -1', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (388, -1, 1108, N'Media', CAST(N'2022-06-07T22:33:10.733' AS DateTime), N'Delete', N'Trashed media with Id: 1108 related to original parent media item with Id: 1107', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (389, -1, 1109, N'Media', CAST(N'2022-06-07T22:33:10.737' AS DateTime), N'Delete', N'Trashed media with Id: 1109 related to original parent media item with Id: 1107', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (390, -1, 1110, N'Media', CAST(N'2022-06-07T22:33:10.737' AS DateTime), N'Delete', N'Trashed media with Id: 1110 related to original parent media item with Id: 1107', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (391, -1, 1111, N'Media', CAST(N'2022-06-07T22:33:10.740' AS DateTime), N'Delete', N'Trashed media with Id: 1111 related to original parent media item with Id: 1107', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (392, -1, 1112, N'Media', CAST(N'2022-06-07T22:33:10.743' AS DateTime), N'Delete', N'Trashed media with Id: 1112 related to original parent media item with Id: 1107', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (393, -1, 1113, N'Media', CAST(N'2022-06-07T22:33:10.747' AS DateTime), N'Delete', N'Trashed media with Id: 1113 related to original parent media item with Id: 1107', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (394, -1, 1114, N'Media', CAST(N'2022-06-07T22:33:10.750' AS DateTime), N'Delete', N'Trashed media with Id: 1114 related to original parent media item with Id: 1107', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (395, -1, 1115, N'Media', CAST(N'2022-06-07T22:33:10.753' AS DateTime), N'Delete', N'Trashed media with Id: 1115 related to original parent media item with Id: 1107', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (396, -1, 1116, N'Media', CAST(N'2022-06-07T22:33:10.757' AS DateTime), N'Delete', N'Trashed media with Id: 1116 related to original parent media item with Id: 1107', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (397, -1, 1104, N'Media', CAST(N'2022-06-07T22:33:10.800' AS DateTime), N'Move', N'Move Media to recycle bin', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (398, -1, 1104, N'Media', CAST(N'2022-06-07T22:33:10.810' AS DateTime), N'Delete', N'Trashed media with Id: 1104 related to original parent media item with Id: -1', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (399, -1, 1105, N'Media', CAST(N'2022-06-07T22:33:10.813' AS DateTime), N'Delete', N'Trashed media with Id: 1105 related to original parent media item with Id: 1104', NULL)
GO
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (400, -1, 1106, N'Media', CAST(N'2022-06-07T22:33:10.817' AS DateTime), N'Delete', N'Trashed media with Id: 1106 related to original parent media item with Id: 1104', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (401, -1, 1099, N'Media', CAST(N'2022-06-07T22:33:10.860' AS DateTime), N'Move', N'Move Media to recycle bin', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (402, -1, 1099, N'Media', CAST(N'2022-06-07T22:33:10.873' AS DateTime), N'Delete', N'Trashed media with Id: 1099 related to original parent media item with Id: -1', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (403, -1, 1100, N'Media', CAST(N'2022-06-07T22:33:10.877' AS DateTime), N'Delete', N'Trashed media with Id: 1100 related to original parent media item with Id: 1099', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (404, -1, 1101, N'Media', CAST(N'2022-06-07T22:33:10.880' AS DateTime), N'Delete', N'Trashed media with Id: 1101 related to original parent media item with Id: 1099', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (405, -1, 1102, N'Media', CAST(N'2022-06-07T22:33:10.883' AS DateTime), N'Delete', N'Trashed media with Id: 1102 related to original parent media item with Id: 1099', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (406, -1, 1103, N'Media', CAST(N'2022-06-07T22:33:10.887' AS DateTime), N'Delete', N'Trashed media with Id: 1103 related to original parent media item with Id: 1099', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (407, -1, 1094, N'Media', CAST(N'2022-06-07T22:33:10.917' AS DateTime), N'Move', N'Move Media to recycle bin', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (408, -1, 1094, N'Media', CAST(N'2022-06-07T22:33:10.930' AS DateTime), N'Delete', N'Trashed media with Id: 1094 related to original parent media item with Id: -1', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (409, -1, 1095, N'Media', CAST(N'2022-06-07T22:33:10.953' AS DateTime), N'Move', N'Move Media to recycle bin', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (410, -1, 1095, N'Media', CAST(N'2022-06-07T22:33:10.963' AS DateTime), N'Delete', N'Trashed media with Id: 1095 related to original parent media item with Id: -1', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (411, -1, 1096, N'Media', CAST(N'2022-06-07T22:33:10.987' AS DateTime), N'Move', N'Move Media to recycle bin', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (412, -1, 1096, N'Media', CAST(N'2022-06-07T22:33:11.000' AS DateTime), N'Delete', N'Trashed media with Id: 1096 related to original parent media item with Id: -1', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (413, -1, 1097, N'Media', CAST(N'2022-06-07T22:33:11.020' AS DateTime), N'Move', N'Move Media to recycle bin', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (414, -1, 1097, N'Media', CAST(N'2022-06-07T22:33:11.030' AS DateTime), N'Delete', N'Trashed media with Id: 1097 related to original parent media item with Id: -1', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (415, -1, 1098, N'Media', CAST(N'2022-06-07T22:33:11.050' AS DateTime), N'Move', N'Move Media to recycle bin', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (416, -1, 1098, N'Media', CAST(N'2022-06-07T22:33:11.060' AS DateTime), N'Delete', N'Trashed media with Id: 1098 related to original parent media item with Id: -1', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (417, -1, -21, N'Media', CAST(N'2022-06-07T22:33:29.117' AS DateTime), N'Delete', N'Empty Media recycle bin', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (418, -1, 1151, N'Media', CAST(N'2022-06-07T22:34:03.747' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (419, -1, 1152, N'Media', CAST(N'2022-06-07T22:34:03.870' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (420, -1, 1153, N'Media', CAST(N'2022-06-07T22:34:03.920' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (421, -1, 1154, N'Media', CAST(N'2022-06-07T22:34:03.970' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (422, -1, 1155, N'Media', CAST(N'2022-06-07T22:34:04.017' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (423, -1, 1156, N'Media', CAST(N'2022-06-07T22:34:04.053' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (424, -1, 1157, N'Media', CAST(N'2022-06-07T22:34:04.097' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (425, -1, 1158, N'Media', CAST(N'2022-06-07T22:34:04.130' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (426, -1, 1159, N'Media', CAST(N'2022-06-07T22:34:04.157' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (427, -1, 1160, N'Media', CAST(N'2022-06-07T22:34:04.203' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (428, -1, 1161, N'Media', CAST(N'2022-06-07T22:34:04.247' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (429, -1, 1162, N'Media', CAST(N'2022-06-07T22:34:04.303' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (430, -1, 1163, N'Media', CAST(N'2022-06-07T22:34:04.350' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (431, -1, 1164, N'Media', CAST(N'2022-06-07T22:34:04.393' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (432, -1, 1165, N'Media', CAST(N'2022-06-07T22:34:04.413' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (433, -1, 1166, N'Media', CAST(N'2022-06-07T22:34:04.437' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (434, -1, 1167, N'Media', CAST(N'2022-06-07T22:34:04.460' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (435, -1, 1168, N'Media', CAST(N'2022-06-07T22:34:04.487' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (436, -1, 1169, N'Media', CAST(N'2022-06-07T22:34:04.527' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (437, -1, 1170, N'Media', CAST(N'2022-06-07T22:34:04.567' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (438, -1, 1171, N'Media', CAST(N'2022-06-07T22:34:04.603' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (439, -1, 1172, N'Media', CAST(N'2022-06-07T22:34:04.673' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (440, -1, 1173, N'Media', CAST(N'2022-06-07T22:34:04.703' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (441, -1, 1174, N'Media', CAST(N'2022-06-07T22:34:04.760' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (442, -1, 1175, N'Media', CAST(N'2022-06-07T22:34:04.963' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (443, -1, 1176, N'Media', CAST(N'2022-06-07T22:34:05.040' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (444, -1, 1177, N'Media', CAST(N'2022-06-07T22:34:05.113' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (445, -1, 1178, N'Media', CAST(N'2022-06-07T22:34:05.177' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (446, -1, 1179, N'Media', CAST(N'2022-06-07T22:34:05.233' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (447, -1, 1180, N'Media', CAST(N'2022-06-07T22:34:05.300' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (448, -1, 1181, N'Media', CAST(N'2022-06-07T22:34:05.473' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (449, -1, 1182, N'Media', CAST(N'2022-06-07T22:34:05.527' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (450, -1, 1183, N'Media', CAST(N'2022-06-07T22:34:05.550' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (451, -1, 1184, N'Media', CAST(N'2022-06-07T22:34:05.600' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (452, -1, 1185, N'Media', CAST(N'2022-06-07T22:34:05.653' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (453, -1, 1186, N'Media', CAST(N'2022-06-07T22:34:05.710' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (454, -1, 1187, N'Media', CAST(N'2022-06-07T22:34:05.750' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (455, -1, 1188, N'Media', CAST(N'2022-06-07T22:34:05.800' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (456, -1, 1189, N'Media', CAST(N'2022-06-07T22:34:05.823' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (457, -1, 1190, N'Media', CAST(N'2022-06-07T22:34:05.870' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (458, -1, 1191, N'Media', CAST(N'2022-06-07T22:34:05.923' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (459, -1, 1192, N'Media', CAST(N'2022-06-07T22:34:05.973' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (460, -1, 1193, N'Media', CAST(N'2022-06-07T22:34:06.020' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (461, -1, 1194, N'Media', CAST(N'2022-06-07T22:34:06.067' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (462, -1, 1195, N'Media', CAST(N'2022-06-07T22:34:06.177' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (463, -1, 1196, N'Media', CAST(N'2022-06-07T22:34:06.207' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (464, -1, 1197, N'Media', CAST(N'2022-06-07T22:34:06.230' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (465, -1, 1198, N'Media', CAST(N'2022-06-07T22:34:06.267' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (466, -1, 1199, N'Media', CAST(N'2022-06-07T22:34:06.303' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (467, -1, 1200, N'Media', CAST(N'2022-06-07T22:34:06.340' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (468, -1, 1201, N'Media', CAST(N'2022-06-07T22:34:06.470' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (469, -1, 1202, N'Media', CAST(N'2022-06-07T22:34:06.557' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (470, -1, 1203, N'Media', CAST(N'2022-06-07T22:34:06.630' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (471, -1, 1204, N'Media', CAST(N'2022-06-07T22:34:06.707' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (472, -1, 1205, N'Media', CAST(N'2022-06-07T22:34:06.763' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (473, -1, 1206, N'Media', CAST(N'2022-06-07T22:34:06.790' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (474, -1, 1207, N'Media', CAST(N'2022-06-07T22:34:06.813' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (475, -1, 1208, N'Media', CAST(N'2022-06-07T22:34:06.870' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (476, -1, 1209, N'Media', CAST(N'2022-06-07T22:34:06.910' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (477, -1, 1210, N'Media', CAST(N'2022-06-07T22:34:06.957' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (478, -1, 1211, N'Media', CAST(N'2022-06-07T22:34:06.987' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (479, -1, 1212, N'Media', CAST(N'2022-06-07T22:34:07.013' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (480, -1, 1213, N'Media', CAST(N'2022-06-07T22:34:07.073' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (481, -1, 1214, N'Media', CAST(N'2022-06-07T22:34:07.140' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (482, -1, 1215, N'Media', CAST(N'2022-06-07T22:34:07.187' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (483, -1, 1073, N'DocumentType', CAST(N'2022-06-07T22:37:01.157' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (484, -1, 1074, N'Document', CAST(N'2022-06-07T22:37:24.170' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (485, -1, 1147, N'Template', CAST(N'2022-06-07T22:38:10.993' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (486, -1, 1074, N'Document', CAST(N'2022-06-07T22:38:13.870' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (487, -1, 1074, N'Document', CAST(N'2022-06-07T22:41:07.767' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (488, -1, 1074, N'Document', CAST(N'2022-06-07T22:41:46.123' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (489, -1, 1073, N'DocumentType', CAST(N'2022-06-07T22:42:11.277' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (490, -1, 1074, N'Document', CAST(N'2022-06-07T22:44:00.417' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (491, -1, 1147, N'Template', CAST(N'2022-06-07T22:53:14.523' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (492, -1, 1147, N'Template', CAST(N'2022-06-07T22:53:38.377' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (493, -1, 1147, N'Template', CAST(N'2022-06-07T22:53:54.433' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (494, -1, 1147, N'Template', CAST(N'2022-06-07T22:56:40.047' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (495, -1, 1147, N'Template', CAST(N'2022-06-07T23:00:55.637' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (496, -1, 1073, N'DocumentType', CAST(N'2022-06-07T23:01:50.477' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (497, -1, 1074, N'Document', CAST(N'2022-06-07T23:02:08.553' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (498, -1, 1147, N'Template', CAST(N'2022-06-07T23:02:25.633' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (499, -1, 1147, N'Template', CAST(N'2022-06-07T23:03:55.743' AS DateTime), N'Save', NULL, NULL)
GO
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (500, -1, 1147, N'Template', CAST(N'2022-06-07T23:05:40.397' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (501, -1, 1147, N'Template', CAST(N'2022-06-07T23:11:00.110' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (502, -1, 1074, N'Document', CAST(N'2022-06-07T23:12:50.793' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (503, -1, 1074, N'Document', CAST(N'2022-06-07T23:13:48.540' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (504, -1, 1073, N'DocumentType', CAST(N'2022-06-07T23:18:19.350' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (505, -1, 1074, N'Document', CAST(N'2022-06-07T23:19:16.190' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (506, -1, 1073, N'DocumentType', CAST(N'2022-06-07T23:20:04.050' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (507, -1, 1073, N'DocumentType', CAST(N'2022-06-07T23:21:10.747' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (508, -1, 1073, N'DocumentType', CAST(N'2022-06-07T23:21:20.713' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (509, -1, 1074, N'Document', CAST(N'2022-06-07T23:22:03.733' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (510, -1, 1074, N'Document', CAST(N'2022-06-07T23:22:05.873' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (511, -1, 1147, N'Template', CAST(N'2022-06-07T23:23:15.890' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (512, -1, 1147, N'Template', CAST(N'2022-06-07T23:23:23.527' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (513, -1, 1147, N'Template', CAST(N'2022-06-07T23:24:13.193' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (514, -1, 1074, N'Document', CAST(N'2022-06-07T23:24:45.853' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (515, -1, 1074, N'Document', CAST(N'2022-06-07T23:24:47.773' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (516, -1, 1074, N'Document', CAST(N'2022-06-07T23:24:48.657' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (517, -1, 1074, N'Document', CAST(N'2022-06-07T23:25:48.960' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (518, -1, 1074, N'Document', CAST(N'2022-06-07T23:25:50.543' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (519, -1, 1078, N'DocumentType', CAST(N'2022-06-07T23:29:02.067' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (520, -1, 1079, N'Document', CAST(N'2022-06-07T23:30:01.447' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (521, -1, 1079, N'Document', CAST(N'2022-06-07T23:31:16.410' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (522, -1, 1078, N'DocumentType', CAST(N'2022-06-07T23:31:28.820' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (523, -1, 1079, N'Document', CAST(N'2022-06-07T23:31:44.470' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (524, -1, 1077, N'Template', CAST(N'2022-06-07T23:38:24.927' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (525, -1, 1077, N'Template', CAST(N'2022-06-07T23:40:40.450' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (526, -1, 1077, N'Template', CAST(N'2022-06-07T23:41:19.640' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (527, -1, 1077, N'Template', CAST(N'2022-06-07T23:41:56.333' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (528, -1, 1077, N'Template', CAST(N'2022-06-07T23:42:14.513' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (529, -1, 1077, N'Template', CAST(N'2022-06-07T23:42:24.727' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (530, -1, 1077, N'Template', CAST(N'2022-06-07T23:42:59.070' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (531, -1, 1077, N'Template', CAST(N'2022-06-07T23:45:18.080' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (532, -1, 1077, N'Template', CAST(N'2022-06-07T23:45:38.387' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (533, -1, 1077, N'Template', CAST(N'2022-06-07T23:45:44.370' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (534, -1, 1077, N'Template', CAST(N'2022-06-07T23:46:18.980' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (535, -1, 1077, N'Template', CAST(N'2022-06-07T23:46:39.457' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (536, -1, 1077, N'Template', CAST(N'2022-06-07T23:46:53.220' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (537, -1, 1077, N'Template', CAST(N'2022-06-07T23:47:13.907' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (538, -1, 1077, N'Template', CAST(N'2022-06-07T23:47:19.627' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (539, -1, 1077, N'Template', CAST(N'2022-06-07T23:48:06.523' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (540, -1, 1077, N'Template', CAST(N'2022-06-07T23:48:34.100' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (541, -1, 1077, N'Template', CAST(N'2022-06-07T23:48:45.540' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (542, -1, 1077, N'Template', CAST(N'2022-06-07T23:49:57.933' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (543, -1, 1077, N'Template', CAST(N'2022-06-07T23:50:19.713' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (544, -1, 1077, N'Template', CAST(N'2022-06-07T23:54:19.860' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (545, -1, 1077, N'Template', CAST(N'2022-06-07T23:58:18.353' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (546, -1, 1078, N'DocumentType', CAST(N'2022-06-08T00:05:15.820' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (547, -1, 1079, N'Document', CAST(N'2022-06-08T00:05:51.300' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (548, -1, 1077, N'Template', CAST(N'2022-06-08T00:07:02.243' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (549, -1, 1077, N'Template', CAST(N'2022-06-08T00:07:21.297' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (550, -1, 1077, N'Template', CAST(N'2022-06-08T00:07:35.500' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (551, -1, 1077, N'Template', CAST(N'2022-06-08T00:07:44.280' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (552, -1, 1077, N'Template', CAST(N'2022-06-08T00:08:13.680' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (553, -1, 1077, N'Template', CAST(N'2022-06-08T00:12:43.707' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (554, -1, 1077, N'Template', CAST(N'2022-06-08T00:14:21.680' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (555, -1, 1079, N'Document', CAST(N'2022-06-08T00:14:33.903' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (556, -1, 1078, N'DocumentType', CAST(N'2022-06-08T00:15:22.660' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (557, -1, 1077, N'Template', CAST(N'2022-06-08T00:15:30.950' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (558, -1, 1043, N'DataType', CAST(N'2022-06-08T00:16:48.353' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (559, -1, 1043, N'DataType', CAST(N'2022-06-08T00:17:28.983' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (560, -1, 1043, N'DataType', CAST(N'2022-06-08T00:17:47.350' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (561, -1, 1078, N'DocumentType', CAST(N'2022-06-08T00:17:48.873' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (562, -1, 1079, N'Document', CAST(N'2022-06-08T00:18:19.647' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (563, -1, 1077, N'Template', CAST(N'2022-06-08T00:18:36.967' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (564, -1, 1043, N'DataType', CAST(N'2022-06-08T00:21:37.223' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (565, -1, 1078, N'DocumentType', CAST(N'2022-06-08T00:21:39.160' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (566, -1, 1043, N'DataType', CAST(N'2022-06-08T00:23:20.873' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (567, -1, 1043, N'DataType', CAST(N'2022-06-08T00:23:56.723' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (568, -1, 1078, N'DocumentType', CAST(N'2022-06-08T00:24:01.890' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (569, -1, 1043, N'DataType', CAST(N'2022-06-08T00:24:39.310' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (570, -1, 1078, N'DocumentType', CAST(N'2022-06-08T00:24:49.850' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (571, -1, 1078, N'DocumentType', CAST(N'2022-06-08T00:27:22.207' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (572, -1, 1078, N'DocumentType', CAST(N'2022-06-08T00:27:43.567' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (573, -1, 1079, N'Document', CAST(N'2022-06-08T00:27:59.050' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (574, -1, 1077, N'Template', CAST(N'2022-06-08T00:28:26.527' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (575, -1, 1077, N'Template', CAST(N'2022-06-08T00:28:51.800' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (576, -1, 1077, N'Template', CAST(N'2022-06-08T00:29:23.130' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (577, -1, 1043, N'DataType', CAST(N'2022-06-08T00:42:44.300' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (578, -1, 1078, N'DocumentType', CAST(N'2022-06-08T00:42:55.757' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (579, -1, 1077, N'Template', CAST(N'2022-06-08T00:43:04.983' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (580, -1, 1081, N'DocumentType', CAST(N'2022-06-08T00:44:26.947' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (581, -1, 1088, N'Document', CAST(N'2022-06-08T00:44:53.840' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (582, -1, 1080, N'Template', CAST(N'2022-06-08T00:45:20.603' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (583, -1, 1080, N'Template', CAST(N'2022-06-08T00:47:25.483' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (584, -1, -1, N'PartialView', CAST(N'2022-06-08T00:49:03.373' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (585, -1, 1080, N'Template', CAST(N'2022-06-08T00:54:00.413' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (586, -1, 1080, N'Template', CAST(N'2022-06-08T00:54:45.937' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (587, -1, 1080, N'Template', CAST(N'2022-06-08T00:54:53.963' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (588, -1, 1080, N'Template', CAST(N'2022-06-08T00:56:20.547' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (589, -1, 1088, N'Document', CAST(N'2022-06-08T00:56:44.040' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (590, -1, 1088, N'Document', CAST(N'2022-06-08T00:57:29.117' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (591, -1, 1079, N'Document', CAST(N'2022-06-08T00:58:40.443' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (592, -1, 1080, N'Template', CAST(N'2022-06-08T01:02:12.640' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (593, -1, 1081, N'DocumentType', CAST(N'2022-06-08T01:05:11.053' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (594, -1, 1088, N'Document', CAST(N'2022-06-08T01:06:13.733' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (595, -1, 1088, N'Document', CAST(N'2022-06-08T01:06:53.140' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (596, -1, 1088, N'Document', CAST(N'2022-06-08T01:07:23.467' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (597, -1, 1080, N'Template', CAST(N'2022-06-08T01:08:18.180' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (598, -1, 1080, N'Template', CAST(N'2022-06-08T01:08:55.617' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (599, -1, 1080, N'Template', CAST(N'2022-06-08T01:09:21.987' AS DateTime), N'Save', NULL, NULL)
GO
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (600, -1, 1080, N'Template', CAST(N'2022-06-08T01:10:26.210' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (601, -1, 1080, N'Template', CAST(N'2022-06-08T01:10:39.533' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (602, -1, 1080, N'Template', CAST(N'2022-06-08T01:10:48.360' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (603, -1, 1080, N'Template', CAST(N'2022-06-08T01:11:25.537' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (604, -1, 1088, N'Document', CAST(N'2022-06-08T01:11:53.230' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (605, -1, 1088, N'Document', CAST(N'2022-06-08T01:12:33.257' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (606, -1, 1088, N'Document', CAST(N'2022-06-08T01:12:39.387' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (607, -1, 1081, N'DocumentType', CAST(N'2022-06-08T01:14:21.930' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (608, -1, 1088, N'Document', CAST(N'2022-06-08T01:15:08.463' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (609, -1, 1080, N'Template', CAST(N'2022-06-08T01:16:00.853' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (610, -1, 1080, N'Template', CAST(N'2022-06-08T01:18:08.207' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (611, -1, 1080, N'Template', CAST(N'2022-06-08T01:30:35.497' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (612, -1, 1088, N'Document', CAST(N'2022-06-08T01:31:35.287' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (613, -1, 1088, N'Document', CAST(N'2022-06-08T01:35:17.187' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (614, -1, 1088, N'Document', CAST(N'2022-06-08T01:35:53.553' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (615, -1, 1081, N'DocumentType', CAST(N'2022-06-08T01:37:22.603' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (616, -1, 1088, N'Document', CAST(N'2022-06-08T01:38:14.917' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (617, -1, 1080, N'Template', CAST(N'2022-06-08T01:40:23.950' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (618, -1, 1078, N'DocumentType', CAST(N'2022-06-08T01:42:59.777' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (619, -1, 1073, N'DocumentType', CAST(N'2022-06-08T01:47:11.503' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (620, -1, 1074, N'Document', CAST(N'2022-06-08T01:48:08.360' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (621, -1, 1074, N'Document', CAST(N'2022-06-08T01:50:15.317' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (622, -1, 1074, N'Document', CAST(N'2022-06-08T01:50:25.540' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (623, -1, 1074, N'Document', CAST(N'2022-06-08T01:56:50.833' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (624, -1, 1074, N'Document', CAST(N'2022-06-08T01:56:51.780' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (625, -1, 1074, N'Document', CAST(N'2022-06-08T01:58:16.323' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (626, -1, 1074, N'Document', CAST(N'2022-06-08T01:58:17.767' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (627, -1, 1074, N'Document', CAST(N'2022-06-08T01:58:52.143' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (628, -1, 1074, N'Document', CAST(N'2022-06-08T01:58:53.350' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (629, -1, 1074, N'Document', CAST(N'2022-06-08T02:06:13.873' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (630, -1, 1074, N'Document', CAST(N'2022-06-08T02:06:44.580' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (631, -1, 1074, N'Document', CAST(N'2022-06-08T02:07:55.983' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (632, -1, 1074, N'Document', CAST(N'2022-06-08T02:12:02.450' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (633, -1, 1074, N'Document', CAST(N'2022-06-08T02:12:04.770' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (634, -1, 1074, N'Document', CAST(N'2022-06-08T02:14:03.193' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (635, -1, 1074, N'Document', CAST(N'2022-06-08T02:14:04.887' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (636, -1, 1073, N'DocumentType', CAST(N'2022-06-08T02:15:11.150' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (637, -1, 1074, N'Document', CAST(N'2022-06-08T02:15:19.397' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (638, -1, 1074, N'Document', CAST(N'2022-06-08T02:15:48.633' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (639, -1, 1074, N'Document', CAST(N'2022-06-08T02:15:49.747' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (640, -1, 1074, N'Document', CAST(N'2022-06-08T02:16:28.137' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (641, -1, 1073, N'DocumentType', CAST(N'2022-06-08T02:20:14.863' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (642, -1, 1074, N'Document', CAST(N'2022-06-08T02:20:30.503' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (643, -1, 1147, N'Template', CAST(N'2022-06-08T02:21:31.837' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (644, -1, 1074, N'Document', CAST(N'2022-06-08T02:21:51.693' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (645, -1, 1074, N'Document', CAST(N'2022-06-08T02:22:06.333' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (646, -1, 1074, N'Document', CAST(N'2022-06-08T02:22:08.163' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (647, -1, 1147, N'Template', CAST(N'2022-06-08T02:24:27.167' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (648, -1, 1147, N'Template', CAST(N'2022-06-08T02:24:29.503' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (649, -1, 1147, N'Template', CAST(N'2022-06-08T02:24:35.863' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (650, -1, 1147, N'Template', CAST(N'2022-06-08T02:25:58.793' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (651, -1, 1147, N'Template', CAST(N'2022-06-08T02:26:46.027' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (652, -1, 1147, N'Template', CAST(N'2022-06-08T02:26:53.913' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (653, -1, 1073, N'DocumentType', CAST(N'2022-06-08T02:27:55.890' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (654, -1, 1074, N'Document', CAST(N'2022-06-08T02:28:14.373' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (655, -1, 1073, N'DocumentType', CAST(N'2022-06-08T02:33:17.393' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (656, -1, 1073, N'DocumentType', CAST(N'2022-06-08T02:34:12.780' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (657, -1, 1074, N'Document', CAST(N'2022-06-08T02:34:51.923' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (658, -1, 1147, N'Template', CAST(N'2022-06-08T02:35:26.023' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (659, -1, 1074, N'Document', CAST(N'2022-06-08T02:41:35.773' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (660, -1, 1074, N'Document', CAST(N'2022-06-08T02:42:30.773' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (661, -1, 1077, N'Template', CAST(N'2022-06-08T02:44:19.163' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (662, -1, 1077, N'Template', CAST(N'2022-06-08T02:44:45.960' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (663, -1, 1077, N'Template', CAST(N'2022-06-08T02:45:20.973' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (664, -1, 1078, N'DocumentType', CAST(N'2022-06-08T02:48:06.940' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (665, -1, 1078, N'DocumentType', CAST(N'2022-06-08T02:49:53.760' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (666, -1, 1079, N'Document', CAST(N'2022-06-08T02:51:30.120' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (667, -1, 1079, N'Document', CAST(N'2022-06-08T02:51:45.820' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (668, -1, 1079, N'Document', CAST(N'2022-06-08T02:53:50.693' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (669, -1, 1077, N'Template', CAST(N'2022-06-08T02:55:19.780' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (670, -1, 1077, N'Template', CAST(N'2022-06-08T02:55:24.863' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (671, -1, 1077, N'Template', CAST(N'2022-06-08T03:05:31.003' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (672, -1, 1077, N'Template', CAST(N'2022-06-08T03:05:34.587' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (673, -1, 1079, N'Document', CAST(N'2022-06-08T03:05:51.560' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (674, -1, 1079, N'Document', CAST(N'2022-06-08T03:09:33.490' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (675, -1, 1079, N'Document', CAST(N'2022-06-08T03:09:33.887' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (676, -1, 1078, N'DocumentType', CAST(N'2022-06-08T03:12:18.103' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (677, -1, 1077, N'Template', CAST(N'2022-06-08T03:14:24.973' AS DateTime), N'Save', NULL, NULL)
SET IDENTITY_INSERT [dbo].[umbracoLog] OFF
GO
SET IDENTITY_INSERT [dbo].[umbracoLogViewerQuery] ON 

INSERT [dbo].[umbracoLogViewerQuery] ([id], [name], [query]) VALUES (1, N'Find all logs where the Level is NOT Verbose and NOT Debug', N'Not(@Level=''Verbose'') and Not(@Level=''Debug'')')
INSERT [dbo].[umbracoLogViewerQuery] ([id], [name], [query]) VALUES (2, N'Find all logs that has an exception property (Warning, Error & Fatal with Exceptions)', N'Has(@Exception)')
INSERT [dbo].[umbracoLogViewerQuery] ([id], [name], [query]) VALUES (3, N'Find all logs that have the property ''Duration''', N'Has(Duration)')
INSERT [dbo].[umbracoLogViewerQuery] ([id], [name], [query]) VALUES (4, N'Find all logs that have the property ''Duration'' and the duration is greater than 1000ms', N'Has(Duration) and Duration > 1000')
INSERT [dbo].[umbracoLogViewerQuery] ([id], [name], [query]) VALUES (5, N'Find all logs that are from the namespace ''Umbraco.Core''', N'StartsWith(SourceContext, ''Umbraco.Core'')')
INSERT [dbo].[umbracoLogViewerQuery] ([id], [name], [query]) VALUES (6, N'Find all logs that use a specific log message template', N'@MessageTemplate = ''[Timing {TimingId}] {EndMessage} ({TimingDuration}ms)''')
INSERT [dbo].[umbracoLogViewerQuery] ([id], [name], [query]) VALUES (7, N'Find logs where one of the items in the SortedComponentTypes property array is equal to', N'SortedComponentTypes[?] = ''Umbraco.Web.Search.ExamineComponent''')
INSERT [dbo].[umbracoLogViewerQuery] ([id], [name], [query]) VALUES (8, N'Find logs where one of the items in the SortedComponentTypes property array contains', N'Contains(SortedComponentTypes[?], ''DatabaseServer'')')
INSERT [dbo].[umbracoLogViewerQuery] ([id], [name], [query]) VALUES (9, N'Find all logs that the message has localhost in it with SQL like', N'@Message like ''%localhost%''')
INSERT [dbo].[umbracoLogViewerQuery] ([id], [name], [query]) VALUES (10, N'Find all logs that the message that starts with ''end'' in it with SQL like', N'@Message like ''end%''')
SET IDENTITY_INSERT [dbo].[umbracoLogViewerQuery] OFF
GO
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (100, N'/media/l31nt0n3/cover.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (101, N'/media/bstg4ebl/loader.gif')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (102, N'/media/mlngspy2/logo.png')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (103, N'/media/l3ea55k2/logo2.png')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (104, N'/media/hfidvinx/logo3.png')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (105, N'/media/kz2nupw3/logo4.png')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (106, N'/media/janfcdi2/whitesquare.png')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (107, NULL)
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (108, N'/media/wwodofnk/1.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (109, N'/media/4zul1sdj/2.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (110, N'/media/znplt0n2/3.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (111, N'/media/tfmosqsj/recent1.png')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (112, N'/media/aaijbx0o/recent2.png')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (113, N'/media/fprfb0ae/recent3.png')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (114, NULL)
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (115, N'/media/miadfixp/doc1.png')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (116, NULL)
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (117, N'/media/qk3jpwvz/flag1.png')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (118, N'/media/4uflz0bm/flag2.png')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (119, N'/media/togpxhgv/flag3.png')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (120, N'/media/gvvcmuhj/flag4.png')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (121, NULL)
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (122, N'/media/dfgpucqb/1.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (123, N'/media/mmdjh2lr/10.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (124, N'/media/y0igswsw/2.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (125, N'/media/xbpezjxm/3.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (126, N'/media/jaeamcfo/4.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (127, N'/media/3ddnkqrj/5.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (128, N'/media/zkkoxlss/6.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (129, N'/media/0dufokqb/7.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (130, N'/media/tc4pycul/8.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (131, N'/media/gnup1tii/9.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (132, NULL)
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (133, N'/media/giipo1av/new1.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (134, N'/media/pdabbo40/new2.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (135, N'/media/3off1llw/new3.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (136, N'/media/yl2gq3vr/replyindicator.png')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (137, NULL)
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (138, N'/media/otypu3y4/project1.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (139, N'/media/vpal3fgg/project2.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (140, N'/media/hzvjvjwo/project3.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (141, N'/media/kl3fduc5/project4.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (142, N'/media/avzbbzxb/project5.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (143, N'/media/m5vpccft/project6.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (144, N'/media/n2slwj44/project7.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (145, NULL)
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (146, N'/media/su3loh4k/avatar.png')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (147, N'/media/tx1iqghc/ico1.png')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (148, N'/media/st1hvbqs/ico2.png')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (149, N'/media/0dtpmgam/ico3.png')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (150, N'/media/d05gc1ut/man.png')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (151, N'/media/i4xgthci/photo.png')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (152, N'/media/m4fgbyiw/slide1.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (153, N'/media/q10peich/slide2.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (154, N'/media/4lddvvsb/slide3.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (155, NULL)
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (156, N'/media/0uzhkuvh/arrow.png')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (157, N'/media/3hzmfuck/background.png')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (158, N'/media/3hqnhacp/test1.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (159, N'/media/xr2mhhsk/test2.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (160, NULL)
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (161, N'/media/2vnlhgbr/about-us.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (162, N'/media/4weoyues/mem1.png')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (163, N'/media/o2vjbiqq/mem2.png')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (164, N'/media/pmnfo5yt/mem3.png')
GO
SET IDENTITY_INSERT [dbo].[umbracoNode] ON 

INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-103, N'215cb418-2153-4429-9aef-8c0f0041191b', -1, 1, N'-1,-103', 38, 0, -1, N'Upload Vector Graphics', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-06-03T14:58:27.973' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-102, N'bc1e266c-dac4-4164-bf08-8a1ec6a7143d', -1, 1, N'-1,-102', 37, 0, -1, N'Upload Article', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-06-03T14:58:27.973' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-101, N'8f430dd6-4e96-447e-9dc0-cb552c8cd1f3', -1, 1, N'-1,-101', 36, 0, -1, N'Upload Audio', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-06-03T14:58:27.970' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-100, N'70575fe7-9812-4396-bbe1-c81a76db71b5', -1, 1, N'-1,-100', 35, 0, -1, N'Upload Video', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-06-03T14:58:27.970' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-99, N'8f1ef1e1-9de4-40d3-a072-6673f631ca64', -1, 1, N'-1,-99', 39, 0, -1, N'Label (decimal)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-06-03T14:58:27.970' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-98, N'a97cec69-9b71-4c30-8b12-ec398860d7e8', -1, 1, N'-1,-98', 38, 0, -1, N'Label (time)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-06-03T14:58:27.970' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-97, N'aa2c52a0-ce87-4e65-a47c-7df09358585d', -1, 1, N'-1,-97', 2, 0, -1, N'List View - Members', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-06-03T14:58:27.977' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-96, N'3a0156c4-3b8c-4803-bdc1-6871faa83fff', -1, 1, N'-1,-96', 2, 0, -1, N'List View - Media', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-06-03T14:58:27.973' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-95, N'c0808dd3-8133-4e4b-8ce8-e2bea84a96a4', -1, 1, N'-1,-95', 2, 0, -1, N'List View - Content', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-06-03T14:58:27.973' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-94, N'0e9794eb-f9b5-4f20-a788-93acd233a7e4', -1, 1, N'-1,-94', 37, 0, -1, N'Label (datetime)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-06-03T14:58:27.970' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-93, N'930861bf-e262-4ead-a704-f99453565708', -1, 1, N'-1,-93', 36, 0, -1, N'Label (bigint)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-06-03T14:58:27.970' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-92, N'f0bc4bfb-b499-40d6-ba86-058885a5178c', -1, 1, N'-1,-92', 35, 0, -1, N'Label (string)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-06-03T14:58:27.967' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-91, N'8e7f995c-bd81-4627-9932-c40e568ec788', -1, 1, N'-1,-91', 36, 0, -1, N'Label (integer)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-06-03T14:58:27.970' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-90, N'84c6b441-31df-4ffe-b67e-67d5bc3ae65a', -1, 1, N'-1,-90', 34, 0, -1, N'Upload File', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-06-03T14:58:27.970' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-89, N'c6bac0dd-4ab9-45b1-8e30-e4b619ee5da3', -1, 1, N'-1,-89', 33, 0, -1, N'Textarea', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-06-03T14:58:27.973' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-88, N'0cc0eba1-9960-42c9-bf9b-60e150b429ae', -1, 1, N'-1,-88', 32, 0, -1, N'Textstring', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-06-03T14:58:27.973' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-87, N'ca90c950-0aff-4e72-b976-a30b1ac57dad', -1, 1, N'-1,-87', 4, 0, -1, N'Richtext editor', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-06-03T14:58:27.973' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-51, N'2e6d3631-066e-44b8-aec4-96f09099b2b5', -1, 1, N'-1,-51', 2, 0, -1, N'Numeric', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-06-03T14:58:27.973' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-49, N'92897bc6-a5f3-4ffe-ae27-f2e7e33dda49', -1, 1, N'-1,-49', 2, 0, -1, N'True/false', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-06-03T14:58:27.973' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-43, N'fbaf13a8-4036-41f2-93a3-974f678c312a', -1, 1, N'-1,-43', 2, 0, -1, N'Checkbox list', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-06-03T14:58:27.973' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-42, N'f38f0ac7-1d27-439c-9f3f-089cd8825a53', -1, 1, N'-1,-42', 2, 0, -1, N'Dropdown multiple', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-06-03T14:58:27.973' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-41, N'5046194e-4237-453c-a547-15db3a07c4e1', -1, 1, N'-1,-41', 2, 0, -1, N'Date Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-06-03T14:58:27.973' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-40, N'bb5f57c9-ce2b-4bb9-b697-4caca783a805', -1, 1, N'-1,-40', 2, 0, -1, N'Radiobox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-06-03T14:58:27.973' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-39, N'0b6a45e7-44ba-430d-9da5-4e46060b9e03', -1, 1, N'-1,-39', 2, 0, -1, N'Dropdown', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-06-03T14:58:27.973' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-37, N'0225af17-b302-49cb-9176-b9f35cab9c17', -1, 1, N'-1,-37', 2, 0, -1, N'Approved Color', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-06-03T14:58:27.973' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-36, N'e4d66c0f-b935-4200-81f0-025f7256b89a', -1, 1, N'-1,-36', 2, 0, -1, N'Date Picker with time', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-06-03T14:58:27.973' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-21, N'bf7c7cbc-952f-4518-97a2-69e9c7b33842', -1, 0, N'-1,-21', 0, 0, -1, N'Recycle Bin', N'cf3d8e34-1c1c-41e9-ae56-878b57b32113', CAST(N'2022-06-03T14:58:27.967' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-20, N'0f582a79-1e41-4cf0-bfa0-76340651891a', -1, 0, N'-1,-20', 0, 0, -1, N'Recycle Bin', N'01bb7ff2-24dc-4c0c-95a2-c24ef72bbac8', CAST(N'2022-06-03T14:58:27.967' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-1, N'916724a5-173d-4619-b97e-b9de133dd6f5', -1, 0, N'-1', 0, 0, -1, N'SYSTEM DATA: umbraco master root', N'ea7d8624-4cfe-4578-a871-24aa946bf34d', CAST(N'2022-06-03T14:58:27.960' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1031, N'f38bd2d7-65d0-48e6-95dc-87ce06ec2d3d', -1, 1, N'-1,1031', 2, 0, -1, N'Folder', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(N'2022-06-03T14:58:27.987' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1032, N'cc07b313-0843-4aa8-bbda-871c8da728c8', -1, 1, N'-1,1032', 2, 0, -1, N'Image', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(N'2022-06-03T14:58:27.987' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1033, N'4c52d8ab-54e6-40cd-999c-7a5f24903e4d', -1, 1, N'-1,1033', 2, 0, -1, N'File', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(N'2022-06-03T14:58:27.987' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1034, N'f6c515bb-653c-4bdc-821c-987729ebe327', -1, 1, N'-1,1034', 2, 0, -1, N'Video', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(N'2022-06-03T14:58:27.987' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1035, N'a5ddeee0-8fd8-4cee-a658-6f1fcdb00de3', -1, 1, N'-1,1035', 2, 0, -1, N'Audio', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(N'2022-06-03T14:58:27.987' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1036, N'a43e3414-9599-4230-a7d3-943a21b20122', -1, 1, N'-1,1036', 2, 0, -1, N'Article', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(N'2022-06-03T14:58:27.987' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1037, N'c4b1efcf-a9d5-41c4-9621-e9d273b52a9c', -1, 1, N'-1,1037', 2, 0, -1, N'Vector Graphics (SVG)', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(N'2022-06-03T14:58:27.987' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1041, N'b6b73142-b9c1-4bf8-a16d-e1c23320b549', -1, 1, N'-1,1041', 2, 0, -1, N'Tags', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-06-03T14:58:27.977' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1043, N'1df9f033-e6d4-451f-b8d2-e0cbc50a836f', -1, 1, N'-1,1043', 2, 0, -1, N'Image Cropper', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-06-03T14:58:27.983' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1044, N'd59be02f-1df9-4228-aa1e-01917d806cda', -1, 1, N'-1,1044', 0, 0, -1, N'Member', N'9b5416fb-e72f-45a9-a07b-5a9a2709ce43', CAST(N'2022-06-03T14:58:27.987' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1046, N'fd1e0da5-5606-4862-b679-5d0cf3a52a59', -1, 1, N'-1,1046', 2, 0, -1, N'Content Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-06-03T14:58:27.983' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1047, N'1ea2e01f-ebd8-4ce1-8d71-6b1149e63548', -1, 1, N'-1,1047', 2, 0, -1, N'Member Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-06-03T14:58:27.983' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1048, N'135d60e0-64d9-49ed-ab08-893c9ba44ae5', -1, 1, N'-1,1048', 2, 0, -1, N'Media Picker (legacy)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-06-03T14:58:27.983' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1049, N'9dbbcbbb-2327-434a-b355-af1b84e5010a', -1, 1, N'-1,1049', 2, 0, -1, N'Multiple Media Picker (legacy)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-06-03T14:58:27.983' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1050, N'b4e3535a-1753-47e2-8568-602cf8cfee6f', -1, 1, N'-1,1050', 2, 0, -1, N'Multi URL Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-06-03T14:58:27.983' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1051, N'4309a3ea-0d78-4329-a06c-c80b036af19a', -1, 1, N'-1,1051', 2, 0, -1, N'Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-06-03T14:58:27.983' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1052, N'1b661f40-2242-4b44-b9cb-3990ee2b13c0', -1, 1, N'-1,1052', 2, 0, -1, N'Multiple Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-06-03T14:58:27.983' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1053, N'ad9f0cf2-bda2-45d5-9ea1-a63cfc873fd3', -1, 1, N'-1,1053', 2, 0, -1, N'Image Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-06-03T14:58:27.983' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1054, N'0e63d883-b62b-4799-88c3-157f82e83ecc', -1, 1, N'-1,1054', 2, 0, -1, N'Multiple Image Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-06-03T14:58:27.983' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1073, N'31d8e490-1b86-4131-a409-e72103b54fe8', -1, 1, N'-1,1073', 0, 0, -1, N'Home', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2022-06-03T16:20:30.173' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1074, N'd9322b14-c414-4562-902e-428e7bc294e6', -1, 1, N'-1,1074', 0, 0, -1, N'Home', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2022-06-03T16:20:57.773' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1075, N'cb11173b-b01e-4609-b0b3-deb259a285e2', -1, 1, N'-1,1075', 0, 0, NULL, N'Master', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2022-06-03T16:24:39.933' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1077, N'aef22559-4330-4cd1-b7eb-1f4e5b63a092', 1075, 1, N'-1,1075,1077', 0, 0, NULL, N'AboutsUs', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2022-06-03T17:14:09.097' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1078, N'6a4f9823-a760-497c-83d7-10a3b445200c', -1, 1, N'-1,1078', 1, 0, -1, N'AboutsUs', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2022-06-03T17:14:09.147' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1079, N'c976cff5-9336-42be-9fed-92055853e24c', 1074, 2, N'-1,1074,1079', 4, 0, -1, N'AboutUs', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2022-06-03T17:15:19.940' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1080, N'16835696-58e4-4f49-b87a-2e0ac0f88983', 1075, 1, N'-1,1075,1080', 0, 0, NULL, N'Project', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2022-06-03T17:25:39.493' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1081, N'55c252bd-8edb-4b65-b4d8-1f4001164507', -1, 1, N'-1,1081', 2, 0, -1, N'Project', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2022-06-03T17:25:39.513' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1082, N'257d1063-d1d1-42fe-b66a-b00310553a35', 1075, 1, N'-1,1075,1082', 0, 0, NULL, N'Service', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2022-06-03T17:27:03.630' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1083, N'57662f6b-d83e-47f9-9f50-b131d3ea0b94', -1, 1, N'-1,1083', 3, 0, -1, N'Service', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2022-06-03T17:27:03.657' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1084, N'6596e922-2cdb-4516-a443-a63ce5f3821b', 1075, 1, N'-1,1075,1084', 0, 0, NULL, N'News', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2022-06-03T17:28:45.263' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1085, N'4d0b9f63-d056-4aac-a252-32854c50895f', -1, 1, N'-1,1085', 4, 0, -1, N'News', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2022-06-03T17:28:45.283' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1086, N'd1085647-06f7-4c60-af0b-496724d1e1c9', 1075, 1, N'-1,1075,1086', 0, 0, NULL, N'Contact', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2022-06-03T17:30:35.170' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1087, N'f5096ba3-94fc-4442-8ce2-8357fdda033c', -1, 1, N'-1,1087', 5, 0, -1, N'Contact', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2022-06-03T17:30:35.190' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1088, N'f638b90b-1f7a-45ed-98b7-87a5ea867cae', 1074, 2, N'-1,1074,1088', 0, 0, -1, N'Project', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2022-06-03T17:32:11.287' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1089, N'578c1435-fc9a-42c8-8814-c9809bc1d224', 1074, 2, N'-1,1074,1089', 1, 0, -1, N'Service', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2022-06-03T17:32:26.573' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1090, N'3d852f16-75ed-42c5-a399-8abc1107fbbe', 1074, 2, N'-1,1074,1090', 2, 0, -1, N'News', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2022-06-03T17:32:33.630' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1091, N'b4ad3a9f-a0c4-4192-9e42-8117ebb30e2f', 1074, 2, N'-1,1074,1091', 3, 0, -1, N'Contact', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2022-06-03T17:32:40.420' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1143, N'e9030e3f-7608-4505-bfff-cb5676450923', -1, 1, N'-1,1143', 37, 0, -1, N'Home - Footer - Slider', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-06-03T18:03:44.027' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1144, N'4ae624bc-f594-4307-aba8-dcc67296367b', -1, 1, N'-1,1144', 38, 0, -1, N'Home - HomePageFooter - Textarea', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-06-03T18:13:00.273' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1147, N'32827b9c-abf5-4577-9f90-2307f79a568e', 1075, 1, N'-1,1075,1147', 0, 0, NULL, N'Index', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2022-06-03T18:23:43.897' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1148, N'b4e5b481-0c30-470c-8b37-b9e954fc7e13', -1, 1, N'-1,1148', 6, 0, -1, N'Index', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2022-06-03T18:23:43.957' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1149, N'7371f363-09c2-4657-bdbf-6fa758cd0e61', 1074, 2, N'-1,1074,1149', 5, 0, -1, N'Index', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2022-06-03T18:25:48.240' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1150, N'f197135a-070b-4cc8-8104-723f3c4b683f', -1, 1, N'-1,1150', 39, 0, -1, N'Home - SliderText3 - Markdown editor', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-06-07T22:08:56.483' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1151, N'e9c97759-4bbd-4ef1-8c47-f2ea722ebd1c', -1, 1, N'-1,1151', 0, 0, -1, N'Cover', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:03.710' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1152, N'106fa60a-ac2b-4317-a4a4-d3ccb4211551', -1, 1, N'-1,1152', 1, 0, -1, N'Loader', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:03.863' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1153, N'3f69da64-041c-4c25-93d4-407323965b28', -1, 1, N'-1,1153', 2, 0, -1, N'Logo', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:03.913' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1154, N'fd0f4859-475c-46ce-aeb1-098583a5ad13', -1, 1, N'-1,1154', 3, 0, -1, N'Logo2', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:03.953' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1155, N'a12a513f-97b7-4f57-b344-0cab890da23a', -1, 1, N'-1,1155', 4, 0, -1, N'Logo3', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:04.013' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1156, N'3eda7850-2ddd-4370-b941-08da0a1bbe31', -1, 1, N'-1,1156', 5, 0, -1, N'Logo4', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:04.047' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1157, N'0d511b4e-7f1c-4205-842c-378c8e76fb09', -1, 1, N'-1,1157', 6, 0, -1, N'Whitesquare', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:04.090' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1158, N'55dd2784-af81-4972-985f-58dfb7d5654e', -1, 1, N'-1,1158', 7, 0, -1, N'aside', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:04.127' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1159, N'15279db3-0eaa-4d4e-9235-9f6ec1f52b06', 1158, 2, N'-1,1158,1159', 0, 0, -1, N'1', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:04.150' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1160, N'c8bd69f0-7569-48c6-8319-d9aed7777735', 1158, 2, N'-1,1158,1160', 1, 0, -1, N'2', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:04.200' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1161, N'e9b95fcd-ebbc-4d8e-9f8e-58c1d0617a6d', 1158, 2, N'-1,1158,1161', 2, 0, -1, N'3', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:04.243' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1162, N'42e9589f-c949-4dfd-a35f-75ae3e154aeb', 1158, 2, N'-1,1158,1162', 3, 0, -1, N'Recent1', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:04.297' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1163, N'df901006-914e-49c4-a8a8-c28c39a9033e', 1158, 2, N'-1,1158,1163', 4, 0, -1, N'Recent2', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:04.337' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1164, N'e850e32d-f204-4f11-a008-c40a087a3cd3', 1158, 2, N'-1,1158,1164', 5, 0, -1, N'Recent3', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:04.390' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1165, N'accb17a9-4102-436c-94ac-c5cf51efffb1', -1, 1, N'-1,1165', 8, 0, -1, N'docs', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:04.410' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1166, N'a2320164-a6ef-4db5-b5a7-0abbeb9f0f82', 1165, 2, N'-1,1165,1166', 0, 0, -1, N'Doc1', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:04.433' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1167, N'3613281f-2ebc-497b-ad6d-15f448a0c3e3', -1, 1, N'-1,1167', 9, 0, -1, N'flags', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:04.457' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1168, N'da87bb84-42b9-4a93-b228-ba68534908ee', 1167, 2, N'-1,1167,1168', 0, 0, -1, N'Flag1', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:04.477' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1169, N'e8ac0bf3-ac2c-442c-b85e-2e1b7854b909', 1167, 2, N'-1,1167,1169', 1, 0, -1, N'Flag2', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:04.520' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1170, N'9ceb8d9d-2cd5-4ca6-8c72-701247ae3d72', 1167, 2, N'-1,1167,1170', 2, 0, -1, N'Flag3', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:04.560' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1171, N'50266a33-8ae9-4c59-850c-bbf99d30c617', 1167, 2, N'-1,1167,1171', 3, 0, -1, N'Flag4', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:04.600' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1172, N'e4ba1c0c-ba67-4562-8f9c-ebdd47603068', -1, 1, N'-1,1172', 10, 0, -1, N'gallery', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:04.670' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1173, N'0afa4d1f-c201-44de-ab3e-976cb44be58e', 1172, 2, N'-1,1172,1173', 0, 0, -1, N'1', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:04.697' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1174, N'f1930665-4071-45d2-b02d-d4a6924ff429', 1172, 2, N'-1,1172,1174', 1, 0, -1, N'10', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:04.757' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1175, N'5a6990c0-1556-4580-98d7-f701688e07aa', 1172, 2, N'-1,1172,1175', 2, 0, -1, N'2', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:04.957' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1176, N'a64c5ebe-edec-4464-806b-5326c70b3615', 1172, 2, N'-1,1172,1176', 3, 0, -1, N'3', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:05.033' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1177, N'0806084e-6eae-4d14-afa5-4a71de37050a', 1172, 2, N'-1,1172,1177', 4, 0, -1, N'4', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:05.110' AS DateTime))
GO
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1178, N'42c5c7ee-e629-41d4-8cdd-3b04f77617cd', 1172, 2, N'-1,1172,1178', 5, 0, -1, N'5', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:05.173' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1179, N'aeeb94cc-b252-4800-b261-3a6ceb3df3e8', 1172, 2, N'-1,1172,1179', 6, 0, -1, N'6', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:05.227' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1180, N'2a57e8d6-d901-4bd9-b0a7-fcd341c4a0ee', 1172, 2, N'-1,1172,1180', 7, 0, -1, N'7', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:05.297' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1181, N'0afcbc9e-9a8b-4aac-b980-5b66c29bee75', 1172, 2, N'-1,1172,1181', 8, 0, -1, N'8', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:05.463' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1182, N'cded6935-3008-4e32-8f21-de292fb05235', 1172, 2, N'-1,1172,1182', 9, 0, -1, N'9', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:05.523' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1183, N'16bfe9ef-fb9f-44a6-a044-1b9101bf039c', -1, 1, N'-1,1183', 11, 0, -1, N'news', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:05.547' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1184, N'6ce71134-b115-4a85-b95d-0c888aa72a55', 1183, 2, N'-1,1183,1184', 0, 0, -1, N'New1', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:05.597' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1185, N'bb00c17e-f1da-4fb4-b97c-1e111f402021', 1183, 2, N'-1,1183,1185', 1, 0, -1, N'New2', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:05.647' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1186, N'ad5d8bed-b776-4959-be2d-dd873845d132', 1183, 2, N'-1,1183,1186', 2, 0, -1, N'New3', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:05.707' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1187, N'7668f8c4-73b1-40d6-adaf-7689ea10d722', 1183, 2, N'-1,1183,1187', 3, 0, -1, N'Replyindicator', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:05.743' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1188, N'7602f85b-acf8-4d66-85f8-c73b8b2e8178', -1, 1, N'-1,1188', 12, 0, -1, N'projects', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:05.793' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1189, N'77eaf172-3e1e-4155-9a2f-414ee4bd1d11', 1188, 2, N'-1,1188,1189', 0, 0, -1, N'Project1', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:05.820' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1190, N'94bec0ad-70c6-4d3d-bde5-e1ba85c55045', 1188, 2, N'-1,1188,1190', 1, 0, -1, N'Project2', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:05.867' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1191, N'a69a6b38-22ce-4041-9c4a-0ea209815a2f', 1188, 2, N'-1,1188,1191', 2, 0, -1, N'Project3', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:05.917' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1192, N'd051fa54-8b5f-403a-b3ae-32d3821b5702', 1188, 2, N'-1,1188,1192', 3, 0, -1, N'Project4', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:05.967' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1193, N'e6007303-cce1-4f8e-8b21-11cfae11cc8b', 1188, 2, N'-1,1188,1193', 4, 0, -1, N'Project5', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:06.017' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1194, N'08f1ea61-cfb3-4778-bf36-936022f83cd2', 1188, 2, N'-1,1188,1194', 5, 0, -1, N'Project6', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:06.060' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1195, N'27ab2569-0ade-4011-8248-f086664a42cb', 1188, 2, N'-1,1188,1195', 6, 0, -1, N'Project7', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:06.173' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1196, N'35955b95-d9db-40d6-9b8e-08b09be40bb9', -1, 1, N'-1,1196', 13, 0, -1, N'sliders', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:06.203' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1197, N'1fa73b93-9dca-4ea5-9d96-bbf9a0d36e02', 1196, 2, N'-1,1196,1197', 0, 0, -1, N'Avatar', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:06.227' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1198, N'1888f69b-d3e2-4cc8-8a09-5ef741a8ff12', 1196, 2, N'-1,1196,1198', 1, 0, -1, N'Ico1', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:06.260' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1199, N'866af792-c212-438c-9475-108ebda3aa2d', 1196, 2, N'-1,1196,1199', 2, 0, -1, N'Ico2', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:06.297' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1200, N'18e6e7d6-230c-407b-91d7-2ad217daeabe', 1196, 2, N'-1,1196,1200', 3, 0, -1, N'Ico3', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:06.337' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1201, N'6e61be18-0093-4e05-9a9f-8efbcc809d98', 1196, 2, N'-1,1196,1201', 4, 0, -1, N'Man', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:06.460' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1202, N'9c69ae41-1548-4035-b236-a45b732d0dce', 1196, 2, N'-1,1196,1202', 5, 0, -1, N'Photo', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:06.553' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1203, N'e1608a61-9e16-4a2d-8c41-c2d022f92019', 1196, 2, N'-1,1196,1203', 6, 0, -1, N'Slide1', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:06.613' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1204, N'20e2f580-0b47-4117-af55-82625901da3a', 1196, 2, N'-1,1196,1204', 7, 0, -1, N'Slide2', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:06.700' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1205, N'd63ac7f4-bf41-4a35-a575-781d1bb54ef9', 1196, 2, N'-1,1196,1205', 8, 0, -1, N'Slide3', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:06.757' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1206, N'681305c0-6c12-435e-bda6-edde85cd19e6', -1, 1, N'-1,1206', 14, 0, -1, N'testimonial', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:06.783' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1207, N'527533d3-a8a7-4f5d-b3de-cf0f243d0243', 1206, 2, N'-1,1206,1207', 0, 0, -1, N'Arrow', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:06.807' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1208, N'd0c2f2ef-b44a-4704-b724-6489ddd9c6e0', 1206, 2, N'-1,1206,1208', 1, 0, -1, N'Background', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:06.860' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1209, N'80c3e1ef-964f-421a-b80d-33e38d50a80c', 1206, 2, N'-1,1206,1209', 2, 0, -1, N'Test1', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:06.903' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1210, N'9ec378ba-b54a-4c49-b7f1-6fd70016639e', 1206, 2, N'-1,1206,1210', 3, 0, -1, N'Test2', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:06.950' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1211, N'f4ba36a4-d6f1-476b-a210-ba1856cdacec', -1, 1, N'-1,1211', 15, 0, -1, N'workers', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:06.983' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1212, N'98a35be3-3631-4e27-bf49-f6ef47a6b7ae', 1211, 2, N'-1,1211,1212', 0, 0, -1, N'About Us', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:07.010' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1213, N'50ec88f3-e892-408f-a734-788c986b73b2', 1211, 2, N'-1,1211,1213', 1, 0, -1, N'Mem1', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:07.060' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1214, N'a2902a71-1410-462e-9028-3ec0007e8a24', 1211, 2, N'-1,1211,1214', 2, 0, -1, N'Mem2', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:07.133' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1215, N'7f571a7d-e213-43c4-bed2-084fd7dc0e84', 1211, 2, N'-1,1211,1215', 3, 0, -1, N'Mem3', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-06-07T22:34:07.180' AS DateTime))
SET IDENTITY_INSERT [dbo].[umbracoNode] OFF
GO
SET IDENTITY_INSERT [dbo].[umbracoPropertyData] ON 

INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (278, 100, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/l31nt0n3/cover.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (279, 100, 7, NULL, NULL, 1900, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (280, 100, 8, NULL, NULL, 300, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (281, 100, 9, NULL, NULL, NULL, NULL, NULL, N'191707', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (282, 100, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (283, 101, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/bstg4ebl/loader.gif"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (284, 101, 7, NULL, NULL, 64, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (285, 101, 8, NULL, NULL, 64, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (286, 101, 9, NULL, NULL, NULL, NULL, NULL, N'32549', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (287, 101, 10, NULL, NULL, NULL, NULL, NULL, N'gif', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (288, 102, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/mlngspy2/logo.png"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (289, 102, 7, NULL, NULL, 64, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (290, 102, 8, NULL, NULL, 64, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (291, 102, 9, NULL, NULL, NULL, NULL, NULL, N'4528', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (292, 102, 10, NULL, NULL, NULL, NULL, NULL, N'png', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (293, 103, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/l3ea55k2/logo2.png"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (294, 103, 7, NULL, NULL, 64, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (295, 103, 8, NULL, NULL, 64, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (296, 103, 9, NULL, NULL, NULL, NULL, NULL, N'2583', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (297, 103, 10, NULL, NULL, NULL, NULL, NULL, N'png', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (298, 104, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/hfidvinx/logo3.png"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (299, 104, 7, NULL, NULL, 64, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (300, 104, 8, NULL, NULL, 64, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (301, 104, 9, NULL, NULL, NULL, NULL, NULL, N'1571', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (302, 104, 10, NULL, NULL, NULL, NULL, NULL, N'png', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (303, 105, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/kz2nupw3/logo4.png"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (304, 105, 7, NULL, NULL, 64, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (305, 105, 8, NULL, NULL, 64, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (306, 105, 9, NULL, NULL, NULL, NULL, NULL, N'5097', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (307, 105, 10, NULL, NULL, NULL, NULL, NULL, N'png', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (308, 106, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/janfcdi2/whitesquare.png"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (309, 106, 7, NULL, NULL, 15, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (310, 106, 8, NULL, NULL, 15, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (311, 106, 9, NULL, NULL, NULL, NULL, NULL, N'139', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (312, 106, 10, NULL, NULL, NULL, NULL, NULL, N'png', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (313, 108, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/wwodofnk/1.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (314, 108, 7, NULL, NULL, 50, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (315, 108, 8, NULL, NULL, 50, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (316, 108, 9, NULL, NULL, NULL, NULL, NULL, N'2761', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (317, 108, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (318, 109, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/4zul1sdj/2.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (319, 109, 7, NULL, NULL, 50, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (320, 109, 8, NULL, NULL, 50, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (321, 109, 9, NULL, NULL, NULL, NULL, NULL, N'2666', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (322, 109, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (323, 110, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/znplt0n2/3.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (324, 110, 7, NULL, NULL, 50, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (325, 110, 8, NULL, NULL, 50, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (326, 110, 9, NULL, NULL, NULL, NULL, NULL, N'2093', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (327, 110, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (328, 111, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/tfmosqsj/recent1.png"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (329, 111, 7, NULL, NULL, 50, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (330, 111, 8, NULL, NULL, 50, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (331, 111, 9, NULL, NULL, NULL, NULL, NULL, N'1943', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (332, 111, 10, NULL, NULL, NULL, NULL, NULL, N'png', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (333, 112, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/aaijbx0o/recent2.png"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (334, 112, 7, NULL, NULL, 50, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (335, 112, 8, NULL, NULL, 50, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (336, 112, 9, NULL, NULL, NULL, NULL, NULL, N'2127', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (337, 112, 10, NULL, NULL, NULL, NULL, NULL, N'png', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (338, 113, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/fprfb0ae/recent3.png"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (339, 113, 7, NULL, NULL, 50, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (340, 113, 8, NULL, NULL, 50, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (341, 113, 9, NULL, NULL, NULL, NULL, NULL, N'2158', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (342, 113, 10, NULL, NULL, NULL, NULL, NULL, N'png', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (343, 115, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/miadfixp/doc1.png"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (344, 115, 7, NULL, NULL, 128, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (345, 115, 8, NULL, NULL, 128, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (346, 115, 9, NULL, NULL, NULL, NULL, NULL, N'1448', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (347, 115, 10, NULL, NULL, NULL, NULL, NULL, N'png', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (348, 117, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/qk3jpwvz/flag1.png"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (349, 117, 7, NULL, NULL, 20, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (350, 117, 8, NULL, NULL, 13, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (351, 117, 9, NULL, NULL, NULL, NULL, NULL, N'816', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (352, 117, 10, NULL, NULL, NULL, NULL, NULL, N'png', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (353, 118, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/4uflz0bm/flag2.png"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (354, 118, 7, NULL, NULL, 20, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (355, 118, 8, NULL, NULL, 13, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (356, 118, 9, NULL, NULL, NULL, NULL, NULL, N'761', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (357, 118, 10, NULL, NULL, NULL, NULL, NULL, N'png', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (358, 119, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/togpxhgv/flag3.png"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (359, 119, 7, NULL, NULL, 20, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (360, 119, 8, NULL, NULL, 13, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (361, 119, 9, NULL, NULL, NULL, NULL, NULL, N'803', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (362, 119, 10, NULL, NULL, NULL, NULL, NULL, N'png', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (363, 120, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/gvvcmuhj/flag4.png"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (364, 120, 7, NULL, NULL, 20, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (365, 120, 8, NULL, NULL, 13, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (366, 120, 9, NULL, NULL, NULL, NULL, NULL, N'854', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (367, 120, 10, NULL, NULL, NULL, NULL, NULL, N'png', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (368, 122, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/dfgpucqb/1.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (369, 122, 7, NULL, NULL, 2560, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (370, 122, 8, NULL, NULL, 2426, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (371, 122, 9, NULL, NULL, NULL, NULL, NULL, N'2200392', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (372, 122, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (373, 123, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/mmdjh2lr/10.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (374, 123, 7, NULL, NULL, 1987, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (375, 123, 8, NULL, NULL, 1544, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (376, 123, 9, NULL, NULL, NULL, NULL, NULL, N'770348', NULL)
GO
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (377, 123, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (378, 124, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/y0igswsw/2.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (379, 124, 7, NULL, NULL, 2560, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (380, 124, 8, NULL, NULL, 1920, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (381, 124, 9, NULL, NULL, NULL, NULL, NULL, N'2023615', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (382, 124, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (383, 125, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/xbpezjxm/3.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (384, 125, 7, NULL, NULL, 2560, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (385, 125, 8, NULL, NULL, 1920, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (386, 125, 9, NULL, NULL, NULL, NULL, NULL, N'2077916', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (387, 125, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (388, 126, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/jaeamcfo/4.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (389, 126, 7, NULL, NULL, 2560, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (390, 126, 8, NULL, NULL, 1920, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (391, 126, 9, NULL, NULL, NULL, NULL, NULL, N'2272005', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (392, 126, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (393, 127, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/3ddnkqrj/5.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (394, 127, 7, NULL, NULL, 1620, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (395, 127, 8, NULL, NULL, 2160, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (396, 127, 9, NULL, NULL, NULL, NULL, NULL, N'1406191', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (397, 127, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (398, 128, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/zkkoxlss/6.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (399, 128, 7, NULL, NULL, 810, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (400, 128, 8, NULL, NULL, 1080, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (401, 128, 9, NULL, NULL, NULL, NULL, NULL, N'503033', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (402, 128, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (403, 129, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/0dufokqb/7.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (404, 129, 7, NULL, NULL, 2560, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (405, 129, 8, NULL, NULL, 1920, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (406, 129, 9, NULL, NULL, NULL, NULL, NULL, N'1301972', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (407, 129, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (408, 130, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/tc4pycul/8.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (409, 130, 7, NULL, NULL, 2560, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (410, 130, 8, NULL, NULL, 1920, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (411, 130, 9, NULL, NULL, NULL, NULL, NULL, N'1724984', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (412, 130, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (413, 131, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/gnup1tii/9.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (414, 131, 7, NULL, NULL, 810, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (415, 131, 8, NULL, NULL, 1080, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (416, 131, 9, NULL, NULL, NULL, NULL, NULL, N'503033', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (417, 131, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (418, 133, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/giipo1av/new1.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (419, 133, 7, NULL, NULL, 300, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (420, 133, 8, NULL, NULL, 320, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (421, 133, 9, NULL, NULL, NULL, NULL, NULL, N'28969', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (422, 133, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (423, 134, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/pdabbo40/new2.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (424, 134, 7, NULL, NULL, 1091, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (425, 134, 8, NULL, NULL, 728, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (426, 134, 9, NULL, NULL, NULL, NULL, NULL, N'139755', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (427, 134, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (428, 135, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/3off1llw/new3.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (429, 135, 7, NULL, NULL, 500, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (430, 135, 8, NULL, NULL, 333, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (431, 135, 9, NULL, NULL, NULL, NULL, NULL, N'74747', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (432, 135, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (433, 136, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/yl2gq3vr/replyindicator.png"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (434, 136, 7, NULL, NULL, 80, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (435, 136, 8, NULL, NULL, 80, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (436, 136, 9, NULL, NULL, NULL, NULL, NULL, N'163', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (437, 136, 10, NULL, NULL, NULL, NULL, NULL, N'png', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (438, 138, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/otypu3y4/project1.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (439, 138, 7, NULL, NULL, 800, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (440, 138, 8, NULL, NULL, 600, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (441, 138, 9, NULL, NULL, NULL, NULL, NULL, N'205797', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (442, 138, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (443, 139, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/vpal3fgg/project2.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (444, 139, 7, NULL, NULL, 800, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (445, 139, 8, NULL, NULL, 600, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (446, 139, 9, NULL, NULL, NULL, NULL, NULL, N'158424', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (447, 139, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (448, 140, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/hzvjvjwo/project3.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (449, 140, 7, NULL, NULL, 800, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (450, 140, 8, NULL, NULL, 600, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (451, 140, 9, NULL, NULL, NULL, NULL, NULL, N'173488', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (452, 140, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (453, 141, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/kl3fduc5/project4.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (454, 141, 7, NULL, NULL, 800, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (455, 141, 8, NULL, NULL, 600, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (456, 141, 9, NULL, NULL, NULL, NULL, NULL, N'148944', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (457, 141, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (458, 142, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/avzbbzxb/project5.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (459, 142, 7, NULL, NULL, 800, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (460, 142, 8, NULL, NULL, 600, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (461, 142, 9, NULL, NULL, NULL, NULL, NULL, N'221549', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (462, 142, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (463, 143, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/m5vpccft/project6.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (464, 143, 7, NULL, NULL, 800, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (465, 143, 8, NULL, NULL, 600, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (466, 143, 9, NULL, NULL, NULL, NULL, NULL, N'249099', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (467, 143, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (468, 144, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/n2slwj44/project7.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (469, 144, 7, NULL, NULL, 2560, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (470, 144, 8, NULL, NULL, 1920, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (471, 144, 9, NULL, NULL, NULL, NULL, NULL, N'1758967', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (472, 144, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (473, 146, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/su3loh4k/avatar.png"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (474, 146, 7, NULL, NULL, 80, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (475, 146, 8, NULL, NULL, 85, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (476, 146, 9, NULL, NULL, NULL, NULL, NULL, N'17284', NULL)
GO
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (477, 146, 10, NULL, NULL, NULL, NULL, NULL, N'png', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (478, 147, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/tx1iqghc/ico1.png"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (479, 147, 7, NULL, NULL, 56, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (480, 147, 8, NULL, NULL, 54, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (481, 147, 9, NULL, NULL, NULL, NULL, NULL, N'325', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (482, 147, 10, NULL, NULL, NULL, NULL, NULL, N'png', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (483, 148, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/st1hvbqs/ico2.png"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (484, 148, 7, NULL, NULL, 56, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (485, 148, 8, NULL, NULL, 46, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (486, 148, 9, NULL, NULL, NULL, NULL, NULL, N'459', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (487, 148, 10, NULL, NULL, NULL, NULL, NULL, N'png', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (488, 149, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/0dtpmgam/ico3.png"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (489, 149, 7, NULL, NULL, 56, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (490, 149, 8, NULL, NULL, 46, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (491, 149, 9, NULL, NULL, NULL, NULL, NULL, N'218', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (492, 149, 10, NULL, NULL, NULL, NULL, NULL, N'png', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (493, 150, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/d05gc1ut/man.png"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (494, 150, 7, NULL, NULL, 408, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (495, 150, 8, NULL, NULL, 612, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (496, 150, 9, NULL, NULL, NULL, NULL, NULL, N'238117', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (497, 150, 10, NULL, NULL, NULL, NULL, NULL, N'png', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (498, 151, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/i4xgthci/photo.png"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (499, 151, 7, NULL, NULL, 133, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (500, 151, 8, NULL, NULL, 141, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (501, 151, 9, NULL, NULL, NULL, NULL, NULL, N'44497', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (502, 151, 10, NULL, NULL, NULL, NULL, NULL, N'png', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (503, 152, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/m4fgbyiw/slide1.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (504, 152, 7, NULL, NULL, 1920, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (505, 152, 8, NULL, NULL, 1280, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (506, 152, 9, NULL, NULL, NULL, NULL, NULL, N'938171', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (507, 152, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (508, 153, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/q10peich/slide2.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (509, 153, 7, NULL, NULL, 1999, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (510, 153, 8, NULL, NULL, 1333, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (511, 153, 9, NULL, NULL, NULL, NULL, NULL, N'1568218', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (512, 153, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (513, 154, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/4lddvvsb/slide3.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (514, 154, 7, NULL, NULL, 1920, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (515, 154, 8, NULL, NULL, 1080, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (516, 154, 9, NULL, NULL, NULL, NULL, NULL, N'589034', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (517, 154, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (518, 156, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/0uzhkuvh/arrow.png"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (519, 156, 7, NULL, NULL, 42, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (520, 156, 8, NULL, NULL, 21, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (521, 156, 9, NULL, NULL, NULL, NULL, NULL, N'212', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (522, 156, 10, NULL, NULL, NULL, NULL, NULL, N'png', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (523, 157, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/3hzmfuck/background.png"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (524, 157, 7, NULL, NULL, 625, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (525, 157, 8, NULL, NULL, 399, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (526, 157, 9, NULL, NULL, NULL, NULL, NULL, N'107806', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (527, 157, 10, NULL, NULL, NULL, NULL, NULL, N'png', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (528, 158, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/3hqnhacp/test1.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (529, 158, 7, NULL, NULL, 800, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (530, 158, 8, NULL, NULL, 637, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (531, 158, 9, NULL, NULL, NULL, NULL, NULL, N'62458', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (532, 158, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (533, 159, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/xr2mhhsk/test2.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (534, 159, 7, NULL, NULL, 800, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (535, 159, 8, NULL, NULL, 535, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (536, 159, 9, NULL, NULL, NULL, NULL, NULL, N'77976', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (537, 159, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (538, 161, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/2vnlhgbr/about-us.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (539, 161, 7, NULL, NULL, 800, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (540, 161, 8, NULL, NULL, 695, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (541, 161, 9, NULL, NULL, NULL, NULL, NULL, N'175819', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (542, 161, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (543, 162, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/4weoyues/mem1.png"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (544, 162, 7, NULL, NULL, 270, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (545, 162, 8, NULL, NULL, 370, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (546, 162, 9, NULL, NULL, NULL, NULL, NULL, N'154720', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (547, 162, 10, NULL, NULL, NULL, NULL, NULL, N'png', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (548, 163, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/o2vjbiqq/mem2.png"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (549, 163, 7, NULL, NULL, 270, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (550, 163, 8, NULL, NULL, 370, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (551, 163, 9, NULL, NULL, NULL, NULL, NULL, N'113610', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (552, 163, 10, NULL, NULL, NULL, NULL, NULL, N'png', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (553, 164, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/pmnfo5yt/mem3.png"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (554, 164, 7, NULL, NULL, 270, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (555, 164, 8, NULL, NULL, 370, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (556, 164, 9, NULL, NULL, NULL, NULL, NULL, N'154720', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (557, 164, 10, NULL, NULL, NULL, NULL, NULL, N'png', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (716, 30, 84, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"742f8cb7-162e-45d1-a80b-1afa267d206e","mediaKey":"77eaf172-3e1e-4155-9a2f-414ee4bd1d11"},{"key":"bae94035-f137-49e0-85f9-b82abe6a32fb","mediaKey":"27ab2569-0ade-4011-8248-f086664a42cb"},{"key":"0e32324e-8fc1-4822-8401-a0b3b6da0676","mediaKey":"94bec0ad-70c6-4d3d-bde5-e1ba85c55045"},{"key":"a98f3372-d4a7-4f08-b844-bcc95fc53632","mediaKey":"a69a6b38-22ce-4041-9c4a-0ea209815a2f"},{"key":"2f046b30-92fd-4d80-8385-5fb10c737fff","mediaKey":"d051fa54-8b5f-403a-b3ae-32d3821b5702"},{"key":"ed667e75-7dbc-4c92-8613-f38a812f387d","mediaKey":"08f1ea61-cfb3-4778-bf36-936022f83cd2"},{"key":"adc29d7c-7914-4704-9a2c-c3692eed5d01","mediaKey":"e6007303-cce1-4f8e-8b21-11cfae11cc8b"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (717, 183, 84, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"87d509c2-7868-4f6a-98bf-ae9111ed15da","mediaKey":"a69a6b38-22ce-4041-9c4a-0ea209815a2f"},{"key":"742f8cb7-162e-45d1-a80b-1afa267d206e","mediaKey":"77eaf172-3e1e-4155-9a2f-414ee4bd1d11"},{"key":"bae94035-f137-49e0-85f9-b82abe6a32fb","mediaKey":"27ab2569-0ade-4011-8248-f086664a42cb"},{"key":"0e32324e-8fc1-4822-8401-a0b3b6da0676","mediaKey":"94bec0ad-70c6-4d3d-bde5-e1ba85c55045"},{"key":"a98f3372-d4a7-4f08-b844-bcc95fc53632","mediaKey":"a69a6b38-22ce-4041-9c4a-0ea209815a2f"},{"key":"2f046b30-92fd-4d80-8385-5fb10c737fff","mediaKey":"d051fa54-8b5f-403a-b3ae-32d3821b5702"},{"key":"ed667e75-7dbc-4c92-8613-f38a812f387d","mediaKey":"08f1ea61-cfb3-4778-bf36-936022f83cd2"},{"key":"adc29d7c-7914-4704-9a2c-c3692eed5d01","mediaKey":"e6007303-cce1-4f8e-8b21-11cfae11cc8b"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (718, 184, 84, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"742f8cb7-162e-45d1-a80b-1afa267d206e","mediaKey":"77eaf172-3e1e-4155-9a2f-414ee4bd1d11"},{"key":"0e32324e-8fc1-4822-8401-a0b3b6da0676","mediaKey":"94bec0ad-70c6-4d3d-bde5-e1ba85c55045"},{"key":"2f046b30-92fd-4d80-8385-5fb10c737fff","mediaKey":"d051fa54-8b5f-403a-b3ae-32d3821b5702"},{"key":"a98f3372-d4a7-4f08-b844-bcc95fc53632","mediaKey":"a69a6b38-22ce-4041-9c4a-0ea209815a2f"},{"key":"adc29d7c-7914-4704-9a2c-c3692eed5d01","mediaKey":"e6007303-cce1-4f8e-8b21-11cfae11cc8b"},{"key":"ed667e75-7dbc-4c92-8613-f38a812f387d","mediaKey":"08f1ea61-cfb3-4778-bf36-936022f83cd2"},{"key":"bae94035-f137-49e0-85f9-b82abe6a32fb","mediaKey":"27ab2569-0ade-4011-8248-f086664a42cb"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (719, 185, 84, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"742f8cb7-162e-45d1-a80b-1afa267d206e","mediaKey":"77eaf172-3e1e-4155-9a2f-414ee4bd1d11"},{"key":"0e32324e-8fc1-4822-8401-a0b3b6da0676","mediaKey":"94bec0ad-70c6-4d3d-bde5-e1ba85c55045"},{"key":"2f046b30-92fd-4d80-8385-5fb10c737fff","mediaKey":"d051fa54-8b5f-403a-b3ae-32d3821b5702"},{"key":"a98f3372-d4a7-4f08-b844-bcc95fc53632","mediaKey":"a69a6b38-22ce-4041-9c4a-0ea209815a2f"},{"key":"adc29d7c-7914-4704-9a2c-c3692eed5d01","mediaKey":"e6007303-cce1-4f8e-8b21-11cfae11cc8b"},{"key":"ed667e75-7dbc-4c92-8613-f38a812f387d","mediaKey":"08f1ea61-cfb3-4778-bf36-936022f83cd2"},{"key":"bae94035-f137-49e0-85f9-b82abe6a32fb","mediaKey":"27ab2569-0ade-4011-8248-f086664a42cb"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (725, 185, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'День защиты детей🌟;
Атомграды России;
Атомграды России;
День защиты детей🌟;
День защиты детей🌟;
Праздник лета')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (726, 185, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'Завершён;
Подготовка;
Подготовка;
Завершён;
Завершён;
Актуально')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (727, 187, 84, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"742f8cb7-162e-45d1-a80b-1afa267d206e","mediaKey":"77eaf172-3e1e-4155-9a2f-414ee4bd1d11"},{"key":"0e32324e-8fc1-4822-8401-a0b3b6da0676","mediaKey":"94bec0ad-70c6-4d3d-bde5-e1ba85c55045"},{"key":"2f046b30-92fd-4d80-8385-5fb10c737fff","mediaKey":"d051fa54-8b5f-403a-b3ae-32d3821b5702"},{"key":"a98f3372-d4a7-4f08-b844-bcc95fc53632","mediaKey":"a69a6b38-22ce-4041-9c4a-0ea209815a2f"},{"key":"adc29d7c-7914-4704-9a2c-c3692eed5d01","mediaKey":"e6007303-cce1-4f8e-8b21-11cfae11cc8b"},{"key":"ed667e75-7dbc-4c92-8613-f38a812f387d","mediaKey":"08f1ea61-cfb3-4778-bf36-936022f83cd2"},{"key":"bae94035-f137-49e0-85f9-b82abe6a32fb","mediaKey":"27ab2569-0ade-4011-8248-f086664a42cb"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (728, 187, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'День защиты детей🌟;
Атомграды России;
Атомграды России;
День защиты детей🌟;
День защиты детей🌟;
Праздник лета')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (729, 187, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'завершён;
подготовка;
подготовка;
завершён;
завершён;
актуально')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (730, 188, 84, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"742f8cb7-162e-45d1-a80b-1afa267d206e","mediaKey":"77eaf172-3e1e-4155-9a2f-414ee4bd1d11"},{"key":"0e32324e-8fc1-4822-8401-a0b3b6da0676","mediaKey":"94bec0ad-70c6-4d3d-bde5-e1ba85c55045"},{"key":"2f046b30-92fd-4d80-8385-5fb10c737fff","mediaKey":"d051fa54-8b5f-403a-b3ae-32d3821b5702"},{"key":"a98f3372-d4a7-4f08-b844-bcc95fc53632","mediaKey":"a69a6b38-22ce-4041-9c4a-0ea209815a2f"},{"key":"adc29d7c-7914-4704-9a2c-c3692eed5d01","mediaKey":"e6007303-cce1-4f8e-8b21-11cfae11cc8b"},{"key":"ed667e75-7dbc-4c92-8613-f38a812f387d","mediaKey":"08f1ea61-cfb3-4778-bf36-936022f83cd2"},{"key":"bae94035-f137-49e0-85f9-b82abe6a32fb","mediaKey":"27ab2569-0ade-4011-8248-f086664a42cb"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (731, 188, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Праздник лета;
Первый день лета')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (732, 188, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'завершён;
подготовка;
подготовка;
завершён;
завершён;
актуально;
актуально')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (733, 189, 84, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"742f8cb7-162e-45d1-a80b-1afa267d206e","mediaKey":"77eaf172-3e1e-4155-9a2f-414ee4bd1d11"},{"key":"0e32324e-8fc1-4822-8401-a0b3b6da0676","mediaKey":"94bec0ad-70c6-4d3d-bde5-e1ba85c55045"},{"key":"2f046b30-92fd-4d80-8385-5fb10c737fff","mediaKey":"d051fa54-8b5f-403a-b3ae-32d3821b5702"},{"key":"a98f3372-d4a7-4f08-b844-bcc95fc53632","mediaKey":"a69a6b38-22ce-4041-9c4a-0ea209815a2f"},{"key":"adc29d7c-7914-4704-9a2c-c3692eed5d01","mediaKey":"e6007303-cce1-4f8e-8b21-11cfae11cc8b"},{"key":"ed667e75-7dbc-4c92-8613-f38a812f387d","mediaKey":"08f1ea61-cfb3-4778-bf36-936022f83cd2"},{"key":"bae94035-f137-49e0-85f9-b82abe6a32fb","mediaKey":"27ab2569-0ade-4011-8248-f086664a42cb"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (734, 189, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Праздник лета;
Первый день лета')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (735, 189, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'завершён;
подготовка;
подготовка;
завершён;
завершён;
актуально;
актуально')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (736, 188, 87, NULL, NULL, NULL, NULL, NULL, NULL, N'Events;
Contests;
Stock;
Exhibitions;
Holidays;
Other')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (737, 189, 87, NULL, NULL, NULL, NULL, NULL, NULL, N'Events;
Contests;
Stock;
Exhibitions;
Holidays;
Other;
Other')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (738, 190, 84, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"742f8cb7-162e-45d1-a80b-1afa267d206e","mediaKey":"77eaf172-3e1e-4155-9a2f-414ee4bd1d11"},{"key":"0e32324e-8fc1-4822-8401-a0b3b6da0676","mediaKey":"94bec0ad-70c6-4d3d-bde5-e1ba85c55045"},{"key":"2f046b30-92fd-4d80-8385-5fb10c737fff","mediaKey":"d051fa54-8b5f-403a-b3ae-32d3821b5702"},{"key":"a98f3372-d4a7-4f08-b844-bcc95fc53632","mediaKey":"a69a6b38-22ce-4041-9c4a-0ea209815a2f"},{"key":"adc29d7c-7914-4704-9a2c-c3692eed5d01","mediaKey":"e6007303-cce1-4f8e-8b21-11cfae11cc8b"},{"key":"ed667e75-7dbc-4c92-8613-f38a812f387d","mediaKey":"08f1ea61-cfb3-4778-bf36-936022f83cd2"},{"key":"bae94035-f137-49e0-85f9-b82abe6a32fb","mediaKey":"27ab2569-0ade-4011-8248-f086664a42cb"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (739, 190, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Праздник лета;
Первый день лета')
GO
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (740, 190, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'завершён;
подготовка;
подготовка;
завершён;
завершён;
актуально;
актуально')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (741, 190, 87, NULL, NULL, NULL, NULL, NULL, NULL, N'Events;
Contests;
Stock;
Exhibitions;
Holidays;
Other;
Other')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (742, 191, 84, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"742f8cb7-162e-45d1-a80b-1afa267d206e","mediaKey":"77eaf172-3e1e-4155-9a2f-414ee4bd1d11"},{"key":"0e32324e-8fc1-4822-8401-a0b3b6da0676","mediaKey":"94bec0ad-70c6-4d3d-bde5-e1ba85c55045"},{"key":"2f046b30-92fd-4d80-8385-5fb10c737fff","mediaKey":"d051fa54-8b5f-403a-b3ae-32d3821b5702"},{"key":"a98f3372-d4a7-4f08-b844-bcc95fc53632","mediaKey":"a69a6b38-22ce-4041-9c4a-0ea209815a2f"},{"key":"adc29d7c-7914-4704-9a2c-c3692eed5d01","mediaKey":"e6007303-cce1-4f8e-8b21-11cfae11cc8b"},{"key":"ed667e75-7dbc-4c92-8613-f38a812f387d","mediaKey":"08f1ea61-cfb3-4778-bf36-936022f83cd2"},{"key":"bae94035-f137-49e0-85f9-b82abe6a32fb","mediaKey":"27ab2569-0ade-4011-8248-f086664a42cb"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (743, 191, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Праздник лета;
Первый день лета')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (744, 191, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'завершён;
подготовка;
подготовка;
завершён;
завершён;
актуально;
актуально')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (745, 191, 87, NULL, NULL, NULL, NULL, NULL, NULL, N'Events;
Contests;
Stock;
Exhibitions;
Holidays;
Other;
Other')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (746, 192, 84, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"742f8cb7-162e-45d1-a80b-1afa267d206e","mediaKey":"77eaf172-3e1e-4155-9a2f-414ee4bd1d11"},{"key":"0e32324e-8fc1-4822-8401-a0b3b6da0676","mediaKey":"94bec0ad-70c6-4d3d-bde5-e1ba85c55045"},{"key":"2f046b30-92fd-4d80-8385-5fb10c737fff","mediaKey":"d051fa54-8b5f-403a-b3ae-32d3821b5702"},{"key":"a98f3372-d4a7-4f08-b844-bcc95fc53632","mediaKey":"a69a6b38-22ce-4041-9c4a-0ea209815a2f"},{"key":"adc29d7c-7914-4704-9a2c-c3692eed5d01","mediaKey":"e6007303-cce1-4f8e-8b21-11cfae11cc8b"},{"key":"ed667e75-7dbc-4c92-8613-f38a812f387d","mediaKey":"08f1ea61-cfb3-4778-bf36-936022f83cd2"},{"key":"bae94035-f137-49e0-85f9-b82abe6a32fb","mediaKey":"27ab2569-0ade-4011-8248-f086664a42cb"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (747, 192, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Праздник лета;
Первый день лета')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (748, 192, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'завершён;
подготовка;
подготовка;
завершён;
завершён;
актуально;
актуально')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (749, 192, 87, NULL, NULL, NULL, NULL, NULL, NULL, N'Events;
Contests;
Stock;
Exhibitions;
Holidays;
Other;
Other')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (750, 191, 88, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"438d7e51-78e8-43c6-918e-118eefee7cef","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"},{"key":"8e852d1c-8737-4e51-a09a-cfaf954dde65","mediaKey":"f1930665-4071-45d2-b02d-d4a6924ff429"},{"key":"506c44e3-ec34-4c1c-bcf7-f28c07c1281d","mediaKey":"5a6990c0-1556-4580-98d7-f701688e07aa"},{"key":"cdaf4249-f3c9-4347-aedf-01bdf9e4956c","mediaKey":"a64c5ebe-edec-4464-806b-5326c70b3615"},{"key":"82b1fcce-e184-4853-a65f-a74e3405d843","mediaKey":"2a57e8d6-d901-4bd9-b0a7-fcd341c4a0ee"},{"key":"f8965fb2-162f-4f81-99ab-d144c83a2c6a","mediaKey":"42c5c7ee-e629-41d4-8cdd-3b04f77617cd"},{"key":"ee30a6bb-bcf8-4cfa-a26c-a57257784c97","mediaKey":"0806084e-6eae-4d14-afa5-4a71de37050a"},{"key":"58085282-3c83-4f7f-b116-ad1d003e3b8e","mediaKey":"aeeb94cc-b252-4800-b261-3a6ceb3df3e8"},{"key":"03814de6-9948-4053-856f-52a59a99918c","mediaKey":"0afcbc9e-9a8b-4aac-b980-5b66c29bee75"},{"key":"4dbc62ff-7ede-4549-926b-7696dc2bd528","mediaKey":"cded6935-3008-4e32-8f21-de292fb05235"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (751, 192, 88, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"438d7e51-78e8-43c6-918e-118eefee7cef","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"},{"key":"8e852d1c-8737-4e51-a09a-cfaf954dde65","mediaKey":"f1930665-4071-45d2-b02d-d4a6924ff429"},{"key":"506c44e3-ec34-4c1c-bcf7-f28c07c1281d","mediaKey":"5a6990c0-1556-4580-98d7-f701688e07aa"},{"key":"cdaf4249-f3c9-4347-aedf-01bdf9e4956c","mediaKey":"a64c5ebe-edec-4464-806b-5326c70b3615"},{"key":"82b1fcce-e184-4853-a65f-a74e3405d843","mediaKey":"2a57e8d6-d901-4bd9-b0a7-fcd341c4a0ee"},{"key":"f8965fb2-162f-4f81-99ab-d144c83a2c6a","mediaKey":"42c5c7ee-e629-41d4-8cdd-3b04f77617cd"},{"key":"ee30a6bb-bcf8-4cfa-a26c-a57257784c97","mediaKey":"0806084e-6eae-4d14-afa5-4a71de37050a"},{"key":"58085282-3c83-4f7f-b116-ad1d003e3b8e","mediaKey":"aeeb94cc-b252-4800-b261-3a6ceb3df3e8"},{"key":"03814de6-9948-4053-856f-52a59a99918c","mediaKey":"0afcbc9e-9a8b-4aac-b980-5b66c29bee75"},{"key":"4dbc62ff-7ede-4549-926b-7696dc2bd528","mediaKey":"cded6935-3008-4e32-8f21-de292fb05235"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (752, 176, 84, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"e2bb3035-8e32-4013-8e00-68f56e58365f","mediaKey":"77eaf172-3e1e-4155-9a2f-414ee4bd1d11"},{"key":"816397dc-93c9-4834-9603-50dd043381e8","mediaKey":"94bec0ad-70c6-4d3d-bde5-e1ba85c55045"},{"key":"43704885-3b42-4cd3-a205-a9422a72aa15","mediaKey":"a69a6b38-22ce-4041-9c4a-0ea209815a2f"},{"key":"ea7e088f-e5a3-404f-af3a-492863951131","mediaKey":"d051fa54-8b5f-403a-b3ae-32d3821b5702"},{"key":"176ccc5f-51e9-44cb-9483-fb1496968d98","mediaKey":"e6007303-cce1-4f8e-8b21-11cfae11cc8b"},{"key":"64a2fb09-47b2-47ca-a003-f2f0ca57437a","mediaKey":"08f1ea61-cfb3-4778-bf36-936022f83cd2"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (753, 176, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Праздник лета')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (754, 176, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'завершён;
подготовка;
подготовка;
завершён;
завершён;
актуально')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (755, 176, 87, NULL, NULL, NULL, NULL, NULL, NULL, N'Events;
Contests;
Stock;
Exhibitions;
Holidays;
Other')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (756, 176, 88, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b542d0db-d348-4e8a-89fb-b2a36ddd02a4","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"},{"key":"fc10de40-dd29-4f4a-b973-94ae5eeb1078","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"},{"key":"abaeb9ef-0a6b-4822-baa8-59f65a7c17bd","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (757, 176, 89, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"56651ec4-fcf9-4222-84b4-71651b0b2c0a","mediaKey":"e1608a61-9e16-4a2d-8c41-c2d022f92019"},{"key":"ada5159d-84ec-4356-a926-ab52c470fd20","mediaKey":"20e2f580-0b47-4117-af55-82625901da3a"},{"key":"2874eb88-4274-405a-902d-29edd41babf8","mediaKey":"d63ac7f4-bf41-4a35-a575-781d1bb54ef9"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (758, 176, 90, NULL, NULL, NULL, NULL, NULL, NULL, N'Центральная библиотека;
Польза для ребенка;
Территория для научной работы')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (759, 176, 91, NULL, NULL, NULL, NULL, NULL, NULL, N'Новоуральского городского округа;
Читай вместе с нами!;
Предоставление места для работы и научной деятельности. 
<br />В библиотеке имеются необходимые условия для 
<br />полноценной научно-исследовательской деятельности. 
<br />В читальном зале можно проводить выставки и 
<br />конференции, презентации и творческие вечера.;')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (760, 193, 84, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"e2bb3035-8e32-4013-8e00-68f56e58365f","mediaKey":"77eaf172-3e1e-4155-9a2f-414ee4bd1d11"},{"key":"816397dc-93c9-4834-9603-50dd043381e8","mediaKey":"94bec0ad-70c6-4d3d-bde5-e1ba85c55045"},{"key":"43704885-3b42-4cd3-a205-a9422a72aa15","mediaKey":"a69a6b38-22ce-4041-9c4a-0ea209815a2f"},{"key":"ea7e088f-e5a3-404f-af3a-492863951131","mediaKey":"d051fa54-8b5f-403a-b3ae-32d3821b5702"},{"key":"176ccc5f-51e9-44cb-9483-fb1496968d98","mediaKey":"e6007303-cce1-4f8e-8b21-11cfae11cc8b"},{"key":"64a2fb09-47b2-47ca-a003-f2f0ca57437a","mediaKey":"08f1ea61-cfb3-4778-bf36-936022f83cd2"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (761, 193, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Праздник лета')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (762, 193, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'завершён;
подготовка;
подготовка;
завершён;
завершён;
актуально')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (763, 193, 87, NULL, NULL, NULL, NULL, NULL, NULL, N'Events;
Contests;
Stock;
Exhibitions;
Holidays;
Other')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (764, 193, 88, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b542d0db-d348-4e8a-89fb-b2a36ddd02a4","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"},{"key":"fc10de40-dd29-4f4a-b973-94ae5eeb1078","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"},{"key":"abaeb9ef-0a6b-4822-baa8-59f65a7c17bd","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (765, 193, 89, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"56651ec4-fcf9-4222-84b4-71651b0b2c0a","mediaKey":"e1608a61-9e16-4a2d-8c41-c2d022f92019"},{"key":"ada5159d-84ec-4356-a926-ab52c470fd20","mediaKey":"20e2f580-0b47-4117-af55-82625901da3a"},{"key":"2874eb88-4274-405a-902d-29edd41babf8","mediaKey":"d63ac7f4-bf41-4a35-a575-781d1bb54ef9"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (766, 193, 90, NULL, NULL, NULL, NULL, NULL, NULL, N'Центральная библиотека;
Польза для ребенка;
Территория для научной работы')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (767, 193, 91, NULL, NULL, NULL, NULL, NULL, NULL, N'Новоуральского городского округа;
Читай вместе с нами!;
Предоставление места для работы и научной деятельности. 
\<br />В библиотеке имеются необходимые условия для 
\<br />полноценной научно-исследовательской деятельности. 
\<br />В читальном зале можно проводить выставки и 
\<br />конференции, презентации и творческие вечера.;')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (768, 194, 84, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"e2bb3035-8e32-4013-8e00-68f56e58365f","mediaKey":"77eaf172-3e1e-4155-9a2f-414ee4bd1d11"},{"key":"816397dc-93c9-4834-9603-50dd043381e8","mediaKey":"94bec0ad-70c6-4d3d-bde5-e1ba85c55045"},{"key":"43704885-3b42-4cd3-a205-a9422a72aa15","mediaKey":"a69a6b38-22ce-4041-9c4a-0ea209815a2f"},{"key":"ea7e088f-e5a3-404f-af3a-492863951131","mediaKey":"d051fa54-8b5f-403a-b3ae-32d3821b5702"},{"key":"176ccc5f-51e9-44cb-9483-fb1496968d98","mediaKey":"e6007303-cce1-4f8e-8b21-11cfae11cc8b"},{"key":"64a2fb09-47b2-47ca-a003-f2f0ca57437a","mediaKey":"08f1ea61-cfb3-4778-bf36-936022f83cd2"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (769, 194, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Праздник лета')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (770, 194, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'завершён;
подготовка;
подготовка;
завершён;
завершён;
актуально')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (771, 194, 87, NULL, NULL, NULL, NULL, NULL, NULL, N'Events;
Contests;
Stock;
Exhibitions;
Holidays;
Other')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (772, 194, 88, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b542d0db-d348-4e8a-89fb-b2a36ddd02a4","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"},{"key":"fc10de40-dd29-4f4a-b973-94ae5eeb1078","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"},{"key":"abaeb9ef-0a6b-4822-baa8-59f65a7c17bd","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (773, 194, 89, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"56651ec4-fcf9-4222-84b4-71651b0b2c0a","mediaKey":"e1608a61-9e16-4a2d-8c41-c2d022f92019"},{"key":"ada5159d-84ec-4356-a926-ab52c470fd20","mediaKey":"20e2f580-0b47-4117-af55-82625901da3a"},{"key":"2874eb88-4274-405a-902d-29edd41babf8","mediaKey":"d63ac7f4-bf41-4a35-a575-781d1bb54ef9"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (774, 194, 90, NULL, NULL, NULL, NULL, NULL, NULL, N'Центральная библиотека;
Польза для ребенка;
Территория для научной работы')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (775, 194, 91, NULL, NULL, NULL, NULL, NULL, NULL, N'Новоуральского городского округа;
Читай вместе с нами!;
Предоставление места для работы и научной деятельности. 
&lt;br /&gt;В библиотеке имеются необходимые условия для 
\<br />полноценной научно-исследовательской деятельности. 
\<br />В читальном зале можно проводить выставки и 
\<br />конференции, презентации и творческие вечера.;')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (776, 195, 84, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"e2bb3035-8e32-4013-8e00-68f56e58365f","mediaKey":"77eaf172-3e1e-4155-9a2f-414ee4bd1d11"},{"key":"816397dc-93c9-4834-9603-50dd043381e8","mediaKey":"94bec0ad-70c6-4d3d-bde5-e1ba85c55045"},{"key":"43704885-3b42-4cd3-a205-a9422a72aa15","mediaKey":"a69a6b38-22ce-4041-9c4a-0ea209815a2f"},{"key":"ea7e088f-e5a3-404f-af3a-492863951131","mediaKey":"d051fa54-8b5f-403a-b3ae-32d3821b5702"},{"key":"176ccc5f-51e9-44cb-9483-fb1496968d98","mediaKey":"e6007303-cce1-4f8e-8b21-11cfae11cc8b"},{"key":"64a2fb09-47b2-47ca-a003-f2f0ca57437a","mediaKey":"08f1ea61-cfb3-4778-bf36-936022f83cd2"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (777, 195, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Праздник лета')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (778, 195, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'завершён;
подготовка;
подготовка;
завершён;
завершён;
актуально')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (779, 195, 87, NULL, NULL, NULL, NULL, NULL, NULL, N'Events;
Contests;
Stock;
Exhibitions;
Holidays;
Other')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (780, 195, 88, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b542d0db-d348-4e8a-89fb-b2a36ddd02a4","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"},{"key":"fc10de40-dd29-4f4a-b973-94ae5eeb1078","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"},{"key":"abaeb9ef-0a6b-4822-baa8-59f65a7c17bd","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (781, 195, 89, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"56651ec4-fcf9-4222-84b4-71651b0b2c0a","mediaKey":"e1608a61-9e16-4a2d-8c41-c2d022f92019"},{"key":"ada5159d-84ec-4356-a926-ab52c470fd20","mediaKey":"20e2f580-0b47-4117-af55-82625901da3a"},{"key":"2874eb88-4274-405a-902d-29edd41babf8","mediaKey":"d63ac7f4-bf41-4a35-a575-781d1bb54ef9"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (782, 195, 90, NULL, NULL, NULL, NULL, NULL, NULL, N'Центральная библиотека;
Польза для ребенка;
Территория для научной работы')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (783, 195, 91, NULL, NULL, NULL, NULL, NULL, NULL, N'Новоуральского городского округа;
Читай вместе с нами!;
Предоставление места для работы и научной деятельности. 
В библиотеке имеются необходимые условия для 
полноценной научно-исследовательской деятельности. 
В читальном зале можно проводить выставки и 
конференции, презентации и творческие вечера.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (784, 196, 84, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"e2bb3035-8e32-4013-8e00-68f56e58365f","mediaKey":"77eaf172-3e1e-4155-9a2f-414ee4bd1d11"},{"key":"816397dc-93c9-4834-9603-50dd043381e8","mediaKey":"94bec0ad-70c6-4d3d-bde5-e1ba85c55045"},{"key":"43704885-3b42-4cd3-a205-a9422a72aa15","mediaKey":"a69a6b38-22ce-4041-9c4a-0ea209815a2f"},{"key":"ea7e088f-e5a3-404f-af3a-492863951131","mediaKey":"d051fa54-8b5f-403a-b3ae-32d3821b5702"},{"key":"176ccc5f-51e9-44cb-9483-fb1496968d98","mediaKey":"e6007303-cce1-4f8e-8b21-11cfae11cc8b"},{"key":"64a2fb09-47b2-47ca-a003-f2f0ca57437a","mediaKey":"08f1ea61-cfb3-4778-bf36-936022f83cd2"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (785, 196, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Праздник лета')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (786, 196, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'завершён;
подготовка;
подготовка;
завершён;
завершён;
актуально')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (787, 196, 87, NULL, NULL, NULL, NULL, NULL, NULL, N'Events;
Contests;
Stock;
Exhibitions;
Holidays;
Other')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (788, 196, 88, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b542d0db-d348-4e8a-89fb-b2a36ddd02a4","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"},{"key":"fc10de40-dd29-4f4a-b973-94ae5eeb1078","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"},{"key":"abaeb9ef-0a6b-4822-baa8-59f65a7c17bd","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (789, 196, 89, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"56651ec4-fcf9-4222-84b4-71651b0b2c0a","mediaKey":"e1608a61-9e16-4a2d-8c41-c2d022f92019"},{"key":"ada5159d-84ec-4356-a926-ab52c470fd20","mediaKey":"20e2f580-0b47-4117-af55-82625901da3a"},{"key":"2874eb88-4274-405a-902d-29edd41babf8","mediaKey":"d63ac7f4-bf41-4a35-a575-781d1bb54ef9"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (790, 196, 90, NULL, NULL, NULL, NULL, NULL, NULL, N'Центральная библиотека;
Польза для ребенка;
Территория для научной работы')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (791, 196, 91, NULL, NULL, NULL, NULL, NULL, NULL, N'Новоуральского городского округа;
Читай вместе с нами!;
Предоставление места для работы и научной деятельности. 
В библиотеке имеются необходимые условия для <br />
полноценной научно-исследовательской деятельности. <br />
В читальном зале можно проводить выставки и  <br />
конференции, презентации и творческие вечера.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (792, 197, 84, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"e2bb3035-8e32-4013-8e00-68f56e58365f","mediaKey":"77eaf172-3e1e-4155-9a2f-414ee4bd1d11"},{"key":"816397dc-93c9-4834-9603-50dd043381e8","mediaKey":"94bec0ad-70c6-4d3d-bde5-e1ba85c55045"},{"key":"43704885-3b42-4cd3-a205-a9422a72aa15","mediaKey":"a69a6b38-22ce-4041-9c4a-0ea209815a2f"},{"key":"ea7e088f-e5a3-404f-af3a-492863951131","mediaKey":"d051fa54-8b5f-403a-b3ae-32d3821b5702"},{"key":"176ccc5f-51e9-44cb-9483-fb1496968d98","mediaKey":"e6007303-cce1-4f8e-8b21-11cfae11cc8b"},{"key":"64a2fb09-47b2-47ca-a003-f2f0ca57437a","mediaKey":"08f1ea61-cfb3-4778-bf36-936022f83cd2"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (793, 197, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Праздник лета')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (794, 197, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'завершён;
подготовка;
подготовка;
завершён;
завершён;
актуально')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (795, 197, 87, NULL, NULL, NULL, NULL, NULL, NULL, N'Events;
Contests;
Stock;
Exhibitions;
Holidays;
Other')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (796, 197, 88, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b542d0db-d348-4e8a-89fb-b2a36ddd02a4","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"},{"key":"fc10de40-dd29-4f4a-b973-94ae5eeb1078","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"},{"key":"abaeb9ef-0a6b-4822-baa8-59f65a7c17bd","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (797, 197, 89, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"56651ec4-fcf9-4222-84b4-71651b0b2c0a","mediaKey":"e1608a61-9e16-4a2d-8c41-c2d022f92019"},{"key":"ada5159d-84ec-4356-a926-ab52c470fd20","mediaKey":"20e2f580-0b47-4117-af55-82625901da3a"},{"key":"2874eb88-4274-405a-902d-29edd41babf8","mediaKey":"d63ac7f4-bf41-4a35-a575-781d1bb54ef9"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (798, 197, 90, NULL, NULL, NULL, NULL, NULL, NULL, N'Центральная библиотека;
Польза для ребенка;
Территория для научной работы')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (799, 197, 91, NULL, NULL, NULL, NULL, NULL, NULL, N'Новоуральского городского округа;
Читай вместе с нами!;
Предоставление места для работы и научной деятельности. 
В библиотеке имеются необходимые условия для &lt;br /&gt;
полноценной научно-исследовательской деятельности. &lt;br /&gt;
В читальном зале можно проводить выставки и  &lt;br /&gt;
конференции, презентации и творческие вечера.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (800, 198, 84, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"e2bb3035-8e32-4013-8e00-68f56e58365f","mediaKey":"77eaf172-3e1e-4155-9a2f-414ee4bd1d11"},{"key":"816397dc-93c9-4834-9603-50dd043381e8","mediaKey":"94bec0ad-70c6-4d3d-bde5-e1ba85c55045"},{"key":"43704885-3b42-4cd3-a205-a9422a72aa15","mediaKey":"a69a6b38-22ce-4041-9c4a-0ea209815a2f"},{"key":"ea7e088f-e5a3-404f-af3a-492863951131","mediaKey":"d051fa54-8b5f-403a-b3ae-32d3821b5702"},{"key":"176ccc5f-51e9-44cb-9483-fb1496968d98","mediaKey":"e6007303-cce1-4f8e-8b21-11cfae11cc8b"},{"key":"64a2fb09-47b2-47ca-a003-f2f0ca57437a","mediaKey":"08f1ea61-cfb3-4778-bf36-936022f83cd2"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (801, 198, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Праздник лета')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (802, 198, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'завершён;
подготовка;
подготовка;
завершён;
завершён;
актуально')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (803, 198, 87, NULL, NULL, NULL, NULL, NULL, NULL, N'Events;
Contests;
Stock;
Exhibitions;
Holidays;
Other')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (804, 198, 88, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b542d0db-d348-4e8a-89fb-b2a36ddd02a4","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"},{"key":"fc10de40-dd29-4f4a-b973-94ae5eeb1078","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"},{"key":"abaeb9ef-0a6b-4822-baa8-59f65a7c17bd","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (805, 198, 89, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"56651ec4-fcf9-4222-84b4-71651b0b2c0a","mediaKey":"e1608a61-9e16-4a2d-8c41-c2d022f92019"},{"key":"ada5159d-84ec-4356-a926-ab52c470fd20","mediaKey":"20e2f580-0b47-4117-af55-82625901da3a"},{"key":"2874eb88-4274-405a-902d-29edd41babf8","mediaKey":"d63ac7f4-bf41-4a35-a575-781d1bb54ef9"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (806, 198, 90, NULL, NULL, NULL, NULL, NULL, NULL, N'Центральная библиотека;
Польза для ребенка;
Территория для научной работы')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (807, 198, 91, NULL, NULL, NULL, NULL, NULL, NULL, N'Новоуральского городского округа;
Читай вместе с нами!;
Предоставление места для работы и научной деятельности. 
В библиотеке имеются необходимые условия для &lt;br /&gt;
полноценной научно-исследовательской деятельности. &lt;br /&gt;
В читальном зале можно проводить выставки и  &lt;br /&gt;
конференции, презентации и творческие вечера.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (808, 199, 84, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"e2bb3035-8e32-4013-8e00-68f56e58365f","mediaKey":"77eaf172-3e1e-4155-9a2f-414ee4bd1d11"},{"key":"816397dc-93c9-4834-9603-50dd043381e8","mediaKey":"94bec0ad-70c6-4d3d-bde5-e1ba85c55045"},{"key":"43704885-3b42-4cd3-a205-a9422a72aa15","mediaKey":"a69a6b38-22ce-4041-9c4a-0ea209815a2f"},{"key":"ea7e088f-e5a3-404f-af3a-492863951131","mediaKey":"d051fa54-8b5f-403a-b3ae-32d3821b5702"},{"key":"176ccc5f-51e9-44cb-9483-fb1496968d98","mediaKey":"e6007303-cce1-4f8e-8b21-11cfae11cc8b"},{"key":"64a2fb09-47b2-47ca-a003-f2f0ca57437a","mediaKey":"08f1ea61-cfb3-4778-bf36-936022f83cd2"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (809, 199, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Праздник лета')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (810, 199, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'завершён;
подготовка;
подготовка;
завершён;
завершён;
актуально')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (811, 199, 87, NULL, NULL, NULL, NULL, NULL, NULL, N'Events;
Contests;
Stock;
Exhibitions;
Holidays;
Other')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (812, 199, 88, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b542d0db-d348-4e8a-89fb-b2a36ddd02a4","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"},{"key":"fc10de40-dd29-4f4a-b973-94ae5eeb1078","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"},{"key":"abaeb9ef-0a6b-4822-baa8-59f65a7c17bd","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (813, 199, 89, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"56651ec4-fcf9-4222-84b4-71651b0b2c0a","mediaKey":"e1608a61-9e16-4a2d-8c41-c2d022f92019"},{"key":"ada5159d-84ec-4356-a926-ab52c470fd20","mediaKey":"20e2f580-0b47-4117-af55-82625901da3a"},{"key":"2874eb88-4274-405a-902d-29edd41babf8","mediaKey":"d63ac7f4-bf41-4a35-a575-781d1bb54ef9"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (814, 199, 90, NULL, NULL, NULL, NULL, NULL, NULL, N'Центральная библиотека;
Польза для ребенка;
Территория для научной работы')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (815, 199, 91, NULL, NULL, NULL, NULL, NULL, NULL, N'Новоуральского городского округа;
Читай вместе с нами!;
Предоставление места для работы и научной деятельности. 
В библиотеке имеются необходимые условия для <br />
полноценной научно-исследовательской деятельности. <br />
В читальном зале можно проводить выставки и  <br />
конференции, презентации и творческие вечера.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (816, 200, 84, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"e2bb3035-8e32-4013-8e00-68f56e58365f","mediaKey":"77eaf172-3e1e-4155-9a2f-414ee4bd1d11"},{"key":"816397dc-93c9-4834-9603-50dd043381e8","mediaKey":"94bec0ad-70c6-4d3d-bde5-e1ba85c55045"},{"key":"43704885-3b42-4cd3-a205-a9422a72aa15","mediaKey":"a69a6b38-22ce-4041-9c4a-0ea209815a2f"},{"key":"ea7e088f-e5a3-404f-af3a-492863951131","mediaKey":"d051fa54-8b5f-403a-b3ae-32d3821b5702"},{"key":"176ccc5f-51e9-44cb-9483-fb1496968d98","mediaKey":"e6007303-cce1-4f8e-8b21-11cfae11cc8b"},{"key":"64a2fb09-47b2-47ca-a003-f2f0ca57437a","mediaKey":"08f1ea61-cfb3-4778-bf36-936022f83cd2"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (817, 200, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Праздник лета')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (818, 200, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'завершён;
подготовка;
подготовка;
завершён;
завершён;
актуально')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (819, 200, 87, NULL, NULL, NULL, NULL, NULL, NULL, N'Events;
Contests;
Stock;
Exhibitions;
Holidays;
Other')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (820, 200, 88, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b542d0db-d348-4e8a-89fb-b2a36ddd02a4","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"},{"key":"fc10de40-dd29-4f4a-b973-94ae5eeb1078","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"},{"key":"abaeb9ef-0a6b-4822-baa8-59f65a7c17bd","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (821, 200, 89, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"56651ec4-fcf9-4222-84b4-71651b0b2c0a","mediaKey":"e1608a61-9e16-4a2d-8c41-c2d022f92019"},{"key":"ada5159d-84ec-4356-a926-ab52c470fd20","mediaKey":"20e2f580-0b47-4117-af55-82625901da3a"},{"key":"2874eb88-4274-405a-902d-29edd41babf8","mediaKey":"d63ac7f4-bf41-4a35-a575-781d1bb54ef9"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (822, 200, 90, NULL, NULL, NULL, NULL, NULL, NULL, N'Центральная библиотека;
Польза для ребенка;
Территория для научной работы')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (823, 200, 91, NULL, NULL, NULL, NULL, NULL, NULL, N'Новоуральского городского округа;
Читай вместе с нами!;
Предоставление места для работы и научной деятельности. 
В библиотеке имеются необходимые условия для <br />
полноценной научно-исследовательской деятельности. <br />
В читальном зале можно проводить выставки и  <br />
конференции, презентации и творческие вечера.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (824, 201, 84, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"e2bb3035-8e32-4013-8e00-68f56e58365f","mediaKey":"77eaf172-3e1e-4155-9a2f-414ee4bd1d11"},{"key":"816397dc-93c9-4834-9603-50dd043381e8","mediaKey":"94bec0ad-70c6-4d3d-bde5-e1ba85c55045"},{"key":"43704885-3b42-4cd3-a205-a9422a72aa15","mediaKey":"a69a6b38-22ce-4041-9c4a-0ea209815a2f"},{"key":"ea7e088f-e5a3-404f-af3a-492863951131","mediaKey":"d051fa54-8b5f-403a-b3ae-32d3821b5702"},{"key":"176ccc5f-51e9-44cb-9483-fb1496968d98","mediaKey":"e6007303-cce1-4f8e-8b21-11cfae11cc8b"},{"key":"64a2fb09-47b2-47ca-a003-f2f0ca57437a","mediaKey":"08f1ea61-cfb3-4778-bf36-936022f83cd2"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (825, 201, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Праздник лета')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (826, 201, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'завершён;
подготовка;
подготовка;
завершён;
завершён;
актуально')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (827, 201, 87, NULL, NULL, NULL, NULL, NULL, NULL, N'Events;
Contests;
Stock;
Exhibitions;
Holidays;
Other')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (828, 201, 88, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b542d0db-d348-4e8a-89fb-b2a36ddd02a4","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"},{"key":"fc10de40-dd29-4f4a-b973-94ae5eeb1078","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"},{"key":"abaeb9ef-0a6b-4822-baa8-59f65a7c17bd","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (829, 201, 89, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"56651ec4-fcf9-4222-84b4-71651b0b2c0a","mediaKey":"e1608a61-9e16-4a2d-8c41-c2d022f92019"},{"key":"ada5159d-84ec-4356-a926-ab52c470fd20","mediaKey":"20e2f580-0b47-4117-af55-82625901da3a"},{"key":"2874eb88-4274-405a-902d-29edd41babf8","mediaKey":"d63ac7f4-bf41-4a35-a575-781d1bb54ef9"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (830, 201, 90, NULL, NULL, NULL, NULL, NULL, NULL, N'Центральная библиотека;
Польза для ребенка;
Территория для научной работы')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (831, 201, 91, NULL, NULL, NULL, NULL, NULL, NULL, N'Новоуральского городского округа;
Читай вместе с нами!')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (832, 201, 92, NULL, NULL, NULL, NULL, NULL, NULL, N'Предоставление места для работы и научной деятельности. 
В библиотеке имеются необходимые условия для <br />
полноценной научно-исследовательской деятельности. <br />
В читальном зале можно проводить выставки и  <br />
конференции, презентации и творческие вечера.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (833, 202, 84, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"e2bb3035-8e32-4013-8e00-68f56e58365f","mediaKey":"77eaf172-3e1e-4155-9a2f-414ee4bd1d11"},{"key":"816397dc-93c9-4834-9603-50dd043381e8","mediaKey":"94bec0ad-70c6-4d3d-bde5-e1ba85c55045"},{"key":"43704885-3b42-4cd3-a205-a9422a72aa15","mediaKey":"a69a6b38-22ce-4041-9c4a-0ea209815a2f"},{"key":"ea7e088f-e5a3-404f-af3a-492863951131","mediaKey":"d051fa54-8b5f-403a-b3ae-32d3821b5702"},{"key":"176ccc5f-51e9-44cb-9483-fb1496968d98","mediaKey":"e6007303-cce1-4f8e-8b21-11cfae11cc8b"},{"key":"64a2fb09-47b2-47ca-a003-f2f0ca57437a","mediaKey":"08f1ea61-cfb3-4778-bf36-936022f83cd2"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (834, 202, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Праздник лета')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (835, 202, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'завершён;
подготовка;
подготовка;
завершён;
завершён;
актуально')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (836, 202, 87, NULL, NULL, NULL, NULL, NULL, NULL, N'Events;
Contests;
Stock;
Exhibitions;
Holidays;
Other')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (837, 202, 88, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b542d0db-d348-4e8a-89fb-b2a36ddd02a4","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"},{"key":"fc10de40-dd29-4f4a-b973-94ae5eeb1078","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"},{"key":"abaeb9ef-0a6b-4822-baa8-59f65a7c17bd","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (838, 202, 89, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"56651ec4-fcf9-4222-84b4-71651b0b2c0a","mediaKey":"e1608a61-9e16-4a2d-8c41-c2d022f92019"},{"key":"ada5159d-84ec-4356-a926-ab52c470fd20","mediaKey":"20e2f580-0b47-4117-af55-82625901da3a"},{"key":"2874eb88-4274-405a-902d-29edd41babf8","mediaKey":"d63ac7f4-bf41-4a35-a575-781d1bb54ef9"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (839, 202, 90, NULL, NULL, NULL, NULL, NULL, NULL, N'Центральная библиотека;
Польза для ребенка;
Территория для научной работы')
GO
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (840, 202, 91, NULL, NULL, NULL, NULL, NULL, NULL, N'Новоуральского городского округа;
Читай вместе с нами!')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (841, 202, 92, NULL, NULL, NULL, NULL, NULL, NULL, N'Предоставление места для работы и научной деятельности. <br />
В библиотеке имеются необходимые условия для <br />
полноценной научно-исследовательской деятельности. <br />
В читальном зале можно проводить выставки и  <br />
конференции, презентации и творческие вечера.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (842, 203, 84, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"e2bb3035-8e32-4013-8e00-68f56e58365f","mediaKey":"77eaf172-3e1e-4155-9a2f-414ee4bd1d11"},{"key":"816397dc-93c9-4834-9603-50dd043381e8","mediaKey":"94bec0ad-70c6-4d3d-bde5-e1ba85c55045"},{"key":"43704885-3b42-4cd3-a205-a9422a72aa15","mediaKey":"a69a6b38-22ce-4041-9c4a-0ea209815a2f"},{"key":"ea7e088f-e5a3-404f-af3a-492863951131","mediaKey":"d051fa54-8b5f-403a-b3ae-32d3821b5702"},{"key":"176ccc5f-51e9-44cb-9483-fb1496968d98","mediaKey":"e6007303-cce1-4f8e-8b21-11cfae11cc8b"},{"key":"64a2fb09-47b2-47ca-a003-f2f0ca57437a","mediaKey":"08f1ea61-cfb3-4778-bf36-936022f83cd2"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (843, 203, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Праздник лета')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (844, 203, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'завершён;
подготовка;
подготовка;
завершён;
завершён;
актуально')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (845, 203, 87, NULL, NULL, NULL, NULL, NULL, NULL, N'Events;
Contests;
Stock;
Exhibitions;
Holidays;
Other')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (846, 203, 88, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b542d0db-d348-4e8a-89fb-b2a36ddd02a4","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"},{"key":"fc10de40-dd29-4f4a-b973-94ae5eeb1078","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"},{"key":"abaeb9ef-0a6b-4822-baa8-59f65a7c17bd","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (847, 203, 89, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"56651ec4-fcf9-4222-84b4-71651b0b2c0a","mediaKey":"e1608a61-9e16-4a2d-8c41-c2d022f92019"},{"key":"ada5159d-84ec-4356-a926-ab52c470fd20","mediaKey":"20e2f580-0b47-4117-af55-82625901da3a"},{"key":"2874eb88-4274-405a-902d-29edd41babf8","mediaKey":"d63ac7f4-bf41-4a35-a575-781d1bb54ef9"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (848, 203, 90, NULL, NULL, NULL, NULL, NULL, NULL, N'Центральная библиотека;
Польза для ребенка;
Территория для научной работы')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (849, 203, 91, NULL, NULL, NULL, NULL, NULL, NULL, N'Новоуральского городского округа;
Читай вместе с нами!')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (850, 203, 92, NULL, NULL, NULL, NULL, NULL, NULL, N'Предоставление места для работы и научной деятельности. <br />
В библиотеке имеются необходимые условия для <br />
полноценной научно-исследовательской деятельности. <br />
В читальном зале можно проводить выставки и  <br />
конференции, презентации и творческие вечера.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (851, 204, 84, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"e2bb3035-8e32-4013-8e00-68f56e58365f","mediaKey":"77eaf172-3e1e-4155-9a2f-414ee4bd1d11"},{"key":"816397dc-93c9-4834-9603-50dd043381e8","mediaKey":"94bec0ad-70c6-4d3d-bde5-e1ba85c55045"},{"key":"43704885-3b42-4cd3-a205-a9422a72aa15","mediaKey":"a69a6b38-22ce-4041-9c4a-0ea209815a2f"},{"key":"ea7e088f-e5a3-404f-af3a-492863951131","mediaKey":"d051fa54-8b5f-403a-b3ae-32d3821b5702"},{"key":"176ccc5f-51e9-44cb-9483-fb1496968d98","mediaKey":"e6007303-cce1-4f8e-8b21-11cfae11cc8b"},{"key":"64a2fb09-47b2-47ca-a003-f2f0ca57437a","mediaKey":"08f1ea61-cfb3-4778-bf36-936022f83cd2"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (852, 204, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Праздник лета')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (853, 204, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'завершён;
подготовка;
подготовка;
завершён;
завершён;
актуально')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (854, 204, 87, NULL, NULL, NULL, NULL, NULL, NULL, N'Events;
Contests;
Stock;
Exhibitions;
Holidays;
Other')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (855, 204, 88, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b542d0db-d348-4e8a-89fb-b2a36ddd02a4","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"},{"key":"fc10de40-dd29-4f4a-b973-94ae5eeb1078","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"},{"key":"abaeb9ef-0a6b-4822-baa8-59f65a7c17bd","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (856, 204, 89, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"56651ec4-fcf9-4222-84b4-71651b0b2c0a","mediaKey":"e1608a61-9e16-4a2d-8c41-c2d022f92019"},{"key":"ada5159d-84ec-4356-a926-ab52c470fd20","mediaKey":"20e2f580-0b47-4117-af55-82625901da3a"},{"key":"2874eb88-4274-405a-902d-29edd41babf8","mediaKey":"d63ac7f4-bf41-4a35-a575-781d1bb54ef9"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (857, 204, 90, NULL, NULL, NULL, NULL, NULL, NULL, N'Центральная библиотека;
Польза для ребенка;
Территория для научной работы')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (858, 204, 91, NULL, NULL, NULL, NULL, NULL, NULL, N'Новоуральского городского округа;
Читай вместе с нами!')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (859, 204, 92, NULL, NULL, NULL, NULL, NULL, NULL, N'Предоставление места для работы и научной деятельности. <br />
В библиотеке имеются необходимые условия для <br />
полноценной научно-исследовательской деятельности. <br />
В читальном зале можно проводить выставки и  <br />
конференции, презентации и творческие вечера.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (860, 203, 93, NULL, NULL, NULL, NULL, NULL, NULL, N'Онлайн-зал;
Медиатека;
Досуг;
Абонемент
')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (861, 204, 93, NULL, NULL, NULL, NULL, NULL, NULL, N'Онлайн-зал;
Медиатека;
Досуг;
Абонемент
')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (862, 205, 84, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"e2bb3035-8e32-4013-8e00-68f56e58365f","mediaKey":"77eaf172-3e1e-4155-9a2f-414ee4bd1d11"},{"key":"816397dc-93c9-4834-9603-50dd043381e8","mediaKey":"94bec0ad-70c6-4d3d-bde5-e1ba85c55045"},{"key":"43704885-3b42-4cd3-a205-a9422a72aa15","mediaKey":"a69a6b38-22ce-4041-9c4a-0ea209815a2f"},{"key":"ea7e088f-e5a3-404f-af3a-492863951131","mediaKey":"d051fa54-8b5f-403a-b3ae-32d3821b5702"},{"key":"176ccc5f-51e9-44cb-9483-fb1496968d98","mediaKey":"e6007303-cce1-4f8e-8b21-11cfae11cc8b"},{"key":"64a2fb09-47b2-47ca-a003-f2f0ca57437a","mediaKey":"08f1ea61-cfb3-4778-bf36-936022f83cd2"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (863, 205, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Праздник лета')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (864, 205, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'завершён;
подготовка;
подготовка;
завершён;
завершён;
актуально')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (865, 205, 87, NULL, NULL, NULL, NULL, NULL, NULL, N'Events;
Contests;
Stock;
Exhibitions;
Holidays;
Other')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (866, 205, 88, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b542d0db-d348-4e8a-89fb-b2a36ddd02a4","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"},{"key":"fc10de40-dd29-4f4a-b973-94ae5eeb1078","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"},{"key":"abaeb9ef-0a6b-4822-baa8-59f65a7c17bd","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (867, 205, 89, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"56651ec4-fcf9-4222-84b4-71651b0b2c0a","mediaKey":"e1608a61-9e16-4a2d-8c41-c2d022f92019"},{"key":"ada5159d-84ec-4356-a926-ab52c470fd20","mediaKey":"20e2f580-0b47-4117-af55-82625901da3a"},{"key":"2874eb88-4274-405a-902d-29edd41babf8","mediaKey":"d63ac7f4-bf41-4a35-a575-781d1bb54ef9"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (868, 205, 90, NULL, NULL, NULL, NULL, NULL, NULL, N'Центральная библиотека;
Польза для ребенка;
Территория для научной работы')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (869, 205, 91, NULL, NULL, NULL, NULL, NULL, NULL, N'Новоуральского городского округа;
Читай вместе с нами!')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (870, 205, 92, NULL, NULL, NULL, NULL, NULL, NULL, N'Предоставление места для работы и научной деятельности. <br />
В библиотеке имеются необходимые условия для <br />
полноценной научно-исследовательской деятельности. <br />
В читальном зале можно проводить выставки и  <br />
конференции, презентации и творческие вечера.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (871, 205, 93, NULL, NULL, NULL, NULL, NULL, NULL, N'Онлайн-зал;
Медиатека;
Досуг;
Абонемент
')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (872, 204, 94, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"dca6f400-e973-4dea-919b-07fa51eba33e","mediaKey":"80c3e1ef-964f-421a-b80d-33e38d50a80c"},{"key":"7bf1b1b0-c319-4744-b451-60db367c0b4a","mediaKey":"9ec378ba-b54a-4c49-b7f1-6fd70016639e"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (873, 205, 94, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"dca6f400-e973-4dea-919b-07fa51eba33e","mediaKey":"80c3e1ef-964f-421a-b80d-33e38d50a80c"},{"key":"7bf1b1b0-c319-4744-b451-60db367c0b4a","mediaKey":"9ec378ba-b54a-4c49-b7f1-6fd70016639e"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (874, 204, 95, NULL, NULL, NULL, NULL, NULL, NULL, N'Мне очень понравилось в библиотеке!;
Пришли с ребёнком на праздник, были в восторге!')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (875, 205, 95, NULL, NULL, NULL, NULL, NULL, NULL, N'Мне очень понравилось в библиотеке!;
Пришли с ребёнком на праздник, были в восторге!')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (876, 204, 96, NULL, NULL, NULL, NULL, NULL, NULL, N'Данил Балякин;
Екатерина Мартынова')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (877, 205, 96, NULL, NULL, NULL, NULL, NULL, NULL, N'Данил Балякин;
Екатерина Мартынова')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (878, 206, 84, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"e2bb3035-8e32-4013-8e00-68f56e58365f","mediaKey":"77eaf172-3e1e-4155-9a2f-414ee4bd1d11"},{"key":"816397dc-93c9-4834-9603-50dd043381e8","mediaKey":"94bec0ad-70c6-4d3d-bde5-e1ba85c55045"},{"key":"43704885-3b42-4cd3-a205-a9422a72aa15","mediaKey":"a69a6b38-22ce-4041-9c4a-0ea209815a2f"},{"key":"ea7e088f-e5a3-404f-af3a-492863951131","mediaKey":"d051fa54-8b5f-403a-b3ae-32d3821b5702"},{"key":"176ccc5f-51e9-44cb-9483-fb1496968d98","mediaKey":"e6007303-cce1-4f8e-8b21-11cfae11cc8b"},{"key":"64a2fb09-47b2-47ca-a003-f2f0ca57437a","mediaKey":"08f1ea61-cfb3-4778-bf36-936022f83cd2"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (879, 206, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Праздник лета')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (880, 206, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'завершён;
подготовка;
подготовка;
завершён;
завершён;
актуально')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (881, 206, 87, NULL, NULL, NULL, NULL, NULL, NULL, N'Events;
Contests;
Stock;
Exhibitions;
Holidays;
Other')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (882, 206, 88, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b542d0db-d348-4e8a-89fb-b2a36ddd02a4","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"},{"key":"fc10de40-dd29-4f4a-b973-94ae5eeb1078","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"},{"key":"abaeb9ef-0a6b-4822-baa8-59f65a7c17bd","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (883, 206, 89, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"56651ec4-fcf9-4222-84b4-71651b0b2c0a","mediaKey":"e1608a61-9e16-4a2d-8c41-c2d022f92019"},{"key":"ada5159d-84ec-4356-a926-ab52c470fd20","mediaKey":"20e2f580-0b47-4117-af55-82625901da3a"},{"key":"2874eb88-4274-405a-902d-29edd41babf8","mediaKey":"d63ac7f4-bf41-4a35-a575-781d1bb54ef9"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (884, 206, 90, NULL, NULL, NULL, NULL, NULL, NULL, N'Центральная библиотека;
Польза для ребенка;
Территория для научной работы')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (885, 206, 91, NULL, NULL, NULL, NULL, NULL, NULL, N'Новоуральского городского округа;
Читай вместе с нами!')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (886, 206, 92, NULL, NULL, NULL, NULL, NULL, NULL, N'Предоставление места для работы и научной деятельности. <br />
В библиотеке имеются необходимые условия для <br />
полноценной научно-исследовательской деятельности. <br />
В читальном зале можно проводить выставки и  <br />
конференции, презентации и творческие вечера.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (887, 206, 93, NULL, NULL, NULL, NULL, NULL, NULL, N'Онлайн-зал;
Медиатека;
Досуг;
Абонемент
')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (888, 206, 94, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"dca6f400-e973-4dea-919b-07fa51eba33e","mediaKey":"80c3e1ef-964f-421a-b80d-33e38d50a80c"},{"key":"7bf1b1b0-c319-4744-b451-60db367c0b4a","mediaKey":"9ec378ba-b54a-4c49-b7f1-6fd70016639e"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (889, 206, 95, NULL, NULL, NULL, NULL, NULL, NULL, N'Мне очень понравилось в библиотеке!;
Пришли с ребёнком на праздник, были в восторге!')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (890, 206, 96, NULL, NULL, NULL, NULL, NULL, NULL, N'Данил Балякин;
Екатерина Мартынова')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (891, 207, 84, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"e2bb3035-8e32-4013-8e00-68f56e58365f","mediaKey":"77eaf172-3e1e-4155-9a2f-414ee4bd1d11"},{"key":"816397dc-93c9-4834-9603-50dd043381e8","mediaKey":"94bec0ad-70c6-4d3d-bde5-e1ba85c55045"},{"key":"43704885-3b42-4cd3-a205-a9422a72aa15","mediaKey":"a69a6b38-22ce-4041-9c4a-0ea209815a2f"},{"key":"ea7e088f-e5a3-404f-af3a-492863951131","mediaKey":"d051fa54-8b5f-403a-b3ae-32d3821b5702"},{"key":"176ccc5f-51e9-44cb-9483-fb1496968d98","mediaKey":"e6007303-cce1-4f8e-8b21-11cfae11cc8b"},{"key":"64a2fb09-47b2-47ca-a003-f2f0ca57437a","mediaKey":"08f1ea61-cfb3-4778-bf36-936022f83cd2"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (892, 207, 85, NULL, NULL, NULL, NULL, NULL, NULL, N'День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Атомграды России;
День защиты детей🌟;
Праздник лета')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (893, 207, 86, NULL, NULL, NULL, NULL, NULL, NULL, N'завершён;
подготовка;
подготовка;
завершён;
завершён;
актуально')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (894, 207, 87, NULL, NULL, NULL, NULL, NULL, NULL, N'Events;
Contests;
Stock;
Exhibitions;
Holidays;
Other')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (895, 207, 88, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b542d0db-d348-4e8a-89fb-b2a36ddd02a4","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"},{"key":"fc10de40-dd29-4f4a-b973-94ae5eeb1078","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"},{"key":"abaeb9ef-0a6b-4822-baa8-59f65a7c17bd","mediaKey":"0afa4d1f-c201-44de-ab3e-976cb44be58e"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (896, 207, 89, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"56651ec4-fcf9-4222-84b4-71651b0b2c0a","mediaKey":"e1608a61-9e16-4a2d-8c41-c2d022f92019"},{"key":"ada5159d-84ec-4356-a926-ab52c470fd20","mediaKey":"20e2f580-0b47-4117-af55-82625901da3a"},{"key":"2874eb88-4274-405a-902d-29edd41babf8","mediaKey":"d63ac7f4-bf41-4a35-a575-781d1bb54ef9"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (897, 207, 90, NULL, NULL, NULL, NULL, NULL, NULL, N'Центральная библиотека;
Польза для ребенка;
Территория для научной работы')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (898, 207, 91, NULL, NULL, NULL, NULL, NULL, NULL, N'Новоуральского городского округа;
Читай вместе с нами!')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (899, 207, 92, NULL, NULL, NULL, NULL, NULL, NULL, N'Предоставление места для работы и научной деятельности. <br />
В библиотеке имеются необходимые условия для <br />
полноценной научно-исследовательской деятельности. <br />
В читальном зале можно проводить выставки и  <br />
конференции, презентации и творческие вечера.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (900, 207, 93, NULL, NULL, NULL, NULL, NULL, NULL, N'Онлайн-зал;
Медиатека;
Досуг;
Абонемент
')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (901, 207, 94, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"dca6f400-e973-4dea-919b-07fa51eba33e","mediaKey":"80c3e1ef-964f-421a-b80d-33e38d50a80c"},{"key":"7bf1b1b0-c319-4744-b451-60db367c0b4a","mediaKey":"9ec378ba-b54a-4c49-b7f1-6fd70016639e"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (902, 207, 95, NULL, NULL, NULL, NULL, NULL, NULL, N'Мне очень понравилось в библиотеке!;
Пришли с ребёнком на праздник, были в восторге!')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (903, 207, 96, NULL, NULL, NULL, NULL, NULL, NULL, N'Данил Балякин;
Екатерина Мартынова')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (904, 186, 97, NULL, NULL, NULL, NULL, NULL, NULL, N'О Библиотеке')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (905, 186, 98, NULL, NULL, NULL, NULL, NULL, NULL, N'Библиотека осуществляет информационную поддержку молодёжи в учебно-образовательном и самообразовательном процессе, оказывает профориентационные, психологические, образовательные услуги; организует просветительскую и культурно-досуговую работу. В библиотеке работают около 15 клубов и объединений по интересам. Профессиональный психолог ведет индивидуальные консультации по различным проблемам, волнующим молодых людей.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (906, 186, 99, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"e96c6866-bbe3-49f0-8aec-674549583de0","mediaKey":"98a35be3-3631-4e27-bf49-f6ef47a6b7ae"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (907, 186, 100, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"117c62f1-50c2-4dd5-8763-59114699c8c6","mediaKey":"50ec88f3-e892-408f-a734-788c986b73b2"},{"key":"f8c65524-d23b-4644-aca8-d33d84644824","mediaKey":"a2902a71-1410-462e-9028-3ec0007e8a24"},{"key":"ec8a6987-28a5-44d6-9f43-52ba93353955","mediaKey":"7f571a7d-e213-43c4-bed2-084fd7dc0e84"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (908, 186, 101, NULL, NULL, NULL, NULL, NULL, NULL, N'Иван Иванов;
Иванова Настя;
Иван Иванов')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (909, 186, 102, NULL, NULL, NULL, NULL, NULL, NULL, N'специалист;
специалист;
специалист')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (910, 208, 97, NULL, NULL, NULL, NULL, NULL, NULL, N'О Библиотеке')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (911, 208, 98, NULL, NULL, NULL, NULL, NULL, NULL, N'Библиотека осуществляет информационную поддержку молодёжи в учебно-образовательном и самообразовательном процессе, оказывает профориентационные, психологические, образовательные услуги; организует просветительскую и культурно-досуговую работу. В библиотеке работают около 15 клубов и объединений по интересам. Профессиональный психолог ведет индивидуальные консультации по различным проблемам, волнующим молодых людей.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (912, 208, 99, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"e96c6866-bbe3-49f0-8aec-674549583de0","mediaKey":"98a35be3-3631-4e27-bf49-f6ef47a6b7ae"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (913, 208, 100, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"117c62f1-50c2-4dd5-8763-59114699c8c6","mediaKey":"50ec88f3-e892-408f-a734-788c986b73b2"},{"key":"f8c65524-d23b-4644-aca8-d33d84644824","mediaKey":"a2902a71-1410-462e-9028-3ec0007e8a24"},{"key":"ec8a6987-28a5-44d6-9f43-52ba93353955","mediaKey":"7f571a7d-e213-43c4-bed2-084fd7dc0e84"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (914, 208, 101, NULL, NULL, NULL, NULL, NULL, NULL, N'Иван Иванов;
Иванова Настя;
Иван Иванов')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (915, 208, 102, NULL, NULL, NULL, NULL, NULL, NULL, N'специалист;
специалист;
специалист')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (916, 186, 103, NULL, NULL, NULL, NULL, NULL, NULL, N'Устав библиотеки;
Свидетельство о государственной регистрации;
Копия решения учредителя о создании организации культуры;
Копия решения о назначении руководителя организации культуры;
Муниципальное задание на оказание услуг в 2021 году')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (917, 208, 103, NULL, NULL, NULL, NULL, NULL, NULL, N'Устав библиотеки;
Свидетельство о государственной регистрации;
Копия решения учредителя о создании организации культуры;
Копия решения о назначении руководителя организации культуры;
Муниципальное задание на оказание услуг в 2021 году')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (918, 186, 104, NULL, NULL, NULL, NULL, NULL, NULL, N'~/docs/ustav.rtf;
~/docs/OGRN.pdf;
~/docs/Kopija_reshenija_o_sozdanii_uchrezhdenija_kultury.pdf;
~/docs/Kopija_reshenija_o_naznachenii_rukovoditelja_Baumshtein.jpg;
~/docs/Munisipalnoe_zadanie_na_okazanie_uslug_v_2021_godu.pdf')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (919, 208, 104, NULL, NULL, NULL, NULL, NULL, NULL, N'~/docs/ustav.rtf;
~/docs/OGRN.pdf;
~/docs/Kopija_reshenija_o_sozdanii_uchrezhdenija_kultury.pdf;
~/docs/Kopija_reshenija_o_naznachenii_rukovoditelja_Baumshtein.jpg;
~/docs/Munisipalnoe_zadanie_na_okazanie_uslug_v_2021_godu.pdf')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (920, 209, 97, NULL, NULL, NULL, NULL, NULL, NULL, N'О Библиотеке')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (921, 209, 98, NULL, NULL, NULL, NULL, NULL, NULL, N'Библиотека осуществляет информационную поддержку молодёжи в учебно-образовательном и самообразовательном процессе, оказывает профориентационные, психологические, образовательные услуги; организует просветительскую и культурно-досуговую работу. В библиотеке работают около 15 клубов и объединений по интересам. Профессиональный психолог ведет индивидуальные консультации по различным проблемам, волнующим молодых людей.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (922, 209, 99, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"e96c6866-bbe3-49f0-8aec-674549583de0","mediaKey":"98a35be3-3631-4e27-bf49-f6ef47a6b7ae"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (923, 209, 100, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"117c62f1-50c2-4dd5-8763-59114699c8c6","mediaKey":"50ec88f3-e892-408f-a734-788c986b73b2"},{"key":"f8c65524-d23b-4644-aca8-d33d84644824","mediaKey":"a2902a71-1410-462e-9028-3ec0007e8a24"},{"key":"ec8a6987-28a5-44d6-9f43-52ba93353955","mediaKey":"7f571a7d-e213-43c4-bed2-084fd7dc0e84"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (924, 209, 101, NULL, NULL, NULL, NULL, NULL, NULL, N'Иван Иванов;
Иванова Настя;
Иван Иванов')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (925, 209, 102, NULL, NULL, NULL, NULL, NULL, NULL, N'специалист;
специалист;
специалист')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (926, 209, 103, NULL, NULL, NULL, NULL, NULL, NULL, N'Устав библиотеки;
Свидетельство о государственной регистрации;
Копия решения учредителя о создании организации культуры;
Копия решения о назначении руководителя организации культуры;
Муниципальное задание на оказание услуг в 2021 году')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (927, 209, 104, NULL, NULL, NULL, NULL, NULL, NULL, N'/docs/ustav.rtf;
/docs/OGRN.pdf;
/docs/Kopija_reshenija_o_sozdanii_uchrezhdenija_kultury.pdf;
/docs/Kopija_reshenija_o_naznachenii_rukovoditelja_Baumshtein.jpg;
/docs/Munisipalnoe_zadanie_na_okazanie_uslug_v_2021_godu.pdf')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (928, 210, 97, NULL, NULL, NULL, NULL, NULL, NULL, N'О Библиотеке')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (929, 210, 98, NULL, NULL, NULL, NULL, NULL, NULL, N'Библиотека осуществляет информационную поддержку молодёжи в учебно-образовательном и самообразовательном процессе, оказывает профориентационные, психологические, образовательные услуги; организует просветительскую и культурно-досуговую работу. В библиотеке работают около 15 клубов и объединений по интересам. Профессиональный психолог ведет индивидуальные консультации по различным проблемам, волнующим молодых людей.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (930, 210, 99, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"e96c6866-bbe3-49f0-8aec-674549583de0","mediaKey":"98a35be3-3631-4e27-bf49-f6ef47a6b7ae"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (931, 210, 100, NULL, NULL, NULL, NULL, NULL, NULL, N'[{"key":"117c62f1-50c2-4dd5-8763-59114699c8c6","mediaKey":"50ec88f3-e892-408f-a734-788c986b73b2"},{"key":"f8c65524-d23b-4644-aca8-d33d84644824","mediaKey":"a2902a71-1410-462e-9028-3ec0007e8a24"},{"key":"ec8a6987-28a5-44d6-9f43-52ba93353955","mediaKey":"7f571a7d-e213-43c4-bed2-084fd7dc0e84"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (932, 210, 101, NULL, NULL, NULL, NULL, NULL, NULL, N'Иван Иванов;
Иванова Настя;
Иван Иванов')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (933, 210, 102, NULL, NULL, NULL, NULL, NULL, NULL, N'специалист;
специалист;
специалист')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (934, 210, 103, NULL, NULL, NULL, NULL, NULL, NULL, N'Устав библиотеки;
Свидетельство о государственной регистрации;
Копия решения учредителя о создании организации культуры;
Копия решения о назначении руководителя организации культуры;
Муниципальное задание на оказание услуг в 2021 году')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (935, 210, 104, NULL, NULL, NULL, NULL, NULL, NULL, N'/docs/ustav.rtf;
/docs/OGRN.pdf;
/docs/Kopija_reshenija_o_sozdanii_uchrezhdenija_kultury.pdf;
/docs/Kopija_reshenija_o_naznachenii_rukovoditelja_Baumshtein.jpg;
/docs/Munisipalnoe_zadanie_na_okazanie_uslug_v_2021_godu.pdf')
SET IDENTITY_INSERT [dbo].[umbracoPropertyData] OFF
GO
SET IDENTITY_INSERT [dbo].[umbracoRelation] ON 

INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (200, 1088, 1189, 4, CAST(N'2022-06-08T01:38:14.887' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (201, 1088, 1190, 4, CAST(N'2022-06-08T01:38:14.887' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (202, 1088, 1192, 4, CAST(N'2022-06-08T01:38:14.887' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (203, 1088, 1191, 4, CAST(N'2022-06-08T01:38:14.887' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (204, 1088, 1193, 4, CAST(N'2022-06-08T01:38:14.887' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (205, 1088, 1194, 4, CAST(N'2022-06-08T01:38:14.887' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (206, 1088, 1195, 4, CAST(N'2022-06-08T01:38:14.887' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (207, 1088, 1173, 4, CAST(N'2022-06-08T01:38:14.887' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (208, 1088, 1174, 4, CAST(N'2022-06-08T01:38:14.887' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (209, 1088, 1175, 4, CAST(N'2022-06-08T01:38:14.887' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (210, 1088, 1176, 4, CAST(N'2022-06-08T01:38:14.887' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (211, 1088, 1180, 4, CAST(N'2022-06-08T01:38:14.887' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (212, 1088, 1178, 4, CAST(N'2022-06-08T01:38:14.887' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (213, 1088, 1177, 4, CAST(N'2022-06-08T01:38:14.887' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (214, 1088, 1179, 4, CAST(N'2022-06-08T01:38:14.887' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (215, 1088, 1181, 4, CAST(N'2022-06-08T01:38:14.887' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (216, 1088, 1182, 4, CAST(N'2022-06-08T01:38:14.887' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (477, 1074, 1189, 4, CAST(N'2022-06-08T02:42:30.740' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (478, 1074, 1190, 4, CAST(N'2022-06-08T02:42:30.740' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (479, 1074, 1191, 4, CAST(N'2022-06-08T02:42:30.740' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (480, 1074, 1192, 4, CAST(N'2022-06-08T02:42:30.740' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (481, 1074, 1193, 4, CAST(N'2022-06-08T02:42:30.740' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (482, 1074, 1194, 4, CAST(N'2022-06-08T02:42:30.740' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (483, 1074, 1173, 4, CAST(N'2022-06-08T02:42:30.740' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (484, 1074, 1203, 4, CAST(N'2022-06-08T02:42:30.740' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (485, 1074, 1204, 4, CAST(N'2022-06-08T02:42:30.740' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (486, 1074, 1205, 4, CAST(N'2022-06-08T02:42:30.740' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (487, 1074, 1209, 4, CAST(N'2022-06-08T02:42:30.740' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (488, 1074, 1210, 4, CAST(N'2022-06-08T02:42:30.740' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (509, 1079, 1212, 4, CAST(N'2022-06-08T03:09:33.883' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (510, 1079, 1213, 4, CAST(N'2022-06-08T03:09:33.883' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (511, 1079, 1214, 4, CAST(N'2022-06-08T03:09:33.883' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (512, 1079, 1215, 4, CAST(N'2022-06-08T03:09:33.883' AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[umbracoRelation] OFF
GO
SET IDENTITY_INSERT [dbo].[umbracoRelationType] ON 

INSERT [dbo].[umbracoRelationType] ([id], [typeUniqueId], [dual], [parentObjectType], [childObjectType], [name], [alias], [isDependency]) VALUES (1, N'4cbeb612-e689-3563-b755-bf3ede295433', 1, N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'Relate Document On Copy', N'relateDocumentOnCopy', 0)
INSERT [dbo].[umbracoRelationType] ([id], [typeUniqueId], [dual], [parentObjectType], [childObjectType], [name], [alias], [isDependency]) VALUES (2, N'0cc3507c-66ab-3091-8913-3d998148e423', 0, N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'Relate Parent Document On Delete', N'relateParentDocumentOnDelete', 0)
INSERT [dbo].[umbracoRelationType] ([id], [typeUniqueId], [dual], [parentObjectType], [childObjectType], [name], [alias], [isDependency]) VALUES (3, N'8307994f-faf2-3844-bab9-72d34514edf2', 0, N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', N'Relate Parent Media Folder On Delete', N'relateParentMediaFolderOnDelete', 0)
INSERT [dbo].[umbracoRelationType] ([id], [typeUniqueId], [dual], [parentObjectType], [childObjectType], [name], [alias], [isDependency]) VALUES (4, N'4954ce93-3bf9-3d1e-9cd2-21bf9f9c2abf', 0, NULL, NULL, N'Related Media', N'umbMedia', 1)
INSERT [dbo].[umbracoRelationType] ([id], [typeUniqueId], [dual], [parentObjectType], [childObjectType], [name], [alias], [isDependency]) VALUES (5, N'0b93e414-5abe-36ec-a6bb-516e56f12238', 0, NULL, NULL, N'Related Document', N'umbDocument', 1)
SET IDENTITY_INSERT [dbo].[umbracoRelationType] OFF
GO
SET IDENTITY_INSERT [dbo].[umbracoServer] ON 

INSERT [dbo].[umbracoServer] ([id], [address], [computerName], [registeredDate], [lastNotifiedDate], [isActive], [isSchedulingPublisher]) VALUES (1, N'https://localhost:44304/', N'LITA_PC/622a5053f6f025bb48f9de324fb751bc305c08eb', CAST(N'2022-06-03T14:59:08.320' AS DateTime), CAST(N'2022-06-08T05:23:38.443' AS DateTime), 1, 1)
INSERT [dbo].[umbracoServer] ([id], [address], [computerName], [registeredDate], [lastNotifiedDate], [isActive], [isSchedulingPublisher]) VALUES (2, N'https://localhost:44381/', N'LITA_PC/0f1afbf9643e6ca54811bdc46d0d337263b42692', CAST(N'2022-06-04T22:54:02.360' AS DateTime), CAST(N'2022-06-04T23:13:21.007' AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[umbracoServer] OFF
GO
SET IDENTITY_INSERT [dbo].[umbracoUser] ON 

INSERT [dbo].[umbracoUser] ([id], [userDisabled], [userNoConsole], [userName], [userLogin], [userPassword], [passwordConfig], [userEmail], [userLanguage], [securityStampToken], [failedLoginAttempts], [lastLockoutDate], [lastPasswordChangeDate], [lastLoginDate], [emailConfirmedDate], [invitedDate], [createDate], [updateDate], [avatar], [tourData]) VALUES (-1, 0, 0, N'admin', N'super.yttt2017@yandex.ru', N'AQAAAAEAACcQAAAAEE2fEGzbmrNjwxjvN03b7cGNeg8HtRYaQK0bK3L9vuZHUE63TieXBv+8sHdQn2v11Q==', N'{"hashAlgorithm":"PBKDF2.ASPNETCORE.V3"}', N'super.yttt2017@yandex.ru', N'en-US', N'PVZNLCELSDNINYQ3IKXFG56NZUZNMLK7', 0, NULL, CAST(N'2022-06-03T14:58:29.287' AS DateTime), CAST(N'2022-06-08T04:42:28.603' AS DateTime), NULL, NULL, CAST(N'2022-06-03T14:58:27.650' AS DateTime), CAST(N'2022-06-08T04:42:28.613' AS DateTime), NULL, N'[{"alias":"umbIntroIntroduction","completed":false,"disabled":true},{"alias":"umbEmailMarketing","completed":false,"disabled":true}]')
SET IDENTITY_INSERT [dbo].[umbracoUser] OFF
GO
INSERT [dbo].[umbracoUser2UserGroup] ([userId], [userGroupId]) VALUES (-1, 1)
INSERT [dbo].[umbracoUser2UserGroup] ([userId], [userGroupId]) VALUES (-1, 5)
GO
SET IDENTITY_INSERT [dbo].[umbracoUserGroup] ON 

INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (1, N'admin', N'Administrators', N'CADMOSKTPIURZ:5F7ïN', CAST(N'2022-06-03T14:58:28.533' AS DateTime), CAST(N'2022-06-03T14:58:28.533' AS DateTime), N'icon-medal', -1, -1)
INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (2, N'writer', N'Writers', N'CAH:FN', CAST(N'2022-06-03T14:58:28.537' AS DateTime), CAST(N'2022-06-03T14:58:28.537' AS DateTime), N'icon-edit', -1, -1)
INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (3, N'editor', N'Editors', N'CADMOSKTPUZ:5FïN', CAST(N'2022-06-03T14:58:28.537' AS DateTime), CAST(N'2022-06-03T14:58:28.537' AS DateTime), N'icon-tools', -1, -1)
INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (4, N'translator', N'Translators', N'AF', CAST(N'2022-06-03T14:58:28.537' AS DateTime), CAST(N'2022-06-03T14:58:28.537' AS DateTime), N'icon-globe', -1, -1)
INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (5, N'sensitiveData', N'Sensitive data', N'', CAST(N'2022-06-03T14:58:28.537' AS DateTime), CAST(N'2022-06-03T14:58:28.537' AS DateTime), N'icon-lock', -1, -1)
SET IDENTITY_INSERT [dbo].[umbracoUserGroup] OFF
GO
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'content')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'forms')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'media')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'member')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'packages')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'settings')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'translation')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'users')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (2, N'content')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (3, N'content')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (3, N'forms')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (3, N'media')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (4, N'translation')
GO
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'542c8440-82cc-4fcd-aa50-0ce3f58d7851', -1, CAST(N'2022-06-03T11:09:51.937' AS DateTime), CAST(N'2022-06-03T13:39:50.950' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'64c3a3c7-4af3-4b41-bdb0-2793ef42fe5b', -1, CAST(N'2022-06-03T09:58:45.837' AS DateTime), CAST(N'2022-06-03T10:56:59.700' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'1eb3a558-70c4-4226-b97b-28c26ee70bef', -1, CAST(N'2022-06-07T17:01:34.253' AS DateTime), CAST(N'2022-06-07T22:36:15.423' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'73a1f9da-5913-4732-ba07-2ba441daaa15', -1, CAST(N'2022-06-07T23:42:28.603' AS DateTime), CAST(N'2022-06-08T00:02:45.840' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'990eb6c5-7a1a-4374-a81a-2bfd5c978b9a', -1, CAST(N'2022-06-03T14:34:38.400' AS DateTime), CAST(N'2022-06-03T14:37:22.973' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'4cc61f32-c4c5-49ba-a17c-6bc9be1e7edf', -1, CAST(N'2022-06-04T17:53:55.513' AS DateTime), CAST(N'2022-06-04T17:53:55.513' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'227772e6-6498-4610-8a8e-8f2f59205fce', -1, CAST(N'2022-06-07T23:03:35.317' AS DateTime), CAST(N'2022-06-07T23:20:42.477' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'636b6af6-0b76-4fe7-ae89-98b695ca1aa9', -1, CAST(N'2022-06-07T22:36:15.663' AS DateTime), CAST(N'2022-06-07T22:36:15.663' AS DateTime), NULL, N'::1')
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'7bdbd4b2-afb7-407d-baad-a96fddb797ce', -1, CAST(N'2022-06-04T18:13:53.843' AS DateTime), CAST(N'2022-06-04T18:13:53.843' AS DateTime), NULL, N'::1')
GO
/****** Object:  Index [UK_UFDataSource_Key]    Script Date: 08.06.2022 5:24:01 ******/
ALTER TABLE [dbo].[UFDataSource] ADD  CONSTRAINT [UK_UFDataSource_Key] UNIQUE NONCLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK_UFFolders_Key]    Script Date: 08.06.2022 5:24:01 ******/
ALTER TABLE [dbo].[UFFolders] ADD  CONSTRAINT [UK_UFFolders_Key] UNIQUE NONCLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK_UFForms_Key]    Script Date: 08.06.2022 5:24:01 ******/
ALTER TABLE [dbo].[UFForms] ADD  CONSTRAINT [UK_UFForms_Key] UNIQUE NONCLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK_UFPrevalueSource_Key]    Script Date: 08.06.2022 5:24:01 ******/
ALTER TABLE [dbo].[UFPrevalueSource] ADD  CONSTRAINT [UK_UFPrevalueSource_Key] UNIQUE NONCLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_UFUserFormSecurity_User_Form]    Script Date: 08.06.2022 5:24:01 ******/
ALTER TABLE [dbo].[UFUserFormSecurity] ADD  CONSTRAINT [UK_UFUserFormSecurity_User_Form] UNIQUE NONCLUSTERED 
(
	[User] ASC,
	[Form] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK_UFUserGroupFormSecurity_UserGroupId_Form]    Script Date: 08.06.2022 5:24:01 ******/
ALTER TABLE [dbo].[UFUserGroupFormSecurity] ADD  CONSTRAINT [UK_UFUserGroupFormSecurity_UserGroupId_Form] UNIQUE NONCLUSTERED 
(
	[UserGroupId] ASC,
	[Form] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK_UFWorkflows_Key]    Script Date: 08.06.2022 5:24:01 ******/
ALTER TABLE [dbo].[UFWorkflows] ADD  CONSTRAINT [UK_UFWorkflows_Key] UNIQUE NONCLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_thumbnail]  DEFAULT ('folder.png') FOR [thumbnail]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_isContainer]  DEFAULT ('0') FOR [isContainer]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_isElement]  DEFAULT ('0') FOR [isElement]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_allowAtRoot]  DEFAULT ('0') FOR [allowAtRoot]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_variations]  DEFAULT ('1') FOR [variations]
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] ADD  CONSTRAINT [df_cmsContentTypeAllowedContentType_sortOrder]  DEFAULT ('0') FOR [SortOrder]
GO
ALTER TABLE [dbo].[cmsDocumentType] ADD  CONSTRAINT [DF_cmsDocumentType_IsDefault]  DEFAULT ('0') FOR [IsDefault]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroUseInEditor]  DEFAULT ('0') FOR [macroUseInEditor]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroRefreshRate]  DEFAULT ('0') FOR [macroRefreshRate]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroCacheByPage]  DEFAULT ('1') FOR [macroCacheByPage]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroCachePersonalized]  DEFAULT ('0') FOR [macroCachePersonalized]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroDontRender]  DEFAULT ('0') FOR [macroDontRender]
GO
ALTER TABLE [dbo].[cmsMacroProperty] ADD  CONSTRAINT [DF_cmsMacroProperty_macroPropertySortOrder]  DEFAULT ('0') FOR [macroPropertySortOrder]
GO
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_Email]  DEFAULT ('''') FOR [Email]
GO
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_LoginName]  DEFAULT ('''') FOR [LoginName]
GO
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_Password]  DEFAULT ('''') FOR [Password]
GO
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_memberCanEdit]  DEFAULT ('0') FOR [memberCanEdit]
GO
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_viewOnProfile]  DEFAULT ('0') FOR [viewOnProfile]
GO
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_isSensitive]  DEFAULT ('0') FOR [isSensitive]
GO
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_sortOrder]  DEFAULT ('0') FOR [sortOrder]
GO
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_mandatory]  DEFAULT ('0') FOR [mandatory]
GO
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_labelOnTop]  DEFAULT ('0') FOR [labelOnTop]
GO
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_variations]  DEFAULT ('1') FOR [variations]
GO
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_UniqueID]  DEFAULT (newid()) FOR [UniqueID]
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup] ADD  CONSTRAINT [DF_cmsPropertyTypeGroup_uniqueID]  DEFAULT (newid()) FOR [uniqueID]
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup] ADD  CONSTRAINT [DF_cmsPropertyTypeGroup_type]  DEFAULT ('0') FOR [type]
GO
ALTER TABLE [dbo].[UFUserGroupSecurity] ADD  CONSTRAINT [DF_UFUserGroupSecurity_ViewEntries]  DEFAULT ('0') FOR [ViewEntries]
GO
ALTER TABLE [dbo].[UFUserGroupSecurity] ADD  CONSTRAINT [DF_UFUserGroupSecurity_EditEntries]  DEFAULT ('0') FOR [EditEntries]
GO
ALTER TABLE [dbo].[UFUserSecurity] ADD  CONSTRAINT [DF_UFUserSecurity_ViewEntries]  DEFAULT ('0') FOR [ViewEntries]
GO
ALTER TABLE [dbo].[UFUserSecurity] ADD  CONSTRAINT [DF_UFUserSecurity_EditEntries]  DEFAULT ('0') FOR [EditEntries]
GO
ALTER TABLE [dbo].[umbracoAccess] ADD  CONSTRAINT [DF_umbracoAccess_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoAccess] ADD  CONSTRAINT [DF_umbracoAccess_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[umbracoAccessRule] ADD  CONSTRAINT [DF_umbracoAccessRule_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoAccessRule] ADD  CONSTRAINT [DF_umbracoAccessRule_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[umbracoAudit] ADD  CONSTRAINT [DF_umbracoAudit_eventDateUtc]  DEFAULT (getdate()) FOR [eventDateUtc]
GO
ALTER TABLE [dbo].[umbracoCacheInstruction] ADD  CONSTRAINT [DF_umbracoCacheInstruction_instructionCount]  DEFAULT ('1') FOR [instructionCount]
GO
ALTER TABLE [dbo].[umbracoConsent] ADD  CONSTRAINT [DF_umbracoConsent_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoContentVersion] ADD  CONSTRAINT [DF_umbracoContentVersion_versionDate]  DEFAULT (getdate()) FOR [versionDate]
GO
ALTER TABLE [dbo].[umbracoContentVersion] ADD  CONSTRAINT [DF_umbracoContentVersion_preventCleanup]  DEFAULT ('0') FOR [preventCleanup]
GO
ALTER TABLE [dbo].[umbracoCreatedPackageSchema] ADD  CONSTRAINT [DF_umbracoCreatedPackageSchema_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[umbracoExternalLogin] ADD  CONSTRAINT [DF_umbracoExternalLogin_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoExternalLoginToken] ADD  CONSTRAINT [DF_umbracoExternalLoginToken_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoKeyValue] ADD  CONSTRAINT [DF_umbracoKeyValue_updated]  DEFAULT (getdate()) FOR [updated]
GO
ALTER TABLE [dbo].[umbracoLanguage] ADD  CONSTRAINT [DF_umbracoLanguage_isDefaultVariantLang]  DEFAULT ('0') FOR [isDefaultVariantLang]
GO
ALTER TABLE [dbo].[umbracoLanguage] ADD  CONSTRAINT [DF_umbracoLanguage_mandatory]  DEFAULT ('0') FOR [mandatory]
GO
ALTER TABLE [dbo].[umbracoLog] ADD  CONSTRAINT [DF_umbracoLog_Datestamp]  DEFAULT (getdate()) FOR [Datestamp]
GO
ALTER TABLE [dbo].[umbracoNode] ADD  CONSTRAINT [DF_umbracoNode_uniqueId]  DEFAULT (newid()) FOR [uniqueId]
GO
ALTER TABLE [dbo].[umbracoNode] ADD  CONSTRAINT [DF_umbracoNode_trashed]  DEFAULT ('0') FOR [trashed]
GO
ALTER TABLE [dbo].[umbracoNode] ADD  CONSTRAINT [DF_umbracoNode_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoRelation] ADD  CONSTRAINT [DF_umbracoRelation_datetime]  DEFAULT (getdate()) FOR [datetime]
GO
ALTER TABLE [dbo].[umbracoRelationType] ADD  CONSTRAINT [DF_umbracoRelationType_isDependency]  DEFAULT ('0') FOR [isDependency]
GO
ALTER TABLE [dbo].[umbracoServer] ADD  CONSTRAINT [DF_umbracoServer_registeredDate]  DEFAULT (getdate()) FOR [registeredDate]
GO
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_userDisabled]  DEFAULT ('0') FOR [userDisabled]
GO
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_userNoConsole]  DEFAULT ('0') FOR [userNoConsole]
GO
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[umbracoUserGroup] ADD  CONSTRAINT [DF_umbracoUserGroup_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoUserGroup] ADD  CONSTRAINT [DF_umbracoUserGroup_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[cmsContentNu]  WITH NOCHECK ADD  CONSTRAINT [FK_cmsContentNu_umbracoContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[cmsContentNu] CHECK CONSTRAINT [FK_cmsContentNu_umbracoContent_nodeId]
GO
ALTER TABLE [dbo].[cmsContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType] CHECK CONSTRAINT [FK_cmsContentType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsContentType2ContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child] FOREIGN KEY([childContentTypeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType2ContentType] CHECK CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child]
GO
ALTER TABLE [dbo].[cmsContentType2ContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent] FOREIGN KEY([parentContentTypeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType2ContentType] CHECK CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent]
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType] FOREIGN KEY([Id])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] CHECK CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType]
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType1] FOREIGN KEY([AllowedId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] CHECK CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType1]
GO
ALTER TABLE [dbo].[cmsDictionary]  WITH CHECK ADD  CONSTRAINT [FK_cmsDictionary_cmsDictionary_id] FOREIGN KEY([parent])
REFERENCES [dbo].[cmsDictionary] ([id])
GO
ALTER TABLE [dbo].[cmsDictionary] CHECK CONSTRAINT [FK_cmsDictionary_cmsDictionary_id]
GO
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_cmsContentType_nodeId] FOREIGN KEY([contentTypeNodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_cmsTemplate_nodeId] FOREIGN KEY([templateNodeId])
REFERENCES [dbo].[cmsTemplate] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_cmsTemplate_nodeId]
GO
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_umbracoNode_id] FOREIGN KEY([contentTypeNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsLanguageText]  WITH CHECK ADD  CONSTRAINT [FK_cmsLanguageText_cmsDictionary_id] FOREIGN KEY([UniqueId])
REFERENCES [dbo].[cmsDictionary] ([id])
GO
ALTER TABLE [dbo].[cmsLanguageText] CHECK CONSTRAINT [FK_cmsLanguageText_cmsDictionary_id]
GO
ALTER TABLE [dbo].[cmsLanguageText]  WITH CHECK ADD  CONSTRAINT [FK_cmsLanguageText_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[cmsLanguageText] CHECK CONSTRAINT [FK_cmsLanguageText_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[cmsMacroProperty]  WITH CHECK ADD  CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id] FOREIGN KEY([macro])
REFERENCES [dbo].[cmsMacro] ([id])
GO
ALTER TABLE [dbo].[cmsMacroProperty] CHECK CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id]
GO
ALTER TABLE [dbo].[cmsMember]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember_umbracoContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMember] CHECK CONSTRAINT [FK_cmsMember_umbracoContent_nodeId]
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId] FOREIGN KEY([Member])
REFERENCES [dbo].[cmsMember] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup] CHECK CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId]
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id] FOREIGN KEY([MemberGroup])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup] CHECK CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsMemberType]  WITH CHECK ADD  CONSTRAINT [FK_cmsMemberType_cmsContentType_nodeId] FOREIGN KEY([NodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMemberType] CHECK CONSTRAINT [FK_cmsMemberType_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsMemberType]  WITH CHECK ADD  CONSTRAINT [FK_cmsMemberType_umbracoNode_id] FOREIGN KEY([NodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMemberType] CHECK CONSTRAINT [FK_cmsMemberType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsContentType_nodeId] FOREIGN KEY([contentTypeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id] FOREIGN KEY([propertyTypeGroupId])
REFERENCES [dbo].[cmsPropertyTypeGroup] ([id])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id]
GO
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_umbracoDataType_nodeId] FOREIGN KEY([dataTypeId])
REFERENCES [dbo].[umbracoDataType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_umbracoDataType_nodeId]
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyTypeGroup_cmsContentType_nodeId] FOREIGN KEY([contenttypeNodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup] CHECK CONSTRAINT [FK_cmsPropertyTypeGroup_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsContent] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsContent]
GO
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsPropertyType] FOREIGN KEY([propertyTypeId])
REFERENCES [dbo].[cmsPropertyType] ([id])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsPropertyType]
GO
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsTags_id] FOREIGN KEY([tagId])
REFERENCES [dbo].[cmsTags] ([id])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsTags_id]
GO
ALTER TABLE [dbo].[cmsTags]  WITH CHECK ADD  CONSTRAINT [FK_cmsTags_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[cmsTags] CHECK CONSTRAINT [FK_cmsTags_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[cmsTemplate]  WITH CHECK ADD  CONSTRAINT [FK_cmsTemplate_umbracoNode] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsTemplate] CHECK CONSTRAINT [FK_cmsTemplate_umbracoNode]
GO
ALTER TABLE [dbo].[UFFolders]  WITH CHECK ADD  CONSTRAINT [FK_UFFolders_UFFolders_ParentKey] FOREIGN KEY([ParentKey])
REFERENCES [dbo].[UFFolders] ([Key])
GO
ALTER TABLE [dbo].[UFFolders] CHECK CONSTRAINT [FK_UFFolders_UFFolders_ParentKey]
GO
ALTER TABLE [dbo].[UFForms]  WITH CHECK ADD  CONSTRAINT [FK_UFForms_UFFolders_FolderKey] FOREIGN KEY([FolderKey])
REFERENCES [dbo].[UFFolders] ([Key])
GO
ALTER TABLE [dbo].[UFForms] CHECK CONSTRAINT [FK_UFForms_UFFolders_FolderKey]
GO
ALTER TABLE [dbo].[UFRecordAudit]  WITH CHECK ADD  CONSTRAINT [FK_UFRecordAudit_UFRecords_Id] FOREIGN KEY([Record])
REFERENCES [dbo].[UFRecords] ([Id])
GO
ALTER TABLE [dbo].[UFRecordAudit] CHECK CONSTRAINT [FK_UFRecordAudit_UFRecords_Id]
GO
ALTER TABLE [dbo].[UFRecordDataBit]  WITH CHECK ADD  CONSTRAINT [FK_UFRecordDataBit_UFRecordFields_Key] FOREIGN KEY([Key])
REFERENCES [dbo].[UFRecordFields] ([Key])
GO
ALTER TABLE [dbo].[UFRecordDataBit] CHECK CONSTRAINT [FK_UFRecordDataBit_UFRecordFields_Key]
GO
ALTER TABLE [dbo].[UFRecordDataDateTime]  WITH CHECK ADD  CONSTRAINT [FK_UFRecordDataDateTime_UFRecordFields_Key] FOREIGN KEY([Key])
REFERENCES [dbo].[UFRecordFields] ([Key])
GO
ALTER TABLE [dbo].[UFRecordDataDateTime] CHECK CONSTRAINT [FK_UFRecordDataDateTime_UFRecordFields_Key]
GO
ALTER TABLE [dbo].[UFRecordDataInteger]  WITH CHECK ADD  CONSTRAINT [FK_UFRecordDataInteger_UFRecordFields_Key] FOREIGN KEY([Key])
REFERENCES [dbo].[UFRecordFields] ([Key])
GO
ALTER TABLE [dbo].[UFRecordDataInteger] CHECK CONSTRAINT [FK_UFRecordDataInteger_UFRecordFields_Key]
GO
ALTER TABLE [dbo].[UFRecordDataLongString]  WITH CHECK ADD  CONSTRAINT [FK_UFRecordDataLongString_UFRecordFields_Key] FOREIGN KEY([Key])
REFERENCES [dbo].[UFRecordFields] ([Key])
GO
ALTER TABLE [dbo].[UFRecordDataLongString] CHECK CONSTRAINT [FK_UFRecordDataLongString_UFRecordFields_Key]
GO
ALTER TABLE [dbo].[UFRecordDataString]  WITH CHECK ADD  CONSTRAINT [FK_UFRecordDataString_UFRecordFields_Key] FOREIGN KEY([Key])
REFERENCES [dbo].[UFRecordFields] ([Key])
GO
ALTER TABLE [dbo].[UFRecordDataString] CHECK CONSTRAINT [FK_UFRecordDataString_UFRecordFields_Key]
GO
ALTER TABLE [dbo].[UFRecordFields]  WITH CHECK ADD  CONSTRAINT [FK_UFRecordFields_UFRecords_Record] FOREIGN KEY([Record])
REFERENCES [dbo].[UFRecords] ([Id])
GO
ALTER TABLE [dbo].[UFRecordFields] CHECK CONSTRAINT [FK_UFRecordFields_UFRecords_Record]
GO
ALTER TABLE [dbo].[UFUserGroupStartFolders]  WITH CHECK ADD  CONSTRAINT [FK_UFUserGroupStartFolders_UFFolders_FolderKey] FOREIGN KEY([FolderKey])
REFERENCES [dbo].[UFFolders] ([Key])
GO
ALTER TABLE [dbo].[UFUserGroupStartFolders] CHECK CONSTRAINT [FK_UFUserGroupStartFolders_UFFolders_FolderKey]
GO
ALTER TABLE [dbo].[UFUserStartFolders]  WITH CHECK ADD  CONSTRAINT [FK_UFUserStartFolders_UFFolders_FolderKey] FOREIGN KEY([FolderKey])
REFERENCES [dbo].[UFFolders] ([Key])
GO
ALTER TABLE [dbo].[UFUserStartFolders] CHECK CONSTRAINT [FK_UFUserStartFolders_UFFolders_FolderKey]
GO
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id1] FOREIGN KEY([loginNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id1]
GO
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id2] FOREIGN KEY([noAccessNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id2]
GO
ALTER TABLE [dbo].[umbracoAccessRule]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccessRule_umbracoAccess_id] FOREIGN KEY([accessId])
REFERENCES [dbo].[umbracoAccess] ([id])
GO
ALTER TABLE [dbo].[umbracoAccessRule] CHECK CONSTRAINT [FK_umbracoAccessRule_umbracoAccess_id]
GO
ALTER TABLE [dbo].[umbracoContent]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContent_cmsContentType_NodeId] FOREIGN KEY([contentTypeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[umbracoContent] CHECK CONSTRAINT [FK_umbracoContent_cmsContentType_NodeId]
GO
ALTER TABLE [dbo].[umbracoContent]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContent_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoContent] CHECK CONSTRAINT [FK_umbracoContent_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoContentSchedule]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentSchedule_umbracoContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
GO
ALTER TABLE [dbo].[umbracoContentSchedule] CHECK CONSTRAINT [FK_umbracoContentSchedule_umbracoContent_nodeId]
GO
ALTER TABLE [dbo].[umbracoContentSchedule]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentSchedule_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[umbracoContentSchedule] CHECK CONSTRAINT [FK_umbracoContentSchedule_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[umbracoContentVersion]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentVersion_umbracoContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
GO
ALTER TABLE [dbo].[umbracoContentVersion] CHECK CONSTRAINT [FK_umbracoContentVersion_umbracoContent_nodeId]
GO
ALTER TABLE [dbo].[umbracoContentVersion]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentVersion_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoContentVersion] CHECK CONSTRAINT [FK_umbracoContentVersion_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoContentVersionCleanupPolicy]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentVersionCleanupPolicy_cmsContentType_nodeId] FOREIGN KEY([contentTypeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[umbracoContentVersionCleanupPolicy] CHECK CONSTRAINT [FK_umbracoContentVersionCleanupPolicy_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoContentVersion_id] FOREIGN KEY([versionId])
REFERENCES [dbo].[umbracoContentVersion] ([id])
GO
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation] CHECK CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoContentVersion_id]
GO
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation] CHECK CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoUser_id] FOREIGN KEY([availableUserId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation] CHECK CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoDataType]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDataType_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoDataType] CHECK CONSTRAINT [FK_umbracoDataType_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoDocument]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDocument_umbracoContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
GO
ALTER TABLE [dbo].[umbracoDocument] CHECK CONSTRAINT [FK_umbracoDocument_umbracoContent_nodeId]
GO
ALTER TABLE [dbo].[umbracoDocumentCultureVariation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDocumentCultureVariation_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[umbracoDocumentCultureVariation] CHECK CONSTRAINT [FK_umbracoDocumentCultureVariation_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[umbracoDocumentCultureVariation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDocumentCultureVariation_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoDocumentCultureVariation] CHECK CONSTRAINT [FK_umbracoDocumentCultureVariation_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoDocumentVersion]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDocumentVersion_cmsTemplate_nodeId] FOREIGN KEY([templateId])
REFERENCES [dbo].[cmsTemplate] ([nodeId])
GO
ALTER TABLE [dbo].[umbracoDocumentVersion] CHECK CONSTRAINT [FK_umbracoDocumentVersion_cmsTemplate_nodeId]
GO
ALTER TABLE [dbo].[umbracoDocumentVersion]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDocumentVersion_umbracoContentVersion_id] FOREIGN KEY([id])
REFERENCES [dbo].[umbracoContentVersion] ([id])
GO
ALTER TABLE [dbo].[umbracoDocumentVersion] CHECK CONSTRAINT [FK_umbracoDocumentVersion_umbracoContentVersion_id]
GO
ALTER TABLE [dbo].[umbracoDomain]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDomain_umbracoNode_id] FOREIGN KEY([domainRootStructureID])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoDomain] CHECK CONSTRAINT [FK_umbracoDomain_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoExternalLoginToken]  WITH CHECK ADD  CONSTRAINT [FK_umbracoExternalLoginToken_umbracoExternalLogin_id] FOREIGN KEY([externalLoginId])
REFERENCES [dbo].[umbracoExternalLogin] ([id])
GO
ALTER TABLE [dbo].[umbracoExternalLoginToken] CHECK CONSTRAINT [FK_umbracoExternalLoginToken_umbracoExternalLogin_id]
GO
ALTER TABLE [dbo].[umbracoLanguage]  WITH CHECK ADD  CONSTRAINT [FK_umbracoLanguage_umbracoLanguage_id] FOREIGN KEY([fallbackLanguageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[umbracoLanguage] CHECK CONSTRAINT [FK_umbracoLanguage_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[umbracoLog]  WITH CHECK ADD  CONSTRAINT [FK_umbracoLog_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoLog] CHECK CONSTRAINT [FK_umbracoLog_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoMediaVersion]  WITH CHECK ADD  CONSTRAINT [FK_umbracoMediaVersion_umbracoContentVersion_id] FOREIGN KEY([id])
REFERENCES [dbo].[umbracoContentVersion] ([id])
GO
ALTER TABLE [dbo].[umbracoMediaVersion] CHECK CONSTRAINT [FK_umbracoMediaVersion_umbracoContentVersion_id]
GO
ALTER TABLE [dbo].[umbracoNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoNode_umbracoNode_id] FOREIGN KEY([parentId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoNode] CHECK CONSTRAINT [FK_umbracoNode_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoNode_umbracoUser_id] FOREIGN KEY([nodeUser])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoNode] CHECK CONSTRAINT [FK_umbracoNode_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_umbracoPropertyData_cmsPropertyType_id] FOREIGN KEY([propertyTypeId])
REFERENCES [dbo].[cmsPropertyType] ([id])
GO
ALTER TABLE [dbo].[umbracoPropertyData] CHECK CONSTRAINT [FK_umbracoPropertyData_cmsPropertyType_id]
GO
ALTER TABLE [dbo].[umbracoPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_umbracoPropertyData_umbracoContentVersion_id] FOREIGN KEY([versionId])
REFERENCES [dbo].[umbracoContentVersion] ([id])
GO
ALTER TABLE [dbo].[umbracoPropertyData] CHECK CONSTRAINT [FK_umbracoPropertyData_umbracoContentVersion_id]
GO
ALTER TABLE [dbo].[umbracoPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_umbracoPropertyData_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[umbracoPropertyData] CHECK CONSTRAINT [FK_umbracoPropertyData_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[umbracoRedirectUrl]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRedirectUrl_umbracoNode_uniqueID] FOREIGN KEY([contentKey])
REFERENCES [dbo].[umbracoNode] ([uniqueId])
GO
ALTER TABLE [dbo].[umbracoRedirectUrl] CHECK CONSTRAINT [FK_umbracoRedirectUrl_umbracoNode_uniqueID]
GO
ALTER TABLE [dbo].[umbracoRelation]  WITH NOCHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoNode] FOREIGN KEY([parentId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoNode]
GO
ALTER TABLE [dbo].[umbracoRelation]  WITH NOCHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoNode1] FOREIGN KEY([childId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoNode1]
GO
ALTER TABLE [dbo].[umbracoRelation]  WITH NOCHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id] FOREIGN KEY([relType])
REFERENCES [dbo].[umbracoRelationType] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id]
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify] CHECK CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify] CHECK CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoUser2UserGroup]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2UserGroup] CHECK CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoUser2UserGroup]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUserGroup_id] FOREIGN KEY([userGroupId])
REFERENCES [dbo].[umbracoUserGroup] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2UserGroup] CHECK CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUserGroup_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup]  WITH CHECK ADD  CONSTRAINT [FK_startContentId_umbracoNode_id] FOREIGN KEY([startContentId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup] CHECK CONSTRAINT [FK_startContentId_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup]  WITH CHECK ADD  CONSTRAINT [FK_startMediaId_umbracoNode_id] FOREIGN KEY([startMediaId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup] CHECK CONSTRAINT [FK_startMediaId_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup2App]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserGroup2App_umbracoUserGroup_id] FOREIGN KEY([userGroupId])
REFERENCES [dbo].[umbracoUserGroup] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup2App] CHECK CONSTRAINT [FK_umbracoUserGroup2App_umbracoUserGroup_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup2Node]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserGroup2Node_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup2Node] CHECK CONSTRAINT [FK_umbracoUserGroup2Node_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup2Node]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserGroup2Node_umbracoUserGroup_id] FOREIGN KEY([userGroupId])
REFERENCES [dbo].[umbracoUserGroup] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup2Node] CHECK CONSTRAINT [FK_umbracoUserGroup2Node_umbracoUserGroup_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup2NodePermission]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup2NodePermission] CHECK CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup2NodePermission]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoUserGroup_id] FOREIGN KEY([userGroupId])
REFERENCES [dbo].[umbracoUserGroup] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup2NodePermission] CHECK CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoUserGroup_id]
GO
ALTER TABLE [dbo].[umbracoUserLogin]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserLogin_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUserLogin] CHECK CONSTRAINT [FK_umbracoUserLogin_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoUserStartNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserStartNode_umbracoNode_id] FOREIGN KEY([startNode])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUserStartNode] CHECK CONSTRAINT [FK_umbracoUserStartNode_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUserStartNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserStartNode_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUserStartNode] CHECK CONSTRAINT [FK_umbracoUserStartNode_umbracoUser_id]
GO
