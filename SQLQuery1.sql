USE [master]
GO
/****** Object:  Database [Agriculture_Seeds_Sandeep]    Script Date: 15-12-2019 04:39:32 PM ******/
CREATE DATABASE [Agriculture_Seeds_Sandeep]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Agriculture_Seeds_Sandeep', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Agriculture_Seeds_Sandeep.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Agriculture_Seeds_Sandeep_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Agriculture_Seeds_Sandeep_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Agriculture_Seeds_Sandeep] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Agriculture_Seeds_Sandeep].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Agriculture_Seeds_Sandeep] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Agriculture_Seeds_Sandeep] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Agriculture_Seeds_Sandeep] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Agriculture_Seeds_Sandeep] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Agriculture_Seeds_Sandeep] SET ARITHABORT OFF 
GO
ALTER DATABASE [Agriculture_Seeds_Sandeep] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Agriculture_Seeds_Sandeep] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Agriculture_Seeds_Sandeep] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Agriculture_Seeds_Sandeep] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Agriculture_Seeds_Sandeep] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Agriculture_Seeds_Sandeep] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Agriculture_Seeds_Sandeep] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Agriculture_Seeds_Sandeep] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Agriculture_Seeds_Sandeep] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Agriculture_Seeds_Sandeep] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Agriculture_Seeds_Sandeep] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Agriculture_Seeds_Sandeep] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Agriculture_Seeds_Sandeep] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Agriculture_Seeds_Sandeep] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Agriculture_Seeds_Sandeep] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Agriculture_Seeds_Sandeep] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Agriculture_Seeds_Sandeep] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Agriculture_Seeds_Sandeep] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Agriculture_Seeds_Sandeep] SET  MULTI_USER 
GO
ALTER DATABASE [Agriculture_Seeds_Sandeep] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Agriculture_Seeds_Sandeep] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Agriculture_Seeds_Sandeep] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Agriculture_Seeds_Sandeep] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Agriculture_Seeds_Sandeep] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Agriculture_Seeds_Sandeep]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 15-12-2019 04:39:32 PM ******/
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
/****** Object:  Table [dbo].[AgricultureCropRates]    Script Date: 15-12-2019 04:39:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgricultureCropRates](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgricultureCropVarietyID] [int] NOT NULL,
	[Rate] [nvarchar](max) NULL,
	[Quantity] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_dbo.AgricultureCropRates] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AgricultureCrops]    Script Date: 15-12-2019 04:39:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgricultureCrops](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CropName] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AgricultureCrops] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AgricultureCropVarieties]    Script Date: 15-12-2019 04:39:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgricultureCropVarieties](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgricultureCropID] [int] NOT NULL,
	[VarietyName] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AgricultureCropVarieties] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AgricultureSeedSellings]    Script Date: 15-12-2019 04:39:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgricultureSeedSellings](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[AgricultureCropVarietyID] [int] NOT NULL,
	[NoofBags] [nvarchar](max) NULL,
	[Amount] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_dbo.AgricultureSeedSellings] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AgricultureStores]    Script Date: 15-12-2019 04:39:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgricultureStores](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgricultureCropVarietyID] [int] NOT NULL,
	[Quantity] [decimal](18, 2) NOT NULL,
	[NoofBags] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AgricultureStores] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 15-12-2019 04:39:32 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 15-12-2019 04:39:32 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 15-12-2019 04:39:32 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 15-12-2019 04:39:32 PM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 15-12-2019 04:39:32 PM ******/
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
/****** Object:  Table [dbo].[BankPayments]    Script Date: 15-12-2019 04:39:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankPayments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[TransactionDate] [datetime] NOT NULL,
	[TransactionNumber] [nvarchar](max) NULL,
	[AmountReceived] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_dbo.BankPayments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 15-12-2019 04:39:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Customers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201912110625352_InitialCreate', N'Agriculture_Seeds_Sandeep.Migrations.Configuration', 0x1F8B0800000000000400ED5DDB6EE4B8117D0F907F10FA2909BCEEB19D5D4C06ED5D78ECF1C6C88CC7717B1679336889B685D1A55752CFDA08F6CBF2904FCA2F84D49514EF127569C3F08B5B228BC5E2A9E2A5A8AAFFFDE7BFAB9F9EC2C0F90693D48FA3E3C5C1FE9B85032337F6FCE8E178B1CDEEBF7BBBF8E9C73FFE61F5C10B9F9C5FAA7247B81CAA19A5C78BC72CDBBC5B2E53F7118620DD0F7D3789D3F83EDB77E37009BC7879F8E6CDDF9607074B88482C102DC7595D6FA3CC0F61FE03FD3C8D23176EB22D083EC51E0CD2F2397AB3CEA93A972084E906B8F07871F290F8EE36C8B609BC5D43E8A5B76B1079106EF68BBA0BE724F001E26B0D83FB8503A228CE4086B87EF72585EB2C89A387F5063D00C1CDF306A272F7204861D99B774D71DD8EBD39C41D5B36152B52EE36CDE2D090E0C15129A965BB7A27792F6A4922597E4032CF9E71AF737952A23C4DE2CD35C8901CDAEDBE3B0D125C472DF97D0EBD3D47586BAF8613421DFEDB734E8B72C711DC660908F69CABED5DE0BBFF80CF37F157181D47DB2020BB843A85DE510FD0A32BD4364CB2E76B785F76F4E26CE12CE97ACB76C5BA1A51A7E8F745941D1D2E9C4BD438B80B608D184246EB2C4EE0CF308209EAB37705B20C2668C02F3C98CB9C69BDD5564B70BF80C487D9B39A0339D5623C0B0A08F848A317CE27F0F411460FD9E3F102FDBB70CEFD27E8554F4AAA5F221F190054294BB6CA46FEB90565178B86CEA0EB872058385709FAAFB42A6F17CEDA0598718D5E5C826FFE432E562D292D9C6B18E4C5D3477F53A87D1B8965D15B0E4091BD384FE2F03A0E842D70ABDDDE80E40166A8DBB179DD75BC4DDC56CF57CB463F4DB4B616833DC52D49BEEA6E07DDEDABB4A5ECF10FFBBAABAB5A3A3AD54676C1B82F5528611D9536892BF254C9A0A7A50998C68454BC77312195C03AF41B6B32EA628040A5EC3A51963F06CF82CEAB2BCAC65CA3768F81CF355EDD755CCAB0D3922AD2EECAEAD99C2C6CCE12AFD383CEF4802535AD31270CF3D8565D61E0D4D3415FCC1376C416F40992AF1AA0A501B9D861D2776534CC26E9328EEFDF033C110EBC513A09E36D94CD769B34E4442F310306CB04DDFE5778E3F6B87A79CBE7813273AAB2CC8CAEACD06B2A6FFAD5C39055445E4D9789E91A66026F3576F51847F0721BDEE1211EDA18791E5A010F60F4ACEC3FAC2A69DBF8686B75EFB507C69EB5550726F6AAB4D31DA6DA3FE71C6D21627BA560795F2C5B1DE8ECA73BE9E97B107DBD02CF21C44BB21E2A4AD079D54E1DED1C652ABD4940940217F37B463841F0FF373E6EDF5037097A634DD0F96EE11ABAD0FF063D4B46475B3BAAC1C40A29538F4FB5EFF124DD5CC26CBFAAB85F903C4F10B9DFE2E4EB3E4971CFD1AED728CEA1AEE21C1DDCDD1FBDFDFE07E01DFDF05778F47D2725F23A28912701C5C1E15B2D5098CE1972653AFCFE072BAD0A27902F291A1DEE7C418EF76D59AC991AD8B7CC2CC029D2CBE057F43029FBB0AEA8CE1FDA985316DEDCA2B8435D34A16A626C6DA8F81DB65DFDADC06683062F87169648BF9D004D6B264B8D1DB1921F42E00716CCA4462BA77174EF27613363BF8F11284164CCF31548536425BCBF83F471F0C5C61ABADB0481779D8170F3A2CE3988B6AC0DCDCD6FF1395A0BC6C98708D7EA4DEF63EC7E8DB7D987C8C3EBD32F99CB2E5735095861E7C475619A9E233043EF943CB2EEB66FC6E66AEA65CA6900FC50E0FEA20DEB6D5594D8C6724BB0BB567E31D3C3EB8FF1831FE9B15A1515B35A9450B25A1633651513D3E3B42C2966342FA0E4B328656D15988F90FD65604E76FEEBC07E93F7F0E704532D22F3E1C38D0E3E37E52DFD0282ADEDA63A69436E04EC6B434E76FEDA90B3891E7FF33DBC2AD1D81C55851179ADF2FC7D975AE75A9C8DAD0E5437C76E7C1C1B20529793348D5D3FD702FE79B9F8AE0CDD2BB4B273BA5E9C297ACEB9A883E4807EF8788644BC23512CDA18FC1C9DC10066D039718BCF0F4E41EA028F953AEABFD79BE3DA172EE4B87611D08CFF85E107290D4CB07900783F9522A5F7A38CD5303F72FD0D083A8AB6454FF32C1D4BAB6EB9FDE60C6E6084ED5A47D9E9B0C4B96DCC725833D21A679560574B02F346AA20BD1DAB892DBDABB2A6F01A472FF4BE1410F25E7CA931865EE808797CD5D0115F07ED205CBF532B89C6F52A0DA899DCB5E2828DBA0FA9C25B57163A4F055675B5AFB6E877745C7DD1C7C00E6A8CF2E68F08A1FAD7801A503617EA469932F4AF13F657DD4EE0D795E10878D795950E2BE4FDE3C9A701D9DD191DEBAB7591868F9FE23A5A37A3AFF55DCB6E9B7B8D2E8E6CE835C67A074D3CE766800881B26B020DD8E8CB2AA39872C9E5040E63CD958341CCB6584A5A78E5DD05D0C7AB58123A8DF36F188C6596F9AE1FA13954F88108EBD776FC8FB323953BA004B82C9D20C36C3DA5121B019C7291E83020BC2D3305404B879F2E00DADEBFB901B4E5761400B4F44B8C02505A6213009416C9CE01B4F0F3EA8E7FCBE93B3778D2DEE6F1A775A9B826C026258F9941B370E0A03A19AA0113169E6777F8257CE25DF6477C964ECEB4F417B5218289AF61268D20D1F8906447BCCC664B4A9AF8F85A45BEDE6299B5A041D98424FD91968C32759AA168A0DAC0F348366738065C96E11FA4FC15BB650551E2EB0F1E3DEA231305A9F28E0C4383DEDD2888B44D938C6063BE1444CBDBDBACB4DA66DA80B9EA9A9594BB726D6A40B6BA1225255BAE285A6409CB22D416497004A2BA696085B679ECE12EAE65C35374C60EF7F0F28A1B2264D29E7C69119B8B5F1E82473902FA3ECACE9E3EF53808C5D3DBBB286EB31490CDE1D08916201D10537F98058F185F40F494A53726063EB0711445FDC1343B1866AE966ECE16A2F7C4242E11B2B68FC47C307B025EFAD1AB1CEADA67FEBD4EFD051229D73A9AC0D639E71F07D2BC0FC85831AB0E93758F93893E95EB2689C024A7BF041DCE5AAC3F2005B7D539F8D338DC3439DE243A560E860C51F2A3488190AACE589752B52A544B8977C26672C6D64B4AADF3308194AACE5897528951B59038A73C06E73CBD44449FC95852B6EAFE677D7C50BF5B2D8BF0D3E583D55210A77AF5096C3678CE696A964F9C7511B4FAF4BBB579FCE6B0A0B1742969B70F3BEA9690ED060FB0F516358D383DF793343B0319B803F8F6EBA91732C5B88725829D57D5A4E43C841DD36A475655C6FF3304B4E34A734EA04AC2E7480A78C79D0B04CA57C52C1507871C0701483821124EE3601B466237AFB8B6D8054BD2D477D48A5B2A8E9948AABC8327198526D00949A579CA525A2D5BA2670EFC98D1678E65696475C19D6C436D0F7B82759B39FC84844641A0027A66B4A990C52455EAC55C71332C5EFA03652C8434814A491ACDD3398E9F62BF6A6718C9A3EA5EA3292534D0A01277DFA86195DC8913531B6F1A6B826191949BA7063C976137290ECB67B3817473386215C4B573C41CB6E2AAC302956381A837FA14A930032441EA850190AA90891492AA87B381127BF633985DCC5D64FD2C229FC4AE2FC2CD97D0F6ECE044B0A33CA15611473A51CDC126AD3D0CCE5813666ABA98F0752431E66527BA3CC3C8796D3ACF3601EBD8F9B679371BD48A8EB27AC095F2D79BE3555E5D08D896C079D76EC4B5F5013BD130B1A77B830C597D23A2FBB0894988845FDD9222C52FBA3925A6525DA4A60E7E0497AB271B46917FA6CF72A47507A5C36A444561189D2B63929104CA47863488B0560C31E29DC1BA998A3C462D9CA937FA145BE1C54892AD57D3ADEEF981C204843BC9950D1B46CDBDCC5B7DCA9C00622469CEEB0EB4393CB7DF192C16D81863D47A817DAD4FBB0938D636A9339ED584EE594BD35A7195AEDFBC26A0318C7DB4332D12C19CA82385E6B121AD325C1343AC7C3E4B6C099DDA96B055DCA7EC872D010DB155A28222D146491AC9494C938A7444197E59A427313D33040F8A13C6C3DD2E52B75E7BBA5B1EED55E95D56A76766DCCD45111CB2BC10239AF49FD30C86FBB8C0FEFAD7E034F0F1EEBC2EF00944FE3D4CB322BAD7E2F0CDC1612BA7F37CF22B2FD3D4A362E7EA2559A6876E84B8FE3E16B032229FE5845C3E37B7C20532244FC78B7FE744DE3917FF12DC37BB38DB733E27080FEF9C37CEEFBD921F47DF40E23E82E44F2178FA3349A94B82636FA418FC5A41025E08747A63A627583849770D30D33919E7CB18CBC6453C8AE4845ED4DD1520932051570B9A9ABDE03F6B43DECE8BD4CB98D34918C732E57C67EACEE3B5A3D2B3043911E1FB8D329DDD6E6883C43A31777668676D092CAFC4AC9A9A4E89C75E0666AC990141D62E0FFD9F59CDDA65610A6967E61A6B2A11FB07C708FB5E098E0DC26C01336AC3823B8DFFCB1FEF3917E997C8FF758B5EDCA071C306A59D54C2AECC25A9A36A467FDF899C4CFA2247B6BCA84A5BEE9EC34F676A32E2A6A8DA839BCEF99B7657DBA804485CAA2D6DE99EEFE8CECFACE43AEA65A2B9F98C66B54295E525EA2242514EA22EB484F9887813B14E67F9F989BAB026CC4D942F6C7A6626D2374355CD09E7218E336E0C9334C802725E73139300A697A2B3495E86D854E82472E9B744D9B10429D6A6CE2B36FF8935DA53E27EBAA427F34B6A528771D008AF35468E86E91230BCA620E98A8471904A3A356791476402A80ABEFE56E274EAB8D73D821FED2660A9107F1A51005F2E6CE55F90CE1EB9BD93724C9975636E80947C93392708BEA4A419B3379445AC510122F5D276ECB071147C463A7BB3D83191C55C725734DE0C6970D8C153568C99A542F28597AEAB652CF3D72B39C50CC2A97302F9CAC3FC8E11447D6CAC893EBB307001CE3FD1C4CCC0569E7F0AC036623A89B1C126FA0E63E660334A1A3133AC4D357F4E8C34ED2974F214106CF0C3F6B0961FCD483ED6D04CED507CE772BCF0EE620489E2E05D2B10B782877A5BA262A32EA8C1893852AF821B9D7C111AED1BB54B6DCA65CD5305155C484345B79969CE2C98E69B57BC068551AF95F929B4D253A8FAC80DFE2CCB62A14A62C16B904E82A1688BDEF0308DD1AFB9DD4B379730E3C7781535D6586361834D1171A3E2E0B2CC60B66726762CDB25E4CD9AF5B55C514B3B5B9691372B08C92C6BBB5C6049DB2ECBC8DB16043ADE813C1DB210E99CB9507D662526274AFBF3A2726D741080DA892626C9CDD4F432B2650C2354CEFC2C0B7DD95FB413A5BBE0E6B398AD90740FD0874E5E3110E6C835123FAC607F110E9C83821BC19E97924BB1FFE4501126F79A73CE097A38E5D9C554678D0299F0538ACD39C58415A1508B3241F00DFB42192AA3841591D8541D830C126C1C8DD5F27A1BE16BD5C5AF3398FA0F0D8915A21941973AEDA8CB5C44F77175E8D2E2A82AD2BA72F80966C00319384932FF1EB8197A8D6F54E7334E7E4B15DFEBBF83DE45F4799B6DB619EA320CEF02CA2CE3C31B59FB799A0C9AE7D5E70DFE95DAE80262D3C737D13F47EFB77EE0D57C9F732E390A48E053A1F2FE321ECB0CDF637E78AE295DC69126A1527CF561D60D0C37015EE37E8ED6E01BECC21B82DF47F800DCE7E64AAB88887A2068B1AFCE7CF09080302D6934F5D14F84612F7CFAF1FF77AD350413C00000, N'6.2.0-61023')
GO
SET IDENTITY_INSERT [dbo].[AgricultureCrops] ON 

GO
INSERT [dbo].[AgricultureCrops] ([ID], [CropName]) VALUES (1, N'Wheats')
GO
SET IDENTITY_INSERT [dbo].[AgricultureCrops] OFF
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'25084621-54d4-4036-a50c-225ebd12e162', N'sandeep@gmail.com', 0, N'ACY+M1zdrYCauYXIKdOHFn5zhi/1RZFBumhmq/BcN5Y/8SEaVfI+fviwvETakcZPSQ==', N'49a0319d-e9d1-42b0-a35d-7c455306e1ed', NULL, 0, 0, NULL, 1, 0, N'sandeep@gmail.com')
GO
/****** Object:  Index [IX_AgricultureCropVarietyID]    Script Date: 15-12-2019 04:39:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_AgricultureCropVarietyID] ON [dbo].[AgricultureCropRates]
(
	[AgricultureCropVarietyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AgricultureCropID]    Script Date: 15-12-2019 04:39:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_AgricultureCropID] ON [dbo].[AgricultureCropVarieties]
(
	[AgricultureCropID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AgricultureCropVarietyID]    Script Date: 15-12-2019 04:39:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_AgricultureCropVarietyID] ON [dbo].[AgricultureSeedSellings]
(
	[AgricultureCropVarietyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CustomerID]    Script Date: 15-12-2019 04:39:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_CustomerID] ON [dbo].[AgricultureSeedSellings]
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AgricultureCropVarietyID]    Script Date: 15-12-2019 04:39:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_AgricultureCropVarietyID] ON [dbo].[AgricultureStores]
(
	[AgricultureCropVarietyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 15-12-2019 04:39:32 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 15-12-2019 04:39:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 15-12-2019 04:39:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 15-12-2019 04:39:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 15-12-2019 04:39:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 15-12-2019 04:39:32 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AgricultureCropRates]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AgricultureCropRates_dbo.AgricultureCropVarieties_AgricultureCropVarietyID] FOREIGN KEY([AgricultureCropVarietyID])
REFERENCES [dbo].[AgricultureCropVarieties] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AgricultureCropRates] CHECK CONSTRAINT [FK_dbo.AgricultureCropRates_dbo.AgricultureCropVarieties_AgricultureCropVarietyID]
GO
ALTER TABLE [dbo].[AgricultureCropVarieties]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AgricultureCropVarieties_dbo.AgricultureCrops_AgricultureCropID] FOREIGN KEY([AgricultureCropID])
REFERENCES [dbo].[AgricultureCrops] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AgricultureCropVarieties] CHECK CONSTRAINT [FK_dbo.AgricultureCropVarieties_dbo.AgricultureCrops_AgricultureCropID]
GO
ALTER TABLE [dbo].[AgricultureSeedSellings]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AgricultureSeedSellings_dbo.AgricultureCropVarieties_AgricultureCropVarietyID] FOREIGN KEY([AgricultureCropVarietyID])
REFERENCES [dbo].[AgricultureCropVarieties] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AgricultureSeedSellings] CHECK CONSTRAINT [FK_dbo.AgricultureSeedSellings_dbo.AgricultureCropVarieties_AgricultureCropVarietyID]
GO
ALTER TABLE [dbo].[AgricultureSeedSellings]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AgricultureSeedSellings_dbo.Customers_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AgricultureSeedSellings] CHECK CONSTRAINT [FK_dbo.AgricultureSeedSellings_dbo.Customers_CustomerID]
GO
ALTER TABLE [dbo].[AgricultureStores]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AgricultureStores_dbo.AgricultureCropVarieties_AgricultureCropVarietyID] FOREIGN KEY([AgricultureCropVarietyID])
REFERENCES [dbo].[AgricultureCropVarieties] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AgricultureStores] CHECK CONSTRAINT [FK_dbo.AgricultureStores_dbo.AgricultureCropVarieties_AgricultureCropVarietyID]
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
USE [master]
GO
ALTER DATABASE [Agriculture_Seeds_Sandeep] SET  READ_WRITE 
GO
