USE [master]
GO
/****** Object:  Database [PetShop]    Script Date: 1/24/2022 11:52:49 PM ******/
CREATE DATABASE [PetShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PetShop', FILENAME = N'/var/opt/mssql/data/PetShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PetShop_log', FILENAME = N'/var/opt/mssql/data/PetShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PetShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PetShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PetShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PetShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PetShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PetShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PetShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [PetShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PetShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PetShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PetShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PetShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PetShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PetShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PetShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PetShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PetShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PetShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PetShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PetShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PetShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PetShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PetShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PetShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PetShop] SET RECOVERY FULL 
GO
ALTER DATABASE [PetShop] SET  MULTI_USER 
GO
ALTER DATABASE [PetShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PetShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PetShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PetShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PetShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PetShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PetShop', N'ON'
GO
ALTER DATABASE [PetShop] SET QUERY_STORE = OFF
GO
USE [PetShop]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 1/24/2022 11:52:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] NOT NULL,
	[ProductName] [nvarchar](150) NOT NULL,
	[Price] [float] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[ProductTypeId] [int] NOT NULL,
	[BrandId] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[GetProductByBrand]    Script Date: 1/24/2022 11:52:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetProductByBrand] 
(
	-- Add the parameters for the function here
	@BrandId INT
)
RETURNS TABLE
AS
RETURN
	SELECT [ProductId]
      ,[ProductName]
      ,[Price]
      ,[CategoryId]
      ,[ProductTypeId]
      ,[BrandId]
	FROM [PetShop].[dbo].[Product]
	WHERE [BrandId] = @BrandId

GO
/****** Object:  Table [dbo].[Brand]    Script Date: 1/24/2022 11:52:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[BrandId] [int] NOT NULL,
	[BrandName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 1/24/2022 11:52:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] NOT NULL,
	[CategoryName] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 1/24/2022 11:52:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] NOT NULL,
	[OrderTime] [date] NULL,
	[Price] [float] NOT NULL,
	[ProductId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderHistory]    Script Date: 1/24/2022 11:52:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[ProductId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_OrderHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 1/24/2022 11:52:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ProductTypeId] [int] NOT NULL,
	[ProductTypeName] [nvarchar](50) NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ProductTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 1/24/2022 11:52:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] NOT NULL,
	[Username] [nvarchar](25) NOT NULL,
	[Password] [nvarchar](25) NOT NULL,
	[Firstname] [nvarchar](25) NOT NULL,
	[Lastname] [nvarchar](25) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserHistory]    Script Date: 1/24/2022 11:52:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Username] [nvarchar](25) NOT NULL,
	[Password] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_UserHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Brand] ([BrandId], [BrandName]) VALUES (1, N'4DOG')
INSERT [dbo].[Brand] ([BrandId], [BrandName]) VALUES (2, N'Acana')
INSERT [dbo].[Brand] ([BrandId], [BrandName]) VALUES (3, N'Advance')
INSERT [dbo].[Brand] ([BrandId], [BrandName]) VALUES (4, N'Bavaro')
INSERT [dbo].[Brand] ([BrandId], [BrandName]) VALUES (5, N'Bosch')
INSERT [dbo].[Brand] ([BrandId], [BrandName]) VALUES (6, N'Calibra')
INSERT [dbo].[Brand] ([BrandId], [BrandName]) VALUES (7, N'Canvit')
INSERT [dbo].[Brand] ([BrandId], [BrandName]) VALUES (8, N'Dr. Butte')
INSERT [dbo].[Brand] ([BrandId], [BrandName]) VALUES (9, N'Garfield')
INSERT [dbo].[Brand] ([BrandId], [BrandName]) VALUES (10, N'Hartz')
INSERT [dbo].[Brand] ([BrandId], [BrandName]) VALUES (11, N'Mera')
INSERT [dbo].[Brand] ([BrandId], [BrandName]) VALUES (12, N'Optimeal')
INSERT [dbo].[Brand] ([BrandId], [BrandName]) VALUES (13, N'Petkult')
INSERT [dbo].[Brand] ([BrandId], [BrandName]) VALUES (14, N'Royal Canin')
INSERT [dbo].[Brand] ([BrandId], [BrandName]) VALUES (15, N'Vetiq')
GO
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1, N'dogs')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (2, N'cats')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (3, N'fishes')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (4, N'birds')
GO
INSERT [dbo].[Order] ([OrderId], [OrderTime], [Price], [ProductId], [UserId]) VALUES (1, CAST(N'2022-01-04' AS Date), 19.21, 4, 10)
INSERT [dbo].[Order] ([OrderId], [OrderTime], [Price], [ProductId], [UserId]) VALUES (2, CAST(N'2022-01-05' AS Date), 14.98, 7, 5)
INSERT [dbo].[Order] ([OrderId], [OrderTime], [Price], [ProductId], [UserId]) VALUES (3, CAST(N'2022-01-05' AS Date), 169.99, 25, 9)
INSERT [dbo].[Order] ([OrderId], [OrderTime], [Price], [ProductId], [UserId]) VALUES (4, CAST(N'2022-01-06' AS Date), 16.91, 27, 1)
INSERT [dbo].[Order] ([OrderId], [OrderTime], [Price], [ProductId], [UserId]) VALUES (5, CAST(N'2022-01-24' AS Date), 31.5, 2, 8)
INSERT [dbo].[Order] ([OrderId], [OrderTime], [Price], [ProductId], [UserId]) VALUES (6, CAST(N'2022-01-24' AS Date), 102, 20, 7)
GO
SET IDENTITY_INSERT [dbo].[OrderHistory] ON 

INSERT [dbo].[OrderHistory] ([Id], [OrderId], [OrderDate], [ProductId], [UserId]) VALUES (2, 5, CAST(N'2022-01-24' AS Date), 2, 8)
INSERT [dbo].[OrderHistory] ([Id], [OrderId], [OrderDate], [ProductId], [UserId]) VALUES (3, 6, CAST(N'2022-01-24' AS Date), 20, 7)
SET IDENTITY_INSERT [dbo].[OrderHistory] OFF
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [CategoryId], [ProductTypeId], [BrandId]) VALUES (1, N'Autarky Adult Tasty White Fish And Potato Grain Free Dry Dog Food - 12kg', 28.99, 1, 1, 12)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [CategoryId], [ProductTypeId], [BrandId]) VALUES (2, N'Iams Adult Large Breed Chicken Dry Dog Food - 12kg', 31.5, 1, 1, 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [CategoryId], [ProductTypeId], [BrandId]) VALUES (3, N'Naturo Adult Grain Free Variety Wet Dog Food Trays - 12 X 400g', 11.39, 1, 2, 12)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [CategoryId], [ProductTypeId], [BrandId]) VALUES (4, N'Chappie Favourites Wet Dog Food Cans - 24 X 400G', 19.21, 1, 2, 2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [CategoryId], [ProductTypeId], [BrandId]) VALUES (5, N'''Pull And Tug Rope Toy With Ball For Dogs - 40cm', 2.12, 1, 3, 14)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [CategoryId], [ProductTypeId], [BrandId]) VALUES (6, N'Nerf Tennis Ball Ultra Max Distance Blaster Dog Toy', 27.49, 1, 3, 14)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [CategoryId], [ProductTypeId], [BrandId]) VALUES (7, N'Danish Design Green Dog Robe', 14.98, 1, 4, 3)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [CategoryId], [ProductTypeId], [BrandId]) VALUES (8, N'Rogz Pupz Nylon Harness', 10.56, 1, 4, 3)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [CategoryId], [ProductTypeId], [BrandId]) VALUES (9, N'Pro Plan Veterinary Diet Feline HA ST/OX Hypoallergenic Dry Cat Food - 3.5Kg', 35.99, 2, 5, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [CategoryId], [ProductTypeId], [BrandId]) VALUES (10, N'Go Cat Chicken & Duck Dry Cat Food - 10kg', 18.99, 2, 5, 4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [CategoryId], [ProductTypeId], [BrandId]) VALUES (11, N'Pro Plan Delicate Sensitive Digestion & Skin Adult Ocean Fish Wet Cat Food Pouches - 10 X 85g', 6, 2, 6, 9)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [CategoryId], [ProductTypeId], [BrandId]) VALUES (12, N'Sheba Soup Tuna Fillets Wet Cat Food Pouches - 4 X 40g', 2.35, 2, 6, 9)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [CategoryId], [ProductTypeId], [BrandId]) VALUES (13, N'Mouse Cat Toys - 3 Pack', 1.87, 2, 7, 5)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [CategoryId], [ProductTypeId], [BrandId]) VALUES (14, N'Play Toys For Cats - 8 Pack', 1.87, 2, 7, 5)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [CategoryId], [ProductTypeId], [BrandId]) VALUES (15, N'Beaphar Cat Flea Collars Velour 30cm', 2.68, 2, 8, 6)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [CategoryId], [ProductTypeId], [BrandId]) VALUES (16, N'Ancol Gloss Reflective Cat Collar', 3.16, 2, 8, 6)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [CategoryId], [ProductTypeId], [BrandId]) VALUES (17, N'Aquarian Tropical Fish Food - 200g', 14.98, 3, 9, 7)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [CategoryId], [ProductTypeId], [BrandId]) VALUES (18, N'Tetra Tabimin 120s', 6.13, 3, 9, 7)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [CategoryId], [ProductTypeId], [BrandId]) VALUES (19, N'Jungle Trade Supplies Aquaplus Aquarium - 25 Litre', 69.61, 3, 10, 8)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [CategoryId], [ProductTypeId], [BrandId]) VALUES (20, N'Aqua Marin Fresh 1200 Freshwater Aquarium & Cabinet', 699.99, 3, 10, 8)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [CategoryId], [ProductTypeId], [BrandId]) VALUES (21, N'White Stone With Cactus', 12.31, 3, 11, 10)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [CategoryId], [ProductTypeId], [BrandId]) VALUES (22, N'Armitage Gussie Gold Fish Starter Kit', 17.41, 3, 11, 10)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [CategoryId], [ProductTypeId], [BrandId]) VALUES (23, N'Bucktons Cockatiel & Lovebird Mix Bird Food - 20kg', 25.19, 4, 12, 11)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [CategoryId], [ProductTypeId], [BrandId]) VALUES (24, N'Trill Nutrivit Budgie Seed Bird Food 12 Pack - 500g', 26.99, 4, 12, 11)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [CategoryId], [ProductTypeId], [BrandId]) VALUES (25, N'YINTATECH 52-inch Wrought Iron Cage', 169.99, 4, 13, 13)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [CategoryId], [ProductTypeId], [BrandId]) VALUES (26, N'Echaprey Birdcage', 109.96, 4, 13, 13)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [CategoryId], [ProductTypeId], [BrandId]) VALUES (27, N'Natures Feast Seed Feeder Large', 16.91, 4, 14, 15)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Price], [CategoryId], [ProductTypeId], [BrandId]) VALUES (28, N'Hatchwell Canary Nest Pans - 10 Pack', 24.62, 4, 14, 15)
GO
INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName], [CategoryId]) VALUES (1, N'dry food', 1)
INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName], [CategoryId]) VALUES (2, N'wet food', 1)
INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName], [CategoryId]) VALUES (3, N'toys', 1)
INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName], [CategoryId]) VALUES (4, N'accessory', 1)
INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName], [CategoryId]) VALUES (5, N'dry food', 2)
INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName], [CategoryId]) VALUES (6, N'wet food', 2)
INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName], [CategoryId]) VALUES (7, N'toys', 2)
INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName], [CategoryId]) VALUES (8, N'accessory', 2)
INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName], [CategoryId]) VALUES (9, N'food', 3)
INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName], [CategoryId]) VALUES (10, N'aquarium', 3)
INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName], [CategoryId]) VALUES (11, N'accessory', 3)
INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName], [CategoryId]) VALUES (12, N'food', 4)
INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName], [CategoryId]) VALUES (13, N'cage', 4)
INSERT [dbo].[ProductType] ([ProductTypeId], [ProductTypeName], [CategoryId]) VALUES (14, N'accessory', 4)
GO
INSERT [dbo].[User] ([UserId], [Username], [Password], [Firstname], [Lastname], [Email], [Phone]) VALUES (1, N'muumuucandlelight', N'eZdE0Dy776', N'Darren', N'Vincent', N'darren_vincent@gmail.com', N'0722291181')
INSERT [dbo].[User] ([UserId], [Username], [Password], [Firstname], [Lastname], [Email], [Phone]) VALUES (2, N'commentmarinated', N'FdoZy789MD', N'Beverly', N'Bailey', N'beverly_bailey@gmail.com', N'0262276780')
INSERT [dbo].[User] ([UserId], [Username], [Password], [Firstname], [Lastname], [Email], [Phone]) VALUES (3, N'forecabinlesson', N'iyHHAeP9ou', N'Hugh', N'Fenton', N'hugh_fenton@gmail.com', N'0213156777')
INSERT [dbo].[User] ([UserId], [Username], [Password], [Firstname], [Lastname], [Email], [Phone]) VALUES (4, N'qualifiedsubstance', N'GHAT01EEsf', N'Amanda', N'Watkins', N'amanda_watkins@gmail.com', N'0723289964')
INSERT [dbo].[User] ([UserId], [Username], [Password], [Firstname], [Lastname], [Email], [Phone]) VALUES (5, N'linkagecaution', N'Jy5vVmhdsadsadsa', N'Agnieszka', N'Knight', N'agnieszka_knight@gmail.com', N'0254223535')
INSERT [dbo].[User] ([UserId], [Username], [Password], [Firstname], [Lastname], [Email], [Phone]) VALUES (6, N'highwaydull', N'cUTkycc9LT', N'Usman', N'Parry', N'usman_parry@gmail.com', N'0265215240')
INSERT [dbo].[User] ([UserId], [Username], [Password], [Firstname], [Lastname], [Email], [Phone]) VALUES (7, N'cumbersomeeverything', N'Zj0Wmcu8np', N'Virginia', N'Wainwright', N'virginia_wainwright@gmail.com', N'0745969382')
INSERT [dbo].[User] ([UserId], [Username], [Password], [Firstname], [Lastname], [Email], [Phone]) VALUES (8, N'wholesneer', N'GWWLTA4VPE', N'Khalid', N'Ridley', N'khalid_ridley@gmail.com', N'0351179036')
INSERT [dbo].[User] ([UserId], [Username], [Password], [Firstname], [Lastname], [Email], [Phone]) VALUES (9, N'killerphysicist', N'FsH5HCd211', N'Jason', N'Nichols', N'jason_nichols@gmail.com', N'0722737814')
INSERT [dbo].[User] ([UserId], [Username], [Password], [Firstname], [Lastname], [Email], [Phone]) VALUES (10, N'architectclan', N'QDiur1WaZL', N'Callum', N'Graham', N'callum_graham@gmail.com', N'0246216979')
GO
SET IDENTITY_INSERT [dbo].[UserHistory] ON 

INSERT [dbo].[UserHistory] ([Id], [UserId], [Username], [Password]) VALUES (2, 1, N'muumuucandlelight', N'eZdE0Dy776')
INSERT [dbo].[UserHistory] ([Id], [UserId], [Username], [Password]) VALUES (3, 5, N'linkagecaution', N'Jy5vVmhdsadsadsa')
SET IDENTITY_INSERT [dbo].[UserHistory] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Product]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderHistory]  WITH CHECK ADD  CONSTRAINT [FK_OrderHistory_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderHistory] CHECK CONSTRAINT [FK_OrderHistory_Order]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brand] ([BrandId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Brand]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductType] ([ProductTypeId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
ALTER TABLE [dbo].[ProductType]  WITH CHECK ADD  CONSTRAINT [FK_ProductType_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[ProductType] CHECK CONSTRAINT [FK_ProductType_Category]
GO
ALTER TABLE [dbo].[UserHistory]  WITH CHECK ADD  CONSTRAINT [FK_UserHistory_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserHistory] CHECK CONSTRAINT [FK_UserHistory_User]
GO
/****** Object:  StoredProcedure [dbo].[GetProductByCategory]    Script Date: 1/24/2022 11:52:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetProductByCategory]
	-- Add the parameters for the stored procedure here
	@CategoryId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [ProductId]
      ,[ProductName]
      ,[Price]
      ,[CategoryId]
      ,[ProductTypeId]
      ,[BrandId]
	FROM [PetShop].[dbo].[Product]
	WHERE [CategoryId] = @CategoryId
END
GO
/****** Object:  StoredProcedure [dbo].[HelperProductByBrand]    Script Date: 1/24/2022 11:52:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HelperProductByBrand]
	-- Add the parameters for the stored procedure here
	@BrandId INT 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [dbo].[GetProductByBrand](@BrandId);
END
GO
/****** Object:  Trigger [dbo].[ChangesOnOrder]    Script Date: 1/24/2022 11:52:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[ChangesOnOrder] 
   ON [dbo].[Order]
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	INSERT INTO OrderHistory
		([OrderId]
      ,[OrderDate]
      ,[ProductId]
      ,[UserId])
	SELECT [OrderId]
      ,GETUTCDATE()
      ,[ProductId]
      ,[UserId]
	FROM inserted
END
GO
ALTER TABLE [dbo].[Order] ENABLE TRIGGER [ChangesOnOrder]
GO
/****** Object:  Trigger [dbo].[ChangesOnUser]    Script Date: 1/24/2022 11:52:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[ChangesOnUser]
   ON  [dbo].[User] 
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	INSERT INTO UserHistory
		([UserId]
      ,[Username]
      ,[Password])
	SELECT [UserId]
      ,[Username]
      ,[Password]
	FROM inserted
END
GO
ALTER TABLE [dbo].[User] ENABLE TRIGGER [ChangesOnUser]
GO
USE [master]
GO
ALTER DATABASE [PetShop] SET  READ_WRITE 
GO
