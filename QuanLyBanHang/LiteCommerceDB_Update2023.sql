/****** Object:  Table [Categories] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](255) NULL,
 CONSTRAINT [PK__Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Customers] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](255) NOT NULL,
	[ContactName] [nvarchar](255) NOT NULL,
	[Province] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[IsLocked] [bit] NULL,
 CONSTRAINT [PK__Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Employees]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](255) NOT NULL,
	[BirthDate] [date] NULL,
	[Address] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Photo] [nvarchar](255) NULL,
	[IsWorking] [bit] NULL,
 CONSTRAINT [PK__Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [OrderDetails]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [OrderDetails](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[SalePrice] [money] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Orders]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[OrderTime] [datetime] NOT NULL,
	[DeliveryProvince] [nvarchar](255) NULL,
	[DeliveryAddress] [nvarchar](255) NULL,
	[EmployeeID] [int] NULL,
	[AcceptTime] [datetime] NULL,
	[ShipperID] [int] NULL,
	[ShippedTime] [datetime] NULL,
	[FinishedTime] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK__Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [OrderStatus] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [OrderStatus](
	[Status] [int] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ProductAttributes] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ProductAttributes](
	[AttributeID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[AttributeName] [nvarchar](255) NOT NULL,
	[AttributeValue] [nvarchar](max) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_ProductAttributes] PRIMARY KEY CLUSTERED 
(
	[AttributeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [ProductPhotos]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ProductPhotos](
	[PhotoID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Photo] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[IsHidden] [bit] NOT NULL,
 CONSTRAINT [PK_ProductPhotos] PRIMARY KEY CLUSTERED 
(
	[PhotoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Products]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[ProductDescription] [nvarchar](2000) NULL,
	[SupplierID] [int] NULL,
	[CategoryID] [int] NULL,
	[Unit] [nvarchar](255) NOT NULL,
	[Price] [money] NOT NULL,
	[Photo] [nvarchar](255) NULL,
	[IsSelling] [bit] NULL,
 CONSTRAINT [PK__Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Provinces]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Provinces](
	[ProvinceName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Provinces] PRIMARY KEY CLUSTERED 
(
	[ProvinceName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Shippers]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Shippers](
	[ShipperID] [int] IDENTITY(1,1) NOT NULL,
	[ShipperName] [nvarchar](255) NOT NULL,
	[Phone] [nvarchar](255) NULL,
 CONSTRAINT [PK__Shippers] PRIMARY KEY CLUSTERED 
(
	[ShipperID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Suppliers]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [nvarchar](255) NOT NULL,
	[ContactName] [nvarchar](255) NOT NULL,
	[Provice] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
 CONSTRAINT [PK__Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


SET IDENTITY_INSERT [Categories] ON 
GO
INSERT [Categories] ([CategoryID], [CategoryName], [Description]) VALUES (1, N'May mặc - Thời trang', N'Quần áo, hàng may mặc, thời trang,...')
GO
INSERT [Categories] ([CategoryID], [CategoryName], [Description]) VALUES (2, N'Mỹ phẩm', N'Mỹ phẩm')
GO
INSERT [Categories] ([CategoryID], [CategoryName], [Description]) VALUES (3, N'Điện tử', N'Tivi, điện thoại, máy tính,...')
GO
INSERT [Categories] ([CategoryID], [CategoryName], [Description]) VALUES (4, N'Hàng gia dụng', N'Trang thiết bị, máy móc gia dụng')
GO
INSERT [Categories] ([CategoryID], [CategoryName], [Description]) VALUES (5, N'Mẹ và em bé', N'Mẹ và em bé')
GO
INSERT [Categories] ([CategoryID], [CategoryName], [Description]) VALUES (6, N'Xe máy', N'Xe máy và phụ kiện')
GO
INSERT [Categories] ([CategoryID], [CategoryName], [Description]) VALUES (7, N'Oto', N'Oto và phụ kiện')
GO
INSERT [Categories] ([CategoryID], [CategoryName], [Description]) VALUES (9, N'Đồ chơi - phụ kiện', N'Đồ chơi, phụ kiện')
GO
INSERT [Categories] ([CategoryID], [CategoryName], [Description]) VALUES (10, N'Bàn ghế - nội thất', N'Bàn ghế, trang thiết bị nội thất')
GO
SET IDENTITY_INSERT [Categories] OFF
GO


SET IDENTITY_INSERT [Customers] ON 
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4194, N'Hồ Thị Tâm', N'cô Tâm', N'Thừa Thiên Huế', N'', N'09503277635', N'tam03021990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4195, N'Nguyễn Thị Hà', N'cô Hà', N'Nghệ An', N'', N'02635855659', N'ha20051990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4196, N'Bảo Nguyên', N'anh Nguyên', N'Thừa Thiên Huế', N'', N'03803458182', N'nguyen27111989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4197, N'Trần Thanh Tâm Toàn', N'anh Toàn', N'Thừa Thiên Huế', N'', N'06627672674', N'toan25041991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4198, N'Nguyễn Thị Khoa', N'cô Khoa', N'Nghệ An', N'', N'07034481024', N'khoa20031990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4199, N'Hồ Thị Uyên Phương', N'cô Phương', N'Thừa Thiên Huế', N'', N'08481442691', N'phuong26101990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4200, N'Nguyễn Văn Hiếu', N'anh Hiếu', N'Thừa Thiên Huế', N'', N'09144373140', N'hieu09051990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4201, N'Hồ Thị Liểu', N'cô Liểu', N'Thừa Thiên Huế', N'', N'04553580694', N'lieu25111991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4202, N'Đoàn Văn Ngọ', N'anh Ngọ', N'Quảng Bình', N'', N'08133835787', N'ngo29121989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4203, N'Hoàng Thị Thương', N'cô Thương', N'Nghệ An', N'', N'04743628155', N'thuong06021989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4204, N'Võ Văn Quốc', N'anh Quốc', N'Thừa Thiên Huế', N'', N'04833334572', N'quoc10101989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4205, N'Nguyễn Thanh Thảo Ly', N'cô Ly', N'Thừa Thiên Huế', N'', N'03934359745', N'ly02081990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4206, N'Hồ Thị Thu Thảo', N'cô Thảo', N'Thừa Thiên Huế', N'', N'08124532290', N'thao29031992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4207, N'Trần Đức Trung', N'anh Trung', N'Thừa Thiên Huế', N'', N'05745155750', N'trung29091992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4208, N'Ngô Thị Sáng', N'cô Sáng', N'Nghệ An', N'', N'04825378941', N'sang23031992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4209, N'Nguyễn Vương Tiểu Khôi', N'anh Khôi', N'Quảng Ngãi', N'', N'04756993891', N'khoi11011990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4210, N'Trần Lê Quang Hòa', N'anh Hòa', N'Thừa Thiên Huế', N'', N'07832818082', N'hoa03051991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4211, N'Trần Thị Lê', N'cô Lê', N'Quảng Trị', N'', N'02988982633', N'le17091992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4212, N'Nguyễn Thị Tình', N'cô Tình', N'Hà Tĩnh', N'', N'01754538222', N'tinh02091989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4213, N'Nguyễn Hoàng Sơn', N'anh Sơn', N'Thừa Thiên Huế', N'', N'03879156076', N'son02031991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4214, N'Phạm Hữu Lỉnh', N'anh Lỉnh', N'Thừa Thiên Huế', N'', N'05777844393', N'linh10111991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4215, N'Lê Thị Loan', N'cô Loan', N'NGhệ An', N'', N'03623934103', N'loan15081992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4216, N'Nguyễn Thị Thu Thảo', N'cô Thảo', N'Thừa Thiên Huế', N'', N'09834092288', N'thao30061992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4217, N'Nguyễn Thị Thương', N'cô Thương', N'Nghệ An', N'', N'09526350256', N'thuong16111991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4218, N'Nguyễn Thị Hân', N'cô Hân', N'Nghệ An', N'', N'09164574595', N'han20071988@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4219, N'Lê Đăng Vĩnh', N'anh Vĩnh', N'Thừa Thiên Huế', N'', N'02463953493', N'vinh25011991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4220, N'Nguyễn Thị Thu Hiền', N'cô Hiền', N'Quảng Trị', N'', N'09237196498', N'hien06041988@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4221, N'Trần Xuân Hải', N'anh Hải', N'Quảng Trị', N'', N'09542734433', N'hai16031992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4222, N'Nguyễn Thị Thuý Nga', N'cô Nga', N'Quảng Trị', N'', N'06213671346', N'nga22011992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4223, N'Nguyễn Đình Đẩu', N'anh Đẩu', N'Thừa Thiên Huế', N'', N'02655205303', N'dau16081990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4224, N'Lê Thị Ly Na', N'cô Na', N'Thừa Thiên Huế', N'', N'07015763797', N'na06011991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4225, N'Nguyễn Thị Hạo', N'cô Hạo', N'Quảng Bình', N'', N'05277403628', N'hao14041989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4226, N'Lương Duy Tân', N'anh Tân', N'Quảng Trị', N'', N'06408042620', N'tan17071983@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4227, N'Trần Hữu Hiếu', N'anh Hiếu', N'Thừa Thiên Huế', N'', N'01272483121', N'hieu05081992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4228, N'Ma Thị Phượng', N'cô Phượng', N'Thừa Thiên Huế', N'', N'06503119980', N'phuong01081990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4229, N'Đặng Tuấn Anh', N'anh Anh', N'Thừa Thiên Huế', N'', N'03833035763', N'anh16011992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4230, N'Nguyễn Anh Hào', N'anh Hào', N'Quảng Bình', N'', N'04236226473', N'hao22021988@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4231, N'Nguyễn Chánh Tín', N'anh Tín', N'Thừa Thiên Huế', N'', N'03489218396', N'tin13041991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4232, N'Phạm Thị Thiên Quý', N'cô Quý', N'Quảng Trị', N'', N'08344846567', N'quy09091991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4233, N'Trần Quang Sơn', N'anh Sơn', N'Thừa Thiên Huế', N'', N'04481442530', N'son27031991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4234, N'Nguyễn Thị Diệp', N'cô Diệp', N'Nghệ An', N'', N'03425365470', N'diep15081991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4235, N'Trần Ngọc Anh', N'anh Anh', N'Quảng Bình', N'', N'01201374045', N'anh02101991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4236, N'Ngô Đình Phú', N'anh Phú', N'Thừa Thiên Huế', N'', N'07625687803', N'phu26031990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4237, N'Hoàng Trần Như Ngọc', N'cô Ngọc', N'Thừa Thiên Huế', N'', N'04813206132', N'ngoc12021990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4238, N'Nguyễn Phi Phụng', N'anh Phụng', N'Thừa Thiên Huế', N'', N'04739326580', N'phung24101989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4239, N'Hồ Thị Trang', N'cô Trang', N'Thừa Thiên Huế', N'', N'08657554107', N'trang12051991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4240, N'Bùi Văn Huân', N'anh Huân', N'Nam Định', N'', N'05589854942', N'huan25021992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4241, N'Nguyễn Thị Tuyết', N'cô Tuyết', N'Nghệ An', N'', N'07194221709', N'tuyet25091990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4242, N'Lê Thị Hải Yến', N'cô Yến', N'Hà Tĩnh', N'', N'09292858310', N'yen10021990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4243, N'Võ Văn Thảo', N'anh Thảo', N'Thừa Thiên Huế', N'', N'04846219787', N'thao12091990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4244, N'Nguyễn Tình', N'anh Tình', N'Thừa Thiên Huế', N'', N'08771557001', N'tinh08011988@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4245, N'Lê Hồ Xuân Thịnh', N'anh Thịnh', N'Thừa Thiên Huế', N'', N'05377421890', N'thinh04021990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4246, N'Nông Lộc Duyên', N'cô Duyên', N'Cao Bằng', N'', N'03077618937', N'duyen20031990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4247, N'Nguyễn Tú Uyên', N'cô Uyên', N'Thừa Thiên Huế', N'', N'05992073056', N'uyen27081991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4248, N'Lê Hải Nam', N'anh Nam', N'Thừa Thiên Huế', N'', N'09599163357', N'nam28091992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4249, N'Trần Văn Thạnh', N'anh Thạnh', N'Thừa Thiên Huế', N'', N'09518749446', N'thanh18021991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4250, N'Lê Nguyễn Thị Xuân Công', N'cô Công', N'Thừa Thiên Huế', N'', N'05782923458', N'cong09091991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4251, N'Lê Thị Như', N'cô Như', N'Thừa Thiên Huế', N'', N'08262331117', N'nhu02121990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4252, N'Đinh Thị Hoa', N'cô Hoa', N'Thừa Thiên Huế', N'', N'07422820545', N'hoa28081990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4253, N'Lê Văn Công', N'anh Công', N'Quảng Trị', N'', N'08429845173', N'cong09071990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4254, N'Huỳnh Quang Hải', N'anh Hải', N'Thừa Thiên Huế', N'', N'02079213058', N'hai21081990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4255, N'Hồ Sỹ Tú', N'anh Tú', N'Quảng Trị', N'', N'07118582304', N'tu16091990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4256, N'Trần Xuân Vỹ', N'anh Vỹ', N'Thừa Thiên Huế', N'', N'01517037021', N'vy22061987@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4257, N'Nguyễn Thị Kim Anh', N'cô Anh', N'Thừa Thiên Huế', N'', N'08949780792', N'anh06111990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4258, N'Võ Thị Thu Phong', N'cô Phong', N'Thừa Thiên Huế', N'', N'06155074896', N'phong20071991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4259, N'Hoàng Như Tín', N'anh Tín', N'Thừa Thiên Huế', N'', N'04446083188', N'tin29111990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4260, N'Phan Văn Trường', N'anh Trường', N'Thừa Thiên Huế', N'', N'02023542286', N'truong05021990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4261, N'Đỗ Huyền Trang', N'cô Trang', N'Quảng Bình', N'', N'02507966616', N'trang11011990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4262, N'Trần Đình Mạnh', N'anh Mạnh', N'Hà Tĩnh', N'', N'08214808282', N'manh11081992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4263, N'Phan Thế Doanh', N'anh Doanh', N'Thừa Thiên Huế', N'', N'08126750353', N'doanh20101991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4264, N'Lê Phước Định', N'anh Định', N'Thừa Thiên Huế', N'', N'02572120530', N'dinh15101991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4265, N'Nguyễn Thị Hoa', N'cô Hoa', N'Đà Nẵng', N'', N'01254835857', N'hoa10111989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4266, N'Nguyễn Thị Thiên Thanh', N'cô Thanh', N'Thừa Thiên Huế', N'', N'05324508636', N'thanh06111991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4267, N'Trương Thị Huyền My', N'cô My', N'Nghệ An', N'', N'07876670223', N'my02021992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4268, N'Hồ Hữu Linh', N'anh Linh', N'Nghệ An', N'', N'09234738393', N'linh02121988@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4269, N'Đào Thị Trang', N'cô Trang', N'Vĩnh Phúc', N'', N'02679697453', N'trang28061991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4270, N'Trần Nguyễn Minh Giang', N'anh Giang', N'Quảng Bình', N'', N'08877218335', N'giang04091990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4271, N'Nguyễn Thị Hồng', N'cô Hồng', N'Thừa Thiên Huế', N'', N'08217461386', N'hong01011989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4272, N'Tôn Nữ Nguyệt Anh', N'cô Anh', N'Thừa Thiên Huế', N'', N'07825551983', N'anh06101991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4273, N'Nguyễn Thị Thuyền', N'cô Thuyền', N'Thừa Thiên Huế', N'', N'05994746467', N'thuyen24031991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4274, N'Phạm Thị Bình', N'cô Bình', N'Hà Tĩnh', N'', N'05518169557', N'binh18071989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4275, N'Nguyễn Thị Kim Tuyến', N'cô Tuyến', N'Thừa Thiên Huế', N'', N'06778323525', N'tuyen02111990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4276, N'Nguyễn Trần Nhật Hoàng', N'anh Hoàng', N'Thừa Thiên Huế', N'', N'03582583655', N'hoang01101990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4277, N'Hồng Hồ Bảo', N'anh Bảo', N'Thừa Thiên Huế', N'', N'06531953196', N'bao28061992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4278, N'Trần Quốc Hiếu', N'anh Hiếu', N'Thừa Thiên Huế', N'', N'02073996239', N'hieu15081991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4279, N'Nguyễn Thị Hiền', N'cô Hiền', N'Quảng Bình', N'', N'06489765164', N'hien20041990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4280, N'Võ Văn Hội', N'anh Hội', N'Thừa Thiên Huế', N'', N'02345321990', N'hoi01021989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4281, N'Mai Kim Thuận', N'cô Thuận', N'Thừa Thiên Huế', N'', N'06439301815', N'thuan23111991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4282, N'Phan Văn Cương', N'anh Cương', N'Quảng Trị', N'', N'03761786941', N'cuong10111988@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4283, N'Nguyễn Thuần Nho', N'anh Nho', N'Đà Nẵng', N'', N'08989835402', N'nho28101990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4284, N'Nguyễn Văn Thiện', N'anh Thiện', N'Thanh Hóa', N'', N'01308125380', N'thien13111991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4285, N'Nguyễn Như Thị Nga', N'cô Nga', N'Thừa Thiên Huế', N'', N'06708104255', N'nga06031990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4286, N'Võ Văn Giáp', N'anh Giáp', N'Hà Tĩnh', N'', N'07309094455', N'giap06101989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4287, N'Lê Đức Thành Nhân', N'anh Nhân', N'Thừa Thiên Huế', N'', N'02865970425', N'nhan04011991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4288, N'Nguyễn Thị Thêm', N'cô Thêm', N'Quảng Trị', N'', N'01591975569', N'them31081990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4289, N'Trương Công Lân', N'anh Lân', N'Thừa Thiên Huế', N'', N'08921219196', N'lan18081992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4290, N'Bạch Văn Tuấn', N'anh Tuấn', N'Thừa Thiên Huế', N'', N'09335135971', N'tuan14041992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4291, N'Huỳnh Thị Mùi', N'cô Mùi', N'Thừa Thiên Huế', N'', N'07903587894', N'mui06121991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4292, N'Đào Hữu Hải', N'anh Hải', N'Quảng Bình', N'', N'04719498115', N'hai12111988@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4293, N'Nguyễn Thị Kiều Liên', N'cô Liên', N'Gia Lai', N'', N'06467513602', N'lien27041989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4294, N'Lê Huy Trung', N'anh Trung', N'Hà Tĩnh', N'', N'06604262864', N'trung06081989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4295, N'Phan Trọng Lễ', N'anh Lễ', N'Thừa Thiên Huế', N'', N'05252732942', N'le19081990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4296, N'Huỳnh Phúc Nguyên', N'anh Nguyên', N'Kon Tum ', N'', N'08208010023', N'nguyen13111992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4297, N'Lê Thị Bích Ngọc', N'cô Ngọc', N'Thừa Thiên Huế', N'', N'07022939426', N'ngoc15101990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4298, N'Trần Thị Sáu', N'cô Sáu', N'Quảng Bình', N'', N'01949162542', N'sau20041988@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4299, N'Nguyễn Công Ngọc', N'anh Ngọc', N'Hà Tĩnh', N'', N'04214801022', N'ngoc01021987@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4300, N'Nguyễn Mạnh Đại', N'anh Đại', N'Quảng Bình', N'', N'08607624802', N'dai15071990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4301, N'Châu Ngọc Phương Uyên', N'cô Uyên', N'Thừa Thiên Huế', N'', N'05246122323', N'uyen02121991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4302, N'Trần Đăng Khoa', N'anh Khoa', N'Thừa Thiên Huế', N'', N'05408271920', N'khoa08081990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4303, N'Ngô Văn Đức', N'anh Đức', N'Thừa Thiên Huế', N'', N'09903563840', N'duc01071991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4304, N'Võ Đại Dương', N'anh Dương', N'Thừa Thiên Huế', N'', N'04158899171', N'duong28111991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4305, N'Văn Công Thọ', N'anh Thọ', N'Thừa Thiên Huế', N'', N'03482692109', N'tho04041991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4306, N'Nguyễn Thị Hạnh', N'cô Hạnh', N'Hà Nội', N'', N'06331358890', N'hanh20101990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4307, N'Trương Trọng Trí', N'anh Trí', N'Quảng Nam', N'', N'05482081042', N'tri15121989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4308, N'Trương Ngọc Nguyên Huy', N'anh Huy', N'Thừa Thiên Huế', N'', N'03265120793', N'huy15111990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4309, N'Nguyễn Hữu Trung', N'anh Trung', N'Thừa Thiên Huế', N'', N'06785711871', N'trung13081990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4310, N'Lê Thị Thuý Hằng', N'cô Hằng', N'Đà Nẵng', N'', N'08407906657', N'hang28011991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4311, N'Bạch Văn Thìn', N'anh Thìn', N'Thừa Thiên Huế', N'', N'08694304178', N'thin12111988@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4312, N'Phạm Quang Sơn', N'anh Sơn', N'Thừa Thiên Huế', N'', N'07295454255', N'son30101990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4313, N'Trần Thị ánh Hồng', N'cô Hồng', N'Quảng Bình', N'', N'04344078239', N'hong10101991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4314, N'Trần Dương Phi', N'anh Phi', N'Thừa Thiên Huế', N'', N'06314183344', N'phi01051990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4315, N'Phạm Thị Liên', N'cô Liên', N'Nghệ An ', N'', N'02593111400', N'lien06061992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4316, N'Quách Tiểu Bảo', N'anh Bảo', N'Thừa Thiên Huế', N'', N'07132841000', N'bao10101990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4317, N'Nguyễn Văn Trần', N'anh Trần', N'Nghệ An', N'', N'04051136696', N'tran10011989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4318, N'Hoàng Thị Yến Giang', N'cô Giang', N'Quảng Bình', N'', N'03309838457', N'giang17101991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4319, N'Hoàng Đăng Phúc', N'anh Phúc', N'Thừa Thiên Huế', N'', N'06865763626', N'phuc16011990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4320, N'Nguyễn Thanh Tâm', N'cô Tâm', N'Hà Tĩnh', N'', N'02532698814', N'tam02091990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4321, N'Nguyễn Thị Quý Ngọc', N'cô Ngọc', N'Nam Định', N'', N'01063351998', N'ngoc09111988@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4322, N'Trần Thị Cẩm Trang', N'cô Trang', N'Thừa Thiên Huế', N'', N'07556311329', N'trang01021989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4323, N'Hà Thị Hồng', N'cô Hồng', N'Hà Tĩnh', N'', N'05043189590', N'hong27091992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4324, N'Nguyễn Đăng Khoa', N'anh Khoa', N'Nghệ An', N'', N'06781453791', N'khoa02091991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4325, N'Lê Ngọc Quý', N'anh Quý', N'Thừa Thiên Huế', N'', N'07458534625', N'quy18021991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4326, N'Nguyễn Văn Chương', N'anh Chương', N'Quảng Bình', N'', N'07473661133', N'chuong14071991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4327, N'Nguyễn Thị Loan', N'cô Loan', N'Nghệ An', N'', N'07712130929', N'loan13081992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4328, N'Đặng Văn Luýt', N'anh Luýt', N'Thừa Thiên Huế', N'', N'07738449627', N'luyt16091992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4329, N'Phạm Văn Huy', N'anh Huy', N'Quảng Nam', N'', N'08834326752', N'huy01041991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4330, N'Trần Khôi Nguyên', N'anh Nguyên', N'Thừa Thiên Huế', N'', N'02209204627', N'nguyen07091990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4331, N'Nguyễn Thanh Sa', N'anh Sa', N'Quảng Ngãi', N'', N'08231999986', N'sa29041990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4332, N'Võ Quang Minh', N'anh Minh', N'Thừa Thiên Huế', N'', N'04561601076', N'minh06091991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4333, N'Nguyễn Thị Hậu', N'cô Hậu', N'Quảng Bình', N'', N'05676861576', N'hau20021989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4334, N'Nguyễn Viết Dũng', N'anh Dũng', N'Thừa Thiên Huế', N'', N'05714038059', N'dung12021992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4335, N'Nguyễn Thị Thơm', N'cô Thơm', N'Thanh Hóa', N'', N'05379617001', N'thom02081992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4336, N'Trần Thị Kim Huệ', N'cô Huệ', N'Thừa Thiên Huế', N'', N'03028107662', N'hue20041992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4337, N'Lê Hoàng Nhật Minh', N'cô Minh', N'Thừa Thiên Huế', N'', N'01343453649', N'minh28051991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4338, N'Nguyễn Thị Nhân Duyên', N'cô Duyên', N'Thừa Thiên Huế', N'', N'01973482445', N'duyen08061990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4339, N'Cáp Văn Lộc', N'anh Lộc', N'Quảng Trị', N'', N'03143710631', N'loc15031990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4340, N'Hoàng Anh Quốc', N'anh Quốc', N'Thừa Thiên Huế', N'', N'07769085073', N'quoc19081992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4341, N'Lê Công Hoàng Thông', N'anh Thông', N'Thừa Thiên Huế', N'', N'09457539416', N'thong30071992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4342, N'Trần Thị Nguyên', N'cô Nguyên', N'Nghệ An', N'', N'07344129546', N'nguyen13041991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4343, N'Trần Hoài Phong', N'anh Phong', N'Thừa Thiên Huế', N'', N'05594814972', N'phong25051990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4344, N'Nguyễn Văn Thánh', N'anh Thánh', N'Quảng Bình', N'', N'06257717734', N'thanh05051990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4345, N'Lê Anh Tuấn', N'anh Tuấn', N'Quảng Bình', N'', N'08358113663', N'tuan14021991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4346, N'Hoàng Thị ái Phương', N'cô Phương', N'Thừa Thiên Huế', N'', N'09827581774', N'phuong08031990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4347, N'Huỳnh Trần Hiền Tâm', N'cô Tâm', N'Quảng Ngãi', N'', N'07684291963', N'tam15021990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4348, N'Vũ Như Ái', N'cô Ái', N'Thừa Thiên Huế', N'', N'06007602758', N'ai25041991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4349, N'Đỗ Thu Trang', N'cô Trang', N'Bắc Ninh', N'', N'01449348953', N'trang18041989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4350, N'Nguyễn Văn Hợp', N'anh Hợp', N'Hà Tĩnh', N'', N'02524843607', N'hop04101992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4351, N'Hoàng Thị Như Quỳnh', N'cô Quỳnh', N'Thừa Thiên Huế', N'', N'07433153715', N'quynh09121991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4352, N'Lê Thị Trang', N'cô Trang', N'Nghệ An', N'', N'08816146099', N'trang22091991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4353, N'Phạm Minh Sương', N'anh Sương', N'Hà Tĩnh', N'', N'08128669175', N'suong02091992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4354, N'Đoàn Thị ánh Nguyệt', N'cô Nguyệt', N'Thừa Thiên Huế', N'', N'02725275673', N'nguyet28021991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4355, N'Võ Thị Nhứt', N'cô Nhứt', N'Đà Nẵng', N'', N'04326850584', N'nhut25061991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4356, N'Lê Văn Sơn', N'anh Sơn', N'Nghệ An', N'', N'07368070647', N'son21101990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4357, N'Lê Thanh Tùng', N'anh Tùng', N'Quảng Bình', N'', N'05501919860', N'tung26091991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4358, N'Hoàng Thị Kiều Phương', N'cô Phương', N'Thừa Thiên Huế', N'', N'04255713401', N'phuong30041989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4359, N'Phan Thanh Lộc', N'anh Lộc', N'Thừa Thiên Huế', N'', N'08133625175', N'loc29101989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4360, N'Thái Văn Nhật Cường', N'anh Cường', N'Thừa Thiên Huế', N'', N'01181623978', N'cuong12021991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4361, N'Lê Văn Sinh', N'anh Sinh', N'Thừa Thiên Huế', N'', N'09101933027', N'sinh12021992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4362, N'Nguyễn Thị Kiều Loan', N'cô Loan', N'Thừa Thiên Huế', N'', N'04467666870', N'loan21021990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4363, N'Nguyễn Minh Phú', N'anh Phú', N'Thừa Thiên Huế', N'', N'08601465532', N'phu06011990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4364, N'Phạm Thanh Hải', N'anh Hải', N'Thừa Thiên Huế', N'', N'02024394295', N'hai25041981@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4365, N'Cao Đình Tấn', N'anh Tấn', N'Thừa Thiên Huế', N'', N'07586994918', N'tan21101991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4366, N'Trương Thanh Hiền', N'anh Hiền', N'Quảng Bình', N'', N'07863503865', N'hien08081990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4367, N'Nguyễn Thị Kiều Sang', N'cô Sang', N'Hà Tĩnh', N'', N'01605086588', N'sang02101989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4368, N'Nguyễn Văn Tân', N'anh Tân', N'Thừa Thiên Huế', N'', N'07522902053', N'tan04041990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4369, N'Phạm Thị Phương Lan', N'cô Lan', N'Thừa Thiên Huế', N'', N'05677062908', N'lan22091992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4370, N'Trương Thị Thu Trang', N'cô Trang', N'Hà Tĩnh', N'', N'06267609506', N'trang15101989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4371, N'Lê Văn Cường', N'anh Cường', N'Hà Tĩnh ', N'', N'01541861396', N'cuong18011992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4372, N'Trần Thị Bích Đào', N'cô Đào', N'Thừa Thiên Huế', N'', N'09431832583', N'dao061286@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4373, N'Trần Bảo Trung', N'anh Trung', N'Thừa Thiên Huế', N'', N'04653806324', N'trung12031990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4374, N'Nguyễn Trung Việt', N'anh Việt', N'Quảng Trị', N'', N'03979357330', N'viet24051990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4375, N'Nguyễn Thị Thùy Linh', N'cô Linh', N'Quảng Bình', N'', N'06569364622', N'linh26081987@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4376, N'Lê Văn Phanh', N'anh Phanh', N'Quảng Trị', N'', N'05225098284', N'phanh10021991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4377, N'Nguyễn Thị Minh', N'cô Minh', N'Hà Tĩnh', N'', N'08021172738', N'minh19091990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4378, N'Nguyễn Thụy Trinh', N'cô Trinh', N'Thừa Thiên Huế', N'', N'05349783135', N'trinh16021991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4379, N'Phan Thanh Hưng', N'anh Hưng', N'Thừa Thiên Huế', N'', N'07865926496', N'hung10031989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4380, N'Phạm Thị Phượng', N'cô Phượng', N'Thừa Thiên Huế', N'', N'07269452480', N'phuong21051990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4381, N'Ngô Thị Tuyết Sương', N'cô Sương', N'Quảng Nam', N'', N'09338544991', N'suong04071990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4382, N'Đoàn Văn Thêm', N'anh Thêm', N'Quảng Bình', N'', N'07525670275', N'them19031988@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4383, N'Trần Văn Phúc', N'anh Phúc', N'Nghệ An', N'', N'01331641048', N'phuc06071991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4384, N'Hoàng Thị Dung', N'cô Dung', N'Hà Tĩnh', N'', N'07127954255', N'dung06091990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4385, N'Trần Thị Thanh Hiền', N'cô Hiền', N'Hà Nội', N'', N'05675535356', N'hien09091989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4386, N'Đỗ Thị Việt Trinh', N'cô Trinh', N'Quảng Bình', N'', N'03419735540', N'trinh20121992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4387, N'Trần Thị Thanh Nhàn', N'cô Nhàn', N'Quảng Bình', N'', N'06981870187', N'nhan16021991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4388, N'Trần Thị Hồng', N'cô Hồng', N'Nghệ An ', N'', N'09313583968', N'hong05111992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4389, N'Phạm Tiến Bắc', N'anh Bắc', N'Hà Tĩnh', N'', N'06673117816', N'bac07031992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4390, N'Nguyễn Thị Thu Hiền', N'cô Hiền', N'Quảng Bình', N'', N'06612520800', N'hien20011992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4391, N'Lê Thị Mỹ Hiên', N'cô Hiên', N'Quảng Bình', N'', N'02304714534', N'hien10061990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4392, N'Huỳnh Văn Toàn', N'anh Toàn', N'Thừa Thiên Huế', N'', N'05159879832', N'toan02021990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4393, N'Lê Thị Thanh', N'cô Thanh', N'Hà Tĩnh', N'', N'05036592313', N'thanh20081992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4394, N'Lê Trung Hiếu', N'anh Hiếu', N'Thừa Thiên Huế', N'', N'05579805459', N'hieu12061992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4395, N'Nguyễn Xuân Quang', N'anh Quang', N'Thừa Thiên Huế', N'', N'04863627446', N'quang08111991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4396, N'Hoàng Cao Bằng', N'anh Bằng', N'Thừa Thiên Huế', N'', N'04531618306', N'bang29051991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4397, N'Hoàng Thị Ngọc Anh', N'cô Anh', N'Thừa Thiên Huế', N'', N'08384785587', N'anh28111991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4398, N'Trần Thanh Tùng', N'anh Tùng', N'Thừa Thiên Huế', N'', N'02827787689', N'tung25061989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4399, N'Nguyễn Thị Na', N'cô Na', N'Quảng Trị', N'', N'04965355458', N'na20101992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4400, N'Nguyễn Thị Lệ Giang', N'cô Giang', N'Quảng Bình', N'', N'04007830486', N'giang07101992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4401, N'Lê Thị Thu Lành', N'cô Lành', N'Quảng Trị', N'', N'09125109578', N'lanh08111989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4402, N'Nguyễn Hữu Thanh Tùng', N'anh Tùng', N'Thừa Thiên Huế', N'', N'03729907889', N'tung01011990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4403, N'Chu Đình Ca', N'anh Ca', N'Nghệ An', N'', N'01472775817', N'ca09121992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4404, N'Phan Thanh Huỳnh', N'anh Huỳnh', N'Thừa Thiên Huế', N'', N'06092564153', N'huynh08051991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4405, N'Thái Xuân Quý', N'anh Quý', N'Quảng Bình', N'', N'07122839363', N'quy26071987@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4406, N'Nguyễn Thị Kim Huệ', N'cô Huệ', N'Thừa Thiên Huế', N'', N'08011431647', N'hue10011989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4407, N'Nguyễn Quốc Việt', N'anh Việt', N'Thái Nguyên', N'', N'05768672098', N'viet07041987@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4408, N'Lê Duy Hậu', N'anh Hậu', N'Quảng Nam', N'', N'01566211794', N'hau04011988@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4409, N'Ngô Thị Thuận', N'cô Thuận', N'Thừa Thiên Huế', N'', N'06894083500', N'thuan12041989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4410, N'Lữ Vũ Lực', N'anh Lực', N'Nghệ An', N'', N'04706112676', N'luc02041990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4411, N'Đinh Bảo Hiếu', N'anh Hiếu', N'Thừa Thiên Huế', N'', N'04855811254', N'hieu19081991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4412, N'Lê Nhâm Thân', N'anh Thân', N'Quảng Bình ', N'', N'01472065271', N'than15061992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4413, N'Nguyễn Thị Liên', N'cô Liên', N'Hà Tĩnh', N'', N'09233008103', N'lien05111991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4414, N'Đinh Thị Thiên Hương', N'cô Hương', N'Quảng Bình', N'', N'03491424615', N'huong03061990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4415, N'Phạm Bá Dũng', N'anh Dũng', N'Kon Tum', N'', N'02396183969', N'dung08121991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4416, N'Lê Thị Thía', N'cô Thía', N'Thừa Thiên Huế', N'', N'03951366331', N'thia17021990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4417, N'Lô Văn Nghĩa', N'anh Nghĩa', N'Nghệ An', N'', N'06767643331', N'nghia28111988@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4418, N'Nguyễn Hữu Tài', N'anh Tài', N'Lâm Đồng', N'', N'04368209994', N'tai07101991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4419, N'Trần Thị Hằng', N'cô Hằng', N'Thừa Thiên Huế', N'', N'02008428559', N'hang20081992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4420, N'Nguyễn Phước Anh Thư', N'anh Thư', N'Thừa Thiên Huế', N'', N'03969613018', N'thu11071991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4421, N'Nguyễn Xuân Trường', N'anh Trường', N'Thừa Thiên Huế', N'', N'09008037429', N'truong13101991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4422, N'Trương Thành', N'anh Thành', N'Thừa Thiên Huế', N'', N'01323765806', N'thanh06061991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4423, N'Nguyễn Văn Hoàng', N'anh Hoàng', N'Quảng Trị', N'', N'07676332362', N'hoang04021990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4424, N'Lê Thị Diệu Hiền', N'cô Hiền', N'Thừa Thiên Huế', N'', N'03288192955', N'hien01051989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4425, N'Phan Thị Linh', N'cô Linh', N'Hà Tĩnh', N'', N'03143489270', N'linh10101991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4426, N'Ngô Thị Hồng', N'cô Hồng', N'Thừa Thiên Huế', N'', N'07672800860', N'hong16061991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4427, N'Phạm Thị Kiều Diễm', N'cô Diễm', N'Thừa Thiên Huế', N'', N'07683700857', N'diem29111991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4428, N'Hoàng Đình Hải', N'anh Hải', N'Thừa Thiên Huế', N'', N'07102892272', N'hai05121992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4429, N'Nguyễn Văn Bảo', N'anh Bảo', N'Thừa Thiên Huế', N'', N'03728025849', N'bao01081990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4430, N'Nguyễn Gia Hiếu', N'anh Hiếu', N'Quảng Nam', N'', N'01676303730', N'hieu27121990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4431, N'Võ Thị Tình', N'cô Tình', N'Quảng Nam', N'', N'06147865789', N'tinh10121992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4432, N'Phạm Văn Thành', N'anh Thành', N'Thừa Thiên Huế', N'', N'01732601828', N'thanh10081990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4433, N'Nguyễn Thị Thanh Hòa', N'cô Hòa', N'Thừa Thiên Huế', N'', N'07991654134', N'hoa18051990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4434, N'Nguyễn Thị Thương Thảo', N'cô Thảo', N'Quảng Ngãi', N'', N'01838472012', N'thao06041992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4435, N'Nguyễn Soạn', N'anh Soạn', N'Thừa Thiên Huế', N'', N'02355087603', N'soan05051991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4436, N'Nguyễn Thị Bình', N'cô Bình', N'Quảng Trị', N'', N'06904806573', N'binh20121990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4437, N'Trần ánh Hằng', N'cô Hằng', N'Thừa Thiên Huế', N'', N'05466145951', N'hang15091990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4438, N'Phạm Đình Chiến', N'anh Chiến', N'Quảng Bình', N'', N'06596313226', N'chien15031991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4439, N'Lê Thị Quỳnh Châu', N'cô Châu', N'Thừa Thiên Huế', N'', N'02588483591', N'chau18041992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4440, N'Hoàng Thị Kim Oanh', N'cô Oanh', N'Quảng Trị', N'', N'07559475046', N'oanh27021989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4441, N'Trần Thị Ly', N'cô Ly', N'Thừa Thiên Huế', N'', N'06647998554', N'ly10091989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4442, N'Trần Thị ánh Nguyệt', N'cô Nguyệt', N'Thừa Thiên Huế', N'', N'03504602885', N'nguyet25111991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4443, N'Nguyễn Thị Oanh', N'cô Oanh', N'Nghệ An', N'', N'07488198393', N'oanh08101987@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4444, N'Hoàng Thị Thanh Hoa', N'cô Hoa', N'Nghệ An', N'', N'06937746359', N'hoa17031990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4445, N'Nguyễn Thanh Tùng', N'anh Tùng', N'Thừa Thiên Huế', N'', N'08785099799', N'tung17101990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4446, N'Cao Mạnh Linh', N'anh Linh', N'Quảng Trị', N'', N'09761806980', N'linh20111989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4447, N'Phan Văn Tiến', N'anh Tiến', N'Quảng Bình', N'', N'06828612192', N'tien18091990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4448, N'Nguyễn Văn Duân', N'anh Duân', N'Thừa Thiên Huế', N'', N'01085609443', N'duan12061990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4449, N'Trần Thị Quỳnh Giang', N'cô Giang', N'Quảng Bình', N'', N'05834526334', N'giang02051991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4450, N'Hoàng Đức Tú', N'anh Tú', N'Quảng Trị', N'', N'08881895238', N'tu13101990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4451, N'Nguyễn Thị Thuỳ Trang', N'cô Trang', N'Thừa Thiên Huế', N'', N'05767823599', N'trang18121987@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4452, N'Nguyễn Phước Chinh', N'anh Chinh', N'Thừa Thiên Huế', N'', N'09199551128', N'chinh10031992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4453, N'Nguyễn Thanh Huỳnh', N'anh Huỳnh', N'Nghệ An', N'', N'06618832605', N'huynh09061989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4454, N'Phạm Thị Thu Thảo', N'cô Thảo', N'Kon Tum ', N'', N'06896653910', N'thao31081992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4455, N'Đoàn Thị Trang', N'cô Trang', N'Thừa Thiên Huế', N'', N'07958486754', N'trang08051991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4456, N'Nguyễn Hoàng Phương Thảo', N'cô Thảo', N'Khánh Hòa', N'', N'07343929766', N'thao20031990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4457, N'Dương Thị Lương', N'cô Lương', N'Nghệ An', N'', N'09522619205', N'luong30061990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4458, N'Phan Thị Quỳnh Trâm', N'cô Trâm', N'Thừa Thiên Huế', N'', N'07545195360', N'tram240687@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4459, N'Trần Thị Phi', N'cô Phi', N'Thừa Thiên Huế', N'', N'01518912416', N'phi13051990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4460, N'Nguyễn Thị Thi', N'cô Thi', N'Thừa Thiên Huế', N'', N'04891827422', N'thi17081991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4461, N'Hồ Thị Thu Hường', N'cô Hường', N'Quảng Trị', N'', N'04538560120', N'huong11011990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4462, N'Trần Cảnh Thiện Tâm', N'anh Tâm', N'Thừa Thiên Huế', N'', N'03789207208', N'tam05091989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4463, N'Vũ Đình Tâm', N'anh Tâm', N'Thái Bình', N'', N'05676695666', N'tam15081989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4464, N'Trần Thị Hoài Trang', N'cô Trang', N'Quảng Bình', N'', N'03845121738', N'trang28121988@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4465, N'Nguyễn Thị Thu Hương', N'cô Hương', N'Thừa Thiên Huế', N'', N'08751510374', N'huong02021990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4466, N'Hồ Bá Vinh', N'anh Vinh', N'Nghệ An', N'', N'09183703138', N'vinh06041990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4467, N'Lâm Văn Thiết', N'anh Thiết', N'Ninh Bình', N'', N'02877217984', N'thiet10061990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4468, N'Trần Thị Oanh', N'cô Oanh', N'Quảng Bình', N'', N'08618395103', N'oanh02071991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4469, N'Nguyễn Thị Kim Huệ', N'cô Huệ', N'Thừa Thiên Huế', N'', N'08841874214', N'hue21011991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4470, N'Đoàn Nhật', N'anh Nhật', N'Thừa Thiên Huế', N'', N'07946599267', N'nhat23051990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4471, N'Nguyễn Thị Nụ', N'cô Nụ', N'Nghệ An ', N'', N'08087882283', N'nu11051992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4472, N'Lê Hoàng Đan Quế', N'cô Quế', N'Thanh Hóa ', N'', N'09062096579', N'que10101990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4473, N'Phan Thị Dương', N'cô Dương', N'Hà Tĩnh', N'', N'03857971386', N'duong05091992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4474, N'Võ Văn Dũng', N'anh Dũng', N'Quảng Bình', N'', N'09499688214', N'dung20091991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4475, N'Lê Thị Hạnh', N'cô Hạnh', N'Thừa Thiên Huế', N'', N'09828134119', N'hanh02061991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4476, N'Lê Hồng Loan', N'cô Loan', N'Thừa Thiên Huế', N'', N'08634539740', N'loan09071991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4477, N'Hoàng Thanh Quý', N'anh Quý', N'Thừa Thiên Huế', N'', N'09721020185', N'quy14081990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4478, N'Nguyễn Thị Quỳnh Nhi', N'cô Nhi', N'Quảng Trị', N'', N'08408235700', N'nhi21081989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4479, N'Trần Thị Lệ', N'cô Lệ', N'Đà Nẵng', N'', N'08081196235', N'le05071990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4480, N'Đinh Thị Phương', N'cô Phương', N'Quảng Bình', N'', N'04073278417', N'phuong10041990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4481, N'Trần Thị Thắm', N'cô Thắm', N'Thừa Thiên Huế', N'', N'08063146642', N'tham19031990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4482, N'Nguyễn Thanh Việt', N'anh Việt', N'Thừa Thiên Huế', N'', N'02417322645', N'viet20011987@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4483, N'Trần Thị Thanh Mỹ', N'cô Mỹ', N'Bình Định', N'', N'08755609471', N'my17101991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4484, N'Trần Thị Thanh Thuỷ', N'cô Thuỷ', N'Quảng Trị', N'', N'03284231111', N'thuy12071989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4485, N'Lê Văn Phúc', N'anh Phúc', N'Quảng Trị', N'', N'03131132605', N'phuc01061989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4486, N'Nguyễn Bá Anh', N'anh Anh', N'Nghệ An', N'', N'06588997184', N'anh10051990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4487, N'Lê Thị Thương', N'cô Thương', N'Quảng Trị', N'', N'06566192827', N'thuong15061985@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4488, N'Lê Công Mạnh', N'anh Mạnh', N'Quảng Trị', N'', N'01688823042', N'manh07011992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4489, N'Cao Thị Hòa', N'cô Hòa', N'Thừa Thiên Huế', N'', N'01365443656', N'hoa20021988@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4490, N'Lê Thị Ngọc Tuyền', N'cô Tuyền', N'Quảng Bình', N'', N'05928651783', N'tuyen10061990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4491, N'Bùi Thị Giang Thi', N'cô Thi', N'Thừa Thiên Huế', N'', N'04629125829', N'thi17031990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4492, N'Nguyễn Thị Quế', N'cô Quế', N'Thừa Thiên Huế', N'', N'06207742987', N'que20031991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4493, N'Bùi Thị Thùy Phương', N'cô Phương', N'Thừa Thiên Huế', N'', N'01231369627', N'phuong23041992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4494, N'Nguyễn Quang Hà', N'anh Hà', N'Quảng Bình', N'', N'06264333487', N'ha01011991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4495, N'Nguyễn Thị Thu', N'cô Thu', N'Thừa Thiên Huế', N'', N'03087606888', N'thu20051988@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4496, N'Phan Thị Nguyên', N'cô Nguyên', N'Quảng Bình', N'', N'08629828634', N'nguyen01011990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4497, N'Phạm Thị Ngâu', N'cô Ngâu', N'Thừa Thiên Huế', N'', N'08734632778', N'ngau20031990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4498, N'Hồ Dũng Cảm', N'anh Cảm', N'Quảng Trị', N'', N'07634061621', N'cam30041989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4499, N'Hán Thị Thùy Vân', N'cô Vân', N'Thanh Hóa', N'', N'03816260906', N'van15071991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4500, N'Dương Thị Kiều Oanh', N'cô Oanh', N'Quảng Trị', N'', N'01994259984', N'oanh10071991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4501, N'Trần Thị Hằng', N'cô Hằng', N'Thừa Thiên Huế', N'', N'03767088770', N'hang17041990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4502, N'Ngô Quang Phước', N'anh Phước', N'Quảng Trị', N'', N'07428565163', N'phuoc10101989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4503, N'Phan Thị Tuyết', N'cô Tuyết', N'Thừa Thiên Huế', N'', N'06863014623', N'tuyet10101989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4504, N'Võ Thị Thu', N'cô Thu', N'Nghệ An', N'', N'09268394183', N'thu19051990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4505, N'Phạm Thị Thanh', N'cô Thanh', N'Nghệ An', N'', N'05532289325', N'thanh07101992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4506, N'Trần Văn Chơn', N'anh Chơn', N'Thừa Thiên Huế', N'', N'09185141167', N'chon10101992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4507, N'Lê Hà Ngân', N'cô Ngân', N'Quảng Nam', N'', N'06508989037', N'ngan24021991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4508, N'Hàng Vủ Quang', N'anh Quang', N'Thừa Thiên Huế', N'', N'04736854207', N'quang26011991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4509, N'Bùi Thị Đoài', N'cô Đoài', N'Hà Tĩnh', N'', N'07321853902', N'doai11091992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4510, N'Ngô Quốc Dũng', N'anh Dũng', N'Thừa Thiên Huế', N'', N'09658975785', N'dung04091991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4511, N'Dương Thị Ước', N'cô Ước', N'Hà Tĩnh', N'', N'06939457242', N'uoc10021992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4512, N'Nguyễn Văn Anh', N'anh Anh', N'Nghệ An', N'', N'05733911147', N'anh15071989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4513, N'Nguyễn Hữu Lợi', N'anh Lợi', N'Thừa Thiên Huế', N'', N'07757853427', N'loi20091991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4514, N'Lê Quang Lộc', N'anh Lộc', N'Quảng Trị', N'', N'01554321409', N'loc04041992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4515, N'Nguyễn Văn Pháp', N'anh Pháp', N'Thừa Thiên Huế', N'', N'07268573196', N'phap11011991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4516, N'Trần Thị Nguyệt', N'cô Nguyệt', N'Quảng Bình', N'', N'03427559680', N'nguyet22021990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4517, N'Trần Hữu Bảo Hiếu', N'anh Hiếu', N'Thừa Thiên Huế', N'', N'08588592061', N'hieu25121992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4518, N'Nguyễn Thị Thùy Trang', N'cô Trang', N'Quảng Trị ', N'', N'03183284116', N'trang16021991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4519, N'Trịnh Ngọc Ninh', N'anh Ninh', N'Quảng Trị', N'', N'09515025467', N'ninh08051989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4520, N'Phan Thị Cẩm Ly', N'cô Ly', N'Quảng Nam', N'', N'03462831165', N'ly28081990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4521, N'Phan Thị Hoài', N'cô Hoài', N'Hà Tĩnh', N'', N'04899325772', N'hoai04041988@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4522, N'Nguyễn Đình Công', N'anh Công', N'Nghệ An', N'', N'03303647544', N'cong10061990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4523, N'Nguyễn Hồ Xuân Quý', N'cô Quý', N'Thừa Thiên Huế', N'', N'07797498443', N'quy21041991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4524, N'Mai Xuân Hoàn', N'anh Hoàn', N'Quảng Bình', N'', N'01056638093', N'hoan03021990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4525, N'Lê Thị Hạnh', N'cô Hạnh', N'Quảng Nam', N'', N'03885139550', N'hanh01011990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4526, N'Hồ Thị Hồng Đóa', N'cô Đóa', N'Thừa Thiên Huế', N'', N'02025211795', N'doa07061991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4527, N'Nguyễn Thế Quân', N'anh Quân', N'Hà Tĩnh', N'', N'07821205598', N'quan20061990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4528, N'Nguyễn Đình Đạt', N'anh Đạt', N'Thừa Thiên Huế', N'', N'04808774998', N'dat13101990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4529, N'Mai Kim Tánh', N'anh Tánh', N'Thừa Thiên Huế', N'', N'01282803773', N'tanh20121991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4530, N'Nguyễn Thị Hồng Ngát', N'cô Ngát', N'Quảng Bình', N'', N'06827531072', N'ngat19081989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4531, N'Lê Công Danh', N'anh Danh', N'Thừa Thiên Huế', N'', N'06961085632', N'danh09011992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4532, N'Nguyễn Thị Thu Hằng', N'cô Hằng', N'Hà Tĩnh', N'', N'03777778583', N'hang24011991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4533, N'Chu Thị Châu', N'cô Châu', N'Nghệ An', N'', N'04768739335', N'chau05111991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4534, N'Nguyễn Văn Hiếu', N'anh Hiếu', N'Nghệ An', N'', N'08854948773', N'hieu09101988@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4535, N'Nguyễn Thị Thuỷ', N'cô Thuỷ', N'Nghệ An', N'', N'07148744495', N'thuy12111992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4536, N'Nguyễn Văn Nhật', N'anh Nhật', N'Quảng Trị', N'', N'08725454130', N'nhat09051991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4537, N'Nguyễn Thị Hà Phương', N'cô Phương', N'Nghệ An', N'', N'03113721276', N'phuong01061990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4538, N'Hoàng Tài', N'anh Tài', N'Thừa Thiên Huế', N'', N'03015349079', N'tai10071990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4539, N'Nguyễn Thị Như Quỳnh', N'cô Quỳnh', N'Quảng Bình', N'', N'09927702509', N'quynh30101992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4540, N'Lê Văn Phú', N'anh Phú', N'Thừa Thiên Huế', N'', N'02246596365', N'phu12091982@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4541, N'Trần Thị Nga', N'cô Nga', N'Phú Thọ', N'', N'01163752521', N'nga20071990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4542, N'Nguyễn Thị Nhân', N'cô Nhân', N'Nghệ An', N'', N'04869231466', N'nhan15051990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4543, N'Ngô Thị Hiền', N'cô Hiền', N'Nghệ An', N'', N'08766776608', N'hien18051990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4544, N'Lê Thị Hoa', N'cô Hoa', N'Quảng Bình', N'', N'08999053011', N'hoa26111991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4545, N'Võ Kim Bảo', N'anh Bảo', N'Thừa Thiên Huế', N'', N'02599855372', N'bao24061991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4546, N'Võ Thị Hiếu', N'cô Hiếu', N'Hà Tĩnh', N'', N'04722765174', N'hieu10051991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4547, N'Trịnh Minh Tâm', N'anh Tâm', N'Nam Định', N'', N'01669171578', N'tam11061990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4548, N'Dương Thị Phương Minh', N'cô Minh', N'Quảng Bình ', N'', N'05553129259', N'minh10101991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4549, N'Võ Thị Hoài My', N'cô My', N'Quảng Nam', N'', N'07827179059', N'my14051989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4550, N'Trần Thị Thảo', N'cô Thảo', N'Nghệ An', N'', N'08179346747', N'thao11081991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4551, N'Trần Ngọc Đạt', N'anh Đạt', N'Quảng Trị', N'', N'02111055884', N'dat20071992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4552, N'Đoàn Minh Triết', N'anh Triết', N'Thừa Thiên Huế', N'', N'07874738886', N'triet19091991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4553, N'Nguyễn Thị Hoài Phương', N'cô Phương', N'Thừa Thiên Huế', N'', N'01486382472', N'phuong05041988@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4554, N'Trần Thị Bình', N'cô Bình', N'Nghệ An', N'', N'06428961699', N'binh28111990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4555, N'Đinh Thị Hoà', N'cô Hoà', N'Quảng Bình', N'', N'09452605436', N'hoa20071989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4556, N'Đặng Thị Giang', N'cô Giang', N'Hà Tĩnh', N'', N'08732703482', N'giang06081991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4557, N'Nguyễn Tiến Thành', N'anh Thành', N'Bình Định', N'', N'08951139154', N'thanh08041990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4558, N'Đặng Thị Thu Hà', N'cô Hà', N'Kon Tum', N'', N'08212106839', N'ha17081988@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4559, N'Hoàng Văn Tâm', N'anh Tâm', N'Quảng Bình', N'', N'06823498436', N'tam26011988@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4560, N'Phan Công Học', N'anh Học', N'Hà Tĩnh', N'', N'09707684969', N'hoc25081990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4561, N'Trần Trung Hải', N'anh Hải', N'Thừa Thiên Huế ', N'', N'09196572333', N'hai19111992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4562, N'Phan Thị Kim Thảo', N'cô Thảo', N'Thừa Thiên Huế', N'', N'06315362924', N'thao06101991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4563, N'Châu Quốc Lâm', N'anh Lâm', N'Thừa Thiên Huế', N'', N'08077018553', N'lam30081989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4564, N'Nguyễn Hữu Toản', N'anh Toản', N'Quảng Bình', N'', N'08526365178', N'toan16011990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4565, N'Hồ Minh Khánh', N'anh Khánh', N'Thừa Thiên Huế', N'', N'09537622492', N'khanh30121991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4566, N'Ngô Thị Lý', N'cô Lý', N'Quảng Trị', N'', N'09513652327', N'ly18031990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4567, N'Nguyễn Thị Thu Nga', N'cô Nga', N'Thừa Thiên Huế', N'', N'01538912012', N'nga20091990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4568, N'Ngô Quang Mạnh', N'anh Mạnh', N'Quảng Trị', N'', N'09726923276', N'manh05111990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4569, N'Phan Thị Hồng Phượng', N'cô Phượng', N'Tuyên Quang', N'', N'06759050492', N'phuong21021991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4570, N'Hoàng Thị Thu Hồng', N'cô Hồng', N'Hà Tĩnh', N'', N'03046597332', N'hong24021990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4571, N'Hồ Văn Hải', N'anh Hải', N'Thừa Thiên Huế', N'', N'07893988938', N'hai10061990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4572, N'Nguyễn Phước Nam', N'anh Nam', N'Thừa Thiên Huế', N'', N'04739227253', N'nam26021990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4573, N'Nguyễn Thị Vân Quỳnh', N'cô Quỳnh', N'Quảng Bình', N'', N'07165166557', N'quynh10011990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4574, N'Phạm Thị Vi', N'cô Vi', N'Quảng Nam', N'', N'01342446801', N'vi28101990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4575, N'Giang Trung Tiến', N'anh Tiến', N'Thừa Thiên Huế', N'', N'05676037589', N'tien03021991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4576, N'Nguyễn Nhật Thành', N'anh Thành', N'Thừa Thiên Huế', N'', N'09718138481', N'thanh2671990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4577, N'Tôn Nữ Phương Như', N'cô Như', N'Thừa Thiên Huế', N'', N'09214405585', N'nhu07071992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4578, N'Võ Ngọc Quang', N'anh Quang', N'Thừa Thiên Huế', N'', N'03913958055', N'quang03111991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4579, N'Lê Đình Cường', N'anh Cường', N'Quảng Bình', N'', N'06988380663', N'cuong04051990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4580, N'Lê Hoàng Vũ', N'anh Vũ', N'Quảng Bình', N'', N'03516208741', N'vu15021992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4581, N'Phạm Hữu Khánh Toàn', N'anh Toàn', N'Thừa Thiên Huế', N'', N'08888007222', N'toan13041991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4582, N'Nguyễn Văn Dũng', N'anh Dũng', N'Quảng Trị', N'', N'05147080510', N'dung06051988@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4583, N'Lê Thị Thúy Phượng', N'cô Phượng', N'Thừa Thiên Huế', N'', N'05629414055', N'phuong25121990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4584, N'Ngô Thanh Thảo', N'cô Thảo', N'Nghệ An', N'', N'05587346679', N'thao22041989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4585, N'Trần Thị Hà Uyên', N'cô Uyên', N'Thừa Thiên Huế', N'', N'07374729023', N'uyen23031991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4586, N'Nguyễn Thái Thục Nhi', N'cô Nhi', N'Thừa Thiên Huế', N'', N'09123240344', N'nhi23101992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4587, N'Lê Viết Nghĩa', N'anh Nghĩa', N'Thừa Thiên Huế', N'', N'02369053516', N'nghia18051990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4588, N'Hoàng Võ Thiện', N'anh Thiện', N'Thừa Thiên Huế', N'', N'05553419314', N'thien18041991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4589, N'Hà Huy Hiếu', N'anh Hiếu', N'Hà Tĩnh', N'', N'03569199356', N'hieu03091989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4590, N'Tôn Nữ Huy Dung', N'cô Dung', N'Thừa Thiên Huế', N'', N'02411637012', N'dung24121990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4591, N'Lê Thanh Hải', N'anh Hải', N'Thanh Hóa', N'', N'03553743357', N'hai20111991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4592, N'Lê Quang Hải', N'anh Hải', N'Thừa Thiên Huế', N'', N'01997499216', N'hai14121990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4593, N'Nguyễn Hoài An', N'anh An', N'Thừa Thiên Huế', N'', N'05697012055', N'an19041990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4594, N'Hà Trung Hiếu', N'anh Hiếu', N'Nghệ An', N'', N'06795342842', N'hieu04041990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4595, N'Nguyễn Thị Thuý An', N'cô An', N'Quảng Trị', N'', N'08249103831', N'an30101991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4596, N'Trần Xuân Ngọc', N'anh Ngọc', N'Hà Tĩnh', N'', N'07302199690', N'ngoc09101989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4597, N'Hồ Xuân Việt', N'anh Việt', N'Thừa Thiên Huế', N'', N'05364043112', N'viet19061983@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4598, N'Nguyễn Thị Yến Nga', N'cô Nga', N'Thừa Thiên Huế', N'', N'04069836284', N'nga25061992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4599, N'Đoàn Thị Hậu', N'cô Hậu', N'Gia Lai', N'', N'09429436040', N'hau05091990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4600, N'Trương Thị Quỳnh Anh', N'cô Anh', N'Thừa Thiên Huế', N'', N'07999525328', N'anh04101991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4601, N'Hoàng Thị Hảo', N'cô Hảo', N'Thừa Thiên Huế', N'', N'02577234867', N'hao28011991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4602, N'Nguyễn Đình Tri', N'anh Tri', N'Thừa Thiên Huế', N'', N'09817330912', N'tri21011991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4603, N'Huỳnh Quang Phước', N'anh Phước', N'Thừa Thiên Huế', N'', N'05509901918', N'phuoc11041989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4604, N'Nguyễn Thị Khuyên', N'cô Khuyên', N'Hà Tĩnh', N'', N'06746155220', N'khuyen17121991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4605, N'Nguyễn Thị Thuý Hà', N'cô Hà', N'Quảng Bình', N'', N'03399648657', N'ha15021991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4606, N'Hồ Thị Thuý Phượng', N'cô Phượng', N'Quảng Bình', N'', N'01008728413', N'phuong07071991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4607, N'Trần Thị Bảo Anh', N'cô Anh', N'Thừa Thiên Huế', N'', N'08738563066', N'anh15081991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4608, N'Lê Văn Quý', N'anh Quý', N'Nghệ An', N'', N'07939561532', N'quy10061992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4609, N'Hoàng Thị Thuý', N'cô Thuý', N'Quảng Trị', N'', N'07392054256', N'thuy01051990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4610, N'Nguyễn Thị Hạnh', N'cô Hạnh', N'Quảng Bình', N'', N'05667372100', N'hanh10101991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4611, N'Nguyễn Văn Kỳ', N'anh Kỳ', N'Thừa Thiên Huế', N'', N'06581111628', N'ky17061990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4612, N'Bùi Thông Hải Thiện', N'anh Thiện', N'Thừa Thiên Huế', N'', N'08374937540', N'thien03051991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4613, N'Hoàng Văn Phú', N'anh Phú', N'Quảng Bình', N'', N'04155313297', N'phu20111990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4614, N'Nguyễn Thị Thanh Nhàn', N'cô Nhàn', N'Thừa Thiên Huế', N'', N'05471951532', N'nhan07091990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4615, N'Nguyễn Duy Sơn', N'anh Sơn', N'Thừa Thiên Huế', N'', N'05776999462', N'son21061990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4616, N'Nguyễn Văn Hưng', N'anh Hưng', N'Thừa Thiên Huế', N'', N'09132944786', N'hung21091988@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4617, N'Phan Thị Nguyên', N'cô Nguyên', N'Hà Tĩnh', N'', N'02056650070', N'nguyen02031991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4618, N'Nguyễn Anh Tuấn', N'anh Tuấn', N'Thừa Thiên Huế', N'', N'08676428361', N'tuan01101987@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4619, N'Nguyễn Thị Mỹ Tuyên', N'cô Tuyên', N'Quảng Bình', N'', N'02028395092', N'tuyen16041990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4620, N'Lê Quang Chinh', N'anh Chinh', N'Quảng Bình', N'', N'01105004318', N'chinh06091991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4621, N'Trần Vĩnh Thuyết', N'anh Thuyết', N'Thừa Thiên Huế', N'', N'08518231686', N'thuyet15101992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4622, N'Đỗ Thị Dàng', N'cô Dàng', N'Hải Dương', N'', N'06998965174', N'dang14021990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4623, N'Nguyễn Thị Thanh', N'cô Thanh', N'Hưng Yên', N'', N'09128487096', N'thanh02031990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4624, N'Lê Thị Bích Lý', N'cô Lý', N'Quảng Bình', N'', N'01505758420', N'ly19061989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4625, N'Nguyễn Hữu Tuấn', N'anh Tuấn', N'Quảng Bình', N'', N'04745751150', N'tuan25101989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4626, N'Ngô Viết Nhân', N'anh Nhân', N'Thừa Thiên Huế', N'', N'08583697293', N'nhan12031992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4627, N'Trần Trung', N'anh Trung', N'Thừa Thiên Huế', N'', N'04498559687', N'trung12121991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4628, N'Trần Ngọc Thái', N'anh Thái', N'Quảng Nam', N'', N'05472886608', N'thai29031990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4629, N'Nguyễn Thị Nghi Nhạn', N'cô Nhạn', N'Thừa Thiên Huế', N'', N'02783441504', N'nhan24101990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4630, N'Lương Thanh Là', N'anh Là', N'Quảng Nam', N'', N'03787702140', N'la02071990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4631, N'Nguyễn Lê Thị Minh Phương', N'cô Phương', N'Thừa Thiên Huế', N'', N'02311224965', N'phuong20081990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4632, N'Văn Thị Mỹ Hạnh', N'cô Hạnh', N'Thừa Thiên Huế', N'', N'06098607921', N'hanh26041991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4633, N'Nguyễn Thị Tuyển', N'cô Tuyển', N'Thừa Thiên Huế', N'', N'05526928165', N'tuyen20101990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4634, N'Trần Thị Hồng Giang', N'cô Giang', N'Quảng Bình', N'', N'01133525787', N'giang13041992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4635, N'Nguyễn Bách Nhẫn', N'anh Nhẫn', N'Thừa Thiên Huế', N'', N'01692319529', N'nhan04091990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4636, N'Nguyễn Thị Thuý Hằng', N'cô Hằng', N'Quảng Bình', N'', N'06074912282', N'hang23091991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4637, N'Dương Huy Cường', N'anh Cường', N'Quảng Trị', N'', N'06968808945', N'cuong08111984@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4638, N'Đỗ Thị Thu Hà', N'cô Hà', N'Thừa Thiên Huế', N'', N'01659732998', N'ha28111992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4639, N'Trần Thị An', N'cô An', N'Nghệ An', N'', N'08498240174', N'an20111991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4640, N'Nguyễn Văn Tuấn', N'anh Tuấn', N'Thừa Thiên Huế', N'', N'09153942122', N'tuan27121991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4641, N'Nguyễn Phi Hùng', N'anh Hùng', N'Thừa Thiên Huế', N'', N'08128563423', N'hung18101991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4642, N'Nguyễn Quang Huy', N'anh Huy', N'Thừa Thiên Huế', N'', N'08361654917', N'huy19101990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4643, N'Nguyễn Thị Mai Trang', N'cô Trang', N'Quảng Trị', N'', N'03743580183', N'trang24021992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4644, N'Nguyễn Thị Xinh', N'cô Xinh', N'Hà Nội', N'', N'04316156830', N'xinh22091992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4645, N'Nguyễn Như Bảo Việt', N'anh Việt', N'Thừa Thiên Huế', N'', N'02078412615', N'viet18111992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4646, N'Nguyễn Thị Thảo', N'cô Thảo', N'Hà Tĩnh', N'', N'07633855111', N'thao06011990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4647, N'Nguyễn Văn Hiếu', N'anh Hiếu', N'Thừa Thiên Huế', N'', N'05949493300', N'hieu12021991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4648, N'Phan Thị Tường Vy', N'cô Vy', N'Quảng Nam', N'', N'04485080726', N'vy12061990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4649, N'Lê Thị Ngọc Bấp', N'cô Bấp', N'Thừa Thiên Huế', N'', N'02624973125', N'bap20051991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4650, N'Nguyễn Thị Thuỳ', N'cô Thuỳ', N'Hà Tĩnh', N'', N'09272774278', N'thuy02081990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4651, N'Nguyễn Ngọc Duẩn', N'anh Duẩn', N'Thừa Thiên Huế', N'', N'01432692150', N'duan18031990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4652, N'Nguyễn Thị Yến', N'cô Yến', N'Quảng Bình', N'', N'07963680744', N'yen05021992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4653, N'Hồng Nguyên Diệu Ngân', N'cô Ngân', N'Thừa Thiên Huế', N'', N'05386694012', N'ngan06051991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4654, N'Nguyễn Hoàng Quân', N'anh Quân', N'Quảng Bình', N'', N'01771518429', N'quan01081990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4655, N'Nguyễn Sang', N'anh Sang', N'Thừa Thiên Huế', N'', N'09211741977', N'sang29051992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4656, N'Cao Thị Loan', N'cô Loan', N'Nghệ An', N'', N'01722549289', N'loan04101992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4657, N'Nguyễn Thị Ngên', N'cô Ngên', N'Thừa Thiên Huế', N'', N'03771059431', N'ngen10091991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4658, N'Trần Quang Diệu', N'anh Diệu', N'Quảng Nam', N'', N'09904285953', N'dieu10121991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4659, N'Phùng Thị Minh Hằng', N'cô Hằng', N'Đà Nẵng', N'', N'06179580345', N'hang16011990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4660, N'Trương Thị Hiền', N'cô Hiền', N'Quảng Bình', N'', N'01029284037', N'hien18081992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4661, N'Nguyễn Thị Hằng', N'cô Hằng', N'Thanh Hóa', N'', N'08647008707', N'hang22071989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4662, N'Trần Thị Như Thảo', N'cô Thảo', N'Thừa Thiên Huế', N'', N'05989135275', N'thao26081991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4663, N'Phạm Thị Mỹ Duyên', N'cô Duyên', N'Hà Tĩnh', N'', N'01224700427', N'duyen02091990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4664, N'Phạm Thị Tuyết', N'cô Tuyết', N'Thừa Thiên Huế', N'', N'06629039528', N'tuyet26031992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4665, N'Nguyễn Thị Thiết', N'cô Thiết', N'hà Tĩnh', N'', N'06862047767', N'thiet12021992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4666, N'Trương Minh Cảnh', N'anh Cảnh', N'Quảng Trị', N'', N'05976955677', N'canh14041988@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4667, N'Trần Thị Hạnh', N'cô Hạnh', N'Thanh Hóa', N'', N'02891032185', N'hanh02011991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4668, N'Kiều Thị Điệp', N'cô Điệp', N'Nghệ An', N'', N'05105393560', N'diep13121989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4669, N'Nguyễn Văn Thân', N'anh Thân', N'Thừa Thiên Huế', N'', N'06723544761', N'than13071992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4670, N'Văn Thị Hiền', N'cô Hiền', N'Thừa Thiên Huế', N'', N'02931092678', N'hien20051991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4671, N'Nguyễn Ngọc Quỳnh', N'anh Quỳnh', N'Quảng Trị', N'', N'01218348831', N'quynh27081989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4672, N'Nguyễn Thị Thu Hoài', N'cô Hoài', N'Hà Tĩnh', N'', N'08922270208', N'hoai05071992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4673, N'Nguyễn Thị An', N'cô An', N'Hà Tĩnh', N'', N'06657345757', N'an08091990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4674, N'Nguyễn Văn Lộc', N'anh Lộc', N'Thừa Thiên Huế', N'', N'05764806500', N'loc25101991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4675, N'Nguyễn Văn Nam', N'anh Nam', N'Nam Định', N'', N'06465096142', N'nam15041989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4676, N'Lê Thị Linh', N'cô Linh', N'Kon Tum', N'', N'03678405910', N'linh20061991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4677, N'Âu Thị Thanh Huyền', N'cô Huyền', N'Quảng Nam', N'', N'07384928874', N'huyen10031991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4678, N'Phan Anh Quốc', N'anh Quốc', N'Thừa Thiên Huế', N'', N'07301707888', N'quoc03021990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4679, N'Trần Ngọc Huy', N'anh Huy', N'Thừa Thiên Huế', N'', N'01198118815', N'huy28071991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4680, N'Nguyễn Thị Thủy', N'cô Thủy', N'Thừa Thiên Huế', N'', N'01619709049', N'thuy29071992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4681, N'Phạm Thị Hương', N'cô Hương', N'Thừa Thiên Huế', N'', N'06595629323', N'huong04031991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4682, N'Hoàng Thị Thanh', N'cô Thanh', N'Thừa Thiên Huế', N'', N'04375623083', N'thanh09121989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4683, N'Trần Thị Ngọc Trâm', N'cô Trâm', N'Hà Tĩnh', N'', N'02104085780', N'tram03081989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4684, N'Nguyễn Thị Kim Oanh', N'cô Oanh', N'Quảng Nam', N'', N'02737154528', N'oanh05111989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4685, N'Lê Thị Thanh Thanh', N'cô Thanh', N'Quảng Bình', N'', N'07084770160', N'thanh020587@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4686, N'Trần Thị Thanh Phương', N'cô Phương', N'Đà Nẵng', N'', N'06872709999', N'phuong13071990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4687, N'Nguyễn Thị Quỳnh Anh', N'cô Anh', N'Quảng Trị', N'', N'04868016903', N'anh02111990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4688, N'Hồ Xuân Vinh', N'anh Vinh', N'Thừa Thiên Huế', N'', N'08729473880', N'vinh08071990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4689, N'Trịnh Văn Minh', N'anh Minh', N'Quảng Bình', N'', N'04861874972', N'minh03061991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4690, N'Phạm Văn Thanh', N'anh Thanh', N'Quảng Nam', N'', N'09285307208', N'thanh10111990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4691, N'Nguyễn Hữu Kiên', N'anh Kiên', N'Nghệ An', N'', N'05436808391', N'kien20021990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4692, N'Hoàng Thị Ngọc', N'cô Ngọc', N'Thừa Thiên Huế', N'', N'01737395008', N'ngoc11111989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4693, N'Nguyễn Đức Thành Tín', N'anh Tín', N'Thừa Thiên Huế', N'', N'02896457281', N'tin02021989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4694, N'Lưu Qui Nhi', N'anh Nhi', N'Phú Yên', N'', N'02403192256', N'nhi10011990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4695, N'Lê Thị Hoa', N'cô Hoa', N'Thanh Hóa', N'', N'07594324429', N'hoa10051991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4696, N'Võ Văn Phải', N'anh Phải', N'Thừa Thiên Huế', N'', N'03401496063', N'phai30011989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4697, N'Trần Công Tuấn', N'anh Tuấn', N'Quảng nam', N'', N'05243800388', N'tuan04121992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4698, N'Hồ Văn Sơn', N'anh Sơn', N'Thừa Thiên Huế', N'', N'01217792195', N'son12091989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4699, N'Bùi Thị Trà', N'cô Trà', N'Quảng Bình', N'', N'04897893090', N'tra26031991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4700, N'Thái Đình Hoàng', N'anh Hoàng', N'Hà Tĩnh', N'', N'06887467618', N'hoang17061990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4701, N'Đỗ Viết Hồi', N'anh Hồi', N'Thừa Thiên Huế', N'', N'05042397078', N'hoi20081990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4702, N'Trần Ninh Khánh', N'anh Khánh', N'Thừa Thiên Huế', N'', N'04293164463', N'khanh16021991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4703, N'Nguyễn Thị Tịnh', N'cô Tịnh', N'Hà Tĩnh', N'', N'09024162737', N'tinh12031991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4704, N'Bùi Anh Lộc', N'anh Lộc', N'Thừa Thiên Huế', N'', N'07186136515', N'loc09091991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4705, N'Nguyễn Thị Ngọc Huê', N'cô Huê', N'Thừa Thiên Huế', N'', N'09116851030', N'hue30011990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4706, N'Nguyễn Tất Việt', N'anh Việt', N'Quảng Trị', N'', N'09655626953', N'viet18081987@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4707, N'Đỗ Thị Thật', N'cô Thật', N'Thừa Thiên Huế', N'', N'04896490870', N'that05091990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4708, N'Võ Văn Trí', N'anh Trí', N'Quảng Trị ', N'', N'09418555880', N'tri13071992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4709, N'Nguyễn Thị Hằng', N'cô Hằng', N'Quảng Trị', N'', N'05642777016', N'hang20031990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4710, N'Võ Thị Thu Phương', N'cô Phương', N'Quảng Trị', N'', N'04841223295', N'phuong11021989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4711, N'Võ Minh Trình', N'anh Trình', N'Nghệ An', N'', N'05104646217', N'trinh16071991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4712, N'Hồ Hà Viết Trinh', N'cô Trinh', N'Quảng Nam', N'', N'02278875084', N'trinh20091992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4713, N'Nguyễn Trọng Ánh', N'anh Ánh', N'Hà Tĩnh', N'', N'06805590678', N'anh23011991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4714, N'Trần Văn Sơn', N'anh Sơn', N'Nghệ An', N'', N'01361802988', N'son26101991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4715, N'Lang Thị Tuệ', N'cô Tuệ', N'Nghệ An', N'', N'03106400633', N'tue15051989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4716, N'Huỳnh Thị Minh Trí', N'cô Trí', N'Thừa Thiên Huế', N'', N'02182778018', N'tri29011989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4717, N'Phan Thị Đào', N'cô Đào', N'Nghệ An', N'', N'02517108578', N'dao24071992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4718, N'Võ Thị Thuý Ngà', N'cô Ngà', N'Hà Tĩnh', N'', N'02765059777', N'nga11011990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4719, N'Hoàng Minh Mỹ', N'anh Mỹ', N'Thừa Thiên Huế', N'', N'07631876835', N'my13071990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4720, N'La Thị Kem Ly', N'cô Ly', N'Thừa Thiên Huế', N'', N'02354137979', N'ly10121990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4721, N'Phạm Thế An', N'anh An', N'Quảng Trị', N'', N'06175487847', N'an01011991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4722, N'Tôn Thất Tiến', N'anh Tiến', N'Thừa Thiên Huế', N'', N'08684047165', N'tien28081986@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4723, N'Hoàng Thị Vi', N'cô Vi', N'Quảng Bình', N'', N'06234052877', N'vi28091989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4724, N'Đặng Hữu Quyền', N'anh Quyền', N'Thừa Thiên Huế', N'', N'02823751463', N'quyen06111991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4725, N'Trần Thị Tú Hoa', N'cô Hoa', N'Nam Định', N'', N'04369116941', N'hoa02011990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4726, N'Ngô Văn Dũng', N'anh Dũng', N'Thừa Thiên Huế', N'', N'01354419305', N'dung17081989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4727, N'Nguyễn Văn Sơn', N'anh Sơn', N'Bắc Ninh', N'', N'06181503917', N'son01071991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4728, N'Nguyễn Khoa Tri', N'anh Tri', N'Thừa Thiên Huế', N'', N'03045315564', N'tri16051990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4729, N'Trần Thiện Khiêm', N'anh Khiêm', N'Đà Nẵng', N'', N'01581618774', N'khiem17091991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4730, N'Bùi Thị Thắm', N'cô Thắm', N'Nghệ An', N'', N'07064641393', N'tham29051989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4731, N'Cái Thị Diệu Ánh', N'cô Ánh', N'Thừa Thiên Huế', N'', N'04047366283', N'anh01031991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4732, N'Hoàng Thị Thu', N'cô Thu', N'Hà Tĩnh', N'', N'04768444595', N'thu04031992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4733, N'Hoàng Thị Thu', N'cô Thu', N'Quảng Trị', N'', N'03252638907', N'thu15021990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4734, N'Trương Thị Thu Hằng', N'cô Hằng', N'Thừa Thiên Huế', N'', N'07254096625', N'hang24061991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4735, N'Nguyễn Thị Thắm', N'cô Thắm', N'Quảng Trị', N'', N'02903034166', N'tham01081989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4736, N'Đoàn Sơn Tùng', N'anh Tùng', N'Quảng Bình', N'', N'06609298492', N'tung03081988@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4737, N'Nguyễn Văn Mẫn', N'anh Mẫn', N'Thừa Thiên Huế', N'', N'05879799857', N'man21091991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4738, N'Nguyễn Thị Hiệp', N'cô Hiệp', N'Thừa Thiên Huế', N'', N'04772332987', N'hiep10101990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4739, N'Trần Thị Xuân Hiếu', N'cô Hiếu', N'Quảng Nam', N'', N'07583306689', N'hieu23121990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4740, N'Nguyễn Hoàng Vương', N'anh Vương', N'Thừa Thiên Huế', N'', N'01693953569', N'vuong09091991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4741, N'Phan Thị Thanh Hải', N'cô Hải', N'Quảng Trị', N'', N'03032245861', N'hai17081991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4742, N'Phan Văn Tỵ', N'anh Tỵ', N'Thừa Thiên Huế', N'', N'08167036671', N'ty17101989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4743, N'Hoàng Ngọc Quang', N'anh Quang', N'Quảng Trị', N'', N'06416826216', N'quang01031986@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4744, N'Võ Thị Thảo', N'cô Thảo', N'Thừa Thiên Huế', N'', N'08258517453', N'thao23021990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4745, N'Trần Xuân Lâm', N'anh Lâm', N'Quảng Trị', N'', N'07847448220', N'lam02011990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4746, N'Trần Văn Ninh', N'anh Ninh', N'Thừa Thiên Huế', N'', N'02309290736', N'ninh20041991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4747, N'Nguyễn Thái Dương', N'anh Dương', N'Hà Tĩnh', N'', N'05441982629', N'duong11021992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4748, N'Nguyễn Cảnh Liêm', N'anh Liêm', N'Thừa Thiên Huế', N'', N'03045750383', N'liem22111990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4749, N'Lê Quý Hiền', N'anh Hiền', N'Thừa Thiên Huế', N'', N'03936493396', N'hien27101991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4750, N'Trần Xuân Liêm', N'anh Liêm', N'Thừa Thiên Huế', N'', N'03819232216', N'liem18071992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4751, N'Nguyễn Thanh Hoài Mân', N'cô Mân', N'Thừa Thiên Huế', N'', N'05396044172', N'man25101991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4752, N'Hồ Thị Ngọc Diệu', N'cô Diệu', N'Thừa Thiên Huế', N'', N'09007709918', N'dieu12011990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4753, N'Trần Văn Thịnh', N'anh Thịnh', N'Bình Định', N'', N'08484177909', N'thinh25111988@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4754, N'Trương Thị Như Hằng', N'cô Hằng', N'Quảng Bình', N'', N'06014281587', N'hang26111988@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4755, N'Phạm Huy Hiệu', N'anh Hiệu', N'Ninh Bình', N'', N'08859781685', N'hieu11111990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4756, N'Nguyễn Thị Hằng', N'cô Hằng', N'Nghệ An', N'', N'08144350684', N'hang15031992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4757, N'Nguyễn Đình Nhật', N'anh Nhật', N'Thừa Thiên Huế', N'', N'09057078854', N'nhat25091990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4758, N'Nguyễn Thanh Hà', N'anh Hà', N'Hà Tĩnh', N'', N'03033582905', N'ha05051990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4759, N'Võ Thị Yến Thu', N'cô Thu', N'Thừa Thiên Huế', N'', N'05233955167', N'thu10101991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4760, N'Nguyễn Hữu Sơn', N'anh Sơn', N'Thừa Thiên Huế', N'', N'02312525929', N'son10021991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4761, N'Trần Thị Hòa', N'cô Hòa', N'Quảng Bình', N'', N'04612171273', N'hoa10101990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4762, N'Huỳnh Thị Ngọc Anh', N'cô Anh', N'Quảng Nam', N'', N'09682899956', N'anh10031992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4763, N'Đinh Quốc Hiến', N'anh Hiến', N'Quảng Bình', N'', N'09001613950', N'hien20091992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4764, N'Nguyễn Thị Trang', N'cô Trang', N'Quảng Trị', N'', N'09126031513', N'trang27091991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4765, N'Nguyễn Thị Hà Trang', N'cô Trang', N'Thừa Thiên huế', N'', N'05384823084', N'trang03081990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4766, N'Trần Quốc Huy', N'anh Huy', N'Thừa Thiên Huế', N'', N'05071047135', N'huy18071990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4767, N'Lê Thị Phương Anh', N'cô Anh', N'Hà Tĩnh', N'', N'09892512375', N'anh13051990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4768, N'Ngô Phước Thịnh', N'anh Thịnh', N'Thừa Thiên Huế', N'', N'05941597087', N'thinh27031989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4769, N'Hoàng Thị Mạnh', N'cô Mạnh', N'Quảng Bình', N'', N'08985220408', N'manh26061989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4770, N'Dương Trung Hiếu', N'anh Hiếu', N'Khánh Hòa', N'', N'09649736249', N'hieu19011990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4771, N'Trương Minh Thái', N'anh Thái', N'Hậu Giang ', N'', N'05826563341', N'thai25041991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4772, N'Trần Ngọc Thạnh', N'anh Thạnh', N'Thừa Thiên Huế', N'', N'05183014530', N'thanh22021991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4773, N'Đặng Đình Lập', N'anh Lập', N'Nghệ An', N'', N'06634597102', N'lap20111989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4774, N'Trần Ngọc Ân', N'anh Ân', N'Quảng Trị', N'', N'04073992337', N'an17041987@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4775, N'Nguyễn Hữu Tưởng', N'anh Tưởng', N'Hà Tĩnh', N'', N'08762681560', N'tuong20061991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4776, N'Nguyễn Thị Minh', N'cô Minh', N'Quảng Bình', N'', N'04526217915', N'minh06031988@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4777, N'Hồ Thị Quỳnh Nhi', N'cô Nhi', N'Thừa Thiên Huế', N'', N'02946743238', N'nhi11041990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4778, N'Nguyễn Thế Kim Trà', N'cô Trà', N'Quảng Bình', N'', N'03195716152', N'tra01111992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4779, N'Huỳnh Thị Tố Nga', N'cô Nga', N'Quảng Nam', N'', N'06917618035', N'nga17041990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4780, N'Ngô Thị Ngọc', N'cô Ngọc', N'Quảng Bình', N'', N'04582880244', N'ngoc06081990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4781, N'Đinh Duy Khánh', N'anh Khánh', N'Quảng Bình', N'', N'06399442107', N'khanh22041988@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4782, N'Nguyễn Ngọc Liệu', N'anh Liệu', N'Quảng Trị', N'', N'03017627518', N'lieu29101991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4783, N'Lê Nguyễn Phương Thảo', N'cô Thảo', N'Thừa Thiên Huế', N'', N'05994358497', N'thao28081992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4784, N'Nguyễn Trần Mễ Khuê', N'cô Khuê', N'Thừa Thiên Huế', N'', N'07252128464', N'khue28101989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4785, N'Mai Thị Hằng', N'cô Hằng', N'Quảng Trị ', N'', N'09663428215', N'hang11011992@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4786, N'Nguyễn Đình Huệ', N'anh Huệ', N'Nghệ An', N'', N'04788391254', N'hue26101989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4787, N'Nguyễn Văn Thông', N'anh Thông', N'Hà Tĩnh', N'', N'08593612851', N'thong05071990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4788, N'Trần Vĩnh Hoàng', N'anh Hoàng', N'Quảng Bình', N'', N'03268812098', N'hoang30041991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4789, N'Lê Thị Vui', N'cô Vui', N'Thừa Thiên Huế', N'', N'07277396316', N'vui03071990@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4790, N'Bùi Quang Bình', N'anh Bình', N'Thừa Thiên Huế', N'', N'06273657685', N'binh20071991@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4791, N'Nguyễn Thị Chân Phương', N'cô Phương', N'Quảng Nam', N'', N'06249060181', N'phuong10061989@myshop.com', N'123456', 0)
GO
INSERT [Customers] ([CustomerID], [CustomerName], [ContactName], [Province], [Address], [Phone], [Email], [Password], [IsLocked]) VALUES (4792, N'Đỗ Thị Nhàn', N'cô Nhàn', N'Quảng Bình', N'', N'09493856821', N'nhan15081992@myshop.com', N'123456', 0)
GO
SET IDENTITY_INSERT [Customers] OFF
GO
SET IDENTITY_INSERT [Employees] ON 
GO
INSERT [Employees] ([EmployeeID], [FullName], [BirthDate], [Address], [Phone], [Email], [Password], [Photo], [IsWorking]) VALUES (1, N'Lê Đức Dũng', CAST(N'1980-10-09' AS Date), N'13/57 Trần Phú, TP Huế', N'05128097385', N'leducdung@mycompany.com', N'123456', N'', 1)
GO
INSERT [Employees] ([EmployeeID], [FullName], [BirthDate], [Address], [Phone], [Email], [Password], [Photo], [IsWorking]) VALUES (2, N'Lê Thị My Na', CAST(N'1995-06-26' AS Date), N'24/5 Tam Thai, Huế', N'07135895079', N'lethimyna@mycompany.com', N'123456', N'', 1)
GO
INSERT [Employees] ([EmployeeID], [FullName], [BirthDate], [Address], [Phone], [Email], [Password], [Photo], [IsWorking]) VALUES (3, N'Nguyễn Tấn Tú', CAST(N'1995-02-08' AS Date), N'54/8 Nguyễn Hữu Cảnh, thành phố Huế', N'09444655327', N'nguyentantu@mycompany.com', N'123456', N'', 1)
GO
INSERT [Employees] ([EmployeeID], [FullName], [BirthDate], [Address], [Phone], [Email], [Password], [Photo], [IsWorking]) VALUES (4, N'Lê Thị Mỹ Ngân', CAST(N'1995-04-24' AS Date), N'5/2 Trần Thái Tổ', N'06193705608', N'lethimyngan@mycompany.com', N'123456', N'', 1)
GO
INSERT [Employees] ([EmployeeID], [FullName], [BirthDate], [Address], [Phone], [Email], [Password], [Photo], [IsWorking]) VALUES (5, N'Nguyễn Văn Quốc Nhật', CAST(N'1994-08-11' AS Date), N'6/2/281 Trần Hữu Dực', N'08256884817', N'nguyenvanquocnhat@mycompany.com', N'123456', N'', 1)
GO
INSERT [Employees] ([EmployeeID], [FullName], [BirthDate], [Address], [Phone], [Email], [Password], [Photo], [IsWorking]) VALUES (6, N'Khang Hữu Xuân', CAST(N'1995-07-09' AS Date), N'85/23 Nguyễn Huệ, Huế', N'08738122931', N'khanghuuxuan@mycompany.com', N'123456', N'', 1)
GO
INSERT [Employees] ([EmployeeID], [FullName], [BirthDate], [Address], [Phone], [Email], [Password], [Photo], [IsWorking]) VALUES (7, N'Nguyễn Tin', CAST(N'1995-03-08' AS Date), N'11/5 Thanh Hải, Huế', N'04632135949', N'nguyentin@mycompany.com', N'123456', N'', 1)
GO
INSERT [Employees] ([EmployeeID], [FullName], [BirthDate], [Address], [Phone], [Email], [Password], [Photo], [IsWorking]) VALUES (8, N'Tôn Nữ Trâm Anh', CAST(N'1974-08-01' AS Date), N'124 Trần Hưng Đạo, Huế', N'09402089550', N'tonnutramanh@mycompany.com', N'123456', N'', 1)
GO
INSERT [Employees] ([EmployeeID], [FullName], [BirthDate], [Address], [Phone], [Email], [Password], [Photo], [IsWorking]) VALUES (9, N'Nguyễn Thị Thanh Ngân', CAST(N'1973-11-01' AS Date), N'97 Duy Tân, Huế', N'06269045225', N'nguyenthithanhngan@mycompany.com', N'123456', N'', 1)
GO
INSERT [Employees] ([EmployeeID], [FullName], [BirthDate], [Address], [Phone], [Email], [Password], [Photo], [IsWorking]) VALUES (10, N'Bạch Văn Mạnh', CAST(N'1995-07-06' AS Date), N'77 An Dương Vương, Huế', N'08419618744', N'bachvanmanh@mycompany.com', N'123456', N'', 1)
GO
INSERT [Employees] ([EmployeeID], [FullName], [BirthDate], [Address], [Phone], [Email], [Password], [Photo], [IsWorking]) VALUES (11, N'Nguyễn Kim Ngàn', CAST(N'1995-01-08' AS Date), N'14/8 Hải Triều, Huế', N'05125943694', N'nguyenkimngan@mycompany.com', N'123456', N'', 1)
GO
INSERT [Employees] ([EmployeeID], [FullName], [BirthDate], [Address], [Phone], [Email], [Password], [Photo], [IsWorking]) VALUES (12, N'Hoàng Hão Phương Nhi', CAST(N'1975-01-01' AS Date), N'89 Thanh Hải, Huế', N'07416381571', N'hoanghaophuongnhi@mycompany.com', N'123456', N'', 1)
GO
INSERT [Employees] ([EmployeeID], [FullName], [BirthDate], [Address], [Phone], [Email], [Password], [Photo], [IsWorking]) VALUES (13, N'Trần Ngọc Bảo Phước', CAST(N'1995-01-22' AS Date), N'Quảng An, Quảng Điền, Thừa Thiên Huế', N'04336248816', N'tranngocbaophuoc@mycompany.com', N'123456', N'', 1)
GO
INSERT [Employees] ([EmployeeID], [FullName], [BirthDate], [Address], [Phone], [Email], [Password], [Photo], [IsWorking]) VALUES (14, N'Bùi Ngọc Kha', CAST(N'1995-02-02' AS Date), N'38/5 Thích Tịnh Khiết', N'03142038439', N'buingockha@mycompany.com', N'123456', N'', 1)
GO
INSERT [Employees] ([EmployeeID], [FullName], [BirthDate], [Address], [Phone], [Email], [Password], [Photo], [IsWorking]) VALUES (15, N'Nguyễn Ngọc Phú', CAST(N'1995-11-02' AS Date), N'77/3 Nguyễn Huệ, Huế', N'06263321366', N'nguyenngocphu@mycompany.com', N'123456', N'', 1)
GO
INSERT [Employees] ([EmployeeID], [FullName], [BirthDate], [Address], [Phone], [Email], [Password], [Photo], [IsWorking]) VALUES (16, N'Lê Hữu Hải', CAST(N'1993-11-30' AS Date), N'141/8 Minh Mạng, Huế', N'07917261395', N'lehuuhai@mycompany.com', N'123456', N'', 1)
GO
INSERT [Employees] ([EmployeeID], [FullName], [BirthDate], [Address], [Phone], [Email], [Password], [Photo], [IsWorking]) VALUES (17, N'Nguyễn Thị Bảo Hưng', CAST(N'1995-05-16' AS Date), N'118 Vạn Xuân, Kim Long, Huế', N'07789058669', N'nguyenthibaohung@mycompany.com', N'123456', N'', 1)
GO
INSERT [Employees] ([EmployeeID], [FullName], [BirthDate], [Address], [Phone], [Email], [Password], [Photo], [IsWorking]) VALUES (18, N'Nguyễn Văn Anh', CAST(N'1975-08-13' AS Date), N'18/94 Đặng Huy Trứ, Huế', N'06042929599', N'nguyenvananh@mycompany.com', N'123456', N'', 1)
GO
INSERT [Employees] ([EmployeeID], [FullName], [BirthDate], [Address], [Phone], [Email], [Password], [Photo], [IsWorking]) VALUES (19, N'Nguyễn Đức Hiếu', CAST(N'1977-02-10' AS Date), N'Tổ 8, khu vực 2, Thủy Dương, Thừa Thiên Huế', N'09916254340', N'nguyenduchieu@mycompany.com', N'123456', N'', 1)
GO
INSERT [Employees] ([EmployeeID], [FullName], [BirthDate], [Address], [Phone], [Email], [Password], [Photo], [IsWorking]) VALUES (20, N'Phan Văn Guyn', CAST(N'1995-02-26' AS Date), N'326 Kinh Dương Vương, Thuận An, Phú Vang, Thừa Thiên Huế', N'03303690225', N'phanvanguyn@mycompany.com', N'123456', N'', 1)
GO
INSERT [Employees] ([EmployeeID], [FullName], [BirthDate], [Address], [Phone], [Email], [Password], [Photo], [IsWorking]) VALUES (21, N'Lê Chí Nghĩa', CAST(N'1995-03-14' AS Date), N'139 Nguyễn Huệ, Thành phố Huế', N'05157692456', N'lechinghia@mycompany.com', N'123456', N'', 1)
GO
INSERT [Employees] ([EmployeeID], [FullName], [BirthDate], [Address], [Phone], [Email], [Password], [Photo], [IsWorking]) VALUES (22, N'Trần Hoàng Minh Nghĩa', CAST(N'1995-11-17' AS Date), N'987 Nguyễn Sinh Cung, Huế', N'02483481133', N'tranhoangminhnghia@mycompany.com', N'123456', N'', 1)
GO
INSERT [Employees] ([EmployeeID], [FullName], [BirthDate], [Address], [Phone], [Email], [Password], [Photo], [IsWorking]) VALUES (23, N'Phan Đình Doản', CAST(N'1983-06-04' AS Date), N'105 Nguyễn Hữu Dật,Phường Hương Long Thành Phố Huế', N'02014725531', N'phandinhdoan@mycompany.com', N'123456', N'', 1)
GO
INSERT [Employees] ([EmployeeID], [FullName], [BirthDate], [Address], [Phone], [Email], [Password], [Photo], [IsWorking]) VALUES (24, N'Phạm Nguyễn Thu Uyên', CAST(N'1972-03-27' AS Date), N'16 Duy Tân, Huế', N'08623661164', N'phamnguyenthuuyen@mycompany.com', N'123456', N'', 1)
GO
INSERT [Employees] ([EmployeeID], [FullName], [BirthDate], [Address], [Phone], [Email], [Password], [Photo], [IsWorking]) VALUES (25, N'Nguyễn Đắc Quý', CAST(N'1995-07-29' AS Date), N'Tổ 2, khu vực 1, phường An Đông, Huế', N'06976897864', N'nguyendacquy@mycompany.com', N'123456', N'', 1)
GO
INSERT [Employees] ([EmployeeID], [FullName], [BirthDate], [Address], [Phone], [Email], [Password], [Photo], [IsWorking]) VALUES (26, N'Lê Đình Huy', CAST(N'1995-08-08' AS Date), N'9A/15 Nguyễn Khoa Chiêm, Huế', N'03316524738', N'ledinhhuy@mycompany.com', N'123456', N'', 1)
GO
INSERT [Employees] ([EmployeeID], [FullName], [BirthDate], [Address], [Phone], [Email], [Password], [Photo], [IsWorking]) VALUES (27, N'Ngô Viết Anh', CAST(N'1981-07-01' AS Date), N'Tổ 5, xóm 7, Lộc An, Phú Lộc, Thừa Thiên Huế', N'02671538513', N'ngovietanh@mycompany.com', N'123456', N'', 1)
GO
INSERT [Employees] ([EmployeeID], [FullName], [BirthDate], [Address], [Phone], [Email], [Password], [Photo], [IsWorking]) VALUES (28, N'Trương Thị Như Quỳnh', CAST(N'1990-10-18' AS Date), N'Xóm An Dương Đông, Lộc An, Phú Lộc,Thừa Thiên Huế', N'09291754816', N'truongthinhuquynh@mycompany.com', N'123456', N'', 1)
GO
INSERT [Employees] ([EmployeeID], [FullName], [BirthDate], [Address], [Phone], [Email], [Password], [Photo], [IsWorking]) VALUES (29, N'Lê Thị Quỳnh Vy', CAST(N'1990-07-07' AS Date), N'87 Phan Bội Châu, Huế', N'08797752944', N'lethiquynhvy@mycompany.com', N'123456', N'', 1)
GO
INSERT [Employees] ([EmployeeID], [FullName], [BirthDate], [Address], [Phone], [Email], [Password], [Photo], [IsWorking]) VALUES (30, N'Lâm Hoàng Thanh Phong', CAST(N'1995-05-15' AS Date), N'178 Trần Quang Diệu, thành phố Huế', N'08986270521', N'lamhoangthanhphong@mycompany.com', N'123456', N'', 1)
GO
INSERT [Employees] ([EmployeeID], [FullName], [BirthDate], [Address], [Phone], [Email], [Password], [Photo], [IsWorking]) VALUES (31, N'Lê Thanh Nhật Hưng', CAST(N'1993-07-25' AS Date), N'5/8 Trần Khánh Dư, thành phố Huế', N'03496812341', N'lethanhnhathung@mycompany.com', N'123456', N'', 1)
GO
INSERT [Employees] ([EmployeeID], [FullName], [BirthDate], [Address], [Phone], [Email], [Password], [Photo], [IsWorking]) VALUES (32, N'Huỳnh Thiên Trí', CAST(N'1995-07-11' AS Date), N'Phú An, Phú Vang, Thừa Thiên Huế', N'03726624997', N'huynhthientri@mycompany.com', N'123456', N'', 1)
GO
SET IDENTITY_INSERT [Employees] OFF
GO


INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (1, 113, 2, 6000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (1, 441, 3, 1105000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (1, 657, 1, 12000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (1, 714, 3, 7990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (1, 731, 4, 7300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (1, 744, 2, 10990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (2, 370, 2, 11500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (3, 309, 4, 2636000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (3, 354, 2, 60000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (3, 716, 3, 14490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (4, 527, 1, 6980000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (5, 729, 3, 548000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (6, 121, 5, 70000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (6, 159, 3, 25000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (6, 377, 2, 20999000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (6, 488, 5, 8690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (8, 110, 2, 5590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (8, 530, 1, 65000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (8, 715, 1, 13290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (9, 167, 2, 130000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (9, 404, 4, 199000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (9, 457, 1, 1550000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (9, 547, 1, 14590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (9, 742, 2, 13389000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (10, 85, 5, 4890000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (10, 544, 5, 11990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (10, 589, 1, 1459000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (10, 710, 5, 2990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (11, 137, 4, 2840000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (11, 152, 1, 195000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (11, 186, 4, 7590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (11, 363, 2, 900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (11, 656, 4, 449000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (12, 271, 4, 400000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (12, 438, 5, 599000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (13, 117, 4, 3690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (13, 129, 2, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (13, 340, 1, 1200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (13, 401, 5, 22999000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (13, 451, 5, 1535510.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (13, 489, 3, 13090000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (14, 661, 5, 23090000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (15, 300, 1, 990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (15, 360, 5, 165000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (16, 98, 1, 8190000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (16, 219, 1, 2990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (16, 512, 3, 1500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (16, 542, 1, 3390000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (17, 516, 4, 1200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (17, 590, 1, 568000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (17, 604, 5, 2200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (18, 734, 3, 16390000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (19, 532, 1, 1150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (19, 707, 3, 2630000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (20, 544, 1, 11990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (20, 545, 1, 10690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (20, 559, 3, 900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (20, 701, 1, 6690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (21, 248, 3, 2280000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (21, 520, 1, 1565000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (21, 652, 1, 1950000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (22, 189, 4, 7000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (22, 533, 3, 80000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (23, 127, 3, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (23, 227, 2, 950000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (23, 333, 5, 3000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (23, 763, 2, 5689000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (24, 82, 5, 84000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (24, 124, 4, 70000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (24, 268, 2, 11360000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (24, 304, 2, 698000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (26, 258, 5, 573000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (26, 757, 5, 17590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (27, 334, 2, 2000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (28, 134, 5, 2780000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (28, 273, 5, 1600000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (28, 439, 2, 299000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (28, 520, 3, 1565000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (28, 749, 5, 10990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (29, 155, 5, 700000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (29, 181, 4, 70000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (29, 289, 3, 2250000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (29, 451, 5, 1535510.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (29, 577, 5, 9450000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (30, 79, 4, 4350000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (30, 185, 4, 4200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (30, 328, 2, 815000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (31, 419, 5, 8099119.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (31, 490, 5, 12190000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (32, 524, 2, 5649000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (33, 123, 5, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (34, 96, 2, 7290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (34, 608, 3, 540000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (35, 279, 2, 1900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (35, 452, 1, 9290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (35, 567, 2, 3825000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (36, 240, 4, 1200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (36, 563, 2, 790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (39, 387, 3, 3350000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (39, 579, 1, 870000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (40, 256, 5, 2960000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (40, 320, 1, 289000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (40, 710, 4, 2990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (40, 748, 5, 14490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (41, 98, 5, 8190000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (41, 106, 2, 730000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (41, 186, 2, 7590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (41, 204, 5, 10800000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (41, 240, 1, 1200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (41, 296, 3, 1010000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (41, 483, 5, 7490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (41, 644, 1, 15300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (42, 249, 4, 1930000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (42, 319, 3, 165000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (42, 626, 4, 5400000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (43, 127, 4, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (43, 333, 1, 3000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (43, 422, 4, 5250000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (43, 486, 4, 9390000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (43, 625, 5, 6990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (43, 684, 4, 69800000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (43, 749, 1, 10990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (46, 272, 1, 300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (46, 350, 3, 88000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (46, 604, 1, 2200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (47, 385, 4, 20150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (47, 457, 5, 1550000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (48, 313, 1, 3990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (48, 451, 5, 1535510.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (49, 179, 1, 170000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (49, 269, 2, 1450000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (49, 359, 2, 125000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (49, 543, 4, 3590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (49, 718, 2, 9690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (50, 258, 4, 573000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (50, 311, 1, 4990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (50, 546, 5, 14390000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (50, 697, 2, 870000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (50, 720, 4, 2480000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (52, 385, 3, 20150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (52, 632, 3, 2990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (52, 748, 4, 14490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (53, 201, 3, 7900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (53, 288, 2, 2350000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (53, 324, 2, 74000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (53, 623, 2, 30000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (54, 300, 2, 990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (54, 581, 2, 150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (54, 633, 4, 3990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (54, 751, 1, 16990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (54, 765, 5, 1590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (55, 354, 1, 60000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (55, 368, 4, 14499000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (55, 566, 1, 2349000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (55, 665, 1, 2990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (56, 130, 5, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (56, 283, 2, 900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (56, 434, 5, 7500001.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (57, 768, 5, 300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (58, 762, 1, 5590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (59, 212, 2, 5990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (59, 435, 4, 12000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (59, 534, 3, 80000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (59, 598, 5, 2500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (59, 664, 4, 2649000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (60, 108, 5, 150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (60, 269, 4, 1450000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (60, 310, 4, 2290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (60, 467, 5, 240000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (60, 557, 2, 850000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (60, 579, 2, 870000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (60, 604, 3, 2200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (60, 703, 1, 2990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (60, 722, 5, 12000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (61, 196, 5, 5000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (61, 210, 2, 8990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (61, 221, 4, 9790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (61, 384, 5, 18900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (61, 435, 5, 12000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (62, 343, 4, 89000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (62, 385, 4, 20150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (63, 461, 2, 1500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (63, 544, 5, 11990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (64, 96, 3, 7290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (64, 687, 5, 27200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (64, 750, 1, 16990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (65, 437, 3, 2800000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (65, 482, 2, 19990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (65, 748, 5, 14490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (68, 719, 2, 5650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (69, 389, 5, 2890000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (69, 664, 3, 2649000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (70, 89, 1, 2215000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (70, 172, 4, 100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (70, 313, 1, 3990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (71, 180, 4, 80000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (72, 240, 2, 1200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (73, 78, 3, 2590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (73, 486, 3, 9390000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (74, 151, 3, 8500001.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (74, 463, 3, 140000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (74, 487, 2, 7490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (76, 550, 2, 12890000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (76, 738, 2, 16990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (77, 79, 5, 4350000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (77, 557, 1, 850000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (78, 736, 3, 12490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (79, 202, 1, 9150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (79, 395, 5, 1500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (81, 333, 2, 3000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (82, 145, 3, 2000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (82, 720, 4, 2480000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (83, 338, 5, 13580000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (83, 642, 4, 15152500.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (84, 278, 5, 1840000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (84, 769, 5, 850000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (86, 187, 5, 12990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (86, 286, 2, 1750000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (86, 665, 3, 2990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (86, 757, 4, 17590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (87, 183, 3, 2215000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (87, 348, 3, 31000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (87, 688, 4, 27200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (87, 755, 1, 15990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (88, 146, 4, 240000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (88, 304, 4, 698000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (88, 494, 3, 1800000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (89, 158, 3, 25000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (90, 597, 2, 180000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (91, 98, 2, 8190000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (91, 309, 1, 2636000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (92, 85, 3, 4890000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (93, 357, 2, 690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (94, 408, 5, 3000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (94, 530, 5, 65000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (94, 687, 5, 27200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (95, 338, 2, 13580000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (95, 541, 2, 3290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (95, 551, 3, 12890000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (96, 281, 5, 2400000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (96, 403, 3, 1300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (96, 655, 2, 7710000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (97, 225, 2, 4790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (97, 279, 1, 1900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (97, 354, 1, 60000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (97, 410, 3, 3300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (97, 718, 1, 9690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (98, 241, 3, 591000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (98, 320, 2, 289000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (98, 443, 3, 599000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (98, 493, 1, 1950000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (99, 330, 2, 1990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (99, 364, 3, 1300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (100, 287, 3, 1850000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (100, 611, 3, 550000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (100, 645, 4, 3500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (100, 720, 3, 2480000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (101, 217, 3, 17190000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (101, 369, 5, 6400000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (101, 482, 3, 19990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (101, 558, 2, 816000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (102, 416, 4, 4950000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (103, 443, 3, 599000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (104, 416, 3, 4950000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (104, 594, 2, 450000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (104, 616, 3, 590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (105, 137, 3, 2840000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (105, 242, 1, 750000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (106, 370, 4, 11500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (106, 460, 1, 460000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (106, 718, 3, 9690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (107, 123, 2, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (108, 509, 4, 775000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (109, 279, 1, 1900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (109, 750, 4, 16990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (110, 358, 1, 226000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (110, 472, 3, 39000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (110, 526, 5, 7910000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (110, 735, 1, 18290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (111, 323, 5, 10000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (112, 243, 5, 950000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (113, 206, 3, 9100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (113, 536, 1, 26000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (113, 563, 2, 790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (114, 574, 5, 6920000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (115, 257, 4, 1950000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (115, 360, 2, 165000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (115, 613, 2, 1450000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (115, 615, 2, 1500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (115, 664, 3, 2649000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (115, 673, 4, 3290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (117, 188, 4, 6900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (117, 346, 2, 880000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (117, 473, 5, 39000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (117, 619, 4, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (117, 634, 5, 1590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (118, 259, 3, 573000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (118, 488, 1, 8690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (118, 667, 4, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (119, 215, 3, 5950000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (121, 96, 2, 7290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (121, 141, 1, 145000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (122, 88, 2, 4790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (123, 229, 2, 225000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (123, 474, 2, 9500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (123, 549, 3, 12890000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (123, 561, 4, 4000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (123, 591, 1, 2089000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (123, 671, 3, 2649000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (124, 549, 4, 12890000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (124, 688, 4, 27200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (125, 95, 5, 7290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (125, 112, 5, 9090000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (125, 147, 4, 150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (125, 306, 5, 73000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (125, 355, 5, 720000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (125, 521, 1, 3180000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (126, 321, 1, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (126, 481, 5, 9800000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (126, 523, 1, 2380000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (127, 217, 5, 17190000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (127, 535, 2, 790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (128, 81, 4, 4350000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (128, 226, 4, 963000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (128, 426, 2, 6400000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (128, 502, 1, 1990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (128, 756, 3, 17590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (129, 351, 3, 4200.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (129, 587, 1, 540000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (129, 707, 1, 2630000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (130, 172, 5, 100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (130, 286, 4, 1750000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (130, 343, 4, 89000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (130, 377, 1, 20999000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (130, 578, 4, 795000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (131, 366, 5, 2990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (131, 610, 5, 1050000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (131, 661, 4, 23090000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (132, 269, 2, 1450000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (132, 287, 3, 1850000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (132, 710, 4, 2990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (133, 96, 4, 7290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (133, 238, 1, 550000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (134, 193, 4, 1350000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (134, 226, 1, 963000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (134, 361, 3, 120000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (134, 714, 2, 7990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (135, 194, 1, 2800000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (136, 80, 4, 4350000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (136, 324, 2, 74000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (136, 380, 3, 31000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (136, 584, 5, 4150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (137, 152, 4, 195000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (137, 707, 2, 2630000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (138, 389, 5, 2890000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (138, 516, 3, 1200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (139, 101, 3, 4990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (139, 732, 1, 135000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (140, 379, 5, 10500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (140, 508, 2, 3980000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (140, 608, 3, 540000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (140, 612, 1, 1000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (141, 542, 3, 3390000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (142, 596, 1, 260000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (144, 239, 4, 1200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (144, 351, 1, 4200.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (145, 165, 3, 235000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (145, 335, 1, 185000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (147, 438, 1, 599000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (147, 564, 4, 980000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (148, 208, 4, 3049000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (148, 326, 3, 5900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (148, 352, 5, 399000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (150, 440, 5, 690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (152, 83, 4, 105000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (152, 223, 3, 8990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (152, 433, 3, 160000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (152, 440, 1, 690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (152, 568, 2, 5850000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (153, 370, 3, 11500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (153, 375, 1, 8250000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (154, 349, 4, 48000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (154, 466, 5, 205000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (154, 737, 5, 14790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (154, 738, 4, 16990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (155, 138, 2, 90000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (155, 194, 2, 2800000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (155, 347, 2, 32000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (155, 505, 3, 275000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (156, 108, 4, 150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (156, 203, 3, 10000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (156, 258, 3, 573000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (156, 347, 5, 32000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (156, 400, 4, 4900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (156, 641, 3, 7290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (158, 270, 5, 12000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (158, 282, 2, 2350000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (158, 461, 1, 1500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (158, 722, 5, 12000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (159, 124, 4, 70000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (159, 148, 5, 1000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (159, 367, 2, 24999000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (159, 388, 1, 2440000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (159, 527, 5, 6980000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (159, 665, 2, 2990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (160, 248, 5, 2280000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (160, 323, 5, 10000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (160, 387, 5, 3350000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (160, 428, 3, 4180000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (160, 660, 1, 23090000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (160, 748, 4, 14490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (161, 632, 3, 2990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (161, 641, 3, 7290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (162, 124, 2, 70000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (163, 206, 1, 9100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (163, 544, 2, 11990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (163, 571, 1, 550000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (163, 684, 3, 69800000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (163, 689, 4, 19500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (164, 184, 3, 3900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (164, 371, 3, 7500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (164, 578, 2, 795000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (164, 696, 3, 1150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (165, 337, 3, 399000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (166, 175, 2, 150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (167, 93, 3, 7990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (167, 398, 5, 5099000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (167, 607, 4, 1050000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (167, 707, 4, 2630000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (168, 216, 3, 5500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (168, 470, 2, 115000500.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (168, 638, 4, 1880000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (168, 708, 5, 3800000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (169, 193, 2, 1350000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (169, 237, 5, 7000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (169, 436, 4, 1300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (169, 629, 1, 3990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (170, 247, 5, 2280000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (170, 424, 2, 790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (170, 508, 2, 3980000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (170, 580, 3, 1300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (170, 663, 3, 25590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (171, 566, 1, 2349000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (171, 622, 2, 1450000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (171, 656, 1, 449000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (171, 662, 1, 25590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (173, 564, 4, 980000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (174, 247, 5, 2280000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (175, 207, 3, 9100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (175, 401, 4, 22999000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (175, 529, 3, 65000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (175, 658, 1, 590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (175, 711, 4, 2490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (176, 305, 5, 3300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (176, 517, 1, 11699000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (176, 614, 5, 1200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (177, 374, 1, 57200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (177, 455, 3, 11890000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (177, 633, 5, 3990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (178, 591, 1, 2089000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (178, 687, 5, 27200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (179, 191, 4, 12900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (179, 715, 1, 13290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (180, 508, 1, 3980000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (181, 528, 5, 120000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (181, 538, 4, 43000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (183, 287, 4, 1850000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (184, 165, 2, 235000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (184, 295, 1, 575000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (184, 350, 5, 88000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (184, 368, 2, 14499000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (184, 599, 2, 3000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (186, 399, 2, 7250000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (186, 409, 5, 3100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (186, 493, 3, 1950000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (186, 585, 3, 3122000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (187, 271, 1, 400000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (187, 620, 4, 1245000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (187, 624, 5, 2490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (187, 673, 2, 3290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (188, 202, 2, 9150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (188, 337, 2, 399000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (188, 517, 2, 11699000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (188, 706, 2, 9190000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (189, 374, 2, 57200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (190, 308, 3, 2490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (190, 366, 5, 2990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (191, 398, 1, 5099000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (192, 200, 4, 7500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (192, 406, 4, 3960000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (192, 535, 1, 790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (192, 539, 2, 2490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (192, 671, 2, 2649000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (192, 741, 3, 11289000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (192, 760, 1, 636000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (193, 186, 4, 7590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (193, 221, 1, 9790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (193, 445, 1, 12531000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (193, 505, 5, 275000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (193, 576, 5, 850000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (194, 382, 3, 17700000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (194, 414, 3, 2880000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (194, 599, 3, 3000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (195, 558, 4, 816000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (196, 103, 3, 2790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (196, 207, 1, 9100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (196, 343, 2, 89000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (197, 128, 5, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (197, 480, 1, 2190000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (197, 725, 2, 480000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (197, 738, 4, 16990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (198, 353, 2, 500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (198, 699, 3, 7490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (199, 192, 3, 12900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (199, 458, 4, 320000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (199, 645, 5, 3500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (200, 209, 1, 3149000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (200, 455, 1, 11890000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (200, 472, 1, 39000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (200, 501, 4, 14490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (204, 338, 5, 13580000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (204, 380, 3, 31000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (204, 452, 2, 9290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (204, 454, 4, 11890000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (204, 544, 2, 11990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (205, 219, 4, 2990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (205, 488, 1, 8690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (205, 720, 1, 2480000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (206, 516, 4, 1200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (206, 605, 4, 85000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (206, 736, 2, 12490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (206, 763, 1, 5689000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (208, 139, 5, 205000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (208, 439, 2, 299000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (208, 532, 4, 1150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (208, 557, 4, 850000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (208, 722, 3, 12000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (210, 687, 5, 27200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (211, 154, 2, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (212, 107, 1, 100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (213, 128, 2, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (214, 115, 4, 3390000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (214, 154, 5, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (214, 536, 4, 26000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (215, 102, 4, 2890000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (215, 345, 1, 73000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (215, 692, 4, 13840000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (215, 749, 2, 10990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (216, 425, 2, 520000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (216, 581, 5, 150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (216, 592, 5, 1179000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (216, 677, 5, 39000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (216, 750, 4, 16990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (216, 763, 5, 5689000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (217, 436, 2, 1300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (218, 304, 4, 698000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (218, 433, 5, 160000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (218, 450, 3, 1535510.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (218, 733, 3, 14290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (219, 111, 5, 6990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (219, 210, 3, 8990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (220, 128, 5, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (220, 343, 1, 89000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (220, 480, 4, 2190000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (221, 336, 1, 449000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (221, 469, 5, 65000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (221, 521, 1, 3180000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (222, 685, 4, 78000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (223, 296, 3, 1010000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (223, 382, 5, 17700000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (223, 522, 2, 5290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (223, 533, 3, 80000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (223, 568, 1, 5850000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (225, 581, 5, 150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (225, 744, 4, 10990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (226, 369, 5, 6400000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (226, 527, 4, 6980000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (227, 166, 3, 245000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (227, 203, 1, 10000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (227, 275, 1, 700000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (227, 612, 4, 1000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (227, 731, 5, 7300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (227, 764, 2, 2049000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (228, 406, 1, 3960000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (228, 684, 2, 69800000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (229, 196, 5, 5000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (229, 287, 5, 1850000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (229, 352, 4, 399000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (229, 387, 2, 3350000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (229, 497, 4, 120000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (229, 633, 1, 3990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (230, 126, 2, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (230, 151, 1, 8500001.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (230, 564, 1, 980000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (230, 640, 3, 15880000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (230, 722, 1, 12000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (231, 523, 5, 2380000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (231, 576, 2, 850000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (231, 577, 1, 9450000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (231, 710, 3, 2990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (232, 471, 2, 16000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (232, 532, 5, 1150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (233, 428, 4, 4180000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (233, 460, 5, 460000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (233, 501, 4, 14490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (233, 525, 2, 2540000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (235, 488, 4, 8690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (235, 730, 5, 2000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (236, 213, 1, 6490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (237, 127, 5, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (237, 554, 5, 1200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (238, 224, 5, 9790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (239, 589, 3, 1459000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (239, 663, 1, 25590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (241, 125, 3, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (241, 161, 3, 50000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (241, 258, 1, 573000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (241, 524, 5, 5649000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (242, 80, 2, 4350000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (242, 408, 3, 3000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (243, 154, 5, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (243, 450, 4, 1535510.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (243, 673, 5, 3290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (244, 377, 1, 20999000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (244, 388, 3, 2440000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (244, 416, 5, 4950000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (244, 597, 1, 180000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (244, 719, 5, 5650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (244, 733, 5, 14290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (245, 204, 5, 10800000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (245, 254, 1, 550000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (247, 224, 4, 9790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (247, 529, 3, 65000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (247, 712, 5, 12190000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (248, 272, 3, 300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (248, 320, 1, 289000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (248, 392, 3, 1950000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (248, 608, 3, 540000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (250, 173, 2, 155000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (250, 192, 4, 12900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (250, 230, 3, 899000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (250, 438, 3, 599000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (250, 512, 3, 1500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (250, 575, 5, 1650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (251, 351, 3, 4200.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (253, 295, 2, 575000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (253, 585, 2, 3122000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (254, 157, 4, 70000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (254, 372, 1, 13500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (254, 458, 4, 320000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (254, 512, 4, 1500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (254, 682, 2, 40500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (255, 92, 4, 1225000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (255, 189, 4, 7000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (256, 337, 1, 399000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (256, 362, 5, 1899000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (257, 191, 3, 12900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (257, 453, 2, 10990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (258, 361, 4, 120000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (258, 457, 3, 1550000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (258, 603, 3, 2500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (259, 296, 5, 1010000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (260, 238, 2, 550000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (261, 511, 5, 775000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (261, 667, 3, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (261, 690, 2, 19200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (262, 451, 1, 1535510.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (262, 486, 2, 9390000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (264, 530, 1, 65000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (266, 252, 1, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (266, 368, 5, 14499000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (266, 379, 5, 10500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (267, 239, 2, 1200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (267, 399, 4, 7250000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (267, 473, 3, 39000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (267, 578, 1, 795000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (267, 730, 1, 2000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (268, 100, 1, 5990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (268, 126, 5, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (268, 162, 2, 70000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (268, 339, 1, 3100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (268, 350, 2, 88000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (268, 398, 5, 5099000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (268, 557, 1, 850000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (269, 606, 4, 180000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (270, 171, 5, 85000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (271, 112, 2, 9090000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (271, 203, 2, 10000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (271, 542, 1, 3390000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (271, 740, 4, 11450000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (272, 177, 3, 180000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (272, 257, 1, 1950000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (272, 384, 4, 18900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (273, 182, 1, 420000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (273, 275, 1, 700000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (273, 476, 4, 12930.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (273, 661, 5, 23090000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (275, 311, 3, 4990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (275, 433, 2, 160000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (275, 657, 4, 12000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (276, 220, 5, 10999000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (276, 482, 2, 19990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (276, 575, 1, 1650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (276, 615, 1, 1500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (277, 240, 1, 1200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (277, 411, 5, 199000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (278, 388, 5, 2440000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (278, 459, 2, 355000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (278, 480, 5, 2190000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (279, 161, 5, 50000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (279, 352, 3, 399000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (279, 432, 4, 9000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (279, 487, 4, 7490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (279, 615, 2, 1500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (279, 675, 4, 35400000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (280, 82, 5, 84000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (280, 477, 1, 330000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (280, 618, 3, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (280, 730, 1, 2000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (281, 695, 5, 55000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (282, 420, 5, 8879119.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (282, 449, 1, 1651910.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (283, 114, 2, 390000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (283, 289, 4, 2250000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (283, 588, 3, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (283, 720, 3, 2480000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (283, 755, 2, 15990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (284, 242, 4, 750000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (284, 421, 5, 3330000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (284, 436, 4, 1300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (284, 567, 1, 3825000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (286, 156, 2, 90000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (286, 183, 4, 2215000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (286, 570, 5, 949000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (288, 107, 1, 100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (289, 132, 2, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (289, 187, 3, 12990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (289, 448, 2, 5610000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (289, 462, 2, 1750000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (289, 534, 1, 80000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (289, 702, 1, 1590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (290, 117, 2, 3690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (290, 165, 3, 235000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (290, 437, 5, 2800000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (291, 118, 3, 6000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (292, 186, 3, 7590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (292, 422, 5, 5250000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (292, 435, 1, 12000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (292, 752, 2, 17990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (293, 126, 2, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (293, 209, 5, 3149000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (293, 249, 5, 1930000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (293, 406, 5, 3960000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (293, 571, 3, 550000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (293, 665, 5, 2990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (293, 768, 1, 300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (294, 494, 3, 1800000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (294, 509, 5, 775000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (294, 538, 2, 43000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (294, 738, 1, 16990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (295, 299, 1, 240000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (295, 439, 3, 299000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (295, 489, 1, 13090000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (296, 221, 3, 9790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (296, 338, 2, 13580000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (296, 466, 4, 205000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (297, 274, 5, 500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (297, 516, 4, 1200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (297, 747, 3, 799000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (298, 384, 5, 18900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (298, 421, 3, 3330000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (299, 288, 2, 2350000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (299, 629, 1, 3990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (300, 304, 4, 698000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (300, 500, 1, 13990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (300, 538, 5, 43000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (300, 749, 5, 10990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (302, 485, 2, 2400000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (302, 631, 4, 1990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (303, 339, 4, 3100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (303, 720, 3, 2480000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (304, 258, 4, 573000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (304, 429, 4, 300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (304, 479, 4, 2290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (304, 673, 3, 3290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (305, 195, 2, 5000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (305, 296, 4, 1010000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (305, 352, 3, 399000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (306, 419, 4, 8099119.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (307, 178, 5, 185000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (307, 457, 3, 1550000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (307, 575, 4, 1650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (307, 757, 5, 17590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (308, 96, 1, 7290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (309, 315, 2, 800000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (309, 364, 2, 1300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (309, 582, 2, 170000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (309, 625, 2, 6990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (309, 685, 2, 78000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (309, 744, 1, 10990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (310, 276, 1, 1700000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (311, 103, 3, 2790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (311, 107, 3, 100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (311, 431, 3, 150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (312, 402, 2, 1300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (312, 592, 3, 1179000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (313, 363, 1, 900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (313, 491, 4, 379000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (314, 263, 5, 2280000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (314, 388, 5, 2440000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (314, 429, 4, 300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (315, 324, 3, 74000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (315, 487, 4, 7490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (315, 548, 3, 16990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (316, 445, 4, 12531000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (316, 686, 1, 52500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (317, 414, 1, 2880000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (318, 675, 3, 35400000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (319, 262, 4, 1750000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (319, 448, 5, 5610000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (319, 592, 1, 1179000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (319, 615, 3, 1500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (319, 624, 5, 2490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (319, 701, 2, 6690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (319, 754, 4, 13990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (320, 755, 3, 15990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (321, 117, 1, 3690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (321, 149, 5, 12000001.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (321, 191, 2, 12900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (321, 286, 4, 1750000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (321, 352, 2, 399000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (321, 685, 1, 78000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (321, 692, 3, 13840000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (321, 727, 5, 450000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (322, 361, 1, 120000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (322, 597, 4, 180000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (322, 687, 2, 27200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (322, 750, 3, 16990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (324, 110, 1, 5590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (324, 505, 2, 275000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (326, 225, 3, 4790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (326, 636, 1, 1570000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (328, 426, 4, 6400000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (328, 579, 2, 870000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (328, 681, 5, 40500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (331, 261, 5, 2100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (331, 406, 5, 3960000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (331, 500, 3, 13990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (331, 518, 1, 12699000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (331, 736, 1, 12490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (332, 98, 4, 8190000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (332, 400, 1, 4900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (332, 444, 1, 1750000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (332, 672, 2, 2990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (333, 202, 5, 9150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (333, 252, 5, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (333, 285, 3, 1150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (333, 696, 1, 1150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (333, 746, 2, 15690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (334, 113, 1, 6000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (334, 231, 1, 1329000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (334, 449, 1, 1651910.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (335, 404, 5, 199000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (335, 488, 3, 8690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (336, 101, 1, 4990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (336, 309, 3, 2636000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (336, 380, 3, 31000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (338, 264, 3, 149000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (338, 417, 3, 8100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (338, 681, 1, 40500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (339, 611, 5, 550000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (340, 176, 1, 165000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (340, 337, 2, 399000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (341, 617, 4, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (342, 108, 3, 150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (342, 260, 1, 1950000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (342, 530, 5, 65000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (343, 275, 5, 700000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (343, 341, 1, 6490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (343, 359, 2, 125000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (343, 602, 3, 3700000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (343, 636, 5, 1570000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (343, 647, 5, 4850000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (343, 746, 3, 15690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (344, 226, 2, 963000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (344, 304, 2, 698000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (344, 324, 4, 74000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (346, 273, 1, 1600000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (346, 293, 1, 550000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (346, 321, 4, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (347, 333, 2, 3000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (347, 420, 5, 8879119.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (347, 595, 2, 170000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (347, 765, 3, 1590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (349, 471, 2, 16000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (350, 709, 2, 2000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (351, 140, 5, 180000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (351, 332, 5, 2299000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (351, 531, 3, 11500.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (351, 615, 3, 1500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (352, 226, 3, 963000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (352, 284, 4, 1050000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (352, 401, 4, 22999000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (352, 425, 3, 520000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (352, 600, 1, 3700000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (355, 156, 3, 90000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (355, 204, 2, 10800000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (355, 329, 3, 945000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (355, 666, 5, 850000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (356, 115, 2, 3390000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (356, 409, 3, 3100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (356, 533, 3, 80000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (358, 270, 4, 12000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (358, 328, 2, 815000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (359, 657, 5, 12000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (359, 664, 2, 2649000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (360, 396, 3, 6500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (361, 197, 2, 5990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (361, 405, 4, 50000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (361, 539, 4, 2490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (361, 761, 4, 3000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (362, 116, 3, 2990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (362, 233, 4, 3050000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (363, 443, 4, 599000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (363, 504, 3, 1786000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (363, 534, 4, 80000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (364, 148, 5, 1000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (364, 714, 4, 7990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (365, 194, 5, 2800000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (365, 207, 5, 9100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (365, 260, 1, 1950000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (366, 203, 4, 10000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (366, 236, 4, 1900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (366, 294, 2, 620000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (366, 297, 5, 2550000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (366, 434, 3, 7500001.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (366, 592, 4, 1179000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (367, 544, 1, 11990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (367, 660, 4, 23090000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (368, 100, 2, 5990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (368, 435, 4, 12000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (369, 382, 4, 17700000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (369, 440, 1, 690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (369, 479, 3, 2290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (369, 482, 2, 19990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (369, 623, 3, 30000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (371, 219, 5, 2990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (371, 524, 1, 5649000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (372, 132, 3, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (372, 280, 4, 2250000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (373, 584, 1, 4150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (374, 193, 5, 1350000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (374, 209, 1, 3149000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (374, 223, 2, 8990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (375, 106, 1, 730000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (375, 166, 5, 245000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (375, 298, 3, 405000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (375, 616, 5, 590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (375, 672, 1, 2990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (375, 694, 1, 399000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (376, 233, 1, 3050000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (376, 318, 5, 750000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (376, 426, 2, 6400000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (376, 499, 5, 960000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (376, 520, 3, 1565000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (376, 717, 3, 14490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (377, 221, 4, 9790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (377, 361, 5, 120000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (377, 677, 4, 39000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (377, 757, 5, 17590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (378, 88, 3, 4790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (378, 518, 1, 12699000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (379, 391, 3, 2290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (379, 617, 5, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (379, 751, 1, 16990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (380, 285, 2, 1150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (380, 373, 4, 33800000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (380, 454, 5, 11890000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (380, 577, 3, 9450000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (380, 635, 4, 2590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (381, 89, 2, 2215000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (381, 299, 5, 240000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (381, 316, 2, 1195000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (381, 526, 3, 7910000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (383, 734, 2, 16390000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (384, 705, 4, 8990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (385, 228, 5, 125000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (385, 307, 2, 243000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (385, 339, 5, 3100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (385, 574, 2, 6920000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (386, 241, 1, 591000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (386, 262, 3, 1750000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (386, 338, 2, 13580000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (387, 222, 4, 7690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (387, 244, 4, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (387, 447, 5, 305000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (387, 477, 2, 330000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (387, 555, 5, 1680000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (388, 332, 2, 2299000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (390, 531, 3, 11500.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (391, 278, 1, 1840000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (391, 367, 3, 24999000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (391, 371, 2, 7500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (391, 560, 2, 3490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (392, 175, 2, 150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (392, 328, 5, 815000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (392, 729, 4, 548000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (393, 394, 4, 2480000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (393, 418, 4, 8900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (395, 128, 5, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (395, 426, 1, 6400000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (395, 655, 4, 7710000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (395, 678, 1, 29000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (398, 390, 2, 3990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (399, 718, 1, 9690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (399, 768, 3, 300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (400, 313, 3, 3990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (401, 231, 4, 1329000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (401, 311, 4, 4990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (401, 391, 1, 2290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (401, 488, 2, 8690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (401, 652, 2, 1950000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (402, 311, 5, 4990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (402, 529, 5, 65000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (403, 132, 1, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (404, 323, 1, 10000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (404, 406, 3, 3960000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (404, 477, 3, 330000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (404, 516, 4, 1200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (405, 183, 5, 2215000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (405, 358, 1, 226000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (406, 110, 3, 5590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (406, 265, 1, 899000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (406, 282, 1, 2350000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (407, 707, 2, 2630000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (408, 285, 4, 1150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (409, 127, 4, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (409, 245, 4, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (409, 293, 2, 550000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (409, 520, 4, 1565000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (409, 694, 1, 399000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (410, 381, 2, 39999000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (411, 352, 3, 399000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (411, 479, 1, 2290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (412, 159, 4, 25000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (412, 203, 3, 10000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (412, 404, 2, 199000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (413, 213, 4, 6490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (414, 655, 5, 7710000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (415, 329, 2, 945000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (415, 438, 5, 599000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (415, 636, 1, 1570000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (415, 724, 4, 1520000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (416, 315, 4, 800000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (416, 660, 2, 23090000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (417, 128, 2, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (417, 230, 5, 899000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (417, 347, 1, 32000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (417, 438, 4, 599000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (417, 511, 5, 775000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (417, 740, 4, 11450000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (418, 107, 1, 100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (418, 109, 4, 5390000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (418, 162, 3, 70000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (418, 579, 5, 870000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (418, 609, 4, 540000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (418, 615, 1, 1500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (419, 768, 2, 300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (420, 93, 3, 7990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (420, 329, 1, 945000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (420, 353, 2, 500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (420, 713, 3, 7290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (420, 766, 4, 3990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (422, 359, 3, 125000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (422, 657, 3, 12000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (422, 716, 2, 14490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (423, 295, 2, 575000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (423, 442, 2, 3100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (423, 565, 2, 59000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (423, 676, 5, 36500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (424, 163, 5, 255000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (424, 322, 3, 12000001.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (424, 573, 5, 450000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (425, 99, 3, 5890000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (425, 235, 5, 6080000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (425, 583, 3, 170000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (426, 124, 2, 70000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (426, 231, 1, 1329000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (426, 559, 2, 900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (426, 614, 4, 1200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (426, 629, 2, 3990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (427, 481, 4, 9800000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (427, 563, 2, 790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (427, 572, 1, 550000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (427, 632, 3, 2990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (428, 124, 2, 70000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (428, 215, 3, 5950000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (428, 446, 4, 790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (428, 632, 1, 2990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (428, 636, 3, 1570000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (429, 141, 2, 145000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (430, 88, 5, 4790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (430, 252, 3, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (430, 564, 1, 980000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (432, 108, 2, 150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (432, 340, 5, 1200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (432, 480, 4, 2190000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (433, 589, 1, 1459000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (433, 769, 2, 850000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (435, 360, 2, 165000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (435, 443, 4, 599000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (435, 528, 4, 120000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (435, 570, 3, 949000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (435, 675, 3, 35400000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (435, 731, 1, 7300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (436, 346, 2, 880000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (436, 557, 5, 850000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (437, 155, 1, 700000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (437, 684, 4, 69800000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (439, 662, 1, 25590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (440, 593, 1, 385000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (441, 460, 4, 460000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (441, 553, 1, 346000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (441, 677, 1, 39000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (441, 755, 1, 15990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (442, 187, 5, 12990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (442, 276, 5, 1700000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (442, 473, 1, 39000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (443, 461, 1, 1500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (443, 712, 4, 12190000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (444, 427, 2, 2600000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (444, 545, 5, 10690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (444, 652, 4, 1950000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (446, 255, 2, 750000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (446, 328, 1, 815000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (447, 227, 4, 950000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (447, 599, 3, 3000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (447, 643, 3, 700000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (447, 646, 2, 4830000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (448, 173, 5, 155000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (448, 442, 2, 3100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (448, 597, 4, 180000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (449, 82, 3, 84000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (449, 122, 2, 70000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (449, 376, 4, 12000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (449, 538, 5, 43000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (449, 735, 3, 18290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (450, 134, 2, 2780000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (450, 245, 4, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (450, 312, 1, 1790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (450, 381, 3, 39999000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (451, 245, 1, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (451, 544, 1, 11990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (452, 608, 5, 540000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (454, 361, 1, 120000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (454, 445, 3, 12531000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (454, 581, 1, 150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (455, 601, 1, 2200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (456, 511, 4, 775000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (456, 635, 5, 2590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (457, 760, 5, 636000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (457, 767, 3, 160000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (458, 380, 1, 31000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (459, 141, 1, 145000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (459, 225, 2, 4790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (459, 595, 1, 170000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (459, 670, 2, 305000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (460, 186, 2, 7590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (460, 485, 4, 2400000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (461, 278, 3, 1840000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (462, 127, 3, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (462, 179, 1, 170000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (462, 315, 3, 800000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (462, 527, 1, 6980000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (462, 645, 4, 3500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (462, 664, 2, 2649000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (463, 266, 3, 393000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (464, 84, 3, 2900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (464, 111, 3, 6990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (464, 309, 4, 2636000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (464, 731, 1, 7300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (465, 145, 5, 2000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (465, 199, 3, 7000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (466, 572, 3, 550000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (466, 653, 5, 20586500.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (467, 145, 1, 2000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (467, 185, 1, 4200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (467, 263, 3, 2280000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (467, 545, 3, 10690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (467, 601, 2, 2200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (467, 671, 3, 2649000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (468, 596, 4, 260000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (468, 731, 1, 7300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (470, 564, 3, 980000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (470, 670, 3, 305000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (470, 686, 3, 52500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (471, 541, 2, 3290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (472, 169, 5, 155000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (472, 499, 5, 960000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (472, 526, 2, 7910000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (472, 563, 5, 790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (472, 601, 5, 2200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (473, 477, 1, 330000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (473, 533, 2, 80000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (473, 738, 3, 16990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (473, 754, 1, 13990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (474, 584, 4, 4150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (475, 386, 3, 20650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (475, 649, 2, 2450000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (476, 288, 3, 2350000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (476, 613, 3, 1450000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (476, 623, 4, 30000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (477, 144, 5, 155000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (477, 271, 3, 400000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (477, 291, 4, 29000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (477, 318, 2, 750000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (477, 734, 2, 16390000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (479, 284, 5, 1050000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (479, 312, 3, 1790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (479, 392, 4, 1950000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (479, 421, 1, 3330000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (479, 545, 5, 10690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (480, 465, 2, 100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (481, 623, 4, 30000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (482, 414, 3, 2880000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (482, 480, 1, 2190000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (482, 508, 1, 3980000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (483, 714, 3, 7990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (484, 324, 2, 74000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (486, 382, 2, 17700000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (486, 547, 3, 14590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (487, 171, 5, 85000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (487, 180, 2, 80000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (489, 480, 4, 2190000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (490, 162, 2, 70000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (490, 229, 5, 225000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (490, 563, 4, 790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (490, 763, 3, 5689000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (491, 382, 5, 17700000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (492, 245, 1, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (492, 397, 5, 8100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (492, 418, 3, 8900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (492, 541, 3, 3290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (492, 558, 2, 816000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (492, 712, 1, 12190000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (494, 204, 3, 10800000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (494, 438, 5, 599000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (494, 450, 2, 1535510.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (494, 584, 4, 4150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (494, 718, 5, 9690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (496, 224, 1, 9790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (497, 206, 5, 9100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (497, 323, 2, 10000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (497, 371, 3, 7500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (498, 78, 5, 2590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (498, 251, 2, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (498, 672, 2, 2990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (500, 100, 4, 5990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (500, 178, 5, 185000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (500, 202, 3, 9150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (500, 618, 4, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (501, 152, 1, 195000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (502, 179, 5, 170000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (502, 456, 3, 210000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (503, 215, 5, 5950000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (503, 265, 1, 899000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (503, 373, 1, 33800000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (503, 461, 3, 1500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (503, 491, 2, 379000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (503, 741, 1, 11289000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (504, 193, 5, 1350000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (504, 417, 1, 8100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (505, 80, 4, 4350000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (505, 191, 2, 12900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (506, 126, 1, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (507, 555, 4, 1680000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (507, 655, 4, 7710000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (508, 82, 1, 84000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (509, 201, 2, 7900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (509, 416, 3, 4950000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (510, 105, 2, 2300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (510, 275, 2, 700000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (510, 317, 3, 295000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (510, 708, 1, 3800000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (511, 233, 1, 3050000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (512, 171, 3, 85000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (512, 473, 5, 39000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (514, 293, 4, 550000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (514, 353, 4, 500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (515, 166, 3, 245000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (516, 331, 3, 2240000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (516, 481, 1, 9800000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (517, 420, 3, 8879119.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (518, 233, 5, 3050000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (518, 567, 2, 3825000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (518, 659, 5, 690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (519, 289, 1, 2250000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (519, 739, 4, 16990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (520, 241, 3, 591000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (520, 463, 1, 140000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (521, 324, 3, 74000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (521, 469, 5, 65000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (521, 479, 3, 2290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (521, 733, 3, 14290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (521, 735, 4, 18290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (523, 140, 1, 180000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (523, 429, 2, 300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (523, 681, 1, 40500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (523, 710, 4, 2990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (523, 748, 5, 14490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (524, 468, 5, 350000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (525, 89, 3, 2215000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (526, 235, 3, 6080000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (526, 263, 4, 2280000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (526, 275, 3, 700000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (526, 427, 2, 2600000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (526, 429, 1, 300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (527, 86, 5, 2730000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (527, 277, 3, 480000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (527, 296, 2, 1010000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (528, 92, 5, 1225000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (528, 439, 1, 299000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (528, 769, 3, 850000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (529, 348, 1, 31000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (530, 208, 4, 3049000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (531, 93, 4, 7990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (531, 245, 2, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (531, 358, 3, 226000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (531, 619, 4, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (532, 98, 2, 8190000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (532, 245, 2, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (532, 251, 1, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (532, 431, 5, 150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (532, 738, 3, 16990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (533, 212, 3, 5990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (533, 290, 1, 48000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (533, 327, 2, 3100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (533, 546, 1, 14390000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (534, 255, 4, 750000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (534, 594, 2, 450000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (535, 225, 5, 4790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (536, 249, 3, 1930000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (536, 644, 5, 15300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (537, 304, 1, 698000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (537, 739, 5, 16990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (538, 356, 5, 150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (539, 130, 1, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (539, 235, 1, 6080000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (539, 331, 1, 2240000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (539, 636, 5, 1570000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (539, 721, 2, 3100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (540, 334, 3, 2000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (540, 694, 2, 399000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (541, 389, 5, 2890000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (541, 740, 1, 11450000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (542, 125, 2, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (542, 159, 1, 25000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (542, 227, 5, 950000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (542, 276, 5, 1700000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (542, 352, 1, 399000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (543, 140, 5, 180000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (543, 421, 3, 3330000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (543, 591, 5, 2089000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (545, 233, 3, 3050000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (546, 288, 1, 2350000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (546, 525, 2, 2540000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (547, 100, 3, 5990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (547, 139, 5, 205000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (547, 184, 4, 3900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (547, 354, 2, 60000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (549, 121, 2, 70000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (549, 520, 2, 1565000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (549, 631, 1, 1990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (549, 751, 1, 16990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (550, 184, 4, 3900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (550, 402, 5, 1300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (550, 495, 2, 315000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (550, 752, 4, 17990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (551, 198, 4, 6000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (551, 383, 2, 25999000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (552, 268, 1, 11360000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (552, 301, 2, 89000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (552, 500, 2, 13990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (552, 593, 3, 385000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (553, 158, 5, 25000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (553, 164, 1, 245000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (553, 445, 4, 12531000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (553, 579, 1, 870000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (553, 586, 5, 550000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (554, 215, 4, 5950000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (554, 337, 4, 399000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (554, 342, 3, 8590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (554, 407, 5, 499000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (555, 169, 4, 155000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (556, 604, 4, 2200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (556, 698, 4, 18000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (557, 614, 4, 1200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (558, 84, 3, 2900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (558, 288, 2, 2350000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (558, 527, 1, 6980000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (559, 91, 1, 3000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (559, 167, 4, 130000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (559, 528, 2, 120000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (559, 691, 3, 14890000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (560, 190, 2, 12490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (560, 704, 4, 7990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (562, 523, 2, 2380000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (562, 569, 3, 3690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (562, 761, 5, 3000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (563, 188, 2, 6900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (563, 396, 4, 6500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (563, 458, 2, 320000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (563, 472, 4, 39000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (563, 486, 2, 9390000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (564, 301, 1, 89000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (564, 396, 3, 6500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (567, 114, 3, 390000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (567, 404, 3, 199000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (568, 224, 1, 9790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (568, 452, 2, 9290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (568, 559, 1, 900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (568, 736, 5, 12490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (569, 658, 5, 590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (570, 148, 1, 1000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (570, 268, 2, 11360000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (571, 665, 2, 2990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (572, 221, 2, 9790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (572, 480, 4, 2190000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (572, 550, 5, 12890000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (573, 248, 4, 2280000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (573, 404, 3, 199000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (573, 682, 3, 40500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (575, 271, 3, 400000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (575, 367, 2, 24999000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (575, 404, 3, 199000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (575, 640, 1, 15880000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (575, 763, 4, 5689000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (576, 131, 3, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (576, 271, 3, 400000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (576, 278, 5, 1840000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (576, 420, 3, 8879119.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (576, 648, 3, 12958000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (577, 152, 5, 195000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (577, 313, 3, 3990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (577, 499, 5, 960000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (577, 550, 5, 12890000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (577, 658, 1, 590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (577, 682, 4, 40500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (579, 131, 1, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (579, 258, 5, 573000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (579, 265, 4, 899000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (579, 408, 5, 3000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (579, 596, 2, 260000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (580, 317, 4, 295000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (580, 325, 3, 258000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (580, 349, 3, 48000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (580, 657, 1, 12000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (581, 365, 5, 2290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (581, 470, 2, 115000500.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (581, 535, 4, 790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (581, 603, 2, 2500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (583, 88, 4, 4790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (583, 317, 3, 295000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (583, 386, 5, 20650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (583, 504, 1, 1786000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (584, 768, 1, 300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (585, 285, 5, 1150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (586, 556, 5, 1200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (586, 596, 4, 260000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (587, 182, 1, 420000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (587, 262, 4, 1750000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (587, 426, 4, 6400000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (587, 559, 3, 900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (587, 591, 1, 2089000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (587, 620, 3, 1245000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (588, 184, 2, 3900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (588, 230, 1, 899000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (588, 447, 4, 305000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (588, 459, 2, 355000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (588, 467, 2, 240000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (589, 102, 2, 2890000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (589, 752, 2, 17990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (590, 108, 1, 150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (590, 180, 1, 80000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (590, 488, 2, 8690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (590, 668, 2, 173000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (590, 725, 3, 480000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (591, 259, 1, 573000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (591, 274, 5, 500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (592, 459, 4, 355000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (592, 667, 3, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (593, 450, 5, 1535510.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (593, 463, 3, 140000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (593, 467, 3, 240000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (593, 585, 3, 3122000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (594, 649, 3, 2450000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (594, 666, 5, 850000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (595, 565, 2, 59000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (595, 570, 5, 949000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (595, 700, 4, 8990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (596, 477, 4, 330000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (597, 216, 5, 5500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (597, 295, 3, 575000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (597, 407, 5, 499000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (598, 134, 5, 2780000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (598, 245, 2, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (598, 436, 5, 1300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (598, 481, 4, 9800000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (599, 245, 4, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (599, 528, 2, 120000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (599, 535, 1, 790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (601, 680, 1, 55500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (602, 555, 5, 1680000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (602, 671, 2, 2649000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (602, 680, 5, 55500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (602, 753, 5, 18850000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (603, 237, 1, 7000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (603, 585, 4, 3122000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (603, 658, 2, 590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (604, 158, 5, 25000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (604, 317, 3, 295000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (604, 346, 1, 880000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (604, 366, 4, 2990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (605, 439, 1, 299000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (606, 425, 1, 520000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (607, 198, 2, 6000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (607, 366, 1, 2990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (607, 552, 3, 9890000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (607, 685, 4, 78000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (608, 351, 2, 4200.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (608, 544, 4, 11990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (609, 96, 1, 7290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (609, 306, 5, 73000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (609, 466, 5, 205000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (609, 684, 4, 69800000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (610, 516, 1, 1200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (610, 560, 1, 3490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (610, 622, 2, 1450000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (611, 213, 4, 6490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (611, 617, 4, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (611, 660, 2, 23090000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (611, 756, 1, 17590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (612, 305, 4, 3300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (612, 465, 5, 100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (612, 518, 1, 12699000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (612, 731, 5, 7300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (613, 185, 3, 4200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (613, 274, 4, 500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (613, 284, 1, 1050000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (613, 337, 4, 399000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (613, 641, 5, 7290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (614, 133, 5, 1550000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (614, 306, 1, 73000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (615, 120, 5, 6000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (615, 374, 2, 57200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (615, 470, 3, 115000500.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (615, 637, 4, 2280000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (615, 762, 2, 5590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (616, 197, 1, 5990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (616, 737, 4, 14790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (617, 271, 1, 400000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (618, 126, 5, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (618, 335, 1, 185000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (619, 627, 1, 8990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (620, 261, 3, 2100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (621, 390, 4, 3990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (621, 579, 4, 870000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (622, 117, 3, 3690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (622, 418, 1, 8900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (622, 492, 5, 550000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (622, 711, 5, 2490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (623, 125, 4, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (623, 273, 5, 1600000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (623, 311, 2, 4990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (624, 94, 4, 8990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (624, 621, 4, 7790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (624, 656, 3, 449000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (624, 685, 5, 78000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (625, 212, 3, 5990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (625, 266, 1, 393000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (625, 304, 3, 698000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (626, 148, 5, 1000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (626, 210, 5, 8990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (626, 366, 3, 2990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (627, 107, 2, 100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (627, 127, 2, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (627, 311, 2, 4990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (628, 271, 3, 400000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (628, 628, 3, 2290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (628, 682, 1, 40500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (628, 683, 2, 38500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (629, 474, 1, 9500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (629, 754, 1, 13990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (630, 355, 5, 720000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (630, 675, 4, 35400000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (631, 191, 1, 12900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (631, 393, 4, 2219000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (631, 518, 1, 12699000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (633, 522, 3, 5290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (633, 616, 2, 590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (634, 324, 3, 74000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (634, 326, 1, 5900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (635, 102, 3, 2890000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (635, 322, 3, 12000001.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (635, 337, 2, 399000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (635, 425, 4, 520000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (635, 496, 3, 345000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (636, 89, 4, 2215000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (636, 152, 4, 195000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (636, 300, 5, 990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (636, 322, 1, 12000001.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (636, 767, 1, 160000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (637, 163, 1, 255000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (637, 324, 5, 74000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (637, 644, 5, 15300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (638, 199, 4, 7000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (638, 421, 1, 3330000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (638, 482, 4, 19990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (638, 619, 1, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (640, 334, 3, 2000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (640, 342, 1, 8590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (640, 601, 1, 2200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (641, 187, 1, 12990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (641, 322, 3, 12000001.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (641, 471, 5, 16000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (641, 515, 2, 154000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (641, 711, 3, 2490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (642, 192, 5, 12900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (642, 372, 3, 13500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (642, 545, 1, 10690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (642, 672, 1, 2990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (643, 451, 5, 1535510.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (643, 736, 4, 12490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (644, 634, 3, 1590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (644, 663, 1, 25590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (645, 204, 3, 10800000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (646, 645, 4, 3500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (647, 139, 1, 205000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (647, 214, 3, 5490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (647, 293, 5, 550000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (647, 331, 2, 2240000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (647, 341, 2, 6490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (647, 423, 3, 390000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (647, 464, 2, 220000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (647, 635, 2, 2590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (648, 434, 4, 7500001.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (648, 437, 5, 2800000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (648, 461, 3, 1500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (648, 492, 5, 550000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (648, 539, 1, 2490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (648, 615, 2, 1500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (648, 701, 2, 6690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (649, 240, 3, 1200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (649, 613, 3, 1450000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (649, 635, 5, 2590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (649, 703, 4, 2990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (650, 229, 5, 225000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (652, 154, 4, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (653, 80, 4, 4350000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (653, 291, 3, 29000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (653, 510, 3, 735000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (654, 205, 1, 17200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (654, 341, 5, 6490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (654, 381, 4, 39999000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (655, 285, 4, 1150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (655, 601, 2, 2200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (656, 182, 1, 420000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (656, 594, 2, 450000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (657, 387, 3, 3350000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (657, 395, 1, 1500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (657, 646, 4, 4830000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (658, 589, 1, 1459000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (659, 744, 5, 10990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (660, 89, 4, 2215000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (660, 447, 1, 305000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (661, 332, 1, 2299000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (662, 86, 1, 2730000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (662, 110, 3, 5590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (662, 211, 5, 7090000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (662, 659, 3, 690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (663, 103, 5, 2790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (663, 219, 5, 2990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (663, 375, 2, 8250000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (663, 758, 4, 19890000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (664, 96, 2, 7290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (664, 533, 4, 80000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (664, 571, 1, 550000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (664, 612, 2, 1000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (665, 405, 1, 50000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (665, 438, 2, 599000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (666, 165, 1, 235000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (666, 319, 1, 165000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (666, 488, 4, 8690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (666, 688, 1, 27200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (666, 767, 3, 160000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (667, 221, 3, 9790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (667, 283, 1, 900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (668, 428, 4, 4180000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (670, 138, 3, 90000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (670, 193, 4, 1350000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (670, 363, 5, 900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (670, 760, 1, 636000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (671, 118, 1, 6000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (671, 180, 3, 80000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (671, 235, 1, 6080000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (671, 429, 1, 300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (671, 638, 1, 1880000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (672, 135, 5, 2860000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (672, 683, 2, 38500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (672, 753, 1, 18850000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (673, 219, 3, 2990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (673, 554, 2, 1200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (674, 151, 4, 8500001.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (674, 300, 4, 990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (674, 560, 3, 3490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (674, 619, 1, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (675, 130, 5, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (675, 443, 2, 599000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (675, 654, 5, 12226500.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (676, 113, 2, 6000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (676, 278, 5, 1840000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (676, 317, 4, 295000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (677, 147, 3, 150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (677, 357, 3, 690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (677, 565, 4, 59000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (677, 712, 2, 12190000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (678, 136, 2, 3190000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (678, 471, 2, 16000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (679, 184, 1, 3900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (679, 208, 5, 3049000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (680, 88, 5, 4790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (680, 239, 2, 1200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (680, 264, 4, 149000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (680, 281, 1, 2400000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (680, 377, 1, 20999000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (680, 437, 1, 2800000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (680, 496, 2, 345000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (680, 521, 1, 3180000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (681, 97, 1, 6690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (681, 305, 4, 3300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (681, 326, 5, 5900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (681, 360, 3, 165000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (681, 398, 1, 5099000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (682, 106, 3, 730000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (683, 325, 2, 258000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (684, 712, 5, 12190000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (686, 136, 2, 3190000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (687, 243, 2, 950000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (687, 258, 1, 573000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (687, 728, 3, 17300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (687, 736, 3, 12490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (688, 201, 1, 7900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (690, 462, 5, 1750000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (690, 517, 4, 11699000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (690, 533, 4, 80000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (691, 268, 1, 11360000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (692, 536, 4, 26000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (694, 452, 1, 9290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (695, 541, 5, 3290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (696, 222, 1, 7690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (698, 91, 4, 3000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (698, 229, 4, 225000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (698, 436, 3, 1300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (698, 455, 1, 11890000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (699, 525, 5, 2540000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (699, 616, 2, 590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (699, 722, 1, 12000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (699, 723, 3, 30000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (700, 562, 2, 3990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (701, 230, 2, 899000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (701, 322, 4, 12000001.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (701, 388, 5, 2440000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (701, 395, 4, 1500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (701, 678, 4, 29000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (702, 376, 5, 12000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (703, 159, 4, 25000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (703, 394, 1, 2480000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (704, 277, 5, 480000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (704, 329, 2, 945000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (705, 96, 5, 7290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (705, 186, 1, 7590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (705, 227, 1, 950000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (705, 327, 4, 3100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (705, 439, 1, 299000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (705, 700, 1, 8990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (706, 607, 2, 1050000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (707, 225, 1, 4790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (707, 346, 1, 880000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (707, 348, 4, 31000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (708, 567, 5, 3825000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (708, 717, 1, 14490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (709, 392, 1, 1950000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (710, 203, 1, 10000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (710, 580, 5, 1300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (710, 656, 3, 449000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (710, 725, 5, 480000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (712, 182, 4, 420000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (712, 207, 1, 9100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (712, 215, 2, 5950000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (712, 388, 2, 2440000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (712, 576, 4, 850000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (712, 624, 3, 2490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (712, 639, 3, 690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (713, 383, 2, 25999000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (713, 450, 1, 1535510.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (714, 260, 3, 1950000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (714, 323, 4, 10000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (714, 432, 4, 9000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (714, 471, 3, 16000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (715, 139, 5, 205000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (715, 216, 2, 5500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (715, 350, 4, 88000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (715, 369, 1, 6400000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (715, 554, 1, 1200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (715, 605, 3, 85000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (715, 692, 5, 13840000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (715, 745, 1, 12890000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (716, 99, 2, 5890000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (716, 211, 3, 7090000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (716, 464, 5, 220000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (716, 494, 4, 1800000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (716, 514, 4, 500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (717, 616, 3, 590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (717, 747, 2, 799000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (718, 472, 5, 39000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (718, 596, 2, 260000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (718, 639, 1, 690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (718, 734, 5, 16390000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (719, 137, 5, 2840000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (719, 239, 2, 1200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (719, 291, 2, 29000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (720, 164, 4, 245000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (720, 607, 1, 1050000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (720, 691, 1, 14890000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (721, 194, 5, 2800000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (721, 394, 1, 2480000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (721, 681, 4, 40500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (722, 356, 1, 150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (722, 705, 3, 8990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (722, 712, 2, 12190000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (724, 383, 1, 25999000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (724, 767, 5, 160000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (725, 166, 2, 245000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (725, 303, 4, 1230000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (725, 417, 4, 8100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (725, 676, 3, 36500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (727, 297, 4, 2550000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (727, 342, 1, 8590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (727, 704, 3, 7990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (728, 663, 3, 25590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (728, 735, 5, 18290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (728, 741, 2, 11289000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (729, 478, 5, 330000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (729, 640, 2, 15880000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (730, 373, 2, 33800000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (730, 682, 4, 40500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (731, 222, 4, 7690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (731, 738, 2, 16990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (732, 264, 5, 149000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (732, 290, 4, 48000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (733, 134, 1, 2780000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (733, 324, 1, 74000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (733, 450, 1, 1535510.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (733, 630, 3, 1689000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (734, 217, 1, 17190000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (734, 235, 2, 6080000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (734, 592, 4, 1179000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (734, 746, 2, 15690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (734, 754, 5, 13990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (735, 246, 2, 600000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (736, 166, 3, 245000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (736, 252, 2, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (736, 336, 4, 449000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (736, 595, 5, 170000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (737, 121, 3, 70000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (737, 669, 4, 254000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (737, 751, 3, 16990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (738, 313, 4, 3990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (738, 432, 3, 9000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (739, 197, 2, 5990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (739, 748, 1, 14490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (740, 229, 5, 225000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (740, 747, 3, 799000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (741, 95, 1, 7290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (741, 321, 5, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (741, 449, 5, 1651910.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (742, 119, 2, 6000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (742, 353, 3, 500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (742, 580, 5, 1300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (742, 712, 4, 12190000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (743, 200, 5, 7500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (743, 301, 1, 89000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (743, 531, 4, 11500.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (743, 552, 3, 9890000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (743, 592, 3, 1179000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (743, 755, 1, 15990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (744, 372, 1, 13500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (744, 473, 4, 39000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (744, 596, 1, 260000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (745, 138, 2, 90000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (745, 218, 1, 3050000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (747, 96, 2, 7290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (747, 255, 4, 750000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (747, 335, 5, 185000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (747, 555, 1, 1680000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (747, 751, 3, 16990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (748, 645, 4, 3500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (749, 374, 2, 57200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (751, 105, 3, 2300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (751, 347, 2, 32000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (751, 419, 1, 8099119.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (751, 672, 1, 2990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (752, 301, 1, 89000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (752, 716, 5, 14490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (753, 107, 1, 100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (753, 381, 3, 39999000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (753, 619, 4, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (754, 95, 5, 7290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (754, 257, 4, 1950000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (754, 576, 4, 850000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (755, 253, 3, 675000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (755, 593, 2, 385000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (755, 625, 4, 6990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (756, 90, 4, 230000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (756, 377, 5, 20999000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (756, 388, 1, 2440000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (756, 416, 1, 4950000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (756, 432, 3, 9000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (756, 704, 5, 7990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (757, 227, 5, 950000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (757, 285, 1, 1150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (757, 361, 5, 120000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (757, 425, 1, 520000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (757, 561, 5, 4000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (758, 226, 1, 963000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (758, 324, 5, 74000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (758, 425, 1, 520000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (758, 448, 2, 5610000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (758, 503, 2, 700000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (758, 572, 2, 550000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (759, 680, 4, 55500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (760, 276, 3, 1700000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (762, 113, 3, 6000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (762, 338, 5, 13580000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (762, 439, 4, 299000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (763, 152, 5, 195000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (764, 149, 2, 12000001.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (764, 186, 4, 7590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (764, 374, 1, 57200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (764, 428, 2, 4180000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (764, 679, 2, 88000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (765, 404, 4, 199000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (765, 411, 1, 199000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (766, 290, 5, 48000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (766, 571, 4, 550000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (767, 141, 2, 145000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (767, 273, 2, 1600000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (767, 557, 3, 850000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (767, 661, 3, 23090000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (767, 762, 4, 5590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (768, 264, 5, 149000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (768, 338, 1, 13580000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (768, 618, 2, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (768, 725, 2, 480000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (768, 761, 5, 3000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (769, 148, 5, 1000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (769, 696, 4, 1150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (769, 713, 5, 7290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (770, 117, 2, 3690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (771, 668, 2, 173000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (773, 151, 5, 8500001.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (773, 199, 5, 7000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (773, 520, 5, 1565000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (773, 532, 1, 1150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (774, 145, 4, 2000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (774, 282, 3, 2350000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (774, 386, 1, 20650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (775, 668, 5, 173000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (776, 206, 2, 9100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (777, 342, 4, 8590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (778, 341, 3, 6490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (778, 597, 2, 180000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (778, 667, 3, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (779, 428, 2, 4180000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (779, 641, 2, 7290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (779, 699, 3, 7490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (780, 117, 2, 3690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (780, 268, 5, 11360000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (781, 297, 2, 2550000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (781, 703, 4, 2990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (781, 752, 4, 17990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (782, 670, 3, 305000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (783, 272, 4, 300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (783, 512, 2, 1500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (784, 116, 3, 2990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (784, 232, 3, 690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (784, 402, 4, 1300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (785, 478, 3, 330000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (786, 241, 1, 591000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (786, 245, 5, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (786, 536, 2, 26000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (786, 616, 1, 590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (786, 630, 1, 1689000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (786, 754, 2, 13990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (787, 187, 3, 12990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (787, 240, 1, 1200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (787, 293, 4, 550000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (787, 541, 1, 3290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (787, 702, 4, 1590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (789, 97, 2, 6690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (789, 290, 2, 48000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (789, 675, 5, 35400000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (790, 170, 4, 155000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (790, 372, 5, 13500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (791, 274, 1, 500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (791, 341, 4, 6490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (791, 357, 2, 690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (791, 496, 5, 345000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (792, 132, 1, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (792, 538, 3, 43000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (792, 658, 4, 590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (793, 516, 3, 1200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (793, 608, 1, 540000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (793, 720, 5, 2480000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (794, 334, 1, 2000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (795, 144, 3, 155000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (795, 414, 4, 2880000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (795, 432, 1, 9000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (795, 555, 5, 1680000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (796, 477, 4, 330000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (796, 700, 2, 8990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (797, 153, 2, 260000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (797, 156, 4, 90000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (797, 546, 2, 14390000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (797, 658, 2, 590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (798, 81, 5, 4350000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (798, 563, 1, 790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (798, 566, 3, 2349000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (799, 717, 1, 14490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (800, 222, 2, 7690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (800, 461, 3, 1500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (800, 510, 4, 735000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (800, 726, 2, 430000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (801, 217, 2, 17190000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (801, 218, 1, 3050000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (801, 487, 2, 7490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (801, 752, 1, 17990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (802, 686, 1, 52500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (803, 259, 5, 573000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (803, 304, 4, 698000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (803, 550, 2, 12890000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (805, 608, 2, 540000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (805, 648, 1, 12958000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (806, 398, 5, 5099000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (806, 586, 2, 550000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (806, 611, 4, 550000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (806, 661, 2, 23090000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (807, 195, 3, 5000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (807, 207, 2, 9100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (807, 228, 2, 125000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (808, 300, 5, 990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (808, 447, 4, 305000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (809, 333, 1, 3000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (809, 503, 1, 700000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (811, 647, 1, 4850000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (812, 553, 3, 346000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (812, 560, 5, 3490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (813, 557, 3, 850000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (814, 188, 4, 6900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (814, 232, 4, 690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (814, 286, 4, 1750000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (814, 389, 2, 2890000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (814, 613, 3, 1450000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (815, 99, 2, 5890000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (815, 198, 2, 6000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (815, 255, 2, 750000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (815, 526, 3, 7910000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (816, 224, 2, 9790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (816, 432, 4, 9000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (816, 459, 1, 355000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (816, 722, 2, 12000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (817, 275, 3, 700000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (817, 366, 2, 2990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (817, 612, 1, 1000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (817, 756, 1, 17590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (818, 404, 2, 199000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (818, 492, 4, 550000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (819, 248, 3, 2280000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (819, 428, 3, 4180000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (819, 509, 1, 775000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (820, 380, 4, 31000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (820, 441, 2, 1105000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (820, 596, 5, 260000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (820, 670, 1, 305000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (821, 247, 1, 2280000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (821, 359, 4, 125000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (821, 425, 2, 520000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (821, 719, 5, 5650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (822, 111, 5, 6990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (822, 289, 5, 2250000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (822, 727, 1, 450000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (825, 640, 3, 15880000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (826, 383, 4, 25999000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (827, 86, 4, 2730000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (827, 165, 5, 235000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (827, 619, 2, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (828, 139, 5, 205000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (828, 184, 3, 3900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (828, 392, 1, 1950000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (828, 620, 1, 1245000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (828, 634, 5, 1590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (829, 145, 1, 2000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (829, 179, 1, 170000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (829, 663, 5, 25590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (829, 751, 1, 16990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (830, 173, 2, 155000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (830, 383, 4, 25999000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (831, 369, 3, 6400000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (831, 450, 1, 1535510.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (832, 110, 2, 5590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (832, 165, 5, 235000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (832, 223, 5, 8990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (833, 236, 3, 1900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (833, 468, 3, 350000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (833, 514, 1, 500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (833, 633, 3, 3990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (834, 388, 1, 2440000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (834, 617, 2, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (835, 171, 1, 85000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (835, 283, 3, 900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (835, 386, 5, 20650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (835, 465, 2, 100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (836, 127, 3, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (837, 305, 5, 3300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (837, 744, 1, 10990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (838, 258, 4, 573000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (838, 338, 1, 13580000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (838, 365, 5, 2290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (838, 518, 1, 12699000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (839, 748, 3, 14490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (840, 128, 2, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (840, 177, 5, 180000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (840, 376, 2, 12000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (840, 715, 5, 13290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (841, 360, 5, 165000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (842, 266, 3, 393000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (842, 409, 3, 3100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (842, 520, 1, 1565000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (843, 122, 2, 70000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (843, 338, 3, 13580000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (843, 748, 1, 14490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (844, 192, 1, 12900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (844, 597, 2, 180000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (844, 626, 1, 5400000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (845, 165, 3, 235000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (845, 396, 5, 6500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (845, 519, 5, 13190000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (846, 92, 2, 1225000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (846, 163, 4, 255000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (846, 222, 1, 7690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (846, 245, 1, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (846, 319, 1, 165000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (847, 184, 2, 3900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (847, 529, 5, 65000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (847, 624, 5, 2490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (848, 114, 4, 390000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (848, 509, 5, 775000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (848, 729, 5, 548000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (849, 360, 2, 165000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (849, 498, 4, 120000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (849, 526, 2, 7910000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (849, 730, 4, 2000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (850, 302, 5, 1200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (850, 390, 2, 3990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (850, 696, 4, 1150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (851, 253, 4, 675000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (851, 322, 2, 12000001.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (851, 456, 1, 210000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (851, 473, 1, 39000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (852, 299, 5, 240000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (852, 333, 3, 3000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (852, 537, 5, 26000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (852, 601, 1, 2200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (854, 491, 4, 379000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (854, 646, 3, 4830000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (854, 713, 4, 7290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (855, 119, 1, 6000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (855, 193, 3, 1350000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (855, 320, 2, 289000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (855, 414, 4, 2880000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (855, 475, 5, 150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (855, 651, 3, 2200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (855, 669, 2, 254000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (856, 251, 3, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (856, 524, 1, 5649000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (856, 707, 1, 2630000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (856, 714, 2, 7990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (857, 509, 1, 775000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (857, 693, 4, 1790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (858, 117, 5, 3690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (858, 294, 2, 620000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (859, 128, 4, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (859, 137, 2, 2840000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (859, 233, 1, 3050000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (859, 633, 2, 3990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (860, 130, 3, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (860, 277, 4, 480000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (860, 463, 2, 140000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (860, 492, 2, 550000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (862, 103, 1, 2790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (862, 518, 5, 12699000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (862, 585, 1, 3122000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (862, 735, 2, 18290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (862, 749, 4, 10990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (863, 237, 5, 7000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (863, 363, 5, 900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (863, 658, 3, 590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (864, 210, 5, 8990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (864, 600, 3, 3700000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (865, 436, 3, 1300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (866, 449, 5, 1651910.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (866, 474, 5, 9500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (866, 548, 2, 16990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (867, 95, 3, 7290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (867, 105, 2, 2300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (867, 138, 3, 90000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (867, 309, 4, 2636000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (867, 474, 5, 9500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (867, 540, 2, 1690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (867, 684, 4, 69800000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (868, 527, 5, 6980000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (868, 746, 3, 15690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (869, 215, 1, 5950000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (869, 632, 3, 2990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (869, 640, 3, 15880000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (869, 737, 2, 14790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (870, 232, 5, 690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (870, 700, 4, 8990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (871, 151, 5, 8500001.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (871, 344, 2, 120000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (871, 482, 5, 19990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (871, 677, 4, 39000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (871, 727, 2, 450000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (872, 103, 5, 2790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (872, 628, 5, 2290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (872, 725, 4, 480000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (873, 335, 2, 185000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (873, 511, 3, 775000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (873, 632, 2, 2990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (873, 706, 3, 9190000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (874, 161, 4, 50000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (874, 222, 5, 7690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (874, 349, 5, 48000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (874, 402, 5, 1300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (875, 549, 4, 12890000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (876, 685, 2, 78000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (877, 122, 4, 70000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (877, 372, 1, 13500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (877, 493, 3, 1950000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (878, 210, 5, 8990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (878, 660, 3, 23090000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (879, 761, 4, 3000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (880, 299, 5, 240000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (882, 586, 1, 550000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (882, 598, 1, 2500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (882, 634, 5, 1590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (882, 740, 4, 11450000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (883, 78, 1, 2590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (883, 154, 3, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (883, 296, 4, 1010000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (885, 110, 2, 5590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (885, 126, 5, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (885, 572, 2, 550000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (885, 648, 5, 12958000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (885, 678, 5, 29000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (886, 481, 2, 9800000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (886, 482, 5, 19990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (886, 741, 5, 11289000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (887, 127, 3, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (887, 268, 5, 11360000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (887, 670, 2, 305000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (888, 440, 4, 690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (889, 206, 4, 9100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (890, 159, 5, 25000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (890, 386, 3, 20650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (891, 704, 3, 7990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (893, 87, 1, 4890000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (894, 128, 1, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (894, 177, 5, 180000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (894, 181, 2, 70000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (895, 433, 5, 160000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (895, 467, 2, 240000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (895, 478, 1, 330000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (895, 495, 1, 315000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (896, 162, 4, 70000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (896, 213, 3, 6490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (896, 396, 5, 6500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (896, 626, 3, 5400000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (897, 114, 2, 390000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (897, 280, 3, 2250000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (897, 295, 1, 575000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (897, 329, 4, 945000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (897, 440, 2, 690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (897, 676, 5, 36500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (898, 522, 4, 5290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (899, 298, 3, 405000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (899, 367, 1, 24999000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (901, 198, 4, 6000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (901, 307, 3, 243000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (901, 395, 3, 1500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (901, 712, 4, 12190000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (901, 749, 2, 10990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (902, 190, 3, 12490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (902, 309, 3, 2636000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (902, 504, 4, 1786000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (903, 290, 4, 48000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (903, 341, 1, 6490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (903, 374, 2, 57200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (903, 576, 3, 850000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (904, 682, 4, 40500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (905, 89, 2, 2215000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (905, 395, 2, 1500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (905, 531, 2, 11500.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (906, 574, 3, 6920000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (906, 628, 4, 2290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (906, 718, 1, 9690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (908, 655, 2, 7710000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (908, 697, 5, 870000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (908, 757, 1, 17590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (909, 115, 5, 3390000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (909, 174, 2, 170000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (909, 669, 3, 254000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (909, 748, 4, 14490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (910, 139, 2, 205000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (910, 164, 1, 245000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (910, 372, 1, 13500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (910, 664, 5, 2649000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (911, 253, 3, 675000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (911, 431, 2, 150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (912, 373, 5, 33800000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (912, 586, 1, 550000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (912, 594, 5, 450000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (912, 695, 4, 55000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (912, 742, 5, 13389000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (913, 575, 1, 1650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (913, 702, 5, 1590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (914, 694, 3, 399000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (915, 99, 3, 5890000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (915, 178, 3, 185000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (915, 367, 2, 24999000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (915, 369, 1, 6400000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (915, 516, 3, 1200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (915, 574, 2, 6920000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (915, 602, 1, 3700000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (916, 399, 4, 7250000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (916, 701, 3, 6690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (917, 274, 2, 500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (917, 458, 4, 320000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (919, 416, 3, 4950000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (919, 441, 3, 1105000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (919, 487, 1, 7490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (920, 650, 1, 2200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (921, 140, 5, 180000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (921, 341, 4, 6490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (921, 427, 4, 2600000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (922, 586, 3, 550000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (922, 740, 3, 11450000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (923, 236, 5, 1900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (923, 579, 4, 870000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (923, 632, 1, 2990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (924, 634, 4, 1590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (924, 757, 5, 17590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (925, 287, 4, 1850000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (925, 619, 4, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (925, 723, 2, 30000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (926, 271, 2, 400000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (926, 395, 1, 1500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (927, 267, 3, 7000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (927, 474, 5, 9500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (927, 603, 3, 2500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (927, 692, 5, 13840000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (928, 333, 4, 3000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (928, 351, 1, 4200.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (928, 409, 5, 3100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (928, 446, 5, 790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (929, 411, 3, 199000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (929, 494, 4, 1800000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (930, 507, 1, 390000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (931, 184, 3, 3900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (931, 270, 1, 12000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (931, 762, 1, 5590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (932, 342, 3, 8590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (932, 625, 3, 6990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (932, 678, 1, 29000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (933, 208, 3, 3049000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (933, 223, 2, 8990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (933, 604, 5, 2200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (934, 474, 5, 9500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (934, 543, 5, 3590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (935, 84, 5, 2900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (935, 287, 5, 1850000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (935, 475, 2, 150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (935, 525, 2, 2540000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (935, 550, 2, 12890000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (935, 633, 2, 3990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (936, 443, 1, 599000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (936, 503, 3, 700000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (937, 159, 4, 25000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (937, 488, 1, 8690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (938, 198, 4, 6000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (938, 303, 4, 1230000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (938, 601, 1, 2200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (938, 680, 1, 55500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (939, 91, 3, 3000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (939, 208, 1, 3049000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (939, 664, 5, 2649000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (940, 645, 4, 3500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (941, 95, 1, 7290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (941, 746, 5, 15690000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (942, 193, 2, 1350000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (942, 198, 2, 6000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (942, 514, 1, 500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (942, 675, 1, 35400000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (943, 359, 5, 125000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (943, 529, 4, 65000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (944, 93, 2, 7990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (944, 487, 2, 7490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (945, 129, 3, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (945, 168, 5, 130000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (945, 241, 5, 591000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (945, 518, 4, 12699000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (945, 526, 3, 7910000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (946, 430, 2, 40000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (946, 520, 2, 1565000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (947, 427, 4, 2600000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (947, 673, 2, 3290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (948, 329, 1, 945000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (948, 491, 3, 379000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (948, 495, 3, 315000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (949, 118, 5, 6000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (949, 156, 2, 90000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (949, 165, 3, 235000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (949, 237, 3, 7000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (949, 486, 5, 9390000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (949, 487, 3, 7490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (950, 118, 5, 6000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (950, 209, 3, 3149000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (951, 247, 2, 2280000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (951, 270, 5, 12000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (951, 523, 2, 2380000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (952, 156, 3, 90000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (952, 384, 1, 18900000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (953, 212, 2, 5990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (953, 218, 5, 3050000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (954, 101, 1, 4990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (954, 581, 4, 150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (955, 170, 4, 155000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (955, 247, 1, 2280000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (955, 441, 3, 1105000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (955, 740, 4, 11450000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (956, 258, 4, 573000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (957, 252, 3, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (957, 267, 5, 7000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (957, 671, 1, 2649000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (958, 489, 3, 13090000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (959, 150, 4, 15000001.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (959, 673, 1, 3290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (960, 344, 1, 120000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (960, 412, 3, 6200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (960, 642, 4, 15152500.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (960, 704, 1, 7990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (961, 320, 4, 289000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (961, 417, 1, 8100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (961, 747, 4, 799000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (962, 130, 1, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (962, 460, 2, 460000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (963, 238, 3, 550000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (963, 426, 3, 6400000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (964, 256, 1, 2960000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (965, 739, 3, 16990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (966, 198, 5, 6000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (966, 212, 2, 5990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (966, 346, 5, 880000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (966, 508, 5, 3980000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (967, 155, 3, 700000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (967, 768, 3, 300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (968, 240, 4, 1200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (968, 652, 2, 1950000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (968, 752, 4, 17990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (969, 164, 4, 245000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (969, 165, 2, 235000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (969, 322, 3, 12000001.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (970, 245, 3, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (970, 548, 5, 16990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (971, 167, 2, 130000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (971, 478, 2, 330000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (971, 539, 3, 2490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (971, 676, 3, 36500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (972, 108, 2, 150000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (972, 130, 2, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (972, 317, 4, 295000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (972, 458, 5, 320000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (973, 127, 2, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (973, 399, 5, 7250000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (973, 624, 1, 2490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (974, 558, 3, 816000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (975, 104, 2, 7490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (975, 181, 3, 70000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (975, 274, 1, 500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (975, 422, 1, 5250000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (976, 106, 1, 730000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (976, 109, 3, 5390000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (976, 198, 2, 6000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (976, 206, 2, 9100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (976, 268, 5, 11360000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (976, 338, 3, 13580000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (976, 618, 1, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (979, 96, 1, 7290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (979, 402, 4, 1300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (979, 408, 2, 3000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (979, 632, 1, 2990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (979, 678, 4, 29000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (979, 724, 4, 1520000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (980, 209, 5, 3149000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (980, 744, 4, 10990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (981, 190, 5, 12490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (981, 262, 3, 1750000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (982, 619, 5, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (983, 428, 4, 4180000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (984, 422, 5, 5250000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (984, 728, 3, 17300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (985, 686, 1, 52500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (986, 203, 3, 10000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (986, 212, 3, 5990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (986, 252, 5, 650000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (986, 580, 1, 1300000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (986, 647, 5, 4850000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (987, 178, 5, 185000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (987, 215, 1, 5950000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (987, 407, 3, 499000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (988, 329, 3, 945000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (988, 564, 5, 980000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (989, 430, 5, 40000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (990, 264, 1, 149000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (990, 544, 2, 11990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (991, 99, 5, 5890000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (991, 169, 5, 155000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (991, 370, 1, 11500000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (991, 609, 2, 540000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (991, 693, 1, 1790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (991, 737, 5, 14790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (992, 131, 3, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (992, 621, 1, 7790000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (993, 432, 5, 9000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (993, 541, 2, 3290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (993, 671, 4, 2649000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (994, 172, 3, 100000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (994, 220, 5, 10999000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (994, 341, 4, 6490000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (994, 633, 4, 3990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (995, 519, 4, 13190000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (995, 735, 4, 18290000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (996, 289, 5, 2250000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (996, 368, 3, 14499000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (996, 630, 4, 1689000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (996, 677, 1, 39000000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (997, 298, 1, 405000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (997, 481, 5, 9800000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (997, 651, 1, 2200000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (997, 652, 2, 1950000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (998, 131, 1, 95000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (999, 146, 2, 240000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (999, 453, 2, 10990000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (999, 485, 4, 2400000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (999, 742, 5, 13389000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (999, 760, 2, 636000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (999, 765, 5, 1590000.0000)
GO
INSERT [OrderDetails] ([OrderID], [ProductID], [Quantity], [SalePrice]) VALUES (1000, 527, 4, 6980000.0000)
GO


SET IDENTITY_INSERT [Orders] ON 
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (1, 4694, CAST(N'2021-01-02T00:00:00.000' AS DateTime), N'Phú Yên', N'', 22, CAST(N'2021-01-02T00:00:00.000' AS DateTime), 2, CAST(N'2021-01-03T00:00:00.000' AS DateTime), CAST(N'2021-01-05T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (2, 4650, CAST(N'2021-01-03T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 10, CAST(N'2021-01-03T00:00:00.000' AS DateTime), 3, CAST(N'2021-01-04T00:00:00.000' AS DateTime), CAST(N'2021-01-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (3, 4688, CAST(N'2021-01-03T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 16, CAST(N'2021-01-03T00:00:00.000' AS DateTime), 2, CAST(N'2021-01-04T00:00:00.000' AS DateTime), CAST(N'2021-01-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (4, 4272, CAST(N'2021-01-04T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 16, CAST(N'2021-01-04T00:00:00.000' AS DateTime), 3, CAST(N'2021-01-05T00:00:00.000' AS DateTime), CAST(N'2021-01-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (5, 4429, CAST(N'2021-01-05T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 13, CAST(N'2021-01-05T00:00:00.000' AS DateTime), 1, CAST(N'2021-01-06T00:00:00.000' AS DateTime), CAST(N'2021-01-08T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (6, 4208, CAST(N'2021-01-05T00:00:00.000' AS DateTime), N'Nghệ An', N'', 16, CAST(N'2021-01-05T00:00:00.000' AS DateTime), 2, CAST(N'2021-01-06T00:00:00.000' AS DateTime), CAST(N'2021-01-08T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (8, 4591, CAST(N'2021-01-06T00:00:00.000' AS DateTime), N'Thanh Hóa', N'', 15, CAST(N'2021-01-06T00:00:00.000' AS DateTime), 1, CAST(N'2021-01-07T00:00:00.000' AS DateTime), CAST(N'2021-01-09T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (9, 4250, CAST(N'2021-01-08T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 26, CAST(N'2021-01-08T00:00:00.000' AS DateTime), 2, CAST(N'2021-01-09T00:00:00.000' AS DateTime), CAST(N'2021-01-11T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (10, 4300, CAST(N'2021-01-09T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 12, CAST(N'2021-01-09T00:00:00.000' AS DateTime), 1, CAST(N'2021-01-10T00:00:00.000' AS DateTime), CAST(N'2021-01-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (11, 4488, CAST(N'2021-01-09T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 8, CAST(N'2021-01-09T00:00:00.000' AS DateTime), 3, CAST(N'2021-01-10T00:00:00.000' AS DateTime), CAST(N'2021-01-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (12, 4263, CAST(N'2021-01-09T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 7, CAST(N'2021-01-09T00:00:00.000' AS DateTime), 3, CAST(N'2021-01-10T00:00:00.000' AS DateTime), CAST(N'2021-01-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (13, 4365, CAST(N'2021-01-10T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 13, CAST(N'2021-01-10T00:00:00.000' AS DateTime), 3, CAST(N'2021-01-11T00:00:00.000' AS DateTime), CAST(N'2021-01-13T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (14, 4494, CAST(N'2021-01-10T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 14, CAST(N'2021-01-10T00:00:00.000' AS DateTime), 3, CAST(N'2021-01-11T00:00:00.000' AS DateTime), CAST(N'2021-01-13T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (15, 4211, CAST(N'2021-01-11T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 19, CAST(N'2021-01-11T00:00:00.000' AS DateTime), 2, CAST(N'2021-01-12T00:00:00.000' AS DateTime), CAST(N'2021-01-14T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (16, 4567, CAST(N'2021-01-13T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 23, CAST(N'2021-01-13T00:00:00.000' AS DateTime), 1, CAST(N'2021-01-14T00:00:00.000' AS DateTime), CAST(N'2021-01-16T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (17, 4489, CAST(N'2021-01-14T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 9, CAST(N'2021-01-14T00:00:00.000' AS DateTime), 1, CAST(N'2021-01-15T00:00:00.000' AS DateTime), CAST(N'2021-01-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (18, 4349, CAST(N'2021-01-14T00:00:00.000' AS DateTime), N'Bắc Ninh', N'', 29, CAST(N'2021-01-14T00:00:00.000' AS DateTime), 2, CAST(N'2021-01-15T00:00:00.000' AS DateTime), CAST(N'2021-01-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (19, 4240, CAST(N'2021-01-16T00:00:00.000' AS DateTime), N'Nam Định', N'', 16, CAST(N'2021-01-16T00:00:00.000' AS DateTime), 1, CAST(N'2021-01-17T00:00:00.000' AS DateTime), CAST(N'2021-01-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (20, 4240, CAST(N'2021-01-16T00:00:00.000' AS DateTime), N'Nam Định', N'', 16, CAST(N'2021-01-16T00:00:00.000' AS DateTime), 1, CAST(N'2021-01-17T00:00:00.000' AS DateTime), CAST(N'2021-01-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (21, 4564, CAST(N'2021-01-17T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 20, CAST(N'2021-01-17T00:00:00.000' AS DateTime), 1, CAST(N'2021-01-18T00:00:00.000' AS DateTime), CAST(N'2021-01-20T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (22, 4222, CAST(N'2021-01-17T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 30, CAST(N'2021-01-17T00:00:00.000' AS DateTime), 1, CAST(N'2021-01-18T00:00:00.000' AS DateTime), CAST(N'2021-01-20T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (23, 4375, CAST(N'2021-01-17T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 23, CAST(N'2021-01-17T00:00:00.000' AS DateTime), 1, CAST(N'2021-01-18T00:00:00.000' AS DateTime), CAST(N'2021-01-20T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (24, 4669, CAST(N'2021-01-18T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 29, CAST(N'2021-01-18T00:00:00.000' AS DateTime), 1, CAST(N'2021-01-19T00:00:00.000' AS DateTime), CAST(N'2021-01-21T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (26, 4543, CAST(N'2021-01-19T00:00:00.000' AS DateTime), N'Nghệ An', N'', 31, CAST(N'2021-01-19T00:00:00.000' AS DateTime), 1, CAST(N'2021-01-20T00:00:00.000' AS DateTime), CAST(N'2021-01-22T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (27, 4620, CAST(N'2021-01-19T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 12, CAST(N'2021-01-19T00:00:00.000' AS DateTime), 3, CAST(N'2021-01-20T00:00:00.000' AS DateTime), CAST(N'2021-01-22T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (28, 4203, CAST(N'2021-01-20T00:00:00.000' AS DateTime), N'Nghệ An', N'', 11, CAST(N'2021-01-20T00:00:00.000' AS DateTime), 3, CAST(N'2021-01-21T00:00:00.000' AS DateTime), CAST(N'2021-01-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (29, 4457, CAST(N'2021-01-21T00:00:00.000' AS DateTime), N'Nghệ An', N'', 9, CAST(N'2021-01-21T00:00:00.000' AS DateTime), 2, CAST(N'2021-01-22T00:00:00.000' AS DateTime), CAST(N'2021-01-24T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (30, 4668, CAST(N'2021-01-22T00:00:00.000' AS DateTime), N'Nghệ An', N'', 28, CAST(N'2021-01-22T00:00:00.000' AS DateTime), 3, CAST(N'2021-01-23T00:00:00.000' AS DateTime), CAST(N'2021-01-25T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (31, 4250, CAST(N'2021-01-22T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 26, CAST(N'2021-01-22T00:00:00.000' AS DateTime), 2, CAST(N'2021-01-23T00:00:00.000' AS DateTime), CAST(N'2021-01-25T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (32, 4306, CAST(N'2021-01-23T00:00:00.000' AS DateTime), N'Hà Nội', N'', 18, CAST(N'2021-01-23T00:00:00.000' AS DateTime), 1, CAST(N'2021-01-24T00:00:00.000' AS DateTime), CAST(N'2021-01-26T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (33, 4431, CAST(N'2021-01-24T00:00:00.000' AS DateTime), N'Quảng Nam', N'', 15, CAST(N'2021-01-24T00:00:00.000' AS DateTime), 3, CAST(N'2021-01-25T00:00:00.000' AS DateTime), CAST(N'2021-01-27T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (34, 4553, CAST(N'2021-01-25T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 9, CAST(N'2021-01-25T00:00:00.000' AS DateTime), 2, CAST(N'2021-01-26T00:00:00.000' AS DateTime), CAST(N'2021-01-28T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (35, 4330, CAST(N'2021-01-26T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 10, CAST(N'2021-01-26T00:00:00.000' AS DateTime), 1, CAST(N'2021-01-27T00:00:00.000' AS DateTime), CAST(N'2021-01-29T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (36, 4286, CAST(N'2021-01-26T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 30, CAST(N'2021-01-26T00:00:00.000' AS DateTime), 2, CAST(N'2021-01-27T00:00:00.000' AS DateTime), CAST(N'2021-01-29T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (39, 4522, CAST(N'2021-01-28T00:00:00.000' AS DateTime), N'Nghệ An', N'', 10, CAST(N'2021-01-28T00:00:00.000' AS DateTime), 1, CAST(N'2021-01-29T00:00:00.000' AS DateTime), CAST(N'2021-01-31T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (40, 4240, CAST(N'2021-01-28T00:00:00.000' AS DateTime), N'Nam Định', N'', 16, CAST(N'2021-01-28T00:00:00.000' AS DateTime), 1, CAST(N'2021-01-29T00:00:00.000' AS DateTime), CAST(N'2021-01-31T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (41, 4511, CAST(N'2021-01-28T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 31, CAST(N'2021-01-28T00:00:00.000' AS DateTime), 2, CAST(N'2021-01-29T00:00:00.000' AS DateTime), CAST(N'2021-01-31T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (42, 4546, CAST(N'2021-01-29T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 2, CAST(N'2021-01-29T00:00:00.000' AS DateTime), 1, CAST(N'2021-01-30T00:00:00.000' AS DateTime), CAST(N'2021-02-01T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (43, 4650, CAST(N'2021-02-01T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 10, CAST(N'2021-02-01T00:00:00.000' AS DateTime), 3, CAST(N'2021-02-02T00:00:00.000' AS DateTime), CAST(N'2021-02-04T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (46, 4472, CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'Thanh Hóa ', N'', 24, CAST(N'2021-02-02T00:00:00.000' AS DateTime), 2, CAST(N'2021-02-03T00:00:00.000' AS DateTime), CAST(N'2021-02-05T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (47, 4375, CAST(N'2021-02-03T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 23, CAST(N'2021-02-03T00:00:00.000' AS DateTime), 1, CAST(N'2021-02-04T00:00:00.000' AS DateTime), CAST(N'2021-02-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (48, 4203, CAST(N'2021-02-03T00:00:00.000' AS DateTime), N'Nghệ An', N'', 11, CAST(N'2021-02-03T00:00:00.000' AS DateTime), 3, CAST(N'2021-02-04T00:00:00.000' AS DateTime), CAST(N'2021-02-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (49, 4434, CAST(N'2021-02-04T00:00:00.000' AS DateTime), N'Quảng Ngãi', N'', 18, CAST(N'2021-02-04T00:00:00.000' AS DateTime), 3, CAST(N'2021-02-05T00:00:00.000' AS DateTime), CAST(N'2021-02-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (50, 4652, CAST(N'2021-02-05T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 12, CAST(N'2021-02-05T00:00:00.000' AS DateTime), 2, CAST(N'2021-02-06T00:00:00.000' AS DateTime), CAST(N'2021-02-08T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (52, 4282, CAST(N'2021-02-07T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 26, CAST(N'2021-02-07T00:00:00.000' AS DateTime), 1, CAST(N'2021-02-08T00:00:00.000' AS DateTime), CAST(N'2021-02-10T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (53, 4541, CAST(N'2021-02-09T00:00:00.000' AS DateTime), N'Phú Thọ', N'', 29, CAST(N'2021-02-09T00:00:00.000' AS DateTime), 2, CAST(N'2021-02-10T00:00:00.000' AS DateTime), CAST(N'2021-02-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (54, 4348, CAST(N'2021-02-10T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 28, CAST(N'2021-02-10T00:00:00.000' AS DateTime), 1, CAST(N'2021-02-11T00:00:00.000' AS DateTime), CAST(N'2021-02-13T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (55, 4425, CAST(N'2021-02-10T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 9, CAST(N'2021-02-10T00:00:00.000' AS DateTime), 3, CAST(N'2021-02-11T00:00:00.000' AS DateTime), CAST(N'2021-02-13T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (56, 4617, CAST(N'2021-02-10T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 9, CAST(N'2021-02-10T00:00:00.000' AS DateTime), 3, CAST(N'2021-02-11T00:00:00.000' AS DateTime), CAST(N'2021-02-13T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (57, 4375, CAST(N'2021-02-11T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 23, CAST(N'2021-02-11T00:00:00.000' AS DateTime), 1, CAST(N'2021-02-12T00:00:00.000' AS DateTime), CAST(N'2021-02-14T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (58, 4281, CAST(N'2021-02-12T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 25, CAST(N'2021-02-12T00:00:00.000' AS DateTime), 3, CAST(N'2021-02-13T00:00:00.000' AS DateTime), CAST(N'2021-02-15T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (59, 4211, CAST(N'2021-02-12T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 19, CAST(N'2021-02-12T00:00:00.000' AS DateTime), 2, CAST(N'2021-02-13T00:00:00.000' AS DateTime), CAST(N'2021-02-15T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (60, 4436, CAST(N'2021-02-13T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 20, CAST(N'2021-02-13T00:00:00.000' AS DateTime), 2, CAST(N'2021-02-14T00:00:00.000' AS DateTime), CAST(N'2021-02-16T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (61, 4618, CAST(N'2021-02-13T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 10, CAST(N'2021-02-13T00:00:00.000' AS DateTime), 1, CAST(N'2021-02-14T00:00:00.000' AS DateTime), CAST(N'2021-02-16T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (62, 4325, CAST(N'2021-02-13T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 5, CAST(N'2021-02-13T00:00:00.000' AS DateTime), 2, CAST(N'2021-02-14T00:00:00.000' AS DateTime), CAST(N'2021-02-16T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (63, 4436, CAST(N'2021-02-14T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 20, CAST(N'2021-02-14T00:00:00.000' AS DateTime), 2, CAST(N'2021-02-15T00:00:00.000' AS DateTime), CAST(N'2021-02-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (64, 4368, CAST(N'2021-02-15T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 16, CAST(N'2021-02-15T00:00:00.000' AS DateTime), 3, CAST(N'2021-02-16T00:00:00.000' AS DateTime), CAST(N'2021-02-18T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (65, 4676, CAST(N'2021-02-16T00:00:00.000' AS DateTime), N'Kon Tum', N'', 4, CAST(N'2021-02-16T00:00:00.000' AS DateTime), 2, CAST(N'2021-02-17T00:00:00.000' AS DateTime), CAST(N'2021-02-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (68, 4472, CAST(N'2021-02-18T00:00:00.000' AS DateTime), N'Thanh Hóa ', N'', 24, CAST(N'2021-02-18T00:00:00.000' AS DateTime), 2, CAST(N'2021-02-19T00:00:00.000' AS DateTime), CAST(N'2021-02-21T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (69, 4487, CAST(N'2021-02-18T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 7, CAST(N'2021-02-18T00:00:00.000' AS DateTime), 2, CAST(N'2021-02-19T00:00:00.000' AS DateTime), CAST(N'2021-02-21T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (70, 4401, CAST(N'2021-02-19T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 17, CAST(N'2021-02-19T00:00:00.000' AS DateTime), 3, CAST(N'2021-02-20T00:00:00.000' AS DateTime), CAST(N'2021-02-22T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (71, 4211, CAST(N'2021-02-19T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 19, CAST(N'2021-02-19T00:00:00.000' AS DateTime), 2, CAST(N'2021-02-20T00:00:00.000' AS DateTime), CAST(N'2021-02-22T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (72, 4592, CAST(N'2021-02-20T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 16, CAST(N'2021-02-20T00:00:00.000' AS DateTime), 2, CAST(N'2021-02-21T00:00:00.000' AS DateTime), CAST(N'2021-02-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (73, 4590, CAST(N'2021-02-20T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 14, CAST(N'2021-02-20T00:00:00.000' AS DateTime), 3, CAST(N'2021-02-21T00:00:00.000' AS DateTime), CAST(N'2021-02-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (74, 4573, CAST(N'2021-02-23T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 29, CAST(N'2021-02-23T00:00:00.000' AS DateTime), 1, CAST(N'2021-02-24T00:00:00.000' AS DateTime), CAST(N'2021-02-26T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (76, 4666, CAST(N'2021-02-26T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 26, CAST(N'2021-02-26T00:00:00.000' AS DateTime), 1, CAST(N'2021-02-27T00:00:00.000' AS DateTime), CAST(N'2021-03-01T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (77, 4479, CAST(N'2021-02-27T00:00:00.000' AS DateTime), N'Đà Nẵng', N'', 31, CAST(N'2021-02-27T00:00:00.000' AS DateTime), 3, CAST(N'2021-02-28T00:00:00.000' AS DateTime), CAST(N'2021-03-02T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (78, 4686, CAST(N'2021-02-28T00:00:00.000' AS DateTime), N'Đà Nẵng', N'', 14, CAST(N'2021-02-28T00:00:00.000' AS DateTime), 3, CAST(N'2021-03-01T00:00:00.000' AS DateTime), CAST(N'2021-03-03T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (79, 4558, CAST(N'2021-02-28T00:00:00.000' AS DateTime), N'Kon Tum', N'', 14, CAST(N'2021-02-28T00:00:00.000' AS DateTime), 1, CAST(N'2021-03-01T00:00:00.000' AS DateTime), CAST(N'2021-03-03T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (81, 4472, CAST(N'2021-03-02T00:00:00.000' AS DateTime), N'Thanh Hóa ', N'', 24, CAST(N'2021-03-02T00:00:00.000' AS DateTime), 2, CAST(N'2021-03-03T00:00:00.000' AS DateTime), CAST(N'2021-03-05T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (82, 4276, CAST(N'2021-03-02T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 20, CAST(N'2021-03-02T00:00:00.000' AS DateTime), 1, CAST(N'2021-03-03T00:00:00.000' AS DateTime), CAST(N'2021-03-05T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (83, 4238, CAST(N'2021-03-02T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 14, CAST(N'2021-03-02T00:00:00.000' AS DateTime), 2, CAST(N'2021-03-03T00:00:00.000' AS DateTime), CAST(N'2021-03-05T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (84, 4433, CAST(N'2021-03-04T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 17, CAST(N'2021-03-04T00:00:00.000' AS DateTime), 2, CAST(N'2021-03-05T00:00:00.000' AS DateTime), CAST(N'2021-03-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (86, 4687, CAST(N'2021-03-04T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 15, CAST(N'2021-03-04T00:00:00.000' AS DateTime), 1, CAST(N'2021-03-05T00:00:00.000' AS DateTime), CAST(N'2021-03-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (87, 4643, CAST(N'2021-03-04T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 3, CAST(N'2021-03-04T00:00:00.000' AS DateTime), 2, CAST(N'2021-03-05T00:00:00.000' AS DateTime), CAST(N'2021-03-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (88, 4452, CAST(N'2021-03-04T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 4, CAST(N'2021-03-04T00:00:00.000' AS DateTime), 3, CAST(N'2021-03-05T00:00:00.000' AS DateTime), CAST(N'2021-03-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (89, 4421, CAST(N'2021-03-05T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 5, CAST(N'2021-03-05T00:00:00.000' AS DateTime), 2, CAST(N'2021-03-06T00:00:00.000' AS DateTime), CAST(N'2021-03-08T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (90, 4596, CAST(N'2021-03-05T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 20, CAST(N'2021-03-05T00:00:00.000' AS DateTime), 3, CAST(N'2021-03-06T00:00:00.000' AS DateTime), CAST(N'2021-03-08T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (91, 4297, CAST(N'2021-03-05T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 9, CAST(N'2021-03-05T00:00:00.000' AS DateTime), 1, CAST(N'2021-03-06T00:00:00.000' AS DateTime), CAST(N'2021-03-08T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (92, 4448, CAST(N'2021-03-06T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 32, CAST(N'2021-03-06T00:00:00.000' AS DateTime), 2, CAST(N'2021-03-07T00:00:00.000' AS DateTime), CAST(N'2021-03-09T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (93, 4581, CAST(N'2021-03-09T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 5, CAST(N'2021-03-09T00:00:00.000' AS DateTime), 3, CAST(N'2021-03-10T00:00:00.000' AS DateTime), CAST(N'2021-03-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (94, 4546, CAST(N'2021-03-10T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 2, CAST(N'2021-03-10T00:00:00.000' AS DateTime), 1, CAST(N'2021-03-11T00:00:00.000' AS DateTime), CAST(N'2021-03-13T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (95, 4619, CAST(N'2021-03-11T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 11, CAST(N'2021-03-11T00:00:00.000' AS DateTime), 2, CAST(N'2021-03-12T00:00:00.000' AS DateTime), CAST(N'2021-03-14T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (96, 4613, CAST(N'2021-03-11T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 5, CAST(N'2021-03-11T00:00:00.000' AS DateTime), 2, CAST(N'2021-03-12T00:00:00.000' AS DateTime), CAST(N'2021-03-14T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (97, 4546, CAST(N'2021-03-12T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 2, CAST(N'2021-03-12T00:00:00.000' AS DateTime), 1, CAST(N'2021-03-13T00:00:00.000' AS DateTime), CAST(N'2021-03-15T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (98, 4305, CAST(N'2021-03-12T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 17, CAST(N'2021-03-12T00:00:00.000' AS DateTime), 3, CAST(N'2021-03-13T00:00:00.000' AS DateTime), CAST(N'2021-03-15T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (99, 4643, CAST(N'2021-03-14T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 3, CAST(N'2021-03-14T00:00:00.000' AS DateTime), 2, CAST(N'2021-03-15T00:00:00.000' AS DateTime), CAST(N'2021-03-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (100, 4254, CAST(N'2021-03-15T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 30, CAST(N'2021-03-15T00:00:00.000' AS DateTime), 3, CAST(N'2021-03-16T00:00:00.000' AS DateTime), CAST(N'2021-03-18T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (101, 4207, CAST(N'2021-03-15T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 15, CAST(N'2021-03-15T00:00:00.000' AS DateTime), 1, CAST(N'2021-03-16T00:00:00.000' AS DateTime), CAST(N'2021-03-18T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (102, 4424, CAST(N'2021-03-16T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 8, CAST(N'2021-03-16T00:00:00.000' AS DateTime), 2, CAST(N'2021-03-17T00:00:00.000' AS DateTime), CAST(N'2021-03-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (103, 4334, CAST(N'2021-03-17T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 14, CAST(N'2021-03-17T00:00:00.000' AS DateTime), 2, CAST(N'2021-03-18T00:00:00.000' AS DateTime), CAST(N'2021-03-20T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (104, 4290, CAST(N'2021-03-20T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 2, CAST(N'2021-03-20T00:00:00.000' AS DateTime), 3, CAST(N'2021-03-21T00:00:00.000' AS DateTime), CAST(N'2021-03-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (105, 4358, CAST(N'2021-03-21T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 6, CAST(N'2021-03-21T00:00:00.000' AS DateTime), 2, CAST(N'2021-03-22T00:00:00.000' AS DateTime), CAST(N'2021-03-24T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (106, 4592, CAST(N'2021-03-21T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 16, CAST(N'2021-03-21T00:00:00.000' AS DateTime), 2, CAST(N'2021-03-22T00:00:00.000' AS DateTime), CAST(N'2021-03-24T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (107, 4365, CAST(N'2021-03-23T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 13, CAST(N'2021-03-23T00:00:00.000' AS DateTime), 3, CAST(N'2021-03-24T00:00:00.000' AS DateTime), CAST(N'2021-03-26T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (108, 4215, CAST(N'2021-03-24T00:00:00.000' AS DateTime), N'NGhệ An', N'', 23, CAST(N'2021-03-24T00:00:00.000' AS DateTime), 3, CAST(N'2021-03-25T00:00:00.000' AS DateTime), CAST(N'2021-03-27T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (109, 4543, CAST(N'2021-03-25T00:00:00.000' AS DateTime), N'Nghệ An', N'', 31, CAST(N'2021-03-25T00:00:00.000' AS DateTime), 1, CAST(N'2021-03-26T00:00:00.000' AS DateTime), CAST(N'2021-03-28T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (110, 4540, CAST(N'2021-03-28T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 28, CAST(N'2021-03-28T00:00:00.000' AS DateTime), 1, CAST(N'2021-03-29T00:00:00.000' AS DateTime), CAST(N'2021-03-31T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (111, 4337, CAST(N'2021-03-29T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 17, CAST(N'2021-03-29T00:00:00.000' AS DateTime), 2, CAST(N'2021-03-30T00:00:00.000' AS DateTime), CAST(N'2021-04-01T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (112, 4605, CAST(N'2021-03-30T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 29, CAST(N'2021-03-30T00:00:00.000' AS DateTime), 3, CAST(N'2021-03-31T00:00:00.000' AS DateTime), CAST(N'2021-04-02T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (113, 4463, CAST(N'2021-03-31T00:00:00.000' AS DateTime), N'Thái Bình', N'', 15, CAST(N'2021-03-31T00:00:00.000' AS DateTime), 2, CAST(N'2021-04-01T00:00:00.000' AS DateTime), CAST(N'2021-04-03T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (114, 4669, CAST(N'2021-03-31T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 29, CAST(N'2021-03-31T00:00:00.000' AS DateTime), 1, CAST(N'2021-04-01T00:00:00.000' AS DateTime), CAST(N'2021-04-03T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (115, 4333, CAST(N'2021-04-01T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 13, CAST(N'2021-04-01T00:00:00.000' AS DateTime), 1, CAST(N'2021-04-02T00:00:00.000' AS DateTime), CAST(N'2021-04-04T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (117, 4279, CAST(N'2021-04-01T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 23, CAST(N'2021-04-01T00:00:00.000' AS DateTime), 1, CAST(N'2021-04-02T00:00:00.000' AS DateTime), CAST(N'2021-04-04T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (118, 4305, CAST(N'2021-04-01T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 17, CAST(N'2021-04-01T00:00:00.000' AS DateTime), 3, CAST(N'2021-04-02T00:00:00.000' AS DateTime), CAST(N'2021-04-04T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (119, 4529, CAST(N'2021-04-03T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 17, CAST(N'2021-04-03T00:00:00.000' AS DateTime), 2, CAST(N'2021-04-04T00:00:00.000' AS DateTime), CAST(N'2021-04-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (121, 4667, CAST(N'2021-04-03T00:00:00.000' AS DateTime), N'Thanh Hóa', N'', 27, CAST(N'2021-04-03T00:00:00.000' AS DateTime), 2, CAST(N'2021-04-04T00:00:00.000' AS DateTime), CAST(N'2021-04-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (122, 4685, CAST(N'2021-04-04T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 13, CAST(N'2021-04-04T00:00:00.000' AS DateTime), 2, CAST(N'2021-04-05T00:00:00.000' AS DateTime), CAST(N'2021-04-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (123, 4529, CAST(N'2021-04-04T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 17, CAST(N'2021-04-04T00:00:00.000' AS DateTime), 2, CAST(N'2021-04-05T00:00:00.000' AS DateTime), CAST(N'2021-04-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (124, 4429, CAST(N'2021-04-04T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 13, CAST(N'2021-04-04T00:00:00.000' AS DateTime), 1, CAST(N'2021-04-05T00:00:00.000' AS DateTime), CAST(N'2021-04-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (125, 4219, CAST(N'2021-04-05T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 27, CAST(N'2021-04-05T00:00:00.000' AS DateTime), 1, CAST(N'2021-04-06T00:00:00.000' AS DateTime), CAST(N'2021-04-08T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (126, 4476, CAST(N'2021-04-06T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 28, CAST(N'2021-04-06T00:00:00.000' AS DateTime), 3, CAST(N'2021-04-07T00:00:00.000' AS DateTime), CAST(N'2021-04-09T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (127, 4220, CAST(N'2021-04-06T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 28, CAST(N'2021-04-06T00:00:00.000' AS DateTime), 2, CAST(N'2021-04-07T00:00:00.000' AS DateTime), CAST(N'2021-04-09T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (128, 4259, CAST(N'2021-04-06T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 3, CAST(N'2021-04-06T00:00:00.000' AS DateTime), 2, CAST(N'2021-04-07T00:00:00.000' AS DateTime), CAST(N'2021-04-09T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (129, 4617, CAST(N'2021-04-10T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 9, CAST(N'2021-04-10T00:00:00.000' AS DateTime), 3, CAST(N'2021-04-11T00:00:00.000' AS DateTime), CAST(N'2021-04-13T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (130, 4261, CAST(N'2021-04-10T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 5, CAST(N'2021-04-10T00:00:00.000' AS DateTime), 1, CAST(N'2021-04-11T00:00:00.000' AS DateTime), CAST(N'2021-04-13T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (131, 4581, CAST(N'2021-04-12T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 5, CAST(N'2021-04-12T00:00:00.000' AS DateTime), 3, CAST(N'2021-04-13T00:00:00.000' AS DateTime), CAST(N'2021-04-15T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (132, 4698, CAST(N'2021-04-13T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 26, CAST(N'2021-04-13T00:00:00.000' AS DateTime), 3, CAST(N'2021-04-14T00:00:00.000' AS DateTime), CAST(N'2021-04-16T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (133, 4530, CAST(N'2021-04-13T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 18, CAST(N'2021-04-13T00:00:00.000' AS DateTime), 3, CAST(N'2021-04-14T00:00:00.000' AS DateTime), CAST(N'2021-04-16T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (134, 4334, CAST(N'2021-04-14T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 14, CAST(N'2021-04-14T00:00:00.000' AS DateTime), 2, CAST(N'2021-04-15T00:00:00.000' AS DateTime), CAST(N'2021-04-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (135, 4624, CAST(N'2021-04-14T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 16, CAST(N'2021-04-14T00:00:00.000' AS DateTime), 1, CAST(N'2021-04-15T00:00:00.000' AS DateTime), CAST(N'2021-04-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (136, 4698, CAST(N'2021-04-14T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 26, CAST(N'2021-04-14T00:00:00.000' AS DateTime), 3, CAST(N'2021-04-15T00:00:00.000' AS DateTime), CAST(N'2021-04-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (137, 4358, CAST(N'2021-04-15T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 6, CAST(N'2021-04-15T00:00:00.000' AS DateTime), 2, CAST(N'2021-04-16T00:00:00.000' AS DateTime), CAST(N'2021-04-18T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (138, 4529, CAST(N'2021-04-15T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 17, CAST(N'2021-04-15T00:00:00.000' AS DateTime), 2, CAST(N'2021-04-16T00:00:00.000' AS DateTime), CAST(N'2021-04-18T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (139, 4368, CAST(N'2021-04-15T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 16, CAST(N'2021-04-15T00:00:00.000' AS DateTime), 3, CAST(N'2021-04-16T00:00:00.000' AS DateTime), CAST(N'2021-04-18T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (140, 4481, CAST(N'2021-04-16T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 1, CAST(N'2021-04-16T00:00:00.000' AS DateTime), 2, CAST(N'2021-04-17T00:00:00.000' AS DateTime), CAST(N'2021-04-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (141, 4620, CAST(N'2021-04-16T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 12, CAST(N'2021-04-16T00:00:00.000' AS DateTime), 3, CAST(N'2021-04-17T00:00:00.000' AS DateTime), CAST(N'2021-04-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (142, 4626, CAST(N'2021-04-17T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 18, CAST(N'2021-04-17T00:00:00.000' AS DateTime), 3, CAST(N'2021-04-18T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (144, 4623, CAST(N'2021-04-19T00:00:00.000' AS DateTime), N'Hưng Yên', N'', 15, CAST(N'2021-04-19T00:00:00.000' AS DateTime), 3, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-22T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (145, 4328, CAST(N'2021-04-19T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 8, CAST(N'2021-04-19T00:00:00.000' AS DateTime), 2, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-22T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (147, 4646, CAST(N'2021-04-21T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 6, CAST(N'2021-04-21T00:00:00.000' AS DateTime), 2, CAST(N'2021-04-22T00:00:00.000' AS DateTime), CAST(N'2021-04-24T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (148, 4330, CAST(N'2021-04-21T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 10, CAST(N'2021-04-21T00:00:00.000' AS DateTime), 1, CAST(N'2021-04-22T00:00:00.000' AS DateTime), CAST(N'2021-04-24T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (150, 4446, CAST(N'2021-04-23T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 30, CAST(N'2021-04-23T00:00:00.000' AS DateTime), 3, CAST(N'2021-04-24T00:00:00.000' AS DateTime), CAST(N'2021-04-26T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (152, 4467, CAST(N'2021-04-24T00:00:00.000' AS DateTime), N'Ninh Bình', N'', 19, CAST(N'2021-04-24T00:00:00.000' AS DateTime), 3, CAST(N'2021-04-25T00:00:00.000' AS DateTime), CAST(N'2021-04-27T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (153, 4601, CAST(N'2021-04-25T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 25, CAST(N'2021-04-25T00:00:00.000' AS DateTime), 2, CAST(N'2021-04-26T00:00:00.000' AS DateTime), CAST(N'2021-04-28T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (154, 4684, CAST(N'2021-04-25T00:00:00.000' AS DateTime), N'Quảng Nam', N'', 12, CAST(N'2021-04-25T00:00:00.000' AS DateTime), 1, CAST(N'2021-04-26T00:00:00.000' AS DateTime), CAST(N'2021-04-28T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (155, 4507, CAST(N'2021-04-26T00:00:00.000' AS DateTime), N'Quảng Nam', N'', 27, CAST(N'2021-04-26T00:00:00.000' AS DateTime), 1, CAST(N'2021-04-27T00:00:00.000' AS DateTime), CAST(N'2021-04-29T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (156, 4464, CAST(N'2021-04-26T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 16, CAST(N'2021-04-26T00:00:00.000' AS DateTime), 3, CAST(N'2021-04-27T00:00:00.000' AS DateTime), CAST(N'2021-04-29T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (158, 4588, CAST(N'2021-04-28T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 12, CAST(N'2021-04-28T00:00:00.000' AS DateTime), 1, CAST(N'2021-04-29T00:00:00.000' AS DateTime), CAST(N'2021-05-01T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (159, 4473, CAST(N'2021-04-29T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 25, CAST(N'2021-04-29T00:00:00.000' AS DateTime), 3, CAST(N'2021-04-30T00:00:00.000' AS DateTime), CAST(N'2021-05-02T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (160, 4250, CAST(N'2021-04-29T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 26, CAST(N'2021-04-29T00:00:00.000' AS DateTime), 2, CAST(N'2021-04-30T00:00:00.000' AS DateTime), CAST(N'2021-05-02T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (161, 4592, CAST(N'2021-04-29T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 16, CAST(N'2021-04-29T00:00:00.000' AS DateTime), 2, CAST(N'2021-04-30T00:00:00.000' AS DateTime), CAST(N'2021-05-02T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (162, 4492, CAST(N'2021-04-30T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 12, CAST(N'2021-04-30T00:00:00.000' AS DateTime), 1, CAST(N'2021-05-01T00:00:00.000' AS DateTime), CAST(N'2021-05-03T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (163, 4573, CAST(N'2021-04-30T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 29, CAST(N'2021-04-30T00:00:00.000' AS DateTime), 1, CAST(N'2021-05-01T00:00:00.000' AS DateTime), CAST(N'2021-05-03T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (164, 4670, CAST(N'2021-04-30T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 30, CAST(N'2021-04-30T00:00:00.000' AS DateTime), 2, CAST(N'2021-05-01T00:00:00.000' AS DateTime), CAST(N'2021-05-03T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (165, 4296, CAST(N'2021-05-01T00:00:00.000' AS DateTime), N'Kon Tum ', N'', 8, CAST(N'2021-05-01T00:00:00.000' AS DateTime), 3, CAST(N'2021-05-02T00:00:00.000' AS DateTime), CAST(N'2021-05-04T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (166, 4661, CAST(N'2021-05-02T00:00:00.000' AS DateTime), N'Thanh Hóa', N'', 21, CAST(N'2021-05-02T00:00:00.000' AS DateTime), 2, CAST(N'2021-05-03T00:00:00.000' AS DateTime), CAST(N'2021-05-05T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (167, 4452, CAST(N'2021-05-02T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 4, CAST(N'2021-05-02T00:00:00.000' AS DateTime), 3, CAST(N'2021-05-03T00:00:00.000' AS DateTime), CAST(N'2021-05-05T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (168, 4553, CAST(N'2021-05-03T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 9, CAST(N'2021-05-03T00:00:00.000' AS DateTime), 2, CAST(N'2021-05-04T00:00:00.000' AS DateTime), CAST(N'2021-05-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (169, 4458, CAST(N'2021-05-03T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 10, CAST(N'2021-05-03T00:00:00.000' AS DateTime), 3, CAST(N'2021-05-04T00:00:00.000' AS DateTime), CAST(N'2021-05-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (170, 4260, CAST(N'2021-05-04T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 4, CAST(N'2021-05-04T00:00:00.000' AS DateTime), 3, CAST(N'2021-05-05T00:00:00.000' AS DateTime), CAST(N'2021-05-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (171, 4389, CAST(N'2021-05-04T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 5, CAST(N'2021-05-04T00:00:00.000' AS DateTime), 3, CAST(N'2021-05-05T00:00:00.000' AS DateTime), CAST(N'2021-05-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (173, 4569, CAST(N'2021-05-08T00:00:00.000' AS DateTime), N'Tuyên Quang', N'', 25, CAST(N'2021-05-08T00:00:00.000' AS DateTime), 3, CAST(N'2021-05-09T00:00:00.000' AS DateTime), CAST(N'2021-05-11T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (174, 4371, CAST(N'2021-05-08T00:00:00.000' AS DateTime), N'Hà Tĩnh ', N'', 19, CAST(N'2021-05-08T00:00:00.000' AS DateTime), 3, CAST(N'2021-05-09T00:00:00.000' AS DateTime), CAST(N'2021-05-11T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (175, 4433, CAST(N'2021-05-09T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 17, CAST(N'2021-05-09T00:00:00.000' AS DateTime), 2, CAST(N'2021-05-10T00:00:00.000' AS DateTime), CAST(N'2021-05-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (176, 4314, CAST(N'2021-05-10T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 26, CAST(N'2021-05-10T00:00:00.000' AS DateTime), 3, CAST(N'2021-05-11T00:00:00.000' AS DateTime), CAST(N'2021-05-13T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (177, 4656, CAST(N'2021-05-10T00:00:00.000' AS DateTime), N'Nghệ An', N'', 16, CAST(N'2021-05-10T00:00:00.000' AS DateTime), 3, CAST(N'2021-05-11T00:00:00.000' AS DateTime), CAST(N'2021-05-13T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (178, 4587, CAST(N'2021-05-11T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 11, CAST(N'2021-05-11T00:00:00.000' AS DateTime), 3, CAST(N'2021-05-12T00:00:00.000' AS DateTime), CAST(N'2021-05-14T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (179, 4652, CAST(N'2021-05-12T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 12, CAST(N'2021-05-12T00:00:00.000' AS DateTime), 2, CAST(N'2021-05-13T00:00:00.000' AS DateTime), CAST(N'2021-05-15T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (180, 4630, CAST(N'2021-05-12T00:00:00.000' AS DateTime), N'Quảng Nam', N'', 22, CAST(N'2021-05-12T00:00:00.000' AS DateTime), 1, CAST(N'2021-05-13T00:00:00.000' AS DateTime), CAST(N'2021-05-15T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (181, 4546, CAST(N'2021-05-13T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 2, CAST(N'2021-05-13T00:00:00.000' AS DateTime), 1, CAST(N'2021-05-14T00:00:00.000' AS DateTime), CAST(N'2021-05-16T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (183, 4254, CAST(N'2021-05-14T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 30, CAST(N'2021-05-14T00:00:00.000' AS DateTime), 3, CAST(N'2021-05-15T00:00:00.000' AS DateTime), CAST(N'2021-05-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (184, 4283, CAST(N'2021-05-14T00:00:00.000' AS DateTime), N'Đà Nẵng', N'', 27, CAST(N'2021-05-14T00:00:00.000' AS DateTime), 2, CAST(N'2021-05-15T00:00:00.000' AS DateTime), CAST(N'2021-05-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (186, 4330, CAST(N'2021-05-15T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 10, CAST(N'2021-05-15T00:00:00.000' AS DateTime), 1, CAST(N'2021-05-16T00:00:00.000' AS DateTime), CAST(N'2021-05-18T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (187, 4673, CAST(N'2021-05-16T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 1, CAST(N'2021-05-16T00:00:00.000' AS DateTime), 2, CAST(N'2021-05-17T00:00:00.000' AS DateTime), CAST(N'2021-05-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (188, 4303, CAST(N'2021-05-17T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 15, CAST(N'2021-05-17T00:00:00.000' AS DateTime), 1, CAST(N'2021-05-18T00:00:00.000' AS DateTime), CAST(N'2021-05-20T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (189, 4540, CAST(N'2021-05-18T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 28, CAST(N'2021-05-18T00:00:00.000' AS DateTime), 1, CAST(N'2021-05-19T00:00:00.000' AS DateTime), CAST(N'2021-05-21T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (190, 4543, CAST(N'2021-05-18T00:00:00.000' AS DateTime), N'Nghệ An', N'', 31, CAST(N'2021-05-18T00:00:00.000' AS DateTime), 1, CAST(N'2021-05-19T00:00:00.000' AS DateTime), CAST(N'2021-05-21T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (191, 4591, CAST(N'2021-05-20T00:00:00.000' AS DateTime), N'Thanh Hóa', N'', 15, CAST(N'2021-05-20T00:00:00.000' AS DateTime), 1, CAST(N'2021-05-21T00:00:00.000' AS DateTime), CAST(N'2021-05-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (192, 4650, CAST(N'2021-05-20T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 10, CAST(N'2021-05-20T00:00:00.000' AS DateTime), 3, CAST(N'2021-05-21T00:00:00.000' AS DateTime), CAST(N'2021-05-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (193, 4644, CAST(N'2021-05-20T00:00:00.000' AS DateTime), N'Hà Nội', N'', 4, CAST(N'2021-05-20T00:00:00.000' AS DateTime), 3, CAST(N'2021-05-21T00:00:00.000' AS DateTime), CAST(N'2021-05-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (194, 4215, CAST(N'2021-05-20T00:00:00.000' AS DateTime), N'NGhệ An', N'', 23, CAST(N'2021-05-20T00:00:00.000' AS DateTime), 3, CAST(N'2021-05-21T00:00:00.000' AS DateTime), CAST(N'2021-05-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (195, 4259, CAST(N'2021-05-21T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 3, CAST(N'2021-05-21T00:00:00.000' AS DateTime), 2, CAST(N'2021-05-22T00:00:00.000' AS DateTime), CAST(N'2021-05-24T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (196, 4442, CAST(N'2021-05-22T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 26, CAST(N'2021-05-22T00:00:00.000' AS DateTime), 2, CAST(N'2021-05-23T00:00:00.000' AS DateTime), CAST(N'2021-05-25T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (197, 4561, CAST(N'2021-05-22T00:00:00.000' AS DateTime), N'Thừa Thiên Huế ', N'', 17, CAST(N'2021-05-22T00:00:00.000' AS DateTime), 1, CAST(N'2021-05-23T00:00:00.000' AS DateTime), CAST(N'2021-05-25T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (198, 4211, CAST(N'2021-05-22T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 19, CAST(N'2021-05-22T00:00:00.000' AS DateTime), 2, CAST(N'2021-05-23T00:00:00.000' AS DateTime), CAST(N'2021-05-25T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (199, 4476, CAST(N'2021-05-23T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 28, CAST(N'2021-05-23T00:00:00.000' AS DateTime), 3, CAST(N'2021-05-24T00:00:00.000' AS DateTime), CAST(N'2021-05-26T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (200, 4590, CAST(N'2021-05-23T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 14, CAST(N'2021-05-23T00:00:00.000' AS DateTime), 3, CAST(N'2021-05-24T00:00:00.000' AS DateTime), CAST(N'2021-05-26T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (204, 4441, CAST(N'2021-05-25T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 25, CAST(N'2021-05-25T00:00:00.000' AS DateTime), 1, CAST(N'2021-05-26T00:00:00.000' AS DateTime), CAST(N'2021-05-28T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (205, 4304, CAST(N'2021-05-26T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 16, CAST(N'2021-05-26T00:00:00.000' AS DateTime), 2, CAST(N'2021-05-27T00:00:00.000' AS DateTime), CAST(N'2021-05-29T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (206, 4409, CAST(N'2021-05-27T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 25, CAST(N'2021-05-27T00:00:00.000' AS DateTime), 2, CAST(N'2021-05-28T00:00:00.000' AS DateTime), CAST(N'2021-05-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (208, 4560, CAST(N'2021-05-28T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 16, CAST(N'2021-05-28T00:00:00.000' AS DateTime), 3, CAST(N'2021-05-29T00:00:00.000' AS DateTime), CAST(N'2021-05-31T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (210, 4409, CAST(N'2021-05-30T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 25, CAST(N'2021-05-30T00:00:00.000' AS DateTime), 2, CAST(N'2021-05-31T00:00:00.000' AS DateTime), CAST(N'2021-06-02T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (211, 4613, CAST(N'2021-05-30T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 5, CAST(N'2021-05-30T00:00:00.000' AS DateTime), 2, CAST(N'2021-05-31T00:00:00.000' AS DateTime), CAST(N'2021-06-02T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (212, 4667, CAST(N'2021-05-31T00:00:00.000' AS DateTime), N'Thanh Hóa', N'', 27, CAST(N'2021-05-31T00:00:00.000' AS DateTime), 2, CAST(N'2021-06-01T00:00:00.000' AS DateTime), CAST(N'2021-06-03T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (213, 4670, CAST(N'2021-06-01T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 30, CAST(N'2021-06-01T00:00:00.000' AS DateTime), 2, CAST(N'2021-06-02T00:00:00.000' AS DateTime), CAST(N'2021-06-04T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (214, 4538, CAST(N'2021-06-01T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 26, CAST(N'2021-06-01T00:00:00.000' AS DateTime), 2, CAST(N'2021-06-02T00:00:00.000' AS DateTime), CAST(N'2021-06-04T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (215, 4227, CAST(N'2021-06-02T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 3, CAST(N'2021-06-02T00:00:00.000' AS DateTime), 3, CAST(N'2021-06-03T00:00:00.000' AS DateTime), CAST(N'2021-06-05T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (216, 4571, CAST(N'2021-06-02T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 27, CAST(N'2021-06-02T00:00:00.000' AS DateTime), 2, CAST(N'2021-06-03T00:00:00.000' AS DateTime), CAST(N'2021-06-05T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (217, 4281, CAST(N'2021-06-05T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 25, CAST(N'2021-06-05T00:00:00.000' AS DateTime), 3, CAST(N'2021-06-06T00:00:00.000' AS DateTime), CAST(N'2021-06-08T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (218, 4465, CAST(N'2021-06-05T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 17, CAST(N'2021-06-05T00:00:00.000' AS DateTime), 1, CAST(N'2021-06-06T00:00:00.000' AS DateTime), CAST(N'2021-06-08T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (219, 4314, CAST(N'2021-06-05T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 26, CAST(N'2021-06-05T00:00:00.000' AS DateTime), 3, CAST(N'2021-06-06T00:00:00.000' AS DateTime), CAST(N'2021-06-08T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (220, 4316, CAST(N'2021-06-05T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 28, CAST(N'2021-06-05T00:00:00.000' AS DateTime), 2, CAST(N'2021-06-06T00:00:00.000' AS DateTime), CAST(N'2021-06-08T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (221, 4599, CAST(N'2021-06-08T00:00:00.000' AS DateTime), N'Gia Lai', N'', 23, CAST(N'2021-06-08T00:00:00.000' AS DateTime), 3, CAST(N'2021-06-09T00:00:00.000' AS DateTime), CAST(N'2021-06-11T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (222, 4664, CAST(N'2021-06-10T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 24, CAST(N'2021-06-10T00:00:00.000' AS DateTime), 2, CAST(N'2021-06-11T00:00:00.000' AS DateTime), CAST(N'2021-06-13T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (223, 4358, CAST(N'2021-06-11T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 6, CAST(N'2021-06-11T00:00:00.000' AS DateTime), 2, CAST(N'2021-06-12T00:00:00.000' AS DateTime), CAST(N'2021-06-14T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (225, 4227, CAST(N'2021-06-13T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 3, CAST(N'2021-06-13T00:00:00.000' AS DateTime), 3, CAST(N'2021-06-14T00:00:00.000' AS DateTime), CAST(N'2021-06-16T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (226, 4322, CAST(N'2021-06-16T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 2, CAST(N'2021-06-16T00:00:00.000' AS DateTime), 2, CAST(N'2021-06-17T00:00:00.000' AS DateTime), CAST(N'2021-06-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (227, 4282, CAST(N'2021-06-16T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 26, CAST(N'2021-06-16T00:00:00.000' AS DateTime), 1, CAST(N'2021-06-17T00:00:00.000' AS DateTime), CAST(N'2021-06-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (228, 4217, CAST(N'2021-06-16T00:00:00.000' AS DateTime), N'Nghệ An', N'', 25, CAST(N'2021-06-16T00:00:00.000' AS DateTime), 2, CAST(N'2021-06-17T00:00:00.000' AS DateTime), CAST(N'2021-06-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (229, 4504, CAST(N'2021-06-17T00:00:00.000' AS DateTime), N'Nghệ An', N'', 24, CAST(N'2021-06-17T00:00:00.000' AS DateTime), 1, CAST(N'2021-06-18T00:00:00.000' AS DateTime), CAST(N'2021-06-20T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (230, 4340, CAST(N'2021-06-17T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 20, CAST(N'2021-06-17T00:00:00.000' AS DateTime), 2, CAST(N'2021-06-18T00:00:00.000' AS DateTime), CAST(N'2021-06-20T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (231, 4220, CAST(N'2021-06-20T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 28, CAST(N'2021-06-20T00:00:00.000' AS DateTime), 2, CAST(N'2021-06-21T00:00:00.000' AS DateTime), CAST(N'2021-06-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (232, 4394, CAST(N'2021-06-24T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 10, CAST(N'2021-06-24T00:00:00.000' AS DateTime), 2, CAST(N'2021-06-25T00:00:00.000' AS DateTime), CAST(N'2021-06-27T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (233, 4587, CAST(N'2021-06-24T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 11, CAST(N'2021-06-24T00:00:00.000' AS DateTime), 3, CAST(N'2021-06-25T00:00:00.000' AS DateTime), CAST(N'2021-06-27T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (235, 4343, CAST(N'2021-06-27T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 23, CAST(N'2021-06-27T00:00:00.000' AS DateTime), 2, CAST(N'2021-06-28T00:00:00.000' AS DateTime), CAST(N'2021-06-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (236, 4667, CAST(N'2021-06-28T00:00:00.000' AS DateTime), N'Thanh Hóa', N'', 27, CAST(N'2021-06-28T00:00:00.000' AS DateTime), 2, CAST(N'2021-06-29T00:00:00.000' AS DateTime), CAST(N'2021-07-01T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (237, 4610, CAST(N'2021-06-29T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 2, CAST(N'2021-06-29T00:00:00.000' AS DateTime), 2, CAST(N'2021-06-30T00:00:00.000' AS DateTime), CAST(N'2021-07-02T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (238, 4326, CAST(N'2021-06-29T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 6, CAST(N'2021-06-29T00:00:00.000' AS DateTime), 3, CAST(N'2021-06-30T00:00:00.000' AS DateTime), CAST(N'2021-07-02T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (239, 4661, CAST(N'2021-06-29T00:00:00.000' AS DateTime), N'Thanh Hóa', N'', 21, CAST(N'2021-06-29T00:00:00.000' AS DateTime), 2, CAST(N'2021-06-30T00:00:00.000' AS DateTime), CAST(N'2021-07-02T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (241, 4349, CAST(N'2021-07-01T00:00:00.000' AS DateTime), N'Bắc Ninh', N'', 29, CAST(N'2021-07-01T00:00:00.000' AS DateTime), 2, CAST(N'2021-07-02T00:00:00.000' AS DateTime), CAST(N'2021-07-04T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (242, 4528, CAST(N'2021-07-02T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 16, CAST(N'2021-07-02T00:00:00.000' AS DateTime), 1, CAST(N'2021-07-03T00:00:00.000' AS DateTime), CAST(N'2021-07-05T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (243, 4406, CAST(N'2021-07-02T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 22, CAST(N'2021-07-02T00:00:00.000' AS DateTime), 2, CAST(N'2021-07-03T00:00:00.000' AS DateTime), CAST(N'2021-07-05T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (244, 4358, CAST(N'2021-07-05T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 6, CAST(N'2021-07-05T00:00:00.000' AS DateTime), 2, CAST(N'2021-07-06T00:00:00.000' AS DateTime), CAST(N'2021-07-08T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (245, 4466, CAST(N'2021-07-06T00:00:00.000' AS DateTime), N'Nghệ An', N'', 18, CAST(N'2021-07-06T00:00:00.000' AS DateTime), 2, CAST(N'2021-07-07T00:00:00.000' AS DateTime), CAST(N'2021-07-09T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (247, 4212, CAST(N'2021-07-07T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 20, CAST(N'2021-07-07T00:00:00.000' AS DateTime), 3, CAST(N'2021-07-08T00:00:00.000' AS DateTime), CAST(N'2021-07-10T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (248, 4700, CAST(N'2021-07-08T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 28, CAST(N'2021-07-08T00:00:00.000' AS DateTime), 2, CAST(N'2021-07-09T00:00:00.000' AS DateTime), CAST(N'2021-07-11T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (250, 4594, CAST(N'2021-07-09T00:00:00.000' AS DateTime), N'Nghệ An', N'', 18, CAST(N'2021-07-09T00:00:00.000' AS DateTime), 1, CAST(N'2021-07-10T00:00:00.000' AS DateTime), CAST(N'2021-07-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (251, 4238, CAST(N'2021-07-09T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 14, CAST(N'2021-07-09T00:00:00.000' AS DateTime), 2, CAST(N'2021-07-10T00:00:00.000' AS DateTime), CAST(N'2021-07-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (253, 4493, CAST(N'2021-07-12T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 13, CAST(N'2021-07-12T00:00:00.000' AS DateTime), 2, CAST(N'2021-07-13T00:00:00.000' AS DateTime), CAST(N'2021-07-15T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (254, 4484, CAST(N'2021-07-12T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 4, CAST(N'2021-07-12T00:00:00.000' AS DateTime), 2, CAST(N'2021-07-13T00:00:00.000' AS DateTime), CAST(N'2021-07-15T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (255, 4261, CAST(N'2021-07-12T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 5, CAST(N'2021-07-12T00:00:00.000' AS DateTime), 1, CAST(N'2021-07-13T00:00:00.000' AS DateTime), CAST(N'2021-07-15T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (256, 4290, CAST(N'2021-07-13T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 2, CAST(N'2021-07-13T00:00:00.000' AS DateTime), 3, CAST(N'2021-07-14T00:00:00.000' AS DateTime), CAST(N'2021-07-16T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (257, 4618, CAST(N'2021-07-13T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 10, CAST(N'2021-07-13T00:00:00.000' AS DateTime), 1, CAST(N'2021-07-14T00:00:00.000' AS DateTime), CAST(N'2021-07-16T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (258, 4350, CAST(N'2021-07-13T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 30, CAST(N'2021-07-13T00:00:00.000' AS DateTime), 3, CAST(N'2021-07-14T00:00:00.000' AS DateTime), CAST(N'2021-07-16T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (259, 4595, CAST(N'2021-07-13T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 19, CAST(N'2021-07-13T00:00:00.000' AS DateTime), 2, CAST(N'2021-07-14T00:00:00.000' AS DateTime), CAST(N'2021-07-16T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (260, 4329, CAST(N'2021-07-14T00:00:00.000' AS DateTime), N'Quảng Nam', N'', 9, CAST(N'2021-07-14T00:00:00.000' AS DateTime), 3, CAST(N'2021-07-15T00:00:00.000' AS DateTime), CAST(N'2021-07-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (261, 4261, CAST(N'2021-07-15T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 5, CAST(N'2021-07-15T00:00:00.000' AS DateTime), 1, CAST(N'2021-07-16T00:00:00.000' AS DateTime), CAST(N'2021-07-18T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (262, 4668, CAST(N'2021-07-15T00:00:00.000' AS DateTime), N'Nghệ An', N'', 28, CAST(N'2021-07-15T00:00:00.000' AS DateTime), 3, CAST(N'2021-07-16T00:00:00.000' AS DateTime), CAST(N'2021-07-18T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (264, 4237, CAST(N'2021-07-16T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 13, CAST(N'2021-07-16T00:00:00.000' AS DateTime), 1, CAST(N'2021-07-17T00:00:00.000' AS DateTime), CAST(N'2021-07-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (266, 4624, CAST(N'2021-07-20T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 16, CAST(N'2021-07-20T00:00:00.000' AS DateTime), 1, CAST(N'2021-07-21T00:00:00.000' AS DateTime), CAST(N'2021-07-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (267, 4473, CAST(N'2021-07-22T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 25, CAST(N'2021-07-22T00:00:00.000' AS DateTime), 3, CAST(N'2021-07-23T00:00:00.000' AS DateTime), CAST(N'2021-07-25T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (268, 4255, CAST(N'2021-07-22T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 31, CAST(N'2021-07-22T00:00:00.000' AS DateTime), 1, CAST(N'2021-07-23T00:00:00.000' AS DateTime), CAST(N'2021-07-25T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (269, 4700, CAST(N'2021-07-24T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 28, CAST(N'2021-07-24T00:00:00.000' AS DateTime), 2, CAST(N'2021-07-25T00:00:00.000' AS DateTime), CAST(N'2021-07-27T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (270, 4561, CAST(N'2021-07-24T00:00:00.000' AS DateTime), N'Thừa Thiên Huế ', N'', 17, CAST(N'2021-07-24T00:00:00.000' AS DateTime), 1, CAST(N'2021-07-25T00:00:00.000' AS DateTime), CAST(N'2021-07-27T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (271, 4425, CAST(N'2021-07-25T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 9, CAST(N'2021-07-25T00:00:00.000' AS DateTime), 3, CAST(N'2021-07-26T00:00:00.000' AS DateTime), CAST(N'2021-07-28T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (272, 4305, CAST(N'2021-07-26T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 17, CAST(N'2021-07-26T00:00:00.000' AS DateTime), 3, CAST(N'2021-07-27T00:00:00.000' AS DateTime), CAST(N'2021-07-29T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (273, 4505, CAST(N'2021-07-27T00:00:00.000' AS DateTime), N'Nghệ An', N'', 25, CAST(N'2021-07-27T00:00:00.000' AS DateTime), 2, CAST(N'2021-07-28T00:00:00.000' AS DateTime), CAST(N'2021-07-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (275, 4492, CAST(N'2021-07-28T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 12, CAST(N'2021-07-28T00:00:00.000' AS DateTime), 1, CAST(N'2021-07-29T00:00:00.000' AS DateTime), CAST(N'2021-07-31T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (276, 4663, CAST(N'2021-07-28T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 23, CAST(N'2021-07-28T00:00:00.000' AS DateTime), 1, CAST(N'2021-07-29T00:00:00.000' AS DateTime), CAST(N'2021-07-31T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (277, 4495, CAST(N'2021-07-29T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 15, CAST(N'2021-07-29T00:00:00.000' AS DateTime), 1, CAST(N'2021-07-30T00:00:00.000' AS DateTime), CAST(N'2021-08-01T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (278, 4335, CAST(N'2021-07-30T00:00:00.000' AS DateTime), N'Thanh Hóa', N'', 15, CAST(N'2021-07-30T00:00:00.000' AS DateTime), 3, CAST(N'2021-07-31T00:00:00.000' AS DateTime), CAST(N'2021-08-02T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (279, 4350, CAST(N'2021-07-30T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 30, CAST(N'2021-07-30T00:00:00.000' AS DateTime), 3, CAST(N'2021-07-31T00:00:00.000' AS DateTime), CAST(N'2021-08-02T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (280, 4566, CAST(N'2021-07-31T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 22, CAST(N'2021-07-31T00:00:00.000' AS DateTime), 3, CAST(N'2021-08-01T00:00:00.000' AS DateTime), CAST(N'2021-08-03T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (281, 4326, CAST(N'2021-08-02T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 6, CAST(N'2021-08-02T00:00:00.000' AS DateTime), 3, CAST(N'2021-08-03T00:00:00.000' AS DateTime), CAST(N'2021-08-05T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (282, 4609, CAST(N'2021-08-02T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 1, CAST(N'2021-08-02T00:00:00.000' AS DateTime), 1, CAST(N'2021-08-03T00:00:00.000' AS DateTime), CAST(N'2021-08-05T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (283, 4537, CAST(N'2021-08-02T00:00:00.000' AS DateTime), N'Nghệ An', N'', 25, CAST(N'2021-08-02T00:00:00.000' AS DateTime), 1, CAST(N'2021-08-03T00:00:00.000' AS DateTime), CAST(N'2021-08-05T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (284, 4306, CAST(N'2021-08-03T00:00:00.000' AS DateTime), N'Hà Nội', N'', 18, CAST(N'2021-08-03T00:00:00.000' AS DateTime), 1, CAST(N'2021-08-04T00:00:00.000' AS DateTime), CAST(N'2021-08-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (286, 4528, CAST(N'2021-08-04T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 16, CAST(N'2021-08-04T00:00:00.000' AS DateTime), 1, CAST(N'2021-08-05T00:00:00.000' AS DateTime), CAST(N'2021-08-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (288, 4492, CAST(N'2021-08-06T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 12, CAST(N'2021-08-06T00:00:00.000' AS DateTime), 1, CAST(N'2021-08-07T00:00:00.000' AS DateTime), CAST(N'2021-08-09T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (289, 4449, CAST(N'2021-08-06T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 1, CAST(N'2021-08-06T00:00:00.000' AS DateTime), 3, CAST(N'2021-08-07T00:00:00.000' AS DateTime), CAST(N'2021-08-09T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (290, 4342, CAST(N'2021-08-06T00:00:00.000' AS DateTime), N'Nghệ An', N'', 22, CAST(N'2021-08-06T00:00:00.000' AS DateTime), 1, CAST(N'2021-08-07T00:00:00.000' AS DateTime), CAST(N'2021-08-09T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (291, 4637, CAST(N'2021-08-06T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 29, CAST(N'2021-08-06T00:00:00.000' AS DateTime), 2, CAST(N'2021-08-07T00:00:00.000' AS DateTime), CAST(N'2021-08-09T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (292, 4330, CAST(N'2021-08-07T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 10, CAST(N'2021-08-07T00:00:00.000' AS DateTime), 1, CAST(N'2021-08-08T00:00:00.000' AS DateTime), CAST(N'2021-08-10T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (293, 4407, CAST(N'2021-08-08T00:00:00.000' AS DateTime), N'Thái Nguyên', N'', 23, CAST(N'2021-08-08T00:00:00.000' AS DateTime), 3, CAST(N'2021-08-09T00:00:00.000' AS DateTime), CAST(N'2021-08-11T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (294, 4564, CAST(N'2021-08-09T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 20, CAST(N'2021-08-09T00:00:00.000' AS DateTime), 1, CAST(N'2021-08-10T00:00:00.000' AS DateTime), CAST(N'2021-08-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (295, 4369, CAST(N'2021-08-09T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 17, CAST(N'2021-08-09T00:00:00.000' AS DateTime), 1, CAST(N'2021-08-10T00:00:00.000' AS DateTime), CAST(N'2021-08-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (296, 4465, CAST(N'2021-08-09T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 17, CAST(N'2021-08-09T00:00:00.000' AS DateTime), 1, CAST(N'2021-08-10T00:00:00.000' AS DateTime), CAST(N'2021-08-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (297, 4465, CAST(N'2021-08-14T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 17, CAST(N'2021-08-14T00:00:00.000' AS DateTime), 1, CAST(N'2021-08-15T00:00:00.000' AS DateTime), CAST(N'2021-08-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (298, 4479, CAST(N'2021-08-14T00:00:00.000' AS DateTime), N'Đà Nẵng', N'', 31, CAST(N'2021-08-14T00:00:00.000' AS DateTime), 3, CAST(N'2021-08-15T00:00:00.000' AS DateTime), CAST(N'2021-08-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (299, 4478, CAST(N'2021-08-14T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 30, CAST(N'2021-08-14T00:00:00.000' AS DateTime), 2, CAST(N'2021-08-15T00:00:00.000' AS DateTime), CAST(N'2021-08-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (300, 4457, CAST(N'2021-08-15T00:00:00.000' AS DateTime), N'Nghệ An', N'', 9, CAST(N'2021-08-15T00:00:00.000' AS DateTime), 2, CAST(N'2021-08-16T00:00:00.000' AS DateTime), CAST(N'2021-08-18T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (302, 4398, CAST(N'2021-08-16T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 14, CAST(N'2021-08-16T00:00:00.000' AS DateTime), 3, CAST(N'2021-08-17T00:00:00.000' AS DateTime), CAST(N'2021-08-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (303, 4609, CAST(N'2021-08-17T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 1, CAST(N'2021-08-17T00:00:00.000' AS DateTime), 1, CAST(N'2021-08-18T00:00:00.000' AS DateTime), CAST(N'2021-08-20T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (304, 4466, CAST(N'2021-08-17T00:00:00.000' AS DateTime), N'Nghệ An', N'', 18, CAST(N'2021-08-17T00:00:00.000' AS DateTime), 2, CAST(N'2021-08-18T00:00:00.000' AS DateTime), CAST(N'2021-08-20T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (305, 4609, CAST(N'2021-08-17T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 1, CAST(N'2021-08-17T00:00:00.000' AS DateTime), 1, CAST(N'2021-08-18T00:00:00.000' AS DateTime), CAST(N'2021-08-20T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (306, 4432, CAST(N'2021-08-17T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 16, CAST(N'2021-08-17T00:00:00.000' AS DateTime), 1, CAST(N'2021-08-18T00:00:00.000' AS DateTime), CAST(N'2021-08-20T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (307, 4537, CAST(N'2021-08-17T00:00:00.000' AS DateTime), N'Nghệ An', N'', 25, CAST(N'2021-08-17T00:00:00.000' AS DateTime), 1, CAST(N'2021-08-18T00:00:00.000' AS DateTime), CAST(N'2021-08-20T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (308, 4210, CAST(N'2021-08-18T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 18, CAST(N'2021-08-18T00:00:00.000' AS DateTime), 1, CAST(N'2021-08-19T00:00:00.000' AS DateTime), CAST(N'2021-08-21T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (309, 4472, CAST(N'2021-08-20T00:00:00.000' AS DateTime), N'Thanh Hóa ', N'', 24, CAST(N'2021-08-20T00:00:00.000' AS DateTime), 2, CAST(N'2021-08-21T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (310, 4440, CAST(N'2021-08-20T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 24, CAST(N'2021-08-20T00:00:00.000' AS DateTime), 3, CAST(N'2021-08-21T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (311, 4272, CAST(N'2021-08-20T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 16, CAST(N'2021-08-20T00:00:00.000' AS DateTime), 3, CAST(N'2021-08-21T00:00:00.000' AS DateTime), CAST(N'2021-08-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (312, 4468, CAST(N'2021-08-21T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 20, CAST(N'2021-08-21T00:00:00.000' AS DateTime), 1, CAST(N'2021-08-22T00:00:00.000' AS DateTime), CAST(N'2021-08-24T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (313, 4252, CAST(N'2021-08-24T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 28, CAST(N'2021-08-24T00:00:00.000' AS DateTime), 1, CAST(N'2021-08-25T00:00:00.000' AS DateTime), CAST(N'2021-08-27T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (314, 4522, CAST(N'2021-08-25T00:00:00.000' AS DateTime), N'Nghệ An', N'', 10, CAST(N'2021-08-25T00:00:00.000' AS DateTime), 1, CAST(N'2021-08-26T00:00:00.000' AS DateTime), CAST(N'2021-08-28T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (315, 4333, CAST(N'2021-08-26T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 13, CAST(N'2021-08-26T00:00:00.000' AS DateTime), 1, CAST(N'2021-08-27T00:00:00.000' AS DateTime), CAST(N'2021-08-29T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (316, 4254, CAST(N'2021-08-27T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 30, CAST(N'2021-08-27T00:00:00.000' AS DateTime), 3, CAST(N'2021-08-28T00:00:00.000' AS DateTime), CAST(N'2021-08-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (317, 4256, CAST(N'2021-08-27T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 32, CAST(N'2021-08-27T00:00:00.000' AS DateTime), 2, CAST(N'2021-08-28T00:00:00.000' AS DateTime), CAST(N'2021-08-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (318, 4683, CAST(N'2021-08-30T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 11, CAST(N'2021-08-30T00:00:00.000' AS DateTime), 3, CAST(N'2021-08-31T00:00:00.000' AS DateTime), CAST(N'2021-09-02T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (319, 4457, CAST(N'2021-08-30T00:00:00.000' AS DateTime), N'Nghệ An', N'', 9, CAST(N'2021-08-30T00:00:00.000' AS DateTime), 2, CAST(N'2021-08-31T00:00:00.000' AS DateTime), CAST(N'2021-09-02T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (320, 4573, CAST(N'2021-08-31T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 29, CAST(N'2021-08-31T00:00:00.000' AS DateTime), 1, CAST(N'2021-09-01T00:00:00.000' AS DateTime), CAST(N'2021-09-03T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (321, 4245, CAST(N'2021-09-01T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 21, CAST(N'2021-09-01T00:00:00.000' AS DateTime), 3, CAST(N'2021-09-02T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (322, 4452, CAST(N'2021-09-01T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 4, CAST(N'2021-09-01T00:00:00.000' AS DateTime), 3, CAST(N'2021-09-02T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (324, 4561, CAST(N'2021-09-01T00:00:00.000' AS DateTime), N'Thừa Thiên Huế ', N'', 17, CAST(N'2021-09-01T00:00:00.000' AS DateTime), 1, CAST(N'2021-09-02T00:00:00.000' AS DateTime), CAST(N'2021-09-04T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (326, 4450, CAST(N'2021-09-02T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 2, CAST(N'2021-09-02T00:00:00.000' AS DateTime), 1, CAST(N'2021-09-03T00:00:00.000' AS DateTime), CAST(N'2021-09-05T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (328, 4543, CAST(N'2021-09-03T00:00:00.000' AS DateTime), N'Nghệ An', N'', 31, CAST(N'2021-09-03T00:00:00.000' AS DateTime), 1, CAST(N'2021-09-04T00:00:00.000' AS DateTime), CAST(N'2021-09-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (331, 4610, CAST(N'2021-09-05T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 2, CAST(N'2021-09-05T00:00:00.000' AS DateTime), 2, CAST(N'2021-09-06T00:00:00.000' AS DateTime), CAST(N'2021-09-08T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (332, 4349, CAST(N'2021-09-05T00:00:00.000' AS DateTime), N'Bắc Ninh', N'', 29, CAST(N'2021-09-05T00:00:00.000' AS DateTime), 2, CAST(N'2021-09-06T00:00:00.000' AS DateTime), CAST(N'2021-09-08T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (333, 4380, CAST(N'2021-09-05T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 28, CAST(N'2021-09-05T00:00:00.000' AS DateTime), 3, CAST(N'2021-09-06T00:00:00.000' AS DateTime), CAST(N'2021-09-08T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (334, 4596, CAST(N'2021-09-06T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 20, CAST(N'2021-09-06T00:00:00.000' AS DateTime), 3, CAST(N'2021-09-07T00:00:00.000' AS DateTime), CAST(N'2021-09-09T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (335, 4394, CAST(N'2021-09-07T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 10, CAST(N'2021-09-07T00:00:00.000' AS DateTime), 2, CAST(N'2021-09-08T00:00:00.000' AS DateTime), CAST(N'2021-09-10T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (336, 4521, CAST(N'2021-09-08T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 9, CAST(N'2021-09-08T00:00:00.000' AS DateTime), 3, CAST(N'2021-09-09T00:00:00.000' AS DateTime), CAST(N'2021-09-11T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (338, 4238, CAST(N'2021-09-12T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 14, CAST(N'2021-09-12T00:00:00.000' AS DateTime), 2, CAST(N'2021-09-13T00:00:00.000' AS DateTime), CAST(N'2021-09-15T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (339, 4452, CAST(N'2021-09-13T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 4, CAST(N'2021-09-13T00:00:00.000' AS DateTime), 3, CAST(N'2021-09-14T00:00:00.000' AS DateTime), CAST(N'2021-09-16T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (340, 4497, CAST(N'2021-09-16T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 17, CAST(N'2021-09-16T00:00:00.000' AS DateTime), 3, CAST(N'2021-09-17T00:00:00.000' AS DateTime), CAST(N'2021-09-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (341, 4463, CAST(N'2021-09-16T00:00:00.000' AS DateTime), N'Thái Bình', N'', 15, CAST(N'2021-09-16T00:00:00.000' AS DateTime), 2, CAST(N'2021-09-17T00:00:00.000' AS DateTime), CAST(N'2021-09-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (342, 4476, CAST(N'2021-09-18T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 28, CAST(N'2021-09-18T00:00:00.000' AS DateTime), 3, CAST(N'2021-09-19T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (343, 4635, CAST(N'2021-09-18T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 27, CAST(N'2021-09-18T00:00:00.000' AS DateTime), 3, CAST(N'2021-09-19T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (344, 4220, CAST(N'2021-09-18T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 28, CAST(N'2021-09-18T00:00:00.000' AS DateTime), 2, CAST(N'2021-09-19T00:00:00.000' AS DateTime), CAST(N'2021-09-21T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (346, 4207, CAST(N'2021-09-20T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 15, CAST(N'2021-09-20T00:00:00.000' AS DateTime), 1, CAST(N'2021-09-21T00:00:00.000' AS DateTime), CAST(N'2021-09-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (347, 4281, CAST(N'2021-09-21T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 25, CAST(N'2021-09-21T00:00:00.000' AS DateTime), 3, CAST(N'2021-09-22T00:00:00.000' AS DateTime), CAST(N'2021-09-24T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (349, 4625, CAST(N'2021-09-22T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 17, CAST(N'2021-09-22T00:00:00.000' AS DateTime), 2, CAST(N'2021-09-23T00:00:00.000' AS DateTime), CAST(N'2021-09-25T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (350, 4663, CAST(N'2021-09-22T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 23, CAST(N'2021-09-22T00:00:00.000' AS DateTime), 1, CAST(N'2021-09-23T00:00:00.000' AS DateTime), CAST(N'2021-09-25T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (351, 4201, CAST(N'2021-09-23T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 9, CAST(N'2021-09-23T00:00:00.000' AS DateTime), 1, CAST(N'2021-09-24T00:00:00.000' AS DateTime), CAST(N'2021-09-26T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (352, 4510, CAST(N'2021-09-23T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 30, CAST(N'2021-09-23T00:00:00.000' AS DateTime), 1, CAST(N'2021-09-24T00:00:00.000' AS DateTime), CAST(N'2021-09-26T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (355, 4240, CAST(N'2021-10-01T00:00:00.000' AS DateTime), N'Nam Định', N'', 16, CAST(N'2021-10-01T00:00:00.000' AS DateTime), 1, CAST(N'2021-10-02T00:00:00.000' AS DateTime), CAST(N'2021-10-04T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (356, 4331, CAST(N'2021-10-01T00:00:00.000' AS DateTime), N'Quảng Ngãi', N'', 11, CAST(N'2021-10-01T00:00:00.000' AS DateTime), 2, CAST(N'2021-10-02T00:00:00.000' AS DateTime), CAST(N'2021-10-04T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (358, 4315, CAST(N'2021-10-01T00:00:00.000' AS DateTime), N'Nghệ An ', N'', 27, CAST(N'2021-10-01T00:00:00.000' AS DateTime), 1, CAST(N'2021-10-02T00:00:00.000' AS DateTime), CAST(N'2021-10-04T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (359, 4352, CAST(N'2021-10-02T00:00:00.000' AS DateTime), N'Nghệ An', N'', 32, CAST(N'2021-10-02T00:00:00.000' AS DateTime), 2, CAST(N'2021-10-03T00:00:00.000' AS DateTime), CAST(N'2021-10-05T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (360, 4337, CAST(N'2021-10-03T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 17, CAST(N'2021-10-03T00:00:00.000' AS DateTime), 2, CAST(N'2021-10-04T00:00:00.000' AS DateTime), CAST(N'2021-10-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (361, 4443, CAST(N'2021-10-03T00:00:00.000' AS DateTime), N'Nghệ An', N'', 27, CAST(N'2021-10-03T00:00:00.000' AS DateTime), 3, CAST(N'2021-10-04T00:00:00.000' AS DateTime), CAST(N'2021-10-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (362, 4561, CAST(N'2021-10-05T00:00:00.000' AS DateTime), N'Thừa Thiên Huế ', N'', 17, CAST(N'2021-10-05T00:00:00.000' AS DateTime), 1, CAST(N'2021-10-06T00:00:00.000' AS DateTime), CAST(N'2021-10-08T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (363, 4422, CAST(N'2021-10-05T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 6, CAST(N'2021-10-05T00:00:00.000' AS DateTime), 3, CAST(N'2021-10-06T00:00:00.000' AS DateTime), CAST(N'2021-10-08T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (364, 4348, CAST(N'2021-10-06T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 28, CAST(N'2021-10-06T00:00:00.000' AS DateTime), 1, CAST(N'2021-10-07T00:00:00.000' AS DateTime), CAST(N'2021-10-09T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (365, 4216, CAST(N'2021-10-06T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 24, CAST(N'2021-10-06T00:00:00.000' AS DateTime), 1, CAST(N'2021-10-07T00:00:00.000' AS DateTime), CAST(N'2021-10-09T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (366, 4303, CAST(N'2021-10-09T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 15, CAST(N'2021-10-09T00:00:00.000' AS DateTime), 1, CAST(N'2021-10-10T00:00:00.000' AS DateTime), CAST(N'2021-10-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (367, 4456, CAST(N'2021-10-12T00:00:00.000' AS DateTime), N'Khánh Hòa', N'', 8, CAST(N'2021-10-12T00:00:00.000' AS DateTime), 1, CAST(N'2021-10-13T00:00:00.000' AS DateTime), CAST(N'2021-10-15T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (368, 4650, CAST(N'2021-10-12T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 10, CAST(N'2021-10-12T00:00:00.000' AS DateTime), 3, CAST(N'2021-10-13T00:00:00.000' AS DateTime), CAST(N'2021-10-15T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (369, 4261, CAST(N'2021-10-14T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 5, CAST(N'2021-10-14T00:00:00.000' AS DateTime), 1, CAST(N'2021-10-15T00:00:00.000' AS DateTime), CAST(N'2021-10-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (371, 4541, CAST(N'2021-10-15T00:00:00.000' AS DateTime), N'Phú Thọ', N'', 29, CAST(N'2021-10-15T00:00:00.000' AS DateTime), 2, CAST(N'2021-10-16T00:00:00.000' AS DateTime), CAST(N'2021-10-18T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (372, 4656, CAST(N'2021-10-15T00:00:00.000' AS DateTime), N'Nghệ An', N'', 16, CAST(N'2021-10-15T00:00:00.000' AS DateTime), 3, CAST(N'2021-10-16T00:00:00.000' AS DateTime), CAST(N'2021-10-18T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (373, 4655, CAST(N'2021-10-16T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 15, CAST(N'2021-10-16T00:00:00.000' AS DateTime), 2, CAST(N'2021-10-17T00:00:00.000' AS DateTime), CAST(N'2021-10-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (374, 4207, CAST(N'2021-10-16T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 15, CAST(N'2021-10-16T00:00:00.000' AS DateTime), 1, CAST(N'2021-10-17T00:00:00.000' AS DateTime), CAST(N'2021-10-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (375, 4276, CAST(N'2021-10-16T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 20, CAST(N'2021-10-16T00:00:00.000' AS DateTime), 1, CAST(N'2021-10-17T00:00:00.000' AS DateTime), CAST(N'2021-10-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (376, 4645, CAST(N'2021-10-16T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 5, CAST(N'2021-10-16T00:00:00.000' AS DateTime), 1, CAST(N'2021-10-17T00:00:00.000' AS DateTime), CAST(N'2021-10-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (377, 4319, CAST(N'2021-10-16T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 31, CAST(N'2021-10-16T00:00:00.000' AS DateTime), 2, CAST(N'2021-10-17T00:00:00.000' AS DateTime), CAST(N'2021-10-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (378, 4641, CAST(N'2021-10-17T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 1, CAST(N'2021-10-17T00:00:00.000' AS DateTime), 3, CAST(N'2021-10-18T00:00:00.000' AS DateTime), CAST(N'2021-10-20T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (379, 4643, CAST(N'2021-10-18T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 3, CAST(N'2021-10-18T00:00:00.000' AS DateTime), 2, CAST(N'2021-10-19T00:00:00.000' AS DateTime), CAST(N'2021-10-21T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (380, 4397, CAST(N'2021-10-18T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 13, CAST(N'2021-10-18T00:00:00.000' AS DateTime), 2, CAST(N'2021-10-19T00:00:00.000' AS DateTime), CAST(N'2021-10-21T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (381, 4236, CAST(N'2021-10-18T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 12, CAST(N'2021-10-18T00:00:00.000' AS DateTime), 3, CAST(N'2021-10-19T00:00:00.000' AS DateTime), CAST(N'2021-10-21T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (383, 4568, CAST(N'2021-10-21T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 24, CAST(N'2021-10-21T00:00:00.000' AS DateTime), 2, CAST(N'2021-10-22T00:00:00.000' AS DateTime), CAST(N'2021-10-24T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (384, 4265, CAST(N'2021-10-21T00:00:00.000' AS DateTime), N'Đà Nẵng', N'', 9, CAST(N'2021-10-21T00:00:00.000' AS DateTime), 2, CAST(N'2021-10-22T00:00:00.000' AS DateTime), CAST(N'2021-10-24T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (385, 4458, CAST(N'2021-10-22T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 10, CAST(N'2021-10-22T00:00:00.000' AS DateTime), 3, CAST(N'2021-10-23T00:00:00.000' AS DateTime), CAST(N'2021-10-25T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (386, 4473, CAST(N'2021-10-23T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 25, CAST(N'2021-10-23T00:00:00.000' AS DateTime), 3, CAST(N'2021-10-24T00:00:00.000' AS DateTime), CAST(N'2021-10-26T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (387, 4380, CAST(N'2021-10-23T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 28, CAST(N'2021-10-23T00:00:00.000' AS DateTime), 3, CAST(N'2021-10-24T00:00:00.000' AS DateTime), CAST(N'2021-10-26T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (388, 4422, CAST(N'2021-10-25T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 6, CAST(N'2021-10-25T00:00:00.000' AS DateTime), 3, CAST(N'2021-10-26T00:00:00.000' AS DateTime), CAST(N'2021-10-28T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (390, 4694, CAST(N'2021-10-27T00:00:00.000' AS DateTime), N'Phú Yên', N'', 22, CAST(N'2021-10-27T00:00:00.000' AS DateTime), 2, CAST(N'2021-10-28T00:00:00.000' AS DateTime), CAST(N'2021-10-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (391, 4323, CAST(N'2021-10-28T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 3, CAST(N'2021-10-28T00:00:00.000' AS DateTime), 3, CAST(N'2021-10-29T00:00:00.000' AS DateTime), CAST(N'2021-10-31T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (392, 4605, CAST(N'2021-10-29T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 29, CAST(N'2021-10-29T00:00:00.000' AS DateTime), 3, CAST(N'2021-10-30T00:00:00.000' AS DateTime), CAST(N'2021-11-01T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (393, 4279, CAST(N'2021-10-29T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 23, CAST(N'2021-10-29T00:00:00.000' AS DateTime), 1, CAST(N'2021-10-30T00:00:00.000' AS DateTime), CAST(N'2021-11-01T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (395, 4490, CAST(N'2021-10-30T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 10, CAST(N'2021-10-30T00:00:00.000' AS DateTime), 2, CAST(N'2021-10-31T00:00:00.000' AS DateTime), CAST(N'2021-11-02T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (398, 4250, CAST(N'2021-11-03T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 26, CAST(N'2021-11-03T00:00:00.000' AS DateTime), 2, CAST(N'2021-11-04T00:00:00.000' AS DateTime), CAST(N'2021-11-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (399, 4365, CAST(N'2021-11-05T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 13, CAST(N'2021-11-05T00:00:00.000' AS DateTime), 3, CAST(N'2021-11-06T00:00:00.000' AS DateTime), CAST(N'2021-11-08T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (400, 4333, CAST(N'2021-11-05T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 13, CAST(N'2021-11-05T00:00:00.000' AS DateTime), 1, CAST(N'2021-11-06T00:00:00.000' AS DateTime), CAST(N'2021-11-08T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (401, 4455, CAST(N'2021-11-06T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 7, CAST(N'2021-11-06T00:00:00.000' AS DateTime), 3, CAST(N'2021-11-07T00:00:00.000' AS DateTime), CAST(N'2021-11-09T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (402, 4210, CAST(N'2021-11-07T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 18, CAST(N'2021-11-07T00:00:00.000' AS DateTime), 1, CAST(N'2021-11-08T00:00:00.000' AS DateTime), CAST(N'2021-11-10T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (403, 4238, CAST(N'2021-11-08T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 14, CAST(N'2021-11-08T00:00:00.000' AS DateTime), 2, CAST(N'2021-11-09T00:00:00.000' AS DateTime), CAST(N'2021-11-11T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (404, 4396, CAST(N'2021-11-08T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 12, CAST(N'2021-11-08T00:00:00.000' AS DateTime), 1, CAST(N'2021-11-09T00:00:00.000' AS DateTime), CAST(N'2021-11-11T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (405, 4564, CAST(N'2021-11-09T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 20, CAST(N'2021-11-09T00:00:00.000' AS DateTime), 1, CAST(N'2021-11-10T00:00:00.000' AS DateTime), CAST(N'2021-11-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (406, 4653, CAST(N'2021-11-09T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 13, CAST(N'2021-11-09T00:00:00.000' AS DateTime), 3, CAST(N'2021-11-10T00:00:00.000' AS DateTime), CAST(N'2021-11-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (407, 4561, CAST(N'2021-11-09T00:00:00.000' AS DateTime), N'Thừa Thiên Huế ', N'', 17, CAST(N'2021-11-09T00:00:00.000' AS DateTime), 1, CAST(N'2021-11-10T00:00:00.000' AS DateTime), CAST(N'2021-11-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (408, 4628, CAST(N'2021-11-09T00:00:00.000' AS DateTime), N'Quảng Nam', N'', 20, CAST(N'2021-11-09T00:00:00.000' AS DateTime), 2, CAST(N'2021-11-10T00:00:00.000' AS DateTime), CAST(N'2021-11-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (409, 4591, CAST(N'2021-11-10T00:00:00.000' AS DateTime), N'Thanh Hóa', N'', 15, CAST(N'2021-11-10T00:00:00.000' AS DateTime), 1, CAST(N'2021-11-11T00:00:00.000' AS DateTime), CAST(N'2021-11-13T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (410, 4495, CAST(N'2021-11-10T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 15, CAST(N'2021-11-10T00:00:00.000' AS DateTime), 1, CAST(N'2021-11-11T00:00:00.000' AS DateTime), CAST(N'2021-11-13T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (411, 4383, CAST(N'2021-11-11T00:00:00.000' AS DateTime), N'Nghệ An', N'', 31, CAST(N'2021-11-11T00:00:00.000' AS DateTime), 3, CAST(N'2021-11-12T00:00:00.000' AS DateTime), CAST(N'2021-11-14T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (412, 4494, CAST(N'2021-11-11T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 14, CAST(N'2021-11-11T00:00:00.000' AS DateTime), 3, CAST(N'2021-11-12T00:00:00.000' AS DateTime), CAST(N'2021-11-14T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (413, 4347, CAST(N'2021-11-12T00:00:00.000' AS DateTime), N'Quảng Ngãi', N'', 27, CAST(N'2021-11-12T00:00:00.000' AS DateTime), 3, CAST(N'2021-11-13T00:00:00.000' AS DateTime), CAST(N'2021-11-15T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (414, 4356, CAST(N'2021-11-12T00:00:00.000' AS DateTime), N'Nghệ An', N'', 4, CAST(N'2021-11-12T00:00:00.000' AS DateTime), 3, CAST(N'2021-11-13T00:00:00.000' AS DateTime), CAST(N'2021-11-15T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (415, 4260, CAST(N'2021-11-14T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 4, CAST(N'2021-11-14T00:00:00.000' AS DateTime), 3, CAST(N'2021-11-15T00:00:00.000' AS DateTime), CAST(N'2021-11-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (416, 4631, CAST(N'2021-11-15T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 23, CAST(N'2021-11-15T00:00:00.000' AS DateTime), 2, CAST(N'2021-11-16T00:00:00.000' AS DateTime), CAST(N'2021-11-18T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (417, 4358, CAST(N'2021-11-15T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 6, CAST(N'2021-11-15T00:00:00.000' AS DateTime), 2, CAST(N'2021-11-16T00:00:00.000' AS DateTime), CAST(N'2021-11-18T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (418, 4645, CAST(N'2021-11-15T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 5, CAST(N'2021-11-15T00:00:00.000' AS DateTime), 1, CAST(N'2021-11-16T00:00:00.000' AS DateTime), CAST(N'2021-11-18T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (419, 4325, CAST(N'2021-11-16T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 5, CAST(N'2021-11-16T00:00:00.000' AS DateTime), 2, CAST(N'2021-11-17T00:00:00.000' AS DateTime), CAST(N'2021-11-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (420, 4659, CAST(N'2021-11-18T00:00:00.000' AS DateTime), N'Đà Nẵng', N'', 19, CAST(N'2021-11-18T00:00:00.000' AS DateTime), 3, CAST(N'2021-11-19T00:00:00.000' AS DateTime), CAST(N'2021-11-21T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (422, 4488, CAST(N'2021-11-19T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 8, CAST(N'2021-11-19T00:00:00.000' AS DateTime), 3, CAST(N'2021-11-20T00:00:00.000' AS DateTime), CAST(N'2021-11-22T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (423, 4561, CAST(N'2021-11-20T00:00:00.000' AS DateTime), N'Thừa Thiên Huế ', N'', 17, CAST(N'2021-11-20T00:00:00.000' AS DateTime), 1, CAST(N'2021-11-21T00:00:00.000' AS DateTime), CAST(N'2021-11-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (424, 4283, CAST(N'2021-11-20T00:00:00.000' AS DateTime), N'Đà Nẵng', N'', 27, CAST(N'2021-11-20T00:00:00.000' AS DateTime), 2, CAST(N'2021-11-21T00:00:00.000' AS DateTime), CAST(N'2021-11-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (425, 4322, CAST(N'2021-11-22T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 2, CAST(N'2021-11-22T00:00:00.000' AS DateTime), 2, CAST(N'2021-11-23T00:00:00.000' AS DateTime), CAST(N'2021-11-25T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (426, 4507, CAST(N'2021-11-23T00:00:00.000' AS DateTime), N'Quảng Nam', N'', 27, CAST(N'2021-11-23T00:00:00.000' AS DateTime), 1, CAST(N'2021-11-24T00:00:00.000' AS DateTime), CAST(N'2021-11-26T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (427, 4475, CAST(N'2021-11-24T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 27, CAST(N'2021-11-24T00:00:00.000' AS DateTime), 2, CAST(N'2021-11-25T00:00:00.000' AS DateTime), CAST(N'2021-11-27T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (428, 4596, CAST(N'2021-11-24T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 20, CAST(N'2021-11-24T00:00:00.000' AS DateTime), 3, CAST(N'2021-11-25T00:00:00.000' AS DateTime), CAST(N'2021-11-27T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (429, 4272, CAST(N'2021-11-24T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 16, CAST(N'2021-11-24T00:00:00.000' AS DateTime), 3, CAST(N'2021-11-25T00:00:00.000' AS DateTime), CAST(N'2021-11-27T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (430, 4455, CAST(N'2021-11-24T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 7, CAST(N'2021-11-24T00:00:00.000' AS DateTime), 3, CAST(N'2021-11-25T00:00:00.000' AS DateTime), CAST(N'2021-11-27T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (432, 4316, CAST(N'2021-11-28T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 28, CAST(N'2021-11-28T00:00:00.000' AS DateTime), 2, CAST(N'2021-11-29T00:00:00.000' AS DateTime), CAST(N'2021-12-01T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (433, 4278, CAST(N'2021-11-29T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 22, CAST(N'2021-11-29T00:00:00.000' AS DateTime), 3, CAST(N'2021-11-30T00:00:00.000' AS DateTime), CAST(N'2021-12-02T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (435, 4488, CAST(N'2021-12-01T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 8, CAST(N'2021-12-01T00:00:00.000' AS DateTime), 3, CAST(N'2021-12-02T00:00:00.000' AS DateTime), CAST(N'2021-12-04T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (436, 4533, CAST(N'2021-12-01T00:00:00.000' AS DateTime), N'Nghệ An', N'', 21, CAST(N'2021-12-01T00:00:00.000' AS DateTime), 3, CAST(N'2021-12-02T00:00:00.000' AS DateTime), CAST(N'2021-12-04T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (437, 4567, CAST(N'2021-12-04T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 23, CAST(N'2021-12-04T00:00:00.000' AS DateTime), 1, CAST(N'2021-12-05T00:00:00.000' AS DateTime), CAST(N'2021-12-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (439, 4300, CAST(N'2021-12-04T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 12, CAST(N'2021-12-04T00:00:00.000' AS DateTime), 1, CAST(N'2021-12-05T00:00:00.000' AS DateTime), CAST(N'2021-12-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (440, 4249, CAST(N'2021-12-05T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 25, CAST(N'2021-12-05T00:00:00.000' AS DateTime), 1, CAST(N'2021-12-06T00:00:00.000' AS DateTime), CAST(N'2021-12-08T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (441, 4626, CAST(N'2021-12-05T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 18, CAST(N'2021-12-05T00:00:00.000' AS DateTime), 3, CAST(N'2021-12-06T00:00:00.000' AS DateTime), CAST(N'2021-12-08T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (442, 4329, CAST(N'2021-12-05T00:00:00.000' AS DateTime), N'Quảng Nam', N'', 9, CAST(N'2021-12-05T00:00:00.000' AS DateTime), 3, CAST(N'2021-12-06T00:00:00.000' AS DateTime), CAST(N'2021-12-08T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (443, 4375, CAST(N'2021-12-06T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 23, CAST(N'2021-12-06T00:00:00.000' AS DateTime), 1, CAST(N'2021-12-07T00:00:00.000' AS DateTime), CAST(N'2021-12-09T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (444, 4205, CAST(N'2021-12-06T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 13, CAST(N'2021-12-06T00:00:00.000' AS DateTime), 2, CAST(N'2021-12-07T00:00:00.000' AS DateTime), CAST(N'2021-12-09T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (446, 4224, CAST(N'2021-12-09T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 32, CAST(N'2021-12-09T00:00:00.000' AS DateTime), 3, CAST(N'2021-12-10T00:00:00.000' AS DateTime), CAST(N'2021-12-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (447, 4358, CAST(N'2021-12-10T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 6, CAST(N'2021-12-10T00:00:00.000' AS DateTime), 2, CAST(N'2021-12-11T00:00:00.000' AS DateTime), CAST(N'2021-12-13T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (448, 4374, CAST(N'2021-12-10T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 22, CAST(N'2021-12-10T00:00:00.000' AS DateTime), 3, CAST(N'2021-12-11T00:00:00.000' AS DateTime), CAST(N'2021-12-13T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (449, 4207, CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 15, CAST(N'2021-12-12T00:00:00.000' AS DateTime), 1, CAST(N'2021-12-13T00:00:00.000' AS DateTime), CAST(N'2021-12-15T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (450, 4559, CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 15, CAST(N'2021-12-12T00:00:00.000' AS DateTime), 2, CAST(N'2021-12-13T00:00:00.000' AS DateTime), CAST(N'2021-12-15T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (451, 4547, CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'Nam Định', N'', 3, CAST(N'2021-12-12T00:00:00.000' AS DateTime), 2, CAST(N'2021-12-13T00:00:00.000' AS DateTime), CAST(N'2021-12-15T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (452, 4256, CAST(N'2021-12-12T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 32, CAST(N'2021-12-12T00:00:00.000' AS DateTime), 2, CAST(N'2021-12-13T00:00:00.000' AS DateTime), CAST(N'2021-12-15T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (454, 4514, CAST(N'2021-12-14T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 2, CAST(N'2021-12-14T00:00:00.000' AS DateTime), 2, CAST(N'2021-12-15T00:00:00.000' AS DateTime), CAST(N'2021-12-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (455, 4684, CAST(N'2021-12-16T00:00:00.000' AS DateTime), N'Quảng Nam', N'', 12, CAST(N'2021-12-16T00:00:00.000' AS DateTime), 1, CAST(N'2021-12-17T00:00:00.000' AS DateTime), CAST(N'2021-12-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (456, 4672, CAST(N'2021-12-16T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 32, CAST(N'2021-12-16T00:00:00.000' AS DateTime), 1, CAST(N'2021-12-17T00:00:00.000' AS DateTime), CAST(N'2021-12-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (457, 4613, CAST(N'2021-12-18T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 5, CAST(N'2021-12-18T00:00:00.000' AS DateTime), 2, CAST(N'2021-12-19T00:00:00.000' AS DateTime), CAST(N'2021-12-21T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (458, 4495, CAST(N'2021-12-18T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 15, CAST(N'2021-12-18T00:00:00.000' AS DateTime), 1, CAST(N'2021-12-19T00:00:00.000' AS DateTime), CAST(N'2021-12-21T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (459, 4386, CAST(N'2021-12-19T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 2, CAST(N'2021-12-19T00:00:00.000' AS DateTime), 3, CAST(N'2021-12-20T00:00:00.000' AS DateTime), CAST(N'2021-12-22T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (460, 4525, CAST(N'2021-12-20T00:00:00.000' AS DateTime), N'Quảng Nam', N'', 13, CAST(N'2021-12-20T00:00:00.000' AS DateTime), 1, CAST(N'2021-12-21T00:00:00.000' AS DateTime), CAST(N'2021-12-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (461, 4561, CAST(N'2021-12-21T00:00:00.000' AS DateTime), N'Thừa Thiên Huế ', N'', 17, CAST(N'2021-12-21T00:00:00.000' AS DateTime), 1, CAST(N'2021-12-22T00:00:00.000' AS DateTime), CAST(N'2021-12-24T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (462, 4221, CAST(N'2021-12-24T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 29, CAST(N'2021-12-24T00:00:00.000' AS DateTime), 3, CAST(N'2021-12-25T00:00:00.000' AS DateTime), CAST(N'2021-12-27T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (463, 4403, CAST(N'2021-12-25T00:00:00.000' AS DateTime), N'Nghệ An', N'', 19, CAST(N'2021-12-25T00:00:00.000' AS DateTime), 2, CAST(N'2021-12-26T00:00:00.000' AS DateTime), CAST(N'2021-12-28T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (464, 4389, CAST(N'2021-12-26T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 5, CAST(N'2021-12-26T00:00:00.000' AS DateTime), 3, CAST(N'2021-12-27T00:00:00.000' AS DateTime), CAST(N'2021-12-29T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (465, 4690, CAST(N'2021-12-27T00:00:00.000' AS DateTime), N'Quảng Nam', N'', 18, CAST(N'2021-12-27T00:00:00.000' AS DateTime), 1, CAST(N'2021-12-28T00:00:00.000' AS DateTime), CAST(N'2021-12-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (466, 4528, CAST(N'2021-12-27T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 16, CAST(N'2021-12-27T00:00:00.000' AS DateTime), 1, CAST(N'2021-12-28T00:00:00.000' AS DateTime), CAST(N'2021-12-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (467, 4340, CAST(N'2021-12-27T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 20, CAST(N'2021-12-27T00:00:00.000' AS DateTime), 2, CAST(N'2021-12-28T00:00:00.000' AS DateTime), CAST(N'2021-12-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (468, 4666, CAST(N'2021-12-27T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 26, CAST(N'2021-12-27T00:00:00.000' AS DateTime), 1, CAST(N'2021-12-28T00:00:00.000' AS DateTime), CAST(N'2021-12-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (470, 4554, CAST(N'2021-12-30T00:00:00.000' AS DateTime), N'Nghệ An', N'', 10, CAST(N'2021-12-30T00:00:00.000' AS DateTime), 3, CAST(N'2021-12-31T00:00:00.000' AS DateTime), CAST(N'2022-01-02T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (471, 4613, CAST(N'2022-01-02T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 5, CAST(N'2022-01-02T00:00:00.000' AS DateTime), 2, CAST(N'2022-01-03T00:00:00.000' AS DateTime), CAST(N'2022-01-05T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (472, 4333, CAST(N'2022-01-04T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 13, CAST(N'2022-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2022-01-05T00:00:00.000' AS DateTime), CAST(N'2022-01-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (473, 4255, CAST(N'2022-01-06T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 31, CAST(N'2022-01-06T00:00:00.000' AS DateTime), 1, CAST(N'2022-01-07T00:00:00.000' AS DateTime), CAST(N'2022-01-09T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (474, 4596, CAST(N'2022-01-06T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 20, CAST(N'2022-01-06T00:00:00.000' AS DateTime), 3, CAST(N'2022-01-07T00:00:00.000' AS DateTime), CAST(N'2022-01-09T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (475, 4208, CAST(N'2022-01-06T00:00:00.000' AS DateTime), N'Nghệ An', N'', 16, CAST(N'2022-01-06T00:00:00.000' AS DateTime), 2, CAST(N'2022-01-07T00:00:00.000' AS DateTime), CAST(N'2022-01-09T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (476, 4530, CAST(N'2022-01-07T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 18, CAST(N'2022-01-07T00:00:00.000' AS DateTime), 3, CAST(N'2022-01-08T00:00:00.000' AS DateTime), CAST(N'2022-01-10T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (477, 4376, CAST(N'2022-01-08T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 24, CAST(N'2022-01-08T00:00:00.000' AS DateTime), 2, CAST(N'2022-01-09T00:00:00.000' AS DateTime), CAST(N'2022-01-11T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (479, 4272, CAST(N'2022-01-11T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 16, CAST(N'2022-01-11T00:00:00.000' AS DateTime), 3, CAST(N'2022-01-12T00:00:00.000' AS DateTime), CAST(N'2022-01-14T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (480, 4478, CAST(N'2022-01-11T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 30, CAST(N'2022-01-11T00:00:00.000' AS DateTime), 2, CAST(N'2022-01-12T00:00:00.000' AS DateTime), CAST(N'2022-01-14T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (481, 4468, CAST(N'2022-01-12T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 20, CAST(N'2022-01-12T00:00:00.000' AS DateTime), 1, CAST(N'2022-01-13T00:00:00.000' AS DateTime), CAST(N'2022-01-15T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (482, 4342, CAST(N'2022-01-13T00:00:00.000' AS DateTime), N'Nghệ An', N'', 22, CAST(N'2022-01-13T00:00:00.000' AS DateTime), 1, CAST(N'2022-01-14T00:00:00.000' AS DateTime), CAST(N'2022-01-16T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (483, 4409, CAST(N'2022-01-14T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 25, CAST(N'2022-01-14T00:00:00.000' AS DateTime), 2, CAST(N'2022-01-15T00:00:00.000' AS DateTime), CAST(N'2022-01-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (484, 4422, CAST(N'2022-01-15T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 6, CAST(N'2022-01-15T00:00:00.000' AS DateTime), 3, CAST(N'2022-01-16T00:00:00.000' AS DateTime), CAST(N'2022-01-18T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (486, 4268, CAST(N'2022-01-18T00:00:00.000' AS DateTime), N'Nghệ An', N'', 12, CAST(N'2022-01-18T00:00:00.000' AS DateTime), 2, CAST(N'2022-01-19T00:00:00.000' AS DateTime), CAST(N'2022-01-21T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (487, 4676, CAST(N'2022-01-19T00:00:00.000' AS DateTime), N'Kon Tum', N'', 4, CAST(N'2022-01-19T00:00:00.000' AS DateTime), 2, CAST(N'2022-01-20T00:00:00.000' AS DateTime), CAST(N'2022-01-22T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (489, 4371, CAST(N'2022-01-21T00:00:00.000' AS DateTime), N'Hà Tĩnh ', N'', 19, CAST(N'2022-01-21T00:00:00.000' AS DateTime), 3, CAST(N'2022-01-22T00:00:00.000' AS DateTime), CAST(N'2022-01-24T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (490, 4702, CAST(N'2022-01-22T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 30, CAST(N'2022-01-22T00:00:00.000' AS DateTime), 1, CAST(N'2022-01-23T00:00:00.000' AS DateTime), CAST(N'2022-01-25T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (491, 4249, CAST(N'2022-01-22T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 25, CAST(N'2022-01-22T00:00:00.000' AS DateTime), 1, CAST(N'2022-01-23T00:00:00.000' AS DateTime), CAST(N'2022-01-25T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (492, 4668, CAST(N'2022-01-22T00:00:00.000' AS DateTime), N'Nghệ An', N'', 28, CAST(N'2022-01-22T00:00:00.000' AS DateTime), 3, CAST(N'2022-01-23T00:00:00.000' AS DateTime), CAST(N'2022-01-25T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (494, 4371, CAST(N'2022-01-23T00:00:00.000' AS DateTime), N'Hà Tĩnh ', N'', 19, CAST(N'2022-01-23T00:00:00.000' AS DateTime), 3, CAST(N'2022-01-24T00:00:00.000' AS DateTime), CAST(N'2022-01-26T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (496, 4429, CAST(N'2022-01-24T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 13, CAST(N'2022-01-24T00:00:00.000' AS DateTime), 1, CAST(N'2022-01-25T00:00:00.000' AS DateTime), CAST(N'2022-01-27T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (497, 4686, CAST(N'2022-01-25T00:00:00.000' AS DateTime), N'Đà Nẵng', N'', 14, CAST(N'2022-01-25T00:00:00.000' AS DateTime), 3, CAST(N'2022-01-26T00:00:00.000' AS DateTime), CAST(N'2022-01-28T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (498, 4694, CAST(N'2022-01-26T00:00:00.000' AS DateTime), N'Phú Yên', N'', 22, CAST(N'2022-01-26T00:00:00.000' AS DateTime), 2, CAST(N'2022-01-27T00:00:00.000' AS DateTime), CAST(N'2022-01-29T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (500, 4597, CAST(N'2022-01-26T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 21, CAST(N'2022-01-26T00:00:00.000' AS DateTime), 1, CAST(N'2022-01-27T00:00:00.000' AS DateTime), CAST(N'2022-01-29T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (501, 4431, CAST(N'2022-01-26T00:00:00.000' AS DateTime), N'Quảng Nam', N'', 15, CAST(N'2022-01-26T00:00:00.000' AS DateTime), 3, CAST(N'2022-01-27T00:00:00.000' AS DateTime), CAST(N'2022-01-29T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (502, 4352, CAST(N'2022-01-27T00:00:00.000' AS DateTime), N'Nghệ An', N'', 32, CAST(N'2022-01-27T00:00:00.000' AS DateTime), 2, CAST(N'2022-01-28T00:00:00.000' AS DateTime), CAST(N'2022-01-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (503, 4568, CAST(N'2022-01-27T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 24, CAST(N'2022-01-27T00:00:00.000' AS DateTime), 2, CAST(N'2022-01-28T00:00:00.000' AS DateTime), CAST(N'2022-01-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (504, 4541, CAST(N'2022-01-29T00:00:00.000' AS DateTime), N'Phú Thọ', N'', 29, CAST(N'2022-01-29T00:00:00.000' AS DateTime), 2, CAST(N'2022-01-30T00:00:00.000' AS DateTime), CAST(N'2022-02-01T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (505, 4227, CAST(N'2022-01-30T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 3, CAST(N'2022-01-30T00:00:00.000' AS DateTime), 3, CAST(N'2022-01-31T00:00:00.000' AS DateTime), CAST(N'2022-02-02T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (506, 4331, CAST(N'2022-01-30T00:00:00.000' AS DateTime), N'Quảng Ngãi', N'', 11, CAST(N'2022-01-30T00:00:00.000' AS DateTime), 2, CAST(N'2022-01-31T00:00:00.000' AS DateTime), CAST(N'2022-02-02T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (507, 4360, CAST(N'2022-01-31T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 8, CAST(N'2022-01-31T00:00:00.000' AS DateTime), 1, CAST(N'2022-02-01T00:00:00.000' AS DateTime), CAST(N'2022-02-03T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (508, 4279, CAST(N'2022-01-31T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 23, CAST(N'2022-01-31T00:00:00.000' AS DateTime), 1, CAST(N'2022-02-01T00:00:00.000' AS DateTime), CAST(N'2022-02-03T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (509, 4590, CAST(N'2022-01-31T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 14, CAST(N'2022-01-31T00:00:00.000' AS DateTime), 3, CAST(N'2022-02-01T00:00:00.000' AS DateTime), CAST(N'2022-02-03T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (510, 4528, CAST(N'2022-02-01T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 16, CAST(N'2022-02-01T00:00:00.000' AS DateTime), 1, CAST(N'2022-02-02T00:00:00.000' AS DateTime), CAST(N'2022-02-04T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (511, 4521, CAST(N'2022-02-01T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 9, CAST(N'2022-02-01T00:00:00.000' AS DateTime), 3, CAST(N'2022-02-02T00:00:00.000' AS DateTime), CAST(N'2022-02-04T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (512, 4466, CAST(N'2022-02-02T00:00:00.000' AS DateTime), N'Nghệ An', N'', 18, CAST(N'2022-02-02T00:00:00.000' AS DateTime), 2, CAST(N'2022-02-03T00:00:00.000' AS DateTime), CAST(N'2022-02-05T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (514, 4594, CAST(N'2022-02-03T00:00:00.000' AS DateTime), N'Nghệ An', N'', 18, CAST(N'2022-02-03T00:00:00.000' AS DateTime), 1, CAST(N'2022-02-04T00:00:00.000' AS DateTime), CAST(N'2022-02-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (515, 4464, CAST(N'2022-02-04T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 16, CAST(N'2022-02-04T00:00:00.000' AS DateTime), 3, CAST(N'2022-02-05T00:00:00.000' AS DateTime), CAST(N'2022-02-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (516, 4652, CAST(N'2022-02-04T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 12, CAST(N'2022-02-04T00:00:00.000' AS DateTime), 2, CAST(N'2022-02-05T00:00:00.000' AS DateTime), CAST(N'2022-02-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (517, 4496, CAST(N'2022-02-07T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 16, CAST(N'2022-02-07T00:00:00.000' AS DateTime), 2, CAST(N'2022-02-08T00:00:00.000' AS DateTime), CAST(N'2022-02-10T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (518, 4463, CAST(N'2022-02-08T00:00:00.000' AS DateTime), N'Thái Bình', N'', 15, CAST(N'2022-02-08T00:00:00.000' AS DateTime), 2, CAST(N'2022-02-09T00:00:00.000' AS DateTime), CAST(N'2022-02-11T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (519, 4256, CAST(N'2022-02-09T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 32, CAST(N'2022-02-09T00:00:00.000' AS DateTime), 2, CAST(N'2022-02-10T00:00:00.000' AS DateTime), CAST(N'2022-02-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (520, 4463, CAST(N'2022-02-11T00:00:00.000' AS DateTime), N'Thái Bình', N'', 15, CAST(N'2022-02-11T00:00:00.000' AS DateTime), 2, CAST(N'2022-02-12T00:00:00.000' AS DateTime), CAST(N'2022-02-14T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (521, 4530, CAST(N'2022-02-13T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 18, CAST(N'2022-02-13T00:00:00.000' AS DateTime), 3, CAST(N'2022-02-14T00:00:00.000' AS DateTime), CAST(N'2022-02-16T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (523, 4561, CAST(N'2022-02-16T00:00:00.000' AS DateTime), N'Thừa Thiên Huế ', N'', 17, CAST(N'2022-02-16T00:00:00.000' AS DateTime), 1, CAST(N'2022-02-17T00:00:00.000' AS DateTime), CAST(N'2022-02-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (524, 4493, CAST(N'2022-02-18T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 13, CAST(N'2022-02-18T00:00:00.000' AS DateTime), 2, CAST(N'2022-02-19T00:00:00.000' AS DateTime), CAST(N'2022-02-21T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (525, 4463, CAST(N'2022-02-20T00:00:00.000' AS DateTime), N'Thái Bình', N'', 15, CAST(N'2022-02-20T00:00:00.000' AS DateTime), 2, CAST(N'2022-02-21T00:00:00.000' AS DateTime), CAST(N'2022-02-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (526, 4564, CAST(N'2022-02-20T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 20, CAST(N'2022-02-20T00:00:00.000' AS DateTime), 1, CAST(N'2022-02-21T00:00:00.000' AS DateTime), CAST(N'2022-02-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (527, 4676, CAST(N'2022-02-20T00:00:00.000' AS DateTime), N'Kon Tum', N'', 4, CAST(N'2022-02-20T00:00:00.000' AS DateTime), 2, CAST(N'2022-02-21T00:00:00.000' AS DateTime), CAST(N'2022-02-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (528, 4434, CAST(N'2022-02-21T00:00:00.000' AS DateTime), N'Quảng Ngãi', N'', 18, CAST(N'2022-02-21T00:00:00.000' AS DateTime), 3, CAST(N'2022-02-22T00:00:00.000' AS DateTime), CAST(N'2022-02-24T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (529, 4602, CAST(N'2022-02-23T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 26, CAST(N'2022-02-23T00:00:00.000' AS DateTime), 3, CAST(N'2022-02-24T00:00:00.000' AS DateTime), CAST(N'2022-02-26T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (530, 4493, CAST(N'2022-02-24T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 13, CAST(N'2022-02-24T00:00:00.000' AS DateTime), 2, CAST(N'2022-02-25T00:00:00.000' AS DateTime), CAST(N'2022-02-27T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (531, 4644, CAST(N'2022-02-26T00:00:00.000' AS DateTime), N'Hà Nội', N'', 4, CAST(N'2022-02-26T00:00:00.000' AS DateTime), 3, CAST(N'2022-02-27T00:00:00.000' AS DateTime), CAST(N'2022-03-01T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (532, 4637, CAST(N'2022-02-27T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 29, CAST(N'2022-02-27T00:00:00.000' AS DateTime), 2, CAST(N'2022-02-28T00:00:00.000' AS DateTime), CAST(N'2022-03-02T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (533, 4568, CAST(N'2022-02-28T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 24, CAST(N'2022-02-28T00:00:00.000' AS DateTime), 2, CAST(N'2022-03-01T00:00:00.000' AS DateTime), CAST(N'2022-03-03T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (534, 4541, CAST(N'2022-02-28T00:00:00.000' AS DateTime), N'Phú Thọ', N'', 29, CAST(N'2022-02-28T00:00:00.000' AS DateTime), 2, CAST(N'2022-03-01T00:00:00.000' AS DateTime), CAST(N'2022-03-03T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (535, 4227, CAST(N'2022-02-28T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 3, CAST(N'2022-02-28T00:00:00.000' AS DateTime), 3, CAST(N'2022-03-01T00:00:00.000' AS DateTime), CAST(N'2022-03-03T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (536, 4463, CAST(N'2022-03-01T00:00:00.000' AS DateTime), N'Thái Bình', N'', 15, CAST(N'2022-03-01T00:00:00.000' AS DateTime), 2, CAST(N'2022-03-02T00:00:00.000' AS DateTime), CAST(N'2022-03-04T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (537, 4306, CAST(N'2022-03-03T00:00:00.000' AS DateTime), N'Hà Nội', N'', 18, CAST(N'2022-03-03T00:00:00.000' AS DateTime), 1, CAST(N'2022-03-04T00:00:00.000' AS DateTime), CAST(N'2022-03-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (538, 4235, CAST(N'2022-03-03T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 11, CAST(N'2022-03-03T00:00:00.000' AS DateTime), 2, CAST(N'2022-03-04T00:00:00.000' AS DateTime), CAST(N'2022-03-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (539, 4467, CAST(N'2022-03-03T00:00:00.000' AS DateTime), N'Ninh Bình', N'', 19, CAST(N'2022-03-03T00:00:00.000' AS DateTime), 3, CAST(N'2022-03-04T00:00:00.000' AS DateTime), CAST(N'2022-03-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (540, 4495, CAST(N'2022-03-04T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 15, CAST(N'2022-03-04T00:00:00.000' AS DateTime), 1, CAST(N'2022-03-05T00:00:00.000' AS DateTime), CAST(N'2022-03-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (541, 4212, CAST(N'2022-03-06T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 20, CAST(N'2022-03-06T00:00:00.000' AS DateTime), 3, CAST(N'2022-03-07T00:00:00.000' AS DateTime), CAST(N'2022-03-09T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (542, 4344, CAST(N'2022-03-07T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 24, CAST(N'2022-03-07T00:00:00.000' AS DateTime), 3, CAST(N'2022-03-08T00:00:00.000' AS DateTime), CAST(N'2022-03-10T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (543, 4481, CAST(N'2022-03-08T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 1, CAST(N'2022-03-08T00:00:00.000' AS DateTime), 2, CAST(N'2022-03-09T00:00:00.000' AS DateTime), CAST(N'2022-03-11T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (545, 4272, CAST(N'2022-03-11T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 16, CAST(N'2022-03-11T00:00:00.000' AS DateTime), 3, CAST(N'2022-03-12T00:00:00.000' AS DateTime), CAST(N'2022-03-14T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (546, 4465, CAST(N'2022-03-12T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 17, CAST(N'2022-03-12T00:00:00.000' AS DateTime), 1, CAST(N'2022-03-13T00:00:00.000' AS DateTime), CAST(N'2022-03-15T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (547, 4360, CAST(N'2022-03-12T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 8, CAST(N'2022-03-12T00:00:00.000' AS DateTime), 1, CAST(N'2022-03-13T00:00:00.000' AS DateTime), CAST(N'2022-03-15T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (549, 4625, CAST(N'2022-03-15T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 17, CAST(N'2022-03-15T00:00:00.000' AS DateTime), 2, CAST(N'2022-03-16T00:00:00.000' AS DateTime), CAST(N'2022-03-18T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (550, 4279, CAST(N'2022-03-15T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 23, CAST(N'2022-03-15T00:00:00.000' AS DateTime), 1, CAST(N'2022-03-16T00:00:00.000' AS DateTime), CAST(N'2022-03-18T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (551, 4644, CAST(N'2022-03-16T00:00:00.000' AS DateTime), N'Hà Nội', N'', 4, CAST(N'2022-03-16T00:00:00.000' AS DateTime), 3, CAST(N'2022-03-17T00:00:00.000' AS DateTime), CAST(N'2022-03-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (552, 4433, CAST(N'2022-03-17T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 17, CAST(N'2022-03-17T00:00:00.000' AS DateTime), 2, CAST(N'2022-03-18T00:00:00.000' AS DateTime), CAST(N'2022-03-20T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (553, 4685, CAST(N'2022-03-17T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 13, CAST(N'2022-03-17T00:00:00.000' AS DateTime), 2, CAST(N'2022-03-18T00:00:00.000' AS DateTime), CAST(N'2022-03-20T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (554, 4606, CAST(N'2022-03-19T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 30, CAST(N'2022-03-19T00:00:00.000' AS DateTime), 1, CAST(N'2022-03-20T00:00:00.000' AS DateTime), CAST(N'2022-03-22T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (555, 4207, CAST(N'2022-03-22T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 15, CAST(N'2022-03-22T00:00:00.000' AS DateTime), 1, CAST(N'2022-03-23T00:00:00.000' AS DateTime), CAST(N'2022-03-25T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (556, 4331, CAST(N'2022-03-24T00:00:00.000' AS DateTime), N'Quảng Ngãi', N'', 11, CAST(N'2022-03-24T00:00:00.000' AS DateTime), 2, CAST(N'2022-03-25T00:00:00.000' AS DateTime), CAST(N'2022-03-27T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (557, 4569, CAST(N'2022-03-25T00:00:00.000' AS DateTime), N'Tuyên Quang', N'', 25, CAST(N'2022-03-25T00:00:00.000' AS DateTime), 3, CAST(N'2022-03-26T00:00:00.000' AS DateTime), CAST(N'2022-03-28T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (558, 4566, CAST(N'2022-03-25T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 22, CAST(N'2022-03-25T00:00:00.000' AS DateTime), 3, CAST(N'2022-03-26T00:00:00.000' AS DateTime), CAST(N'2022-03-28T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (559, 4511, CAST(N'2022-03-25T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 31, CAST(N'2022-03-25T00:00:00.000' AS DateTime), 2, CAST(N'2022-03-26T00:00:00.000' AS DateTime), CAST(N'2022-03-28T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (560, 4311, CAST(N'2022-03-27T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 23, CAST(N'2022-03-27T00:00:00.000' AS DateTime), 3, CAST(N'2022-03-28T00:00:00.000' AS DateTime), CAST(N'2022-03-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (562, 4305, CAST(N'2022-03-30T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 17, CAST(N'2022-03-30T00:00:00.000' AS DateTime), 3, CAST(N'2022-03-31T00:00:00.000' AS DateTime), CAST(N'2022-04-02T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (563, 4348, CAST(N'2022-04-01T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 28, CAST(N'2022-04-01T00:00:00.000' AS DateTime), 1, CAST(N'2022-04-02T00:00:00.000' AS DateTime), CAST(N'2022-04-04T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (564, 4383, CAST(N'2022-04-01T00:00:00.000' AS DateTime), N'Nghệ An', N'', 31, CAST(N'2022-04-01T00:00:00.000' AS DateTime), 3, CAST(N'2022-04-02T00:00:00.000' AS DateTime), CAST(N'2022-04-04T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (567, 4463, CAST(N'2022-04-03T00:00:00.000' AS DateTime), N'Thái Bình', N'', 15, CAST(N'2022-04-03T00:00:00.000' AS DateTime), 2, CAST(N'2022-04-04T00:00:00.000' AS DateTime), CAST(N'2022-04-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (568, 4325, CAST(N'2022-04-04T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 5, CAST(N'2022-04-04T00:00:00.000' AS DateTime), 2, CAST(N'2022-04-05T00:00:00.000' AS DateTime), CAST(N'2022-04-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (569, 4382, CAST(N'2022-04-04T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 30, CAST(N'2022-04-04T00:00:00.000' AS DateTime), 2, CAST(N'2022-04-05T00:00:00.000' AS DateTime), CAST(N'2022-04-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (570, 4347, CAST(N'2022-04-05T00:00:00.000' AS DateTime), N'Quảng Ngãi', N'', 27, CAST(N'2022-04-05T00:00:00.000' AS DateTime), 3, CAST(N'2022-04-06T00:00:00.000' AS DateTime), CAST(N'2022-04-08T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (571, 4334, CAST(N'2022-04-05T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 14, CAST(N'2022-04-05T00:00:00.000' AS DateTime), 2, CAST(N'2022-04-06T00:00:00.000' AS DateTime), CAST(N'2022-04-08T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (572, 4468, CAST(N'2022-04-06T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 20, CAST(N'2022-04-06T00:00:00.000' AS DateTime), 1, CAST(N'2022-04-07T00:00:00.000' AS DateTime), CAST(N'2022-04-09T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (573, 4238, CAST(N'2022-04-06T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 14, CAST(N'2022-04-06T00:00:00.000' AS DateTime), 2, CAST(N'2022-04-07T00:00:00.000' AS DateTime), CAST(N'2022-04-09T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (575, 4296, CAST(N'2022-04-06T00:00:00.000' AS DateTime), N'Kon Tum ', N'', 8, CAST(N'2022-04-06T00:00:00.000' AS DateTime), 3, CAST(N'2022-04-07T00:00:00.000' AS DateTime), CAST(N'2022-04-09T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (576, 4506, CAST(N'2022-04-07T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 26, CAST(N'2022-04-07T00:00:00.000' AS DateTime), 3, CAST(N'2022-04-08T00:00:00.000' AS DateTime), CAST(N'2022-04-10T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (577, 4492, CAST(N'2022-04-08T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 12, CAST(N'2022-04-08T00:00:00.000' AS DateTime), 1, CAST(N'2022-04-09T00:00:00.000' AS DateTime), CAST(N'2022-04-11T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (579, 4652, CAST(N'2022-04-10T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 12, CAST(N'2022-04-10T00:00:00.000' AS DateTime), 2, CAST(N'2022-04-11T00:00:00.000' AS DateTime), CAST(N'2022-04-13T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (580, 4573, CAST(N'2022-04-12T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 29, CAST(N'2022-04-12T00:00:00.000' AS DateTime), 1, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-15T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (581, 4317, CAST(N'2022-04-12T00:00:00.000' AS DateTime), N'Nghệ An', N'', 29, CAST(N'2022-04-12T00:00:00.000' AS DateTime), 3, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-15T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (583, 4669, CAST(N'2022-04-13T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 29, CAST(N'2022-04-13T00:00:00.000' AS DateTime), 1, CAST(N'2022-04-14T00:00:00.000' AS DateTime), CAST(N'2022-04-16T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (584, 4407, CAST(N'2022-04-14T00:00:00.000' AS DateTime), N'Thái Nguyên', N'', 23, CAST(N'2022-04-14T00:00:00.000' AS DateTime), 3, CAST(N'2022-04-15T00:00:00.000' AS DateTime), CAST(N'2022-04-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (585, 4591, CAST(N'2022-04-14T00:00:00.000' AS DateTime), N'Thanh Hóa', N'', 15, CAST(N'2022-04-14T00:00:00.000' AS DateTime), 1, CAST(N'2022-04-15T00:00:00.000' AS DateTime), CAST(N'2022-04-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (586, 4581, CAST(N'2022-04-16T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 5, CAST(N'2022-04-16T00:00:00.000' AS DateTime), 3, CAST(N'2022-04-17T00:00:00.000' AS DateTime), CAST(N'2022-04-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (587, 4288, CAST(N'2022-04-17T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 32, CAST(N'2022-04-17T00:00:00.000' AS DateTime), 1, CAST(N'2022-04-18T00:00:00.000' AS DateTime), CAST(N'2022-04-20T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (588, 4564, CAST(N'2022-04-18T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 20, CAST(N'2022-04-18T00:00:00.000' AS DateTime), 1, CAST(N'2022-04-19T00:00:00.000' AS DateTime), CAST(N'2022-04-21T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (589, 4661, CAST(N'2022-04-19T00:00:00.000' AS DateTime), N'Thanh Hóa', N'', 21, CAST(N'2022-04-19T00:00:00.000' AS DateTime), 2, CAST(N'2022-04-20T00:00:00.000' AS DateTime), CAST(N'2022-04-22T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (590, 4279, CAST(N'2022-04-19T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 23, CAST(N'2022-04-19T00:00:00.000' AS DateTime), 1, CAST(N'2022-04-20T00:00:00.000' AS DateTime), CAST(N'2022-04-22T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (591, 4610, CAST(N'2022-04-20T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 2, CAST(N'2022-04-20T00:00:00.000' AS DateTime), 2, CAST(N'2022-04-21T00:00:00.000' AS DateTime), CAST(N'2022-04-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (592, 4343, CAST(N'2022-04-21T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 23, CAST(N'2022-04-21T00:00:00.000' AS DateTime), 2, CAST(N'2022-04-22T00:00:00.000' AS DateTime), CAST(N'2022-04-24T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (593, 4552, CAST(N'2022-04-24T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 8, CAST(N'2022-04-24T00:00:00.000' AS DateTime), 1, CAST(N'2022-04-25T00:00:00.000' AS DateTime), CAST(N'2022-04-27T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (594, 4396, CAST(N'2022-04-25T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 12, CAST(N'2022-04-25T00:00:00.000' AS DateTime), 1, CAST(N'2022-04-26T00:00:00.000' AS DateTime), CAST(N'2022-04-28T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (595, 4525, CAST(N'2022-04-25T00:00:00.000' AS DateTime), N'Quảng Nam', N'', 13, CAST(N'2022-04-25T00:00:00.000' AS DateTime), 1, CAST(N'2022-04-26T00:00:00.000' AS DateTime), CAST(N'2022-04-28T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (596, 4487, CAST(N'2022-04-27T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 7, CAST(N'2022-04-27T00:00:00.000' AS DateTime), 2, CAST(N'2022-04-28T00:00:00.000' AS DateTime), CAST(N'2022-04-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (597, 4252, CAST(N'2022-04-27T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 28, CAST(N'2022-04-27T00:00:00.000' AS DateTime), 1, CAST(N'2022-04-28T00:00:00.000' AS DateTime), CAST(N'2022-04-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (598, 4645, CAST(N'2022-04-29T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 5, CAST(N'2022-04-29T00:00:00.000' AS DateTime), 1, CAST(N'2022-04-30T00:00:00.000' AS DateTime), CAST(N'2022-05-02T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (599, 4484, CAST(N'2022-04-30T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 4, CAST(N'2022-04-30T00:00:00.000' AS DateTime), 2, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-03T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (601, 4599, CAST(N'2022-05-02T00:00:00.000' AS DateTime), N'Gia Lai', N'', 23, CAST(N'2022-05-02T00:00:00.000' AS DateTime), 3, CAST(N'2022-05-03T00:00:00.000' AS DateTime), CAST(N'2022-05-05T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (602, 4510, CAST(N'2022-05-02T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 30, CAST(N'2022-05-02T00:00:00.000' AS DateTime), 1, CAST(N'2022-05-03T00:00:00.000' AS DateTime), CAST(N'2022-05-05T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (603, 4563, CAST(N'2022-05-03T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 19, CAST(N'2022-05-03T00:00:00.000' AS DateTime), 3, CAST(N'2022-05-04T00:00:00.000' AS DateTime), CAST(N'2022-05-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (604, 4239, CAST(N'2022-05-03T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 15, CAST(N'2022-05-03T00:00:00.000' AS DateTime), 3, CAST(N'2022-05-04T00:00:00.000' AS DateTime), CAST(N'2022-05-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (605, 4647, CAST(N'2022-05-03T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 7, CAST(N'2022-05-03T00:00:00.000' AS DateTime), 3, CAST(N'2022-05-04T00:00:00.000' AS DateTime), CAST(N'2022-05-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (606, 4525, CAST(N'2022-05-04T00:00:00.000' AS DateTime), N'Quảng Nam', N'', 13, CAST(N'2022-05-04T00:00:00.000' AS DateTime), 1, CAST(N'2022-05-05T00:00:00.000' AS DateTime), CAST(N'2022-05-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (607, 4368, CAST(N'2022-05-04T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 16, CAST(N'2022-05-04T00:00:00.000' AS DateTime), 3, CAST(N'2022-05-05T00:00:00.000' AS DateTime), CAST(N'2022-05-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (608, 4283, CAST(N'2022-05-04T00:00:00.000' AS DateTime), N'Đà Nẵng', N'', 27, CAST(N'2022-05-04T00:00:00.000' AS DateTime), 2, CAST(N'2022-05-05T00:00:00.000' AS DateTime), CAST(N'2022-05-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (609, 4328, CAST(N'2022-05-05T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 8, CAST(N'2022-05-05T00:00:00.000' AS DateTime), 2, CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2022-05-08T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (610, 4601, CAST(N'2022-05-06T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 25, CAST(N'2022-05-06T00:00:00.000' AS DateTime), 2, CAST(N'2022-05-07T00:00:00.000' AS DateTime), CAST(N'2022-05-09T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (611, 4625, CAST(N'2022-05-07T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 17, CAST(N'2022-05-07T00:00:00.000' AS DateTime), 2, CAST(N'2022-05-08T00:00:00.000' AS DateTime), CAST(N'2022-05-10T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (612, 4322, CAST(N'2022-05-07T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 2, CAST(N'2022-05-07T00:00:00.000' AS DateTime), 2, CAST(N'2022-05-08T00:00:00.000' AS DateTime), CAST(N'2022-05-10T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (613, 4334, CAST(N'2022-05-08T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 14, CAST(N'2022-05-08T00:00:00.000' AS DateTime), 2, CAST(N'2022-05-09T00:00:00.000' AS DateTime), CAST(N'2022-05-11T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (614, 4605, CAST(N'2022-05-08T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 29, CAST(N'2022-05-08T00:00:00.000' AS DateTime), 3, CAST(N'2022-05-09T00:00:00.000' AS DateTime), CAST(N'2022-05-11T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (615, 4504, CAST(N'2022-05-09T00:00:00.000' AS DateTime), N'Nghệ An', N'', 24, CAST(N'2022-05-09T00:00:00.000' AS DateTime), 1, CAST(N'2022-05-10T00:00:00.000' AS DateTime), CAST(N'2022-05-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (616, 4494, CAST(N'2022-05-09T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 14, CAST(N'2022-05-09T00:00:00.000' AS DateTime), 3, CAST(N'2022-05-10T00:00:00.000' AS DateTime), CAST(N'2022-05-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (617, 4376, CAST(N'2022-05-10T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 24, CAST(N'2022-05-10T00:00:00.000' AS DateTime), 2, CAST(N'2022-05-11T00:00:00.000' AS DateTime), CAST(N'2022-05-13T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (618, 4259, CAST(N'2022-05-13T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 3, CAST(N'2022-05-13T00:00:00.000' AS DateTime), 2, CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(N'2022-05-16T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (619, 4533, CAST(N'2022-05-13T00:00:00.000' AS DateTime), N'Nghệ An', N'', 21, CAST(N'2022-05-13T00:00:00.000' AS DateTime), 3, CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(N'2022-05-16T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (620, 4303, CAST(N'2022-05-15T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 15, CAST(N'2022-05-15T00:00:00.000' AS DateTime), 1, CAST(N'2022-05-16T00:00:00.000' AS DateTime), CAST(N'2022-05-18T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (621, 4493, CAST(N'2022-05-15T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 13, CAST(N'2022-05-15T00:00:00.000' AS DateTime), 2, CAST(N'2022-05-16T00:00:00.000' AS DateTime), CAST(N'2022-05-18T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (622, 4319, CAST(N'2022-05-16T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 31, CAST(N'2022-05-16T00:00:00.000' AS DateTime), 2, CAST(N'2022-05-17T00:00:00.000' AS DateTime), CAST(N'2022-05-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (623, 4689, CAST(N'2022-05-16T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 17, CAST(N'2022-05-16T00:00:00.000' AS DateTime), 3, CAST(N'2022-05-17T00:00:00.000' AS DateTime), CAST(N'2022-05-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (624, 4282, CAST(N'2022-05-17T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 26, CAST(N'2022-05-17T00:00:00.000' AS DateTime), 1, CAST(N'2022-05-18T00:00:00.000' AS DateTime), CAST(N'2022-05-20T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (625, 4352, CAST(N'2022-05-17T00:00:00.000' AS DateTime), N'Nghệ An', N'', 32, CAST(N'2022-05-17T00:00:00.000' AS DateTime), 2, CAST(N'2022-05-18T00:00:00.000' AS DateTime), CAST(N'2022-05-20T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (626, 4480, CAST(N'2022-05-19T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 32, CAST(N'2022-05-19T00:00:00.000' AS DateTime), 1, CAST(N'2022-05-20T00:00:00.000' AS DateTime), CAST(N'2022-05-22T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (627, 4625, CAST(N'2022-05-19T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 17, CAST(N'2022-05-19T00:00:00.000' AS DateTime), 2, CAST(N'2022-05-20T00:00:00.000' AS DateTime), CAST(N'2022-05-22T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (628, 4509, CAST(N'2022-05-20T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 29, CAST(N'2022-05-20T00:00:00.000' AS DateTime), 3, CAST(N'2022-05-21T00:00:00.000' AS DateTime), CAST(N'2022-05-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (629, 4309, CAST(N'2022-05-20T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 21, CAST(N'2022-05-20T00:00:00.000' AS DateTime), 1, CAST(N'2022-05-21T00:00:00.000' AS DateTime), CAST(N'2022-05-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (630, 4515, CAST(N'2022-05-22T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 3, CAST(N'2022-05-22T00:00:00.000' AS DateTime), 3, CAST(N'2022-05-23T00:00:00.000' AS DateTime), CAST(N'2022-05-25T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (631, 4641, CAST(N'2022-05-22T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 1, CAST(N'2022-05-22T00:00:00.000' AS DateTime), 3, CAST(N'2022-05-23T00:00:00.000' AS DateTime), CAST(N'2022-05-25T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (633, 4606, CAST(N'2022-05-23T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 30, CAST(N'2022-05-23T00:00:00.000' AS DateTime), 1, CAST(N'2022-05-24T00:00:00.000' AS DateTime), CAST(N'2022-05-26T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (634, 4466, CAST(N'2022-05-23T00:00:00.000' AS DateTime), N'Nghệ An', N'', 18, CAST(N'2022-05-23T00:00:00.000' AS DateTime), 2, CAST(N'2022-05-24T00:00:00.000' AS DateTime), CAST(N'2022-05-26T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (635, 4396, CAST(N'2022-05-24T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 12, CAST(N'2022-05-24T00:00:00.000' AS DateTime), 1, CAST(N'2022-05-25T00:00:00.000' AS DateTime), CAST(N'2022-05-27T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (636, 4325, CAST(N'2022-05-24T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 5, CAST(N'2022-05-24T00:00:00.000' AS DateTime), 2, CAST(N'2022-05-25T00:00:00.000' AS DateTime), CAST(N'2022-05-27T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (637, 4211, CAST(N'2022-05-29T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 19, CAST(N'2022-05-29T00:00:00.000' AS DateTime), 2, CAST(N'2022-05-30T00:00:00.000' AS DateTime), CAST(N'2022-06-01T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (638, 4389, CAST(N'2022-05-29T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 5, CAST(N'2022-05-29T00:00:00.000' AS DateTime), 3, CAST(N'2022-05-30T00:00:00.000' AS DateTime), CAST(N'2022-06-01T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (640, 4683, CAST(N'2022-05-30T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 11, CAST(N'2022-05-30T00:00:00.000' AS DateTime), 3, CAST(N'2022-05-31T00:00:00.000' AS DateTime), CAST(N'2022-06-02T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (641, 4290, CAST(N'2022-06-03T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 2, CAST(N'2022-06-03T00:00:00.000' AS DateTime), 3, CAST(N'2022-06-04T00:00:00.000' AS DateTime), CAST(N'2022-06-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (642, 4688, CAST(N'2022-06-03T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 16, CAST(N'2022-06-03T00:00:00.000' AS DateTime), 2, CAST(N'2022-06-04T00:00:00.000' AS DateTime), CAST(N'2022-06-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (643, 4549, CAST(N'2022-06-03T00:00:00.000' AS DateTime), N'Quảng Nam', N'', 5, CAST(N'2022-06-03T00:00:00.000' AS DateTime), 1, CAST(N'2022-06-04T00:00:00.000' AS DateTime), CAST(N'2022-06-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (644, 4606, CAST(N'2022-06-06T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 30, CAST(N'2022-06-06T00:00:00.000' AS DateTime), 1, CAST(N'2022-06-07T00:00:00.000' AS DateTime), CAST(N'2022-06-09T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (645, 4390, CAST(N'2022-06-06T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 6, CAST(N'2022-06-06T00:00:00.000' AS DateTime), 1, CAST(N'2022-06-07T00:00:00.000' AS DateTime), CAST(N'2022-06-09T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (646, 4635, CAST(N'2022-06-07T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 27, CAST(N'2022-06-07T00:00:00.000' AS DateTime), 3, CAST(N'2022-06-08T00:00:00.000' AS DateTime), CAST(N'2022-06-10T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (647, 4421, CAST(N'2022-06-08T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 5, CAST(N'2022-06-08T00:00:00.000' AS DateTime), 2, CAST(N'2022-06-09T00:00:00.000' AS DateTime), CAST(N'2022-06-11T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (648, 4573, CAST(N'2022-06-08T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 29, CAST(N'2022-06-08T00:00:00.000' AS DateTime), 1, CAST(N'2022-06-09T00:00:00.000' AS DateTime), CAST(N'2022-06-11T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (649, 4455, CAST(N'2022-06-08T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 7, CAST(N'2022-06-08T00:00:00.000' AS DateTime), 3, CAST(N'2022-06-09T00:00:00.000' AS DateTime), CAST(N'2022-06-11T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (650, 4334, CAST(N'2022-06-08T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 14, CAST(N'2022-06-08T00:00:00.000' AS DateTime), 2, CAST(N'2022-06-09T00:00:00.000' AS DateTime), CAST(N'2022-06-11T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (652, 4644, CAST(N'2022-06-09T00:00:00.000' AS DateTime), N'Hà Nội', N'', 4, CAST(N'2022-06-09T00:00:00.000' AS DateTime), 3, CAST(N'2022-06-10T00:00:00.000' AS DateTime), CAST(N'2022-06-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (653, 4683, CAST(N'2022-06-10T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 11, CAST(N'2022-06-10T00:00:00.000' AS DateTime), 3, CAST(N'2022-06-11T00:00:00.000' AS DateTime), CAST(N'2022-06-13T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (654, 4383, CAST(N'2022-06-10T00:00:00.000' AS DateTime), N'Nghệ An', N'', 31, CAST(N'2022-06-10T00:00:00.000' AS DateTime), 3, CAST(N'2022-06-11T00:00:00.000' AS DateTime), CAST(N'2022-06-13T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (655, 4628, CAST(N'2022-06-10T00:00:00.000' AS DateTime), N'Quảng Nam', N'', 20, CAST(N'2022-06-10T00:00:00.000' AS DateTime), 2, CAST(N'2022-06-11T00:00:00.000' AS DateTime), CAST(N'2022-06-13T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (656, 4261, CAST(N'2022-06-10T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 5, CAST(N'2022-06-10T00:00:00.000' AS DateTime), 1, CAST(N'2022-06-11T00:00:00.000' AS DateTime), CAST(N'2022-06-13T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (657, 4666, CAST(N'2022-06-11T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 26, CAST(N'2022-06-11T00:00:00.000' AS DateTime), 1, CAST(N'2022-06-12T00:00:00.000' AS DateTime), CAST(N'2022-06-14T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (658, 4402, CAST(N'2022-06-14T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 18, CAST(N'2022-06-14T00:00:00.000' AS DateTime), 1, CAST(N'2022-06-15T00:00:00.000' AS DateTime), CAST(N'2022-06-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (659, 4311, CAST(N'2022-06-14T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 23, CAST(N'2022-06-14T00:00:00.000' AS DateTime), 3, CAST(N'2022-06-15T00:00:00.000' AS DateTime), CAST(N'2022-06-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (660, 4566, CAST(N'2022-06-15T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 22, CAST(N'2022-06-15T00:00:00.000' AS DateTime), 3, CAST(N'2022-06-16T00:00:00.000' AS DateTime), CAST(N'2022-06-18T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (661, 4566, CAST(N'2022-06-16T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 22, CAST(N'2022-06-16T00:00:00.000' AS DateTime), 3, CAST(N'2022-06-17T00:00:00.000' AS DateTime), CAST(N'2022-06-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (662, 4702, CAST(N'2022-06-17T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 30, CAST(N'2022-06-17T00:00:00.000' AS DateTime), 1, CAST(N'2022-06-18T00:00:00.000' AS DateTime), CAST(N'2022-06-20T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (663, 4315, CAST(N'2022-06-17T00:00:00.000' AS DateTime), N'Nghệ An ', N'', 27, CAST(N'2022-06-17T00:00:00.000' AS DateTime), 1, CAST(N'2022-06-18T00:00:00.000' AS DateTime), CAST(N'2022-06-20T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (664, 4446, CAST(N'2022-06-18T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 30, CAST(N'2022-06-18T00:00:00.000' AS DateTime), 3, CAST(N'2022-06-19T00:00:00.000' AS DateTime), CAST(N'2022-06-21T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (665, 4303, CAST(N'2022-06-19T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 15, CAST(N'2022-06-19T00:00:00.000' AS DateTime), 1, CAST(N'2022-06-20T00:00:00.000' AS DateTime), CAST(N'2022-06-22T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (666, 4352, CAST(N'2022-06-21T00:00:00.000' AS DateTime), N'Nghệ An', N'', 32, CAST(N'2022-06-21T00:00:00.000' AS DateTime), 2, CAST(N'2022-06-22T00:00:00.000' AS DateTime), CAST(N'2022-06-24T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (667, 4330, CAST(N'2022-06-22T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 10, CAST(N'2022-06-22T00:00:00.000' AS DateTime), 1, CAST(N'2022-06-23T00:00:00.000' AS DateTime), CAST(N'2022-06-25T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (668, 4278, CAST(N'2022-06-22T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 22, CAST(N'2022-06-22T00:00:00.000' AS DateTime), 3, CAST(N'2022-06-23T00:00:00.000' AS DateTime), CAST(N'2022-06-25T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (670, 4331, CAST(N'2022-06-23T00:00:00.000' AS DateTime), N'Quảng Ngãi', N'', 11, CAST(N'2022-06-23T00:00:00.000' AS DateTime), 2, CAST(N'2022-06-24T00:00:00.000' AS DateTime), CAST(N'2022-06-26T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (671, 4361, CAST(N'2022-06-23T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 9, CAST(N'2022-06-23T00:00:00.000' AS DateTime), 2, CAST(N'2022-06-24T00:00:00.000' AS DateTime), CAST(N'2022-06-26T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (672, 4590, CAST(N'2022-06-25T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 14, CAST(N'2022-06-25T00:00:00.000' AS DateTime), 3, CAST(N'2022-06-26T00:00:00.000' AS DateTime), CAST(N'2022-06-28T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (673, 4487, CAST(N'2022-06-25T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 7, CAST(N'2022-06-25T00:00:00.000' AS DateTime), 2, CAST(N'2022-06-26T00:00:00.000' AS DateTime), CAST(N'2022-06-28T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (674, 4421, CAST(N'2022-06-26T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 5, CAST(N'2022-06-26T00:00:00.000' AS DateTime), 2, CAST(N'2022-06-27T00:00:00.000' AS DateTime), CAST(N'2022-06-29T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (675, 4304, CAST(N'2022-06-26T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 16, CAST(N'2022-06-26T00:00:00.000' AS DateTime), 2, CAST(N'2022-06-27T00:00:00.000' AS DateTime), CAST(N'2022-06-29T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (676, 4643, CAST(N'2022-06-27T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 3, CAST(N'2022-06-27T00:00:00.000' AS DateTime), 2, CAST(N'2022-06-28T00:00:00.000' AS DateTime), CAST(N'2022-06-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (677, 4381, CAST(N'2022-06-29T00:00:00.000' AS DateTime), N'Quảng Nam', N'', 29, CAST(N'2022-06-29T00:00:00.000' AS DateTime), 1, CAST(N'2022-06-30T00:00:00.000' AS DateTime), CAST(N'2022-07-02T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (678, 4216, CAST(N'2022-07-01T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 24, CAST(N'2022-07-01T00:00:00.000' AS DateTime), 1, CAST(N'2022-07-02T00:00:00.000' AS DateTime), CAST(N'2022-07-04T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (679, 4637, CAST(N'2022-07-02T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 29, CAST(N'2022-07-02T00:00:00.000' AS DateTime), 2, CAST(N'2022-07-03T00:00:00.000' AS DateTime), CAST(N'2022-07-05T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (680, 4488, CAST(N'2022-07-02T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 8, CAST(N'2022-07-02T00:00:00.000' AS DateTime), 3, CAST(N'2022-07-03T00:00:00.000' AS DateTime), CAST(N'2022-07-05T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (681, 4249, CAST(N'2022-07-03T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 25, CAST(N'2022-07-03T00:00:00.000' AS DateTime), 1, CAST(N'2022-07-04T00:00:00.000' AS DateTime), CAST(N'2022-07-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (682, 4655, CAST(N'2022-07-03T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 15, CAST(N'2022-07-03T00:00:00.000' AS DateTime), 2, CAST(N'2022-07-04T00:00:00.000' AS DateTime), CAST(N'2022-07-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (683, 4235, CAST(N'2022-07-03T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 11, CAST(N'2022-07-03T00:00:00.000' AS DateTime), 2, CAST(N'2022-07-04T00:00:00.000' AS DateTime), CAST(N'2022-07-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (684, 4487, CAST(N'2022-07-04T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 7, CAST(N'2022-07-04T00:00:00.000' AS DateTime), 2, CAST(N'2022-07-05T00:00:00.000' AS DateTime), CAST(N'2022-07-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (686, 4406, CAST(N'2022-07-04T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 22, CAST(N'2022-07-04T00:00:00.000' AS DateTime), 2, CAST(N'2022-07-05T00:00:00.000' AS DateTime), CAST(N'2022-07-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (687, 4433, CAST(N'2022-07-06T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 17, CAST(N'2022-07-06T00:00:00.000' AS DateTime), 2, CAST(N'2022-07-07T00:00:00.000' AS DateTime), CAST(N'2022-07-09T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (688, 4667, CAST(N'2022-07-06T00:00:00.000' AS DateTime), N'Thanh Hóa', N'', 27, CAST(N'2022-07-06T00:00:00.000' AS DateTime), 2, CAST(N'2022-07-07T00:00:00.000' AS DateTime), CAST(N'2022-07-09T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (690, 4542, CAST(N'2022-07-10T00:00:00.000' AS DateTime), N'Nghệ An', N'', 30, CAST(N'2022-07-10T00:00:00.000' AS DateTime), 3, CAST(N'2022-07-11T00:00:00.000' AS DateTime), CAST(N'2022-07-13T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (691, 4296, CAST(N'2022-07-13T00:00:00.000' AS DateTime), N'Kon Tum ', N'', 8, CAST(N'2022-07-13T00:00:00.000' AS DateTime), 3, CAST(N'2022-07-14T00:00:00.000' AS DateTime), CAST(N'2022-07-16T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (692, 4543, CAST(N'2022-07-14T00:00:00.000' AS DateTime), N'Nghệ An', N'', 31, CAST(N'2022-07-14T00:00:00.000' AS DateTime), 1, CAST(N'2022-07-15T00:00:00.000' AS DateTime), CAST(N'2022-07-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (694, 4281, CAST(N'2022-07-14T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 25, CAST(N'2022-07-14T00:00:00.000' AS DateTime), 3, CAST(N'2022-07-15T00:00:00.000' AS DateTime), CAST(N'2022-07-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (695, 4487, CAST(N'2022-07-15T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 7, CAST(N'2022-07-15T00:00:00.000' AS DateTime), 2, CAST(N'2022-07-16T00:00:00.000' AS DateTime), CAST(N'2022-07-18T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (696, 4211, CAST(N'2022-07-16T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 19, CAST(N'2022-07-16T00:00:00.000' AS DateTime), 2, CAST(N'2022-07-17T00:00:00.000' AS DateTime), CAST(N'2022-07-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (698, 4265, CAST(N'2022-07-16T00:00:00.000' AS DateTime), N'Đà Nẵng', N'', 9, CAST(N'2022-07-16T00:00:00.000' AS DateTime), 2, CAST(N'2022-07-17T00:00:00.000' AS DateTime), CAST(N'2022-07-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (699, 4514, CAST(N'2022-07-17T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 2, CAST(N'2022-07-17T00:00:00.000' AS DateTime), 2, CAST(N'2022-07-18T00:00:00.000' AS DateTime), CAST(N'2022-07-20T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (700, 4449, CAST(N'2022-07-17T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 1, CAST(N'2022-07-17T00:00:00.000' AS DateTime), 3, CAST(N'2022-07-18T00:00:00.000' AS DateTime), CAST(N'2022-07-20T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (701, 4628, CAST(N'2022-07-17T00:00:00.000' AS DateTime), N'Quảng Nam', N'', 20, CAST(N'2022-07-17T00:00:00.000' AS DateTime), 2, CAST(N'2022-07-18T00:00:00.000' AS DateTime), CAST(N'2022-07-20T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (702, 4587, CAST(N'2022-07-18T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 11, CAST(N'2022-07-18T00:00:00.000' AS DateTime), 3, CAST(N'2022-07-19T00:00:00.000' AS DateTime), CAST(N'2022-07-21T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (703, 4561, CAST(N'2022-07-20T00:00:00.000' AS DateTime), N'Thừa Thiên Huế ', N'', 17, CAST(N'2022-07-20T00:00:00.000' AS DateTime), 1, CAST(N'2022-07-21T00:00:00.000' AS DateTime), CAST(N'2022-07-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (704, 4397, CAST(N'2022-07-20T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 13, CAST(N'2022-07-20T00:00:00.000' AS DateTime), 2, CAST(N'2022-07-21T00:00:00.000' AS DateTime), CAST(N'2022-07-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (705, 4587, CAST(N'2022-07-20T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 11, CAST(N'2022-07-20T00:00:00.000' AS DateTime), 3, CAST(N'2022-07-21T00:00:00.000' AS DateTime), CAST(N'2022-07-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (706, 4509, CAST(N'2022-07-20T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 29, CAST(N'2022-07-20T00:00:00.000' AS DateTime), 3, CAST(N'2022-07-21T00:00:00.000' AS DateTime), CAST(N'2022-07-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (707, 4263, CAST(N'2022-07-22T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 7, CAST(N'2022-07-22T00:00:00.000' AS DateTime), 3, CAST(N'2022-07-23T00:00:00.000' AS DateTime), CAST(N'2022-07-25T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (708, 4581, CAST(N'2022-07-23T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 5, CAST(N'2022-07-23T00:00:00.000' AS DateTime), 3, CAST(N'2022-07-24T00:00:00.000' AS DateTime), CAST(N'2022-07-26T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (709, 4663, CAST(N'2022-07-23T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 23, CAST(N'2022-07-23T00:00:00.000' AS DateTime), 1, CAST(N'2022-07-24T00:00:00.000' AS DateTime), CAST(N'2022-07-26T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (710, 4455, CAST(N'2022-07-23T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 7, CAST(N'2022-07-23T00:00:00.000' AS DateTime), 3, CAST(N'2022-07-24T00:00:00.000' AS DateTime), CAST(N'2022-07-26T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (712, 4371, CAST(N'2022-07-24T00:00:00.000' AS DateTime), N'Hà Tĩnh ', N'', 19, CAST(N'2022-07-24T00:00:00.000' AS DateTime), 3, CAST(N'2022-07-25T00:00:00.000' AS DateTime), CAST(N'2022-07-27T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (713, 4386, CAST(N'2022-07-24T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 2, CAST(N'2022-07-24T00:00:00.000' AS DateTime), 3, CAST(N'2022-07-25T00:00:00.000' AS DateTime), CAST(N'2022-07-27T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (714, 4515, CAST(N'2022-07-25T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 3, CAST(N'2022-07-25T00:00:00.000' AS DateTime), 3, CAST(N'2022-07-26T00:00:00.000' AS DateTime), CAST(N'2022-07-28T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (715, 4458, CAST(N'2022-07-26T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 10, CAST(N'2022-07-26T00:00:00.000' AS DateTime), 3, CAST(N'2022-07-27T00:00:00.000' AS DateTime), CAST(N'2022-07-29T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (716, 4469, CAST(N'2022-07-26T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 21, CAST(N'2022-07-26T00:00:00.000' AS DateTime), 2, CAST(N'2022-07-27T00:00:00.000' AS DateTime), CAST(N'2022-07-29T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (717, 4424, CAST(N'2022-07-27T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 8, CAST(N'2022-07-27T00:00:00.000' AS DateTime), 2, CAST(N'2022-07-28T00:00:00.000' AS DateTime), CAST(N'2022-07-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (718, 4625, CAST(N'2022-07-27T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 17, CAST(N'2022-07-27T00:00:00.000' AS DateTime), 2, CAST(N'2022-07-28T00:00:00.000' AS DateTime), CAST(N'2022-07-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (719, 4687, CAST(N'2022-07-27T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 15, CAST(N'2022-07-27T00:00:00.000' AS DateTime), 1, CAST(N'2022-07-28T00:00:00.000' AS DateTime), CAST(N'2022-07-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (720, 4216, CAST(N'2022-07-28T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 24, CAST(N'2022-07-28T00:00:00.000' AS DateTime), 1, CAST(N'2022-07-29T00:00:00.000' AS DateTime), CAST(N'2022-07-31T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (721, 4335, CAST(N'2022-07-28T00:00:00.000' AS DateTime), N'Thanh Hóa', N'', 15, CAST(N'2022-07-28T00:00:00.000' AS DateTime), 3, CAST(N'2022-07-29T00:00:00.000' AS DateTime), CAST(N'2022-07-31T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (722, 4252, CAST(N'2022-07-28T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 28, CAST(N'2022-07-28T00:00:00.000' AS DateTime), 1, CAST(N'2022-07-29T00:00:00.000' AS DateTime), CAST(N'2022-07-31T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (724, 4325, CAST(N'2022-07-30T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 5, CAST(N'2022-07-30T00:00:00.000' AS DateTime), 2, CAST(N'2022-07-31T00:00:00.000' AS DateTime), CAST(N'2022-08-02T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (725, 4493, CAST(N'2022-07-30T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 13, CAST(N'2022-07-30T00:00:00.000' AS DateTime), 2, CAST(N'2022-07-31T00:00:00.000' AS DateTime), CAST(N'2022-08-02T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (727, 4507, CAST(N'2022-08-01T00:00:00.000' AS DateTime), N'Quảng Nam', N'', 27, CAST(N'2022-08-01T00:00:00.000' AS DateTime), 1, CAST(N'2022-08-02T00:00:00.000' AS DateTime), CAST(N'2022-08-04T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (728, 4290, CAST(N'2022-08-03T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 2, CAST(N'2022-08-03T00:00:00.000' AS DateTime), 3, CAST(N'2022-08-04T00:00:00.000' AS DateTime), CAST(N'2022-08-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (729, 4303, CAST(N'2022-08-04T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 15, CAST(N'2022-08-04T00:00:00.000' AS DateTime), 1, CAST(N'2022-08-05T00:00:00.000' AS DateTime), CAST(N'2022-08-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (730, 4448, CAST(N'2022-08-06T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 32, CAST(N'2022-08-06T00:00:00.000' AS DateTime), 2, CAST(N'2022-08-07T00:00:00.000' AS DateTime), CAST(N'2022-08-09T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (731, 4615, CAST(N'2022-08-06T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 7, CAST(N'2022-08-06T00:00:00.000' AS DateTime), 1, CAST(N'2022-08-07T00:00:00.000' AS DateTime), CAST(N'2022-08-09T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (732, 4569, CAST(N'2022-08-08T00:00:00.000' AS DateTime), N'Tuyên Quang', N'', 25, CAST(N'2022-08-08T00:00:00.000' AS DateTime), 3, CAST(N'2022-08-09T00:00:00.000' AS DateTime), CAST(N'2022-08-11T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (733, 4484, CAST(N'2022-08-09T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 4, CAST(N'2022-08-09T00:00:00.000' AS DateTime), 2, CAST(N'2022-08-10T00:00:00.000' AS DateTime), CAST(N'2022-08-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (734, 4453, CAST(N'2022-08-09T00:00:00.000' AS DateTime), N'Nghệ An', N'', 5, CAST(N'2022-08-09T00:00:00.000' AS DateTime), 1, CAST(N'2022-08-10T00:00:00.000' AS DateTime), CAST(N'2022-08-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (735, 4385, CAST(N'2022-08-10T00:00:00.000' AS DateTime), N'Hà Nội', N'', 1, CAST(N'2022-08-10T00:00:00.000' AS DateTime), 2, CAST(N'2022-08-11T00:00:00.000' AS DateTime), CAST(N'2022-08-13T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (736, 4584, CAST(N'2022-08-10T00:00:00.000' AS DateTime), N'Nghệ An', N'', 8, CAST(N'2022-08-10T00:00:00.000' AS DateTime), 3, CAST(N'2022-08-11T00:00:00.000' AS DateTime), CAST(N'2022-08-13T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (737, 4217, CAST(N'2022-08-12T00:00:00.000' AS DateTime), N'Nghệ An', N'', 25, CAST(N'2022-08-12T00:00:00.000' AS DateTime), 2, CAST(N'2022-08-13T00:00:00.000' AS DateTime), CAST(N'2022-08-15T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (738, 4672, CAST(N'2022-08-13T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 32, CAST(N'2022-08-13T00:00:00.000' AS DateTime), 1, CAST(N'2022-08-14T00:00:00.000' AS DateTime), CAST(N'2022-08-16T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (739, 4365, CAST(N'2022-08-13T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 13, CAST(N'2022-08-13T00:00:00.000' AS DateTime), 3, CAST(N'2022-08-14T00:00:00.000' AS DateTime), CAST(N'2022-08-16T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (740, 4436, CAST(N'2022-08-14T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 20, CAST(N'2022-08-14T00:00:00.000' AS DateTime), 2, CAST(N'2022-08-15T00:00:00.000' AS DateTime), CAST(N'2022-08-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (741, 4290, CAST(N'2022-08-15T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 2, CAST(N'2022-08-15T00:00:00.000' AS DateTime), 3, CAST(N'2022-08-16T00:00:00.000' AS DateTime), CAST(N'2022-08-18T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (742, 4698, CAST(N'2022-08-17T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 26, CAST(N'2022-08-17T00:00:00.000' AS DateTime), 3, CAST(N'2022-08-18T00:00:00.000' AS DateTime), CAST(N'2022-08-20T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (743, 4409, CAST(N'2022-08-19T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 25, CAST(N'2022-08-19T00:00:00.000' AS DateTime), 2, CAST(N'2022-08-20T00:00:00.000' AS DateTime), CAST(N'2022-08-22T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (744, 4591, CAST(N'2022-08-19T00:00:00.000' AS DateTime), N'Thanh Hóa', N'', 15, CAST(N'2022-08-19T00:00:00.000' AS DateTime), 1, CAST(N'2022-08-20T00:00:00.000' AS DateTime), CAST(N'2022-08-22T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (745, 4515, CAST(N'2022-08-20T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 3, CAST(N'2022-08-20T00:00:00.000' AS DateTime), 3, CAST(N'2022-08-21T00:00:00.000' AS DateTime), CAST(N'2022-08-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (747, 4631, CAST(N'2022-08-20T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 23, CAST(N'2022-08-20T00:00:00.000' AS DateTime), 2, CAST(N'2022-08-21T00:00:00.000' AS DateTime), CAST(N'2022-08-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (748, 4501, CAST(N'2022-08-21T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 21, CAST(N'2022-08-21T00:00:00.000' AS DateTime), 1, CAST(N'2022-08-22T00:00:00.000' AS DateTime), CAST(N'2022-08-24T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (749, 4451, CAST(N'2022-08-21T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 3, CAST(N'2022-08-21T00:00:00.000' AS DateTime), 2, CAST(N'2022-08-22T00:00:00.000' AS DateTime), CAST(N'2022-08-24T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (751, 4645, CAST(N'2022-08-23T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 5, CAST(N'2022-08-23T00:00:00.000' AS DateTime), 1, CAST(N'2022-08-24T00:00:00.000' AS DateTime), CAST(N'2022-08-26T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (752, 4265, CAST(N'2022-08-23T00:00:00.000' AS DateTime), N'Đà Nẵng', N'', 9, CAST(N'2022-08-23T00:00:00.000' AS DateTime), 2, CAST(N'2022-08-24T00:00:00.000' AS DateTime), CAST(N'2022-08-26T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (753, 4565, CAST(N'2022-08-24T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 21, CAST(N'2022-08-24T00:00:00.000' AS DateTime), 2, CAST(N'2022-08-25T00:00:00.000' AS DateTime), CAST(N'2022-08-27T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (754, 4381, CAST(N'2022-08-24T00:00:00.000' AS DateTime), N'Quảng Nam', N'', 29, CAST(N'2022-08-24T00:00:00.000' AS DateTime), 1, CAST(N'2022-08-25T00:00:00.000' AS DateTime), CAST(N'2022-08-27T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (755, 4448, CAST(N'2022-08-25T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 32, CAST(N'2022-08-25T00:00:00.000' AS DateTime), 2, CAST(N'2022-08-26T00:00:00.000' AS DateTime), CAST(N'2022-08-28T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (756, 4207, CAST(N'2022-08-25T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 15, CAST(N'2022-08-25T00:00:00.000' AS DateTime), 1, CAST(N'2022-08-26T00:00:00.000' AS DateTime), CAST(N'2022-08-28T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (757, 4337, CAST(N'2022-08-25T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 17, CAST(N'2022-08-25T00:00:00.000' AS DateTime), 2, CAST(N'2022-08-26T00:00:00.000' AS DateTime), CAST(N'2022-08-28T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (758, 4434, CAST(N'2022-08-27T00:00:00.000' AS DateTime), N'Quảng Ngãi', N'', 18, CAST(N'2022-08-27T00:00:00.000' AS DateTime), 3, CAST(N'2022-08-28T00:00:00.000' AS DateTime), CAST(N'2022-08-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (759, 4365, CAST(N'2022-08-27T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 13, CAST(N'2022-08-27T00:00:00.000' AS DateTime), 3, CAST(N'2022-08-28T00:00:00.000' AS DateTime), CAST(N'2022-08-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (760, 4620, CAST(N'2022-08-27T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 12, CAST(N'2022-08-27T00:00:00.000' AS DateTime), 3, CAST(N'2022-08-28T00:00:00.000' AS DateTime), CAST(N'2022-08-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (762, 4593, CAST(N'2022-08-29T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 17, CAST(N'2022-08-29T00:00:00.000' AS DateTime), 3, CAST(N'2022-08-30T00:00:00.000' AS DateTime), CAST(N'2022-09-01T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (763, 4322, CAST(N'2022-08-31T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 2, CAST(N'2022-08-31T00:00:00.000' AS DateTime), 2, CAST(N'2022-09-01T00:00:00.000' AS DateTime), CAST(N'2022-09-03T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (764, 4475, CAST(N'2022-08-31T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 27, CAST(N'2022-08-31T00:00:00.000' AS DateTime), 2, CAST(N'2022-09-01T00:00:00.000' AS DateTime), CAST(N'2022-09-03T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (765, 4456, CAST(N'2022-08-31T00:00:00.000' AS DateTime), N'Khánh Hòa', N'', 8, CAST(N'2022-08-31T00:00:00.000' AS DateTime), 1, CAST(N'2022-09-01T00:00:00.000' AS DateTime), CAST(N'2022-09-03T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (766, 4237, CAST(N'2022-09-01T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 13, CAST(N'2022-09-01T00:00:00.000' AS DateTime), 1, CAST(N'2022-09-02T00:00:00.000' AS DateTime), CAST(N'2022-09-04T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (767, 4317, CAST(N'2022-09-02T00:00:00.000' AS DateTime), N'Nghệ An', N'', 29, CAST(N'2022-09-02T00:00:00.000' AS DateTime), 3, CAST(N'2022-09-03T00:00:00.000' AS DateTime), CAST(N'2022-09-05T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (768, 4625, CAST(N'2022-09-02T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 17, CAST(N'2022-09-02T00:00:00.000' AS DateTime), 2, CAST(N'2022-09-03T00:00:00.000' AS DateTime), CAST(N'2022-09-05T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (769, 4268, CAST(N'2022-09-03T00:00:00.000' AS DateTime), N'Nghệ An', N'', 12, CAST(N'2022-09-03T00:00:00.000' AS DateTime), 2, CAST(N'2022-09-04T00:00:00.000' AS DateTime), CAST(N'2022-09-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (770, 4567, CAST(N'2022-09-04T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 23, CAST(N'2022-09-04T00:00:00.000' AS DateTime), 1, CAST(N'2022-09-05T00:00:00.000' AS DateTime), CAST(N'2022-09-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (771, 4672, CAST(N'2022-09-04T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 32, CAST(N'2022-09-04T00:00:00.000' AS DateTime), 1, CAST(N'2022-09-05T00:00:00.000' AS DateTime), CAST(N'2022-09-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (773, 4342, CAST(N'2022-09-07T00:00:00.000' AS DateTime), N'Nghệ An', N'', 22, CAST(N'2022-09-07T00:00:00.000' AS DateTime), 1, CAST(N'2022-09-08T00:00:00.000' AS DateTime), CAST(N'2022-09-10T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (774, 4661, CAST(N'2022-09-07T00:00:00.000' AS DateTime), N'Thanh Hóa', N'', 21, CAST(N'2022-09-07T00:00:00.000' AS DateTime), 2, CAST(N'2022-09-08T00:00:00.000' AS DateTime), CAST(N'2022-09-10T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (775, 4236, CAST(N'2022-09-07T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 12, CAST(N'2022-09-07T00:00:00.000' AS DateTime), 3, CAST(N'2022-09-08T00:00:00.000' AS DateTime), CAST(N'2022-09-10T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (776, 4573, CAST(N'2022-09-08T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 29, CAST(N'2022-09-08T00:00:00.000' AS DateTime), 1, CAST(N'2022-09-09T00:00:00.000' AS DateTime), CAST(N'2022-09-11T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (777, 4436, CAST(N'2022-09-08T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 20, CAST(N'2022-09-08T00:00:00.000' AS DateTime), 2, CAST(N'2022-09-09T00:00:00.000' AS DateTime), CAST(N'2022-09-11T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (778, 4210, CAST(N'2022-09-08T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 18, CAST(N'2022-09-08T00:00:00.000' AS DateTime), 1, CAST(N'2022-09-09T00:00:00.000' AS DateTime), CAST(N'2022-09-11T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (779, 4343, CAST(N'2022-09-09T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 23, CAST(N'2022-09-09T00:00:00.000' AS DateTime), 2, CAST(N'2022-09-10T00:00:00.000' AS DateTime), CAST(N'2022-09-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (780, 4584, CAST(N'2022-09-09T00:00:00.000' AS DateTime), N'Nghệ An', N'', 8, CAST(N'2022-09-09T00:00:00.000' AS DateTime), 3, CAST(N'2022-09-10T00:00:00.000' AS DateTime), CAST(N'2022-09-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (781, 4537, CAST(N'2022-09-09T00:00:00.000' AS DateTime), N'Nghệ An', N'', 25, CAST(N'2022-09-09T00:00:00.000' AS DateTime), 1, CAST(N'2022-09-10T00:00:00.000' AS DateTime), CAST(N'2022-09-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (782, 4328, CAST(N'2022-09-10T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 8, CAST(N'2022-09-10T00:00:00.000' AS DateTime), 2, CAST(N'2022-09-11T00:00:00.000' AS DateTime), CAST(N'2022-09-13T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (783, 4643, CAST(N'2022-09-11T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 3, CAST(N'2022-09-11T00:00:00.000' AS DateTime), 2, CAST(N'2022-09-12T00:00:00.000' AS DateTime), CAST(N'2022-09-14T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (784, 4503, CAST(N'2022-09-12T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 23, CAST(N'2022-09-12T00:00:00.000' AS DateTime), 3, CAST(N'2022-09-13T00:00:00.000' AS DateTime), CAST(N'2022-09-15T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (785, 4381, CAST(N'2022-09-13T00:00:00.000' AS DateTime), N'Quảng Nam', N'', 29, CAST(N'2022-09-13T00:00:00.000' AS DateTime), 1, CAST(N'2022-09-14T00:00:00.000' AS DateTime), CAST(N'2022-09-16T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (786, 4453, CAST(N'2022-09-13T00:00:00.000' AS DateTime), N'Nghệ An', N'', 5, CAST(N'2022-09-13T00:00:00.000' AS DateTime), 1, CAST(N'2022-09-14T00:00:00.000' AS DateTime), CAST(N'2022-09-16T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (787, 4330, CAST(N'2022-09-13T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 10, CAST(N'2022-09-13T00:00:00.000' AS DateTime), 1, CAST(N'2022-09-14T00:00:00.000' AS DateTime), CAST(N'2022-09-16T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (789, 4319, CAST(N'2022-09-14T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 31, CAST(N'2022-09-14T00:00:00.000' AS DateTime), 2, CAST(N'2022-09-15T00:00:00.000' AS DateTime), CAST(N'2022-09-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (790, 4402, CAST(N'2022-09-14T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 18, CAST(N'2022-09-14T00:00:00.000' AS DateTime), 1, CAST(N'2022-09-15T00:00:00.000' AS DateTime), CAST(N'2022-09-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (791, 4514, CAST(N'2022-09-16T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 2, CAST(N'2022-09-16T00:00:00.000' AS DateTime), 2, CAST(N'2022-09-17T00:00:00.000' AS DateTime), CAST(N'2022-09-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (792, 4331, CAST(N'2022-09-17T00:00:00.000' AS DateTime), N'Quảng Ngãi', N'', 11, CAST(N'2022-09-17T00:00:00.000' AS DateTime), 2, CAST(N'2022-09-18T00:00:00.000' AS DateTime), CAST(N'2022-09-20T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (793, 4314, CAST(N'2022-09-18T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 26, CAST(N'2022-09-18T00:00:00.000' AS DateTime), 3, CAST(N'2022-09-19T00:00:00.000' AS DateTime), CAST(N'2022-09-21T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (794, 4515, CAST(N'2022-09-18T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 3, CAST(N'2022-09-18T00:00:00.000' AS DateTime), 3, CAST(N'2022-09-19T00:00:00.000' AS DateTime), CAST(N'2022-09-21T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (795, 4563, CAST(N'2022-09-20T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 19, CAST(N'2022-09-20T00:00:00.000' AS DateTime), 3, CAST(N'2022-09-21T00:00:00.000' AS DateTime), CAST(N'2022-09-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (796, 4602, CAST(N'2022-09-20T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 26, CAST(N'2022-09-20T00:00:00.000' AS DateTime), 3, CAST(N'2022-09-21T00:00:00.000' AS DateTime), CAST(N'2022-09-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (797, 4406, CAST(N'2022-09-20T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 22, CAST(N'2022-09-20T00:00:00.000' AS DateTime), 2, CAST(N'2022-09-21T00:00:00.000' AS DateTime), CAST(N'2022-09-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (798, 4686, CAST(N'2022-09-22T00:00:00.000' AS DateTime), N'Đà Nẵng', N'', 14, CAST(N'2022-09-22T00:00:00.000' AS DateTime), 3, CAST(N'2022-09-23T00:00:00.000' AS DateTime), CAST(N'2022-09-25T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (799, 4620, CAST(N'2022-09-23T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 12, CAST(N'2022-09-23T00:00:00.000' AS DateTime), 3, CAST(N'2022-09-24T00:00:00.000' AS DateTime), CAST(N'2022-09-26T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (800, 4668, CAST(N'2022-09-23T00:00:00.000' AS DateTime), N'Nghệ An', N'', 28, CAST(N'2022-09-23T00:00:00.000' AS DateTime), 3, CAST(N'2022-09-24T00:00:00.000' AS DateTime), CAST(N'2022-09-26T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (801, 4311, CAST(N'2022-09-24T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 23, CAST(N'2022-09-24T00:00:00.000' AS DateTime), 3, CAST(N'2022-09-25T00:00:00.000' AS DateTime), CAST(N'2022-09-27T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (802, 4603, CAST(N'2022-09-26T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 27, CAST(N'2022-09-26T00:00:00.000' AS DateTime), 1, CAST(N'2022-09-27T00:00:00.000' AS DateTime), CAST(N'2022-09-29T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (803, 4698, CAST(N'2022-09-26T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 26, CAST(N'2022-09-26T00:00:00.000' AS DateTime), 3, CAST(N'2022-09-27T00:00:00.000' AS DateTime), CAST(N'2022-09-29T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (805, 4588, CAST(N'2022-09-27T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 12, CAST(N'2022-09-27T00:00:00.000' AS DateTime), 1, CAST(N'2022-09-28T00:00:00.000' AS DateTime), CAST(N'2022-09-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (806, 4667, CAST(N'2022-09-27T00:00:00.000' AS DateTime), N'Thanh Hóa', N'', 27, CAST(N'2022-09-27T00:00:00.000' AS DateTime), 2, CAST(N'2022-09-28T00:00:00.000' AS DateTime), CAST(N'2022-09-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (807, 4276, CAST(N'2022-09-28T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 20, CAST(N'2022-09-28T00:00:00.000' AS DateTime), 1, CAST(N'2022-09-29T00:00:00.000' AS DateTime), CAST(N'2022-10-01T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (808, 4610, CAST(N'2022-09-28T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 2, CAST(N'2022-09-28T00:00:00.000' AS DateTime), 2, CAST(N'2022-09-29T00:00:00.000' AS DateTime), CAST(N'2022-10-01T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (809, 4449, CAST(N'2022-09-29T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 1, CAST(N'2022-09-29T00:00:00.000' AS DateTime), 3, CAST(N'2022-09-30T00:00:00.000' AS DateTime), CAST(N'2022-10-02T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (811, 4340, CAST(N'2022-09-30T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 20, CAST(N'2022-09-30T00:00:00.000' AS DateTime), 2, CAST(N'2022-10-01T00:00:00.000' AS DateTime), CAST(N'2022-10-03T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (812, 4561, CAST(N'2022-09-30T00:00:00.000' AS DateTime), N'Thừa Thiên Huế ', N'', 17, CAST(N'2022-09-30T00:00:00.000' AS DateTime), 1, CAST(N'2022-10-01T00:00:00.000' AS DateTime), CAST(N'2022-10-03T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (813, 4433, CAST(N'2022-09-30T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 17, CAST(N'2022-09-30T00:00:00.000' AS DateTime), 2, CAST(N'2022-10-01T00:00:00.000' AS DateTime), CAST(N'2022-10-03T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (814, 4394, CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 10, CAST(N'2022-10-01T00:00:00.000' AS DateTime), 2, CAST(N'2022-10-02T00:00:00.000' AS DateTime), CAST(N'2022-10-04T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (815, 4480, CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 32, CAST(N'2022-10-01T00:00:00.000' AS DateTime), 1, CAST(N'2022-10-02T00:00:00.000' AS DateTime), CAST(N'2022-10-04T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (816, 4456, CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'Khánh Hòa', N'', 8, CAST(N'2022-10-01T00:00:00.000' AS DateTime), 1, CAST(N'2022-10-02T00:00:00.000' AS DateTime), CAST(N'2022-10-04T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (817, 4464, CAST(N'2022-10-01T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 16, CAST(N'2022-10-01T00:00:00.000' AS DateTime), 3, CAST(N'2022-10-02T00:00:00.000' AS DateTime), CAST(N'2022-10-04T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (818, 4319, CAST(N'2022-10-03T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 31, CAST(N'2022-10-03T00:00:00.000' AS DateTime), 2, CAST(N'2022-10-04T00:00:00.000' AS DateTime), CAST(N'2022-10-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (819, 4672, CAST(N'2022-10-03T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 32, CAST(N'2022-10-03T00:00:00.000' AS DateTime), 1, CAST(N'2022-10-04T00:00:00.000' AS DateTime), CAST(N'2022-10-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (820, 4528, CAST(N'2022-10-03T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 16, CAST(N'2022-10-03T00:00:00.000' AS DateTime), 1, CAST(N'2022-10-04T00:00:00.000' AS DateTime), CAST(N'2022-10-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (821, 4546, CAST(N'2022-10-03T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 2, CAST(N'2022-10-03T00:00:00.000' AS DateTime), 1, CAST(N'2022-10-04T00:00:00.000' AS DateTime), CAST(N'2022-10-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (822, 4510, CAST(N'2022-10-04T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 30, CAST(N'2022-10-04T00:00:00.000' AS DateTime), 1, CAST(N'2022-10-05T00:00:00.000' AS DateTime), CAST(N'2022-10-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (825, 4421, CAST(N'2022-10-09T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 5, CAST(N'2022-10-09T00:00:00.000' AS DateTime), 2, CAST(N'2022-10-10T00:00:00.000' AS DateTime), CAST(N'2022-10-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (826, 4515, CAST(N'2022-10-09T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 3, CAST(N'2022-10-09T00:00:00.000' AS DateTime), 3, CAST(N'2022-10-10T00:00:00.000' AS DateTime), CAST(N'2022-10-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (827, 4265, CAST(N'2022-10-09T00:00:00.000' AS DateTime), N'Đà Nẵng', N'', 9, CAST(N'2022-10-09T00:00:00.000' AS DateTime), 2, CAST(N'2022-10-10T00:00:00.000' AS DateTime), CAST(N'2022-10-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (828, 4309, CAST(N'2022-10-09T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 21, CAST(N'2022-10-09T00:00:00.000' AS DateTime), 1, CAST(N'2022-10-10T00:00:00.000' AS DateTime), CAST(N'2022-10-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (829, 4546, CAST(N'2022-10-11T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 2, CAST(N'2022-10-11T00:00:00.000' AS DateTime), 1, CAST(N'2022-10-12T00:00:00.000' AS DateTime), CAST(N'2022-10-14T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (830, 4380, CAST(N'2022-10-11T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 28, CAST(N'2022-10-11T00:00:00.000' AS DateTime), 3, CAST(N'2022-10-12T00:00:00.000' AS DateTime), CAST(N'2022-10-14T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (831, 4227, CAST(N'2022-10-13T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 3, CAST(N'2022-10-13T00:00:00.000' AS DateTime), 3, CAST(N'2022-10-14T00:00:00.000' AS DateTime), CAST(N'2022-10-16T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (832, 4452, CAST(N'2022-10-14T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 4, CAST(N'2022-10-14T00:00:00.000' AS DateTime), 3, CAST(N'2022-10-15T00:00:00.000' AS DateTime), CAST(N'2022-10-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (833, 4581, CAST(N'2022-10-14T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 5, CAST(N'2022-10-14T00:00:00.000' AS DateTime), 3, CAST(N'2022-10-15T00:00:00.000' AS DateTime), CAST(N'2022-10-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (834, 4650, CAST(N'2022-10-16T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 10, CAST(N'2022-10-16T00:00:00.000' AS DateTime), 3, CAST(N'2022-10-17T00:00:00.000' AS DateTime), CAST(N'2022-10-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (835, 4437, CAST(N'2022-10-16T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 21, CAST(N'2022-10-16T00:00:00.000' AS DateTime), 3, CAST(N'2022-10-17T00:00:00.000' AS DateTime), CAST(N'2022-10-19T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (836, 4697, CAST(N'2022-10-17T00:00:00.000' AS DateTime), N'Quảng nam', N'', 25, CAST(N'2022-10-17T00:00:00.000' AS DateTime), 2, CAST(N'2022-10-18T00:00:00.000' AS DateTime), CAST(N'2022-10-20T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (837, 4467, CAST(N'2022-10-19T00:00:00.000' AS DateTime), N'Ninh Bình', N'', 19, CAST(N'2022-10-19T00:00:00.000' AS DateTime), 3, CAST(N'2022-10-20T00:00:00.000' AS DateTime), CAST(N'2022-10-22T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (838, 4436, CAST(N'2022-10-19T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 20, CAST(N'2022-10-19T00:00:00.000' AS DateTime), 2, CAST(N'2022-10-20T00:00:00.000' AS DateTime), CAST(N'2022-10-22T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (839, 4603, CAST(N'2022-10-20T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 27, CAST(N'2022-10-20T00:00:00.000' AS DateTime), 1, CAST(N'2022-10-21T00:00:00.000' AS DateTime), CAST(N'2022-10-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (840, 4666, CAST(N'2022-10-20T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 26, CAST(N'2022-10-20T00:00:00.000' AS DateTime), 1, CAST(N'2022-10-21T00:00:00.000' AS DateTime), CAST(N'2022-10-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (841, 4667, CAST(N'2022-10-23T00:00:00.000' AS DateTime), N'Thanh Hóa', N'', 27, CAST(N'2022-10-23T00:00:00.000' AS DateTime), 2, CAST(N'2022-10-24T00:00:00.000' AS DateTime), CAST(N'2022-10-26T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (842, 4328, CAST(N'2022-10-23T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 8, CAST(N'2022-10-23T00:00:00.000' AS DateTime), 2, CAST(N'2022-10-24T00:00:00.000' AS DateTime), CAST(N'2022-10-26T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (843, 4628, CAST(N'2022-10-23T00:00:00.000' AS DateTime), N'Quảng Nam', N'', 20, CAST(N'2022-10-23T00:00:00.000' AS DateTime), 2, CAST(N'2022-10-24T00:00:00.000' AS DateTime), CAST(N'2022-10-26T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (844, 4503, CAST(N'2022-10-26T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 23, CAST(N'2022-10-26T00:00:00.000' AS DateTime), 3, CAST(N'2022-10-27T00:00:00.000' AS DateTime), CAST(N'2022-10-29T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (845, 4686, CAST(N'2022-10-27T00:00:00.000' AS DateTime), N'Đà Nẵng', N'', 14, CAST(N'2022-10-27T00:00:00.000' AS DateTime), 3, CAST(N'2022-10-28T00:00:00.000' AS DateTime), CAST(N'2022-10-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (846, 4207, CAST(N'2022-10-28T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 15, CAST(N'2022-10-28T00:00:00.000' AS DateTime), 1, CAST(N'2022-10-29T00:00:00.000' AS DateTime), CAST(N'2022-10-31T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (847, 4641, CAST(N'2022-10-30T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 1, CAST(N'2022-10-30T00:00:00.000' AS DateTime), 3, CAST(N'2022-10-31T00:00:00.000' AS DateTime), CAST(N'2022-11-02T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (848, 4515, CAST(N'2022-10-31T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 3, CAST(N'2022-10-31T00:00:00.000' AS DateTime), 3, CAST(N'2022-11-01T00:00:00.000' AS DateTime), CAST(N'2022-11-03T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (849, 4684, CAST(N'2022-10-31T00:00:00.000' AS DateTime), N'Quảng Nam', N'', 12, CAST(N'2022-10-31T00:00:00.000' AS DateTime), 1, CAST(N'2022-11-01T00:00:00.000' AS DateTime), CAST(N'2022-11-03T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (850, 4239, CAST(N'2022-10-31T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 15, CAST(N'2022-10-31T00:00:00.000' AS DateTime), 3, CAST(N'2022-11-01T00:00:00.000' AS DateTime), CAST(N'2022-11-03T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (851, 4227, CAST(N'2022-10-31T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 3, CAST(N'2022-10-31T00:00:00.000' AS DateTime), 3, CAST(N'2022-11-01T00:00:00.000' AS DateTime), CAST(N'2022-11-03T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (852, 4240, CAST(N'2022-11-02T00:00:00.000' AS DateTime), N'Nam Định', N'', 16, CAST(N'2022-11-02T00:00:00.000' AS DateTime), 1, CAST(N'2022-11-03T00:00:00.000' AS DateTime), CAST(N'2022-11-05T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (854, 4510, CAST(N'2022-11-02T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 30, CAST(N'2022-11-02T00:00:00.000' AS DateTime), 1, CAST(N'2022-11-03T00:00:00.000' AS DateTime), CAST(N'2022-11-05T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (855, 4619, CAST(N'2022-11-02T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 11, CAST(N'2022-11-02T00:00:00.000' AS DateTime), 2, CAST(N'2022-11-03T00:00:00.000' AS DateTime), CAST(N'2022-11-05T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (856, 4504, CAST(N'2022-11-03T00:00:00.000' AS DateTime), N'Nghệ An', N'', 24, CAST(N'2022-11-03T00:00:00.000' AS DateTime), 1, CAST(N'2022-11-04T00:00:00.000' AS DateTime), CAST(N'2022-11-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (857, 4401, CAST(N'2022-11-04T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 17, CAST(N'2022-11-04T00:00:00.000' AS DateTime), 3, CAST(N'2022-11-05T00:00:00.000' AS DateTime), CAST(N'2022-11-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (858, 4689, CAST(N'2022-11-05T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 17, CAST(N'2022-11-05T00:00:00.000' AS DateTime), 3, CAST(N'2022-11-06T00:00:00.000' AS DateTime), CAST(N'2022-11-08T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (859, 4457, CAST(N'2022-11-05T00:00:00.000' AS DateTime), N'Nghệ An', N'', 9, CAST(N'2022-11-05T00:00:00.000' AS DateTime), 2, CAST(N'2022-11-06T00:00:00.000' AS DateTime), CAST(N'2022-11-08T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (860, 4443, CAST(N'2022-11-05T00:00:00.000' AS DateTime), N'Nghệ An', N'', 27, CAST(N'2022-11-05T00:00:00.000' AS DateTime), 3, CAST(N'2022-11-06T00:00:00.000' AS DateTime), CAST(N'2022-11-08T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (862, 4451, CAST(N'2022-11-06T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 3, CAST(N'2022-11-06T00:00:00.000' AS DateTime), 2, CAST(N'2022-11-07T00:00:00.000' AS DateTime), CAST(N'2022-11-09T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (863, 4630, CAST(N'2022-11-07T00:00:00.000' AS DateTime), N'Quảng Nam', N'', 22, CAST(N'2022-11-07T00:00:00.000' AS DateTime), 1, CAST(N'2022-11-08T00:00:00.000' AS DateTime), CAST(N'2022-11-10T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (864, 4383, CAST(N'2022-11-07T00:00:00.000' AS DateTime), N'Nghệ An', N'', 31, CAST(N'2022-11-07T00:00:00.000' AS DateTime), 3, CAST(N'2022-11-08T00:00:00.000' AS DateTime), CAST(N'2022-11-10T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (865, 4203, CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'Nghệ An', N'', 11, CAST(N'2022-11-08T00:00:00.000' AS DateTime), 3, CAST(N'2022-11-09T00:00:00.000' AS DateTime), CAST(N'2022-11-11T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (866, 4487, CAST(N'2022-11-09T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 7, CAST(N'2022-11-09T00:00:00.000' AS DateTime), 2, CAST(N'2022-11-10T00:00:00.000' AS DateTime), CAST(N'2022-11-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (867, 4605, CAST(N'2022-11-09T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 29, CAST(N'2022-11-09T00:00:00.000' AS DateTime), 3, CAST(N'2022-11-10T00:00:00.000' AS DateTime), CAST(N'2022-11-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (868, 4235, CAST(N'2022-11-09T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 11, CAST(N'2022-11-09T00:00:00.000' AS DateTime), 2, CAST(N'2022-11-10T00:00:00.000' AS DateTime), CAST(N'2022-11-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (869, 4427, CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 11, CAST(N'2022-11-11T00:00:00.000' AS DateTime), 2, CAST(N'2022-11-12T00:00:00.000' AS DateTime), CAST(N'2022-11-14T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (870, 4602, CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 26, CAST(N'2022-11-11T00:00:00.000' AS DateTime), 3, CAST(N'2022-11-12T00:00:00.000' AS DateTime), CAST(N'2022-11-14T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (871, 4397, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 13, CAST(N'2022-11-12T00:00:00.000' AS DateTime), 2, CAST(N'2022-11-13T00:00:00.000' AS DateTime), CAST(N'2022-11-15T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (872, 4509, CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 29, CAST(N'2022-11-12T00:00:00.000' AS DateTime), 3, CAST(N'2022-11-13T00:00:00.000' AS DateTime), CAST(N'2022-11-15T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (873, 4594, CAST(N'2022-11-14T00:00:00.000' AS DateTime), N'Nghệ An', N'', 18, CAST(N'2022-11-14T00:00:00.000' AS DateTime), 1, CAST(N'2022-11-15T00:00:00.000' AS DateTime), CAST(N'2022-11-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (874, 4545, CAST(N'2022-11-18T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 1, CAST(N'2022-11-18T00:00:00.000' AS DateTime), 3, CAST(N'2022-11-19T00:00:00.000' AS DateTime), CAST(N'2022-11-21T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (875, 4290, CAST(N'2022-11-19T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 2, CAST(N'2022-11-19T00:00:00.000' AS DateTime), 3, CAST(N'2022-11-20T00:00:00.000' AS DateTime), CAST(N'2022-11-22T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (876, 4389, CAST(N'2022-11-20T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 5, CAST(N'2022-11-20T00:00:00.000' AS DateTime), 3, CAST(N'2022-11-21T00:00:00.000' AS DateTime), CAST(N'2022-11-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (877, 4211, CAST(N'2022-11-21T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 19, CAST(N'2022-11-21T00:00:00.000' AS DateTime), 2, CAST(N'2022-11-22T00:00:00.000' AS DateTime), CAST(N'2022-11-24T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (878, 4316, CAST(N'2022-11-23T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 28, CAST(N'2022-11-23T00:00:00.000' AS DateTime), 2, CAST(N'2022-11-24T00:00:00.000' AS DateTime), CAST(N'2022-11-26T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (879, 4594, CAST(N'2022-11-23T00:00:00.000' AS DateTime), N'Nghệ An', N'', 18, CAST(N'2022-11-23T00:00:00.000' AS DateTime), 1, CAST(N'2022-11-24T00:00:00.000' AS DateTime), CAST(N'2022-11-26T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (880, 4394, CAST(N'2022-11-23T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 10, CAST(N'2022-11-23T00:00:00.000' AS DateTime), 2, CAST(N'2022-11-24T00:00:00.000' AS DateTime), CAST(N'2022-11-26T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (882, 4371, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'Hà Tĩnh ', N'', 19, CAST(N'2022-11-27T00:00:00.000' AS DateTime), 3, CAST(N'2022-11-28T00:00:00.000' AS DateTime), CAST(N'2022-11-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (883, 4249, CAST(N'2022-11-27T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 25, CAST(N'2022-11-27T00:00:00.000' AS DateTime), 1, CAST(N'2022-11-28T00:00:00.000' AS DateTime), CAST(N'2022-11-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (885, 4689, CAST(N'2022-11-29T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 17, CAST(N'2022-11-29T00:00:00.000' AS DateTime), 3, CAST(N'2022-11-30T00:00:00.000' AS DateTime), CAST(N'2022-12-02T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (886, 4456, CAST(N'2022-11-30T00:00:00.000' AS DateTime), N'Khánh Hòa', N'', 8, CAST(N'2022-11-30T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-01T00:00:00.000' AS DateTime), CAST(N'2022-12-03T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (887, 4303, CAST(N'2022-11-30T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 15, CAST(N'2022-11-30T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-01T00:00:00.000' AS DateTime), CAST(N'2022-12-03T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (888, 4402, CAST(N'2022-11-30T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 18, CAST(N'2022-11-30T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-01T00:00:00.000' AS DateTime), CAST(N'2022-12-03T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (889, 4561, CAST(N'2022-12-01T00:00:00.000' AS DateTime), N'Thừa Thiên Huế ', N'', 17, CAST(N'2022-12-01T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-02T00:00:00.000' AS DateTime), CAST(N'2022-12-04T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (890, 4515, CAST(N'2022-12-01T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 3, CAST(N'2022-12-01T00:00:00.000' AS DateTime), 3, CAST(N'2022-12-02T00:00:00.000' AS DateTime), CAST(N'2022-12-04T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (891, 4656, CAST(N'2022-12-02T00:00:00.000' AS DateTime), N'Nghệ An', N'', 16, CAST(N'2022-12-02T00:00:00.000' AS DateTime), 3, CAST(N'2022-12-03T00:00:00.000' AS DateTime), CAST(N'2022-12-05T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (893, 4306, CAST(N'2022-12-03T00:00:00.000' AS DateTime), N'Hà Nội', N'', 18, CAST(N'2022-12-03T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-04T00:00:00.000' AS DateTime), CAST(N'2022-12-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (894, 4568, CAST(N'2022-12-04T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 24, CAST(N'2022-12-04T00:00:00.000' AS DateTime), 2, CAST(N'2022-12-05T00:00:00.000' AS DateTime), CAST(N'2022-12-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (895, 4390, CAST(N'2022-12-04T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 6, CAST(N'2022-12-04T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-05T00:00:00.000' AS DateTime), CAST(N'2022-12-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (896, 4492, CAST(N'2022-12-04T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 12, CAST(N'2022-12-04T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-05T00:00:00.000' AS DateTime), CAST(N'2022-12-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (897, 4437, CAST(N'2022-12-06T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 21, CAST(N'2022-12-06T00:00:00.000' AS DateTime), 3, CAST(N'2022-12-07T00:00:00.000' AS DateTime), CAST(N'2022-12-09T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (898, 4326, CAST(N'2022-12-07T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 6, CAST(N'2022-12-07T00:00:00.000' AS DateTime), 3, CAST(N'2022-12-08T00:00:00.000' AS DateTime), CAST(N'2022-12-10T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (899, 4316, CAST(N'2022-12-07T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 28, CAST(N'2022-12-07T00:00:00.000' AS DateTime), 2, CAST(N'2022-12-08T00:00:00.000' AS DateTime), CAST(N'2022-12-10T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (901, 4666, CAST(N'2022-12-08T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 26, CAST(N'2022-12-08T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-09T00:00:00.000' AS DateTime), CAST(N'2022-12-11T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (902, 4568, CAST(N'2022-12-08T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 24, CAST(N'2022-12-08T00:00:00.000' AS DateTime), 2, CAST(N'2022-12-09T00:00:00.000' AS DateTime), CAST(N'2022-12-11T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (903, 4615, CAST(N'2022-12-08T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 7, CAST(N'2022-12-08T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-09T00:00:00.000' AS DateTime), CAST(N'2022-12-11T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (904, 4216, CAST(N'2022-12-09T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 24, CAST(N'2022-12-09T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-10T00:00:00.000' AS DateTime), CAST(N'2022-12-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (905, 4440, CAST(N'2022-12-09T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 24, CAST(N'2022-12-09T00:00:00.000' AS DateTime), 3, CAST(N'2022-12-10T00:00:00.000' AS DateTime), CAST(N'2022-12-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (906, 4278, CAST(N'2022-12-10T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 22, CAST(N'2022-12-10T00:00:00.000' AS DateTime), 3, CAST(N'2022-12-11T00:00:00.000' AS DateTime), CAST(N'2022-12-13T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (908, 4360, CAST(N'2022-12-11T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 8, CAST(N'2022-12-11T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-12T00:00:00.000' AS DateTime), CAST(N'2022-12-14T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (909, 4616, CAST(N'2022-12-11T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 8, CAST(N'2022-12-11T00:00:00.000' AS DateTime), 2, CAST(N'2022-12-12T00:00:00.000' AS DateTime), CAST(N'2022-12-14T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (910, 4265, CAST(N'2022-12-11T00:00:00.000' AS DateTime), N'Đà Nẵng', N'', 9, CAST(N'2022-12-11T00:00:00.000' AS DateTime), 2, CAST(N'2022-12-12T00:00:00.000' AS DateTime), CAST(N'2022-12-14T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (911, 4219, CAST(N'2022-12-11T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 27, CAST(N'2022-12-11T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-12T00:00:00.000' AS DateTime), CAST(N'2022-12-14T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (912, 4584, CAST(N'2022-12-12T00:00:00.000' AS DateTime), N'Nghệ An', N'', 8, CAST(N'2022-12-12T00:00:00.000' AS DateTime), 3, CAST(N'2022-12-13T00:00:00.000' AS DateTime), CAST(N'2022-12-15T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (913, 4268, CAST(N'2022-12-14T00:00:00.000' AS DateTime), N'Nghệ An', N'', 12, CAST(N'2022-12-14T00:00:00.000' AS DateTime), 2, CAST(N'2022-12-15T00:00:00.000' AS DateTime), CAST(N'2022-12-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (914, 4545, CAST(N'2022-12-14T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 1, CAST(N'2022-12-14T00:00:00.000' AS DateTime), 3, CAST(N'2022-12-15T00:00:00.000' AS DateTime), CAST(N'2022-12-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (915, 4221, CAST(N'2022-12-14T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 29, CAST(N'2022-12-14T00:00:00.000' AS DateTime), 3, CAST(N'2022-12-15T00:00:00.000' AS DateTime), CAST(N'2022-12-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (916, 4329, CAST(N'2022-12-14T00:00:00.000' AS DateTime), N'Quảng Nam', N'', 9, CAST(N'2022-12-14T00:00:00.000' AS DateTime), 3, CAST(N'2022-12-15T00:00:00.000' AS DateTime), CAST(N'2022-12-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (917, 4437, CAST(N'2022-12-14T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 21, CAST(N'2022-12-14T00:00:00.000' AS DateTime), 3, CAST(N'2022-12-15T00:00:00.000' AS DateTime), CAST(N'2022-12-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (919, 4383, CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'Nghệ An', N'', 31, CAST(N'2022-12-15T00:00:00.000' AS DateTime), 3, CAST(N'2022-12-16T00:00:00.000' AS DateTime), CAST(N'2022-12-18T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (920, 4368, CAST(N'2022-12-17T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 16, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 3, CAST(N'2022-12-18T00:00:00.000' AS DateTime), CAST(N'2022-12-20T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (921, 4337, CAST(N'2022-12-17T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 17, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 2, CAST(N'2022-12-18T00:00:00.000' AS DateTime), CAST(N'2022-12-20T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (922, 4402, CAST(N'2022-12-17T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 18, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-18T00:00:00.000' AS DateTime), CAST(N'2022-12-20T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (923, 4385, CAST(N'2022-12-18T00:00:00.000' AS DateTime), N'Hà Nội', N'', 1, CAST(N'2022-12-18T00:00:00.000' AS DateTime), 2, CAST(N'2022-12-19T00:00:00.000' AS DateTime), CAST(N'2022-12-21T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (924, 4480, CAST(N'2022-12-18T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 32, CAST(N'2022-12-18T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-19T00:00:00.000' AS DateTime), CAST(N'2022-12-21T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (925, 4595, CAST(N'2022-12-20T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 19, CAST(N'2022-12-20T00:00:00.000' AS DateTime), 2, CAST(N'2022-12-21T00:00:00.000' AS DateTime), CAST(N'2022-12-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (926, 4424, CAST(N'2022-12-20T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 8, CAST(N'2022-12-20T00:00:00.000' AS DateTime), 2, CAST(N'2022-12-21T00:00:00.000' AS DateTime), CAST(N'2022-12-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (927, 4323, CAST(N'2022-12-21T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 3, CAST(N'2022-12-21T00:00:00.000' AS DateTime), 3, CAST(N'2022-12-22T00:00:00.000' AS DateTime), CAST(N'2022-12-24T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (928, 4319, CAST(N'2022-12-22T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 31, CAST(N'2022-12-22T00:00:00.000' AS DateTime), 2, CAST(N'2022-12-23T00:00:00.000' AS DateTime), CAST(N'2022-12-25T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (929, 4495, CAST(N'2022-12-25T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 15, CAST(N'2022-12-25T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-26T00:00:00.000' AS DateTime), CAST(N'2022-12-28T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (930, 4224, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 32, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 3, CAST(N'2022-12-27T00:00:00.000' AS DateTime), CAST(N'2022-12-29T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (931, 4690, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'Quảng Nam', N'', 18, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-27T00:00:00.000' AS DateTime), CAST(N'2022-12-29T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (932, 4205, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 13, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 2, CAST(N'2022-12-27T00:00:00.000' AS DateTime), CAST(N'2022-12-29T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (933, 4597, CAST(N'2022-12-26T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 21, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-27T00:00:00.000' AS DateTime), CAST(N'2022-12-29T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (934, 4398, CAST(N'2022-12-27T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 14, CAST(N'2022-12-27T00:00:00.000' AS DateTime), 3, CAST(N'2022-12-28T00:00:00.000' AS DateTime), CAST(N'2022-12-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (935, 4235, CAST(N'2022-12-27T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 11, CAST(N'2022-12-27T00:00:00.000' AS DateTime), 2, CAST(N'2022-12-28T00:00:00.000' AS DateTime), CAST(N'2022-12-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (936, 4361, CAST(N'2022-12-27T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 9, CAST(N'2022-12-27T00:00:00.000' AS DateTime), 2, CAST(N'2022-12-28T00:00:00.000' AS DateTime), CAST(N'2022-12-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (937, 4268, CAST(N'2022-12-27T00:00:00.000' AS DateTime), N'Nghệ An', N'', 12, CAST(N'2022-12-27T00:00:00.000' AS DateTime), 2, CAST(N'2022-12-28T00:00:00.000' AS DateTime), CAST(N'2022-12-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (938, 4414, CAST(N'2022-12-28T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 30, CAST(N'2022-12-28T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-29T00:00:00.000' AS DateTime), CAST(N'2022-12-31T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (939, 4554, CAST(N'2022-12-28T00:00:00.000' AS DateTime), N'Nghệ An', N'', 10, CAST(N'2022-12-28T00:00:00.000' AS DateTime), 3, CAST(N'2022-12-29T00:00:00.000' AS DateTime), CAST(N'2022-12-31T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (940, 4210, CAST(N'2022-12-30T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 18, CAST(N'2022-12-30T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-31T00:00:00.000' AS DateTime), CAST(N'2023-01-02T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (941, 4646, CAST(N'2022-12-31T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 6, CAST(N'2022-12-31T00:00:00.000' AS DateTime), 2, CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2023-01-03T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (942, 4383, CAST(N'2023-01-03T00:00:00.000' AS DateTime), N'Nghệ An', N'', 31, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 3, CAST(N'2023-01-04T00:00:00.000' AS DateTime), CAST(N'2023-01-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (943, 4641, CAST(N'2023-01-04T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 3, CAST(N'2023-01-05T00:00:00.000' AS DateTime), CAST(N'2023-01-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (944, 4235, CAST(N'2023-01-05T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 11, CAST(N'2023-01-05T00:00:00.000' AS DateTime), 2, CAST(N'2023-01-06T00:00:00.000' AS DateTime), CAST(N'2023-01-08T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (945, 4511, CAST(N'2023-01-05T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 31, CAST(N'2023-01-05T00:00:00.000' AS DateTime), 2, CAST(N'2023-01-06T00:00:00.000' AS DateTime), CAST(N'2023-01-08T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (946, 4547, CAST(N'2023-01-06T00:00:00.000' AS DateTime), N'Nam Định', N'', 3, CAST(N'2023-01-06T00:00:00.000' AS DateTime), 2, CAST(N'2023-01-07T00:00:00.000' AS DateTime), CAST(N'2023-01-09T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (947, 4659, CAST(N'2023-01-07T00:00:00.000' AS DateTime), N'Đà Nẵng', N'', 19, CAST(N'2023-01-07T00:00:00.000' AS DateTime), 3, CAST(N'2023-01-08T00:00:00.000' AS DateTime), CAST(N'2023-01-10T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (948, 4480, CAST(N'2023-01-08T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 32, CAST(N'2023-01-08T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-09T00:00:00.000' AS DateTime), CAST(N'2023-01-11T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (949, 4653, CAST(N'2023-01-09T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 13, CAST(N'2023-01-09T00:00:00.000' AS DateTime), 3, CAST(N'2023-01-10T00:00:00.000' AS DateTime), CAST(N'2023-01-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (950, 4440, CAST(N'2023-01-11T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 24, CAST(N'2023-01-11T00:00:00.000' AS DateTime), 3, CAST(N'2023-01-12T00:00:00.000' AS DateTime), CAST(N'2023-01-14T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (951, 4441, CAST(N'2023-01-11T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 25, CAST(N'2023-01-11T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-12T00:00:00.000' AS DateTime), CAST(N'2023-01-14T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (952, 4383, CAST(N'2023-01-12T00:00:00.000' AS DateTime), N'Nghệ An', N'', 31, CAST(N'2023-01-12T00:00:00.000' AS DateTime), 3, CAST(N'2023-01-13T00:00:00.000' AS DateTime), CAST(N'2023-01-15T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (953, 4323, CAST(N'2023-01-12T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 3, CAST(N'2023-01-12T00:00:00.000' AS DateTime), 3, CAST(N'2023-01-13T00:00:00.000' AS DateTime), CAST(N'2023-01-15T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (954, 4590, CAST(N'2023-01-13T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 14, CAST(N'2023-01-13T00:00:00.000' AS DateTime), 3, CAST(N'2023-01-14T00:00:00.000' AS DateTime), CAST(N'2023-01-16T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (955, 4250, CAST(N'2023-01-13T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 26, CAST(N'2023-01-13T00:00:00.000' AS DateTime), 2, CAST(N'2023-01-14T00:00:00.000' AS DateTime), CAST(N'2023-01-16T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (956, 4643, CAST(N'2023-01-14T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 3, CAST(N'2023-01-14T00:00:00.000' AS DateTime), 2, CAST(N'2023-01-15T00:00:00.000' AS DateTime), CAST(N'2023-01-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (957, 4225, CAST(N'2023-01-14T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 1, CAST(N'2023-01-14T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-15T00:00:00.000' AS DateTime), CAST(N'2023-01-17T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (958, 4442, CAST(N'2023-01-15T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 26, CAST(N'2023-01-15T00:00:00.000' AS DateTime), 2, CAST(N'2023-01-16T00:00:00.000' AS DateTime), CAST(N'2023-01-18T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (959, 4409, CAST(N'2023-01-15T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 25, CAST(N'2023-01-15T00:00:00.000' AS DateTime), 2, CAST(N'2023-01-16T00:00:00.000' AS DateTime), CAST(N'2023-01-18T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (960, 4228, CAST(N'2023-01-15T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 4, CAST(N'2023-01-15T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-16T00:00:00.000' AS DateTime), CAST(N'2023-01-18T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (961, 4216, CAST(N'2023-01-17T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 24, CAST(N'2023-01-17T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-18T00:00:00.000' AS DateTime), CAST(N'2023-01-20T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (962, 4314, CAST(N'2023-01-17T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 26, CAST(N'2023-01-17T00:00:00.000' AS DateTime), 3, CAST(N'2023-01-18T00:00:00.000' AS DateTime), CAST(N'2023-01-20T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (963, 4464, CAST(N'2023-01-18T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 16, CAST(N'2023-01-18T00:00:00.000' AS DateTime), 3, CAST(N'2023-01-19T00:00:00.000' AS DateTime), CAST(N'2023-01-21T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (964, 4538, CAST(N'2023-01-18T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 26, CAST(N'2023-01-18T00:00:00.000' AS DateTime), 2, CAST(N'2023-01-19T00:00:00.000' AS DateTime), CAST(N'2023-01-21T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (965, 4356, CAST(N'2023-01-19T00:00:00.000' AS DateTime), N'Nghệ An', N'', 4, CAST(N'2023-01-19T00:00:00.000' AS DateTime), 3, CAST(N'2023-01-20T00:00:00.000' AS DateTime), CAST(N'2023-01-22T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (966, 4437, CAST(N'2023-01-20T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 21, CAST(N'2023-01-20T00:00:00.000' AS DateTime), 3, CAST(N'2023-01-21T00:00:00.000' AS DateTime), CAST(N'2023-01-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (967, 4446, CAST(N'2023-01-20T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 30, CAST(N'2023-01-20T00:00:00.000' AS DateTime), 3, CAST(N'2023-01-21T00:00:00.000' AS DateTime), CAST(N'2023-01-23T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (968, 4224, CAST(N'2023-01-21T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 32, CAST(N'2023-01-21T00:00:00.000' AS DateTime), 3, CAST(N'2023-01-22T00:00:00.000' AS DateTime), CAST(N'2023-01-24T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (969, 4553, CAST(N'2023-01-22T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 9, CAST(N'2023-01-22T00:00:00.000' AS DateTime), 2, CAST(N'2023-01-23T00:00:00.000' AS DateTime), CAST(N'2023-01-25T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (970, 4514, CAST(N'2023-01-24T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 2, CAST(N'2023-01-24T00:00:00.000' AS DateTime), 2, CAST(N'2023-01-25T00:00:00.000' AS DateTime), CAST(N'2023-01-27T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (971, 4549, CAST(N'2023-01-26T00:00:00.000' AS DateTime), N'Quảng Nam', N'', 5, CAST(N'2023-01-26T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-27T00:00:00.000' AS DateTime), CAST(N'2023-01-29T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (972, 4451, CAST(N'2023-01-26T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 3, CAST(N'2023-01-26T00:00:00.000' AS DateTime), 2, CAST(N'2023-01-27T00:00:00.000' AS DateTime), CAST(N'2023-01-29T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (973, 4317, CAST(N'2023-01-26T00:00:00.000' AS DateTime), N'Nghệ An', N'', 29, CAST(N'2023-01-26T00:00:00.000' AS DateTime), 3, CAST(N'2023-01-27T00:00:00.000' AS DateTime), CAST(N'2023-01-29T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (974, 4465, CAST(N'2023-01-27T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 17, CAST(N'2023-01-27T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-28T00:00:00.000' AS DateTime), CAST(N'2023-01-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (975, 4491, CAST(N'2023-01-27T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 11, CAST(N'2023-01-27T00:00:00.000' AS DateTime), 3, CAST(N'2023-01-28T00:00:00.000' AS DateTime), CAST(N'2023-01-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (976, 4276, CAST(N'2023-01-27T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 20, CAST(N'2023-01-27T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-28T00:00:00.000' AS DateTime), CAST(N'2023-01-30T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (979, 4545, CAST(N'2023-01-28T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 1, CAST(N'2023-01-28T00:00:00.000' AS DateTime), 3, CAST(N'2023-01-29T00:00:00.000' AS DateTime), CAST(N'2023-01-31T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (980, 4309, CAST(N'2023-01-28T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 21, CAST(N'2023-01-28T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-29T00:00:00.000' AS DateTime), CAST(N'2023-01-31T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (981, 4360, CAST(N'2023-01-30T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 8, CAST(N'2023-01-30T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-31T00:00:00.000' AS DateTime), CAST(N'2023-02-02T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (982, 4581, CAST(N'2023-01-30T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 5, CAST(N'2023-01-30T00:00:00.000' AS DateTime), 3, CAST(N'2023-01-31T00:00:00.000' AS DateTime), CAST(N'2023-02-02T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (983, 4221, CAST(N'2023-01-30T00:00:00.000' AS DateTime), N'Quảng Trị', N'', 29, CAST(N'2023-01-30T00:00:00.000' AS DateTime), 3, CAST(N'2023-01-31T00:00:00.000' AS DateTime), CAST(N'2023-02-02T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (984, 4542, CAST(N'2023-01-31T00:00:00.000' AS DateTime), N'Nghệ An', N'', 30, CAST(N'2023-01-31T00:00:00.000' AS DateTime), 3, CAST(N'2023-02-01T00:00:00.000' AS DateTime), CAST(N'2023-02-03T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (985, 4331, CAST(N'2023-02-02T00:00:00.000' AS DateTime), N'Quảng Ngãi', N'', 11, CAST(N'2023-02-02T00:00:00.000' AS DateTime), 2, CAST(N'2023-02-03T00:00:00.000' AS DateTime), CAST(N'2023-02-05T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (986, 4350, CAST(N'2023-02-02T00:00:00.000' AS DateTime), N'Hà Tĩnh', N'', 30, CAST(N'2023-02-02T00:00:00.000' AS DateTime), 3, CAST(N'2023-02-03T00:00:00.000' AS DateTime), CAST(N'2023-02-05T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (987, 4333, CAST(N'2023-02-03T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 13, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-02-04T00:00:00.000' AS DateTime), CAST(N'2023-02-06T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (988, 4360, CAST(N'2023-02-04T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 8, CAST(N'2023-02-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-02-05T00:00:00.000' AS DateTime), CAST(N'2023-02-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (989, 4698, CAST(N'2023-02-04T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 26, CAST(N'2023-02-04T00:00:00.000' AS DateTime), 3, CAST(N'2023-02-05T00:00:00.000' AS DateTime), CAST(N'2023-02-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (990, 4522, CAST(N'2023-02-04T00:00:00.000' AS DateTime), N'Nghệ An', N'', 10, CAST(N'2023-02-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-02-05T00:00:00.000' AS DateTime), CAST(N'2023-02-07T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (991, 4655, CAST(N'2023-02-05T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 15, CAST(N'2023-02-05T00:00:00.000' AS DateTime), 2, CAST(N'2023-02-06T00:00:00.000' AS DateTime), CAST(N'2023-02-08T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (992, 4615, CAST(N'2023-02-06T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 7, CAST(N'2023-02-06T00:00:00.000' AS DateTime), 1, CAST(N'2023-02-07T00:00:00.000' AS DateTime), CAST(N'2023-02-09T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (993, 4252, CAST(N'2023-02-07T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 28, CAST(N'2023-02-07T00:00:00.000' AS DateTime), 1, CAST(N'2023-02-08T00:00:00.000' AS DateTime), CAST(N'2023-02-10T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (994, 4403, CAST(N'2023-02-09T00:00:00.000' AS DateTime), N'Nghệ An', N'', 19, CAST(N'2023-02-09T00:00:00.000' AS DateTime), 2, CAST(N'2023-02-10T00:00:00.000' AS DateTime), CAST(N'2023-02-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (995, 4365, CAST(N'2023-02-09T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 13, CAST(N'2023-02-09T00:00:00.000' AS DateTime), 3, CAST(N'2023-02-10T00:00:00.000' AS DateTime), CAST(N'2023-02-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (996, 4304, CAST(N'2023-02-09T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 16, CAST(N'2023-02-09T00:00:00.000' AS DateTime), 2, CAST(N'2023-02-10T00:00:00.000' AS DateTime), CAST(N'2023-02-12T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (997, 4369, CAST(N'2023-02-10T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 17, CAST(N'2023-02-10T00:00:00.000' AS DateTime), 1, CAST(N'2023-02-11T00:00:00.000' AS DateTime), CAST(N'2023-02-13T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (998, 4669, CAST(N'2023-02-11T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 29, CAST(N'2023-02-11T00:00:00.000' AS DateTime), 1, CAST(N'2023-02-12T00:00:00.000' AS DateTime), CAST(N'2023-02-14T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (999, 4390, CAST(N'2023-02-11T00:00:00.000' AS DateTime), N'Quảng Bình', N'', 6, CAST(N'2023-02-11T00:00:00.000' AS DateTime), 1, CAST(N'2023-02-12T00:00:00.000' AS DateTime), CAST(N'2023-02-14T00:00:00.000' AS DateTime), 4)
GO
INSERT [Orders] ([OrderID], [CustomerID], [OrderTime], [DeliveryProvince], [DeliveryAddress], [EmployeeID], [AcceptTime], [ShipperID], [ShippedTime], [FinishedTime], [Status]) VALUES (1000, 4398, CAST(N'2023-02-12T00:00:00.000' AS DateTime), N'Thừa Thiên Huế', N'', 14, CAST(N'2023-02-12T00:00:00.000' AS DateTime), 3, CAST(N'2023-02-13T00:00:00.000' AS DateTime), CAST(N'2023-02-15T00:00:00.000' AS DateTime), 4)
GO


SET IDENTITY_INSERT [Orders] OFF
GO
INSERT [OrderStatus] ([Status], [Description]) VALUES (-2, N'Đơn hàng bị từ chối')
GO
INSERT [OrderStatus] ([Status], [Description]) VALUES (-1, N'Đơn hàng đã bị hủy')
GO
INSERT [OrderStatus] ([Status], [Description]) VALUES (1, N'Đơn hàng vừa gửi/khởi tạo')
GO
INSERT [OrderStatus] ([Status], [Description]) VALUES (2, N'Đơn hàng đã chấp nhận')
GO
INSERT [OrderStatus] ([Status], [Description]) VALUES (3, N'Đơn hàng đang được vận chuyển')
GO
INSERT [OrderStatus] ([Status], [Description]) VALUES (4, N'Đơn hàng đã hoàn tất')
GO


SET IDENTITY_INSERT [Products] ON 
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (78, N'04528-Xe tập đi Chicco, Xanh dương', N'', 2, 5, N'Cái', 2590000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (79, N'78640-Nôi bọc vải 3 tầng (Jordan)', N'', 2, 5, N'Cái', 4890000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (80, N'Áo thun nữ tay dài sọc ngang - AX1743 - xanh lá', N'', 2, 1, N'Cái', 180000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (81, N'Nokia Lumia 1520 6" Quad-core 2.2GHz 20MP 3400mAh', N'', 1, 3, N'Cái', 15990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (82, N'Nokia Lumia 520 (Nokia Lumia 520 RM-914)...', N'', 2, 3, N'Cái', 2900000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (83, N'Nokia Lumia 720 (Nokia 720 RM-885) Red', N'', 2, 3, N'Cái', 5300000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (84, N'Nokia Lumia 925 4.5'''' Dual-core 1.5GHz 8.7MP 2000mAh', N'', 1, 3, N'Cái', 10990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (85, N'Nước hoa CK IN2U Her MS395', N'', 2, 2, N'Chai', 1100000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (86, N'Ổ cứng di động LaCie Porsche P''9220 USB 3.0 1TB', N'', 1, 3, N'Cái', 2480000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (87, N'Ổ cứng Seagate  1TB 3.0 Đen', N'', 1, 3, N'Cái', 1890000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (88, N'Áo thun Polo Hàn Quốc cao cấp - 360014', N'', 2, 1, N'Cái', 185000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (89, N'Ốp lưng nắp gài Galaxy Note2 Mercury', N'', 1, 9, N'Cái', 319000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (90, N'Ốp nắp gập Galaxy Note 2 Mercury', N'', 1, 9, N'Cái', 319000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (91, N'Panasonic CU/CS-KC12PKH 1.5 Hp', N'', 1, 4, N'Cái', 9890000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (92, N'Panasonic CU/CS-TS12PKH-8 1.5 Hp Inverter', N'', 1, 4, N'Cái', 13690000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (93, N'Panasonic CU/CS-TS9PKH-8 1 Hp Inverter', N'', 1, 4, N'Cái', 11690000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (94, N'Áo thun Polo nam YSL - Xanh bích A-919', N'', 2, 1, N'Cái', 170000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (95, N'Panasonic DH-3HD1W Trực tiếp 3.5kW', N'', 1, 4, N'Cái', 3590000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (96, N'Panasonic DH-3JP3VK Trực tiếp 3.5kW Bơm trợ lực', N'', 1, 4, N'Cái', 3690000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (97, N'Panasonic DH-3KD1VN Trực tiếp 3.5kW', N'', 1, 4, N'Cái', 3990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (98, N'Panasonic DH-3KP1VW Trực tiếp 3.5kW Bơm trợ lực', N'', 1, 4, N'Cái', 3890000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (99, N'Panasonic DH-4HP1W Trực tiếp 4.5kW Bơm trợ lực', N'', 1, 4, N'Cái', 3490000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (100, N'Panasonic KX-FL612', N'', 2, 4, N'Cái', 4430000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (101, N'Panasonic KX-FP711', N'', 2, 4, N'Cái', 2235000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (102, N'Panasonic KX-FT983', N'', 2, 4, N'Cái', 1100000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (103, N'Panasonic KX-TG1311', N'', 1, 4, N'Cái', 659000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (104, N'Panasonic KX-TG1312', N'', 1, 4, N'Cái', 1280000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (105, N'Áo thun Thái KNS-0001', N'', 2, 1, N'Cái', 80000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (106, N'Panasonic KX-TS560', N'', 1, 4, N'Cái', 559000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (107, N'Panasonic KX-TSC11', N'', 1, 4, N'Cái', 499000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (108, N'Panasonic MK-GH1WRA', N'', 1, 4, N'Cái', 849000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (109, N'Philips 200V4LSB 19.5-inch LCD LED', N'', 1, 4, N'Cái', 2350000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (110, N'Áo USA trắng 2013', N'', 2, 1, N'Cái', 70000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (111, N'Philips HD4665, 1.7L, Inox cao cấp, đun sôi nhanh, bảo hành 24 tháng', N'', 1, 4, N'Cái', 2490000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (112, N'Philips HP8115', N'', 1, 4, N'Cái', 499000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (113, N'Philips HP8118', N'', 1, 4, N'Cái', 570000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (114, N'Philips HR1456', N'', 1, 4, N'Cái', 749000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (115, N'Philips HR1847 ép trái cây, xay xinh tố, xay khô', N'', 1, 4, N'Cái', 2249000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (116, N'Philips HR1861, ca đựng nước 1L, ép khô xác', N'', 1, 4, N'Cái', 2990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (117, N'Philips 197E3LSU 18.5-inch LED', N'', 1, 4, N'Cái', 2150000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (118, N'Áo vest nam KC25', N'', 2, 1, N'Cái', 420000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (119, N'Plasma Samsung PS51E8000G 51 inches Full HD Smart TV 3D 600 Hz', N'', 1, 3, N'Cái', 25890000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (120, N'Quần áo bóng đá Arsenal đỏ', N'', 2, 1, N'Cái', 70000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (121, N'Quần áo bóng đá Italia xanh', N'', 2, 1, N'Cái', 70000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (122, N'Quần Jeans dài ống côn - QD230', N'', 2, 1, N'Cái', 260000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (123, N'Quần lót nam Freeman 6021', N'', 2, 1, N'Cái', 56000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (124, N'Quần lót nam Seahorse LX003', N'', 2, 1, N'Cái', 155000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (125, N'Quần lót nam Seahorse S3C004', N'', 2, 1, N'Cái', 75000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (126, N'Apple iPad (Apple A4 1GHz, 16GB Flash...', N'', 2, 3, N'Cái', 3900000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (127, N'Quần lót nam Seahorse SF006', N'', 2, 1, N'Cái', 69000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (128, N'Quần lưng nâu Q04', N'', 2, 1, N'Cái', 146000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (129, N'Apple iPad 1 (Apple A4 1GHz, 32GB Flash...', N'', 2, 3, N'Cái', 4200000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (130, N'Samsung ASV10PUQNXEA 1 Hp Inverter', N'', 1, 3, N'Cái', 10790000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (131, N'Samsung ASV13PSPN 1.5 Hp Inverter', N'', 1, 3, N'Cái', 10990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (132, N'Samsung ASV13PUQNXEA 1.5 Hp Inverter', N'', 1, 3, N'Cái', 10890000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (133, N'Samsung Galaxy Ace S5830 (Samsung Galaxy...', N'', 2, 3, N'Cái', 2200000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (134, N'Apple iPad 2 (Apple A5 1GHz, 16GB Flash...', N'', 2, 3, N'Cái', 7590000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (135, N'Samsung Galaxy Camera 3G (Galaxy Camera...', N'', 2, 3, N'Cái', 6500000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (136, N'Samsung Galaxy Mega 5.8 Duos I9152 5.8'''' Dual-core 1.4GHz 2SIM 2600mAh', N'', 1, 3, N'Cái', 8989000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (137, N'Samsung Galaxy Mega 6.3 I9200 6.3'''' Dual-core 1.7GHz 8MP 2SIM 3200mAh', N'', 1, 3, N'Cái', 9990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (138, N'Samsung Galaxy Note (Samsung GT-N7000/...', N'', 2, 3, N'Cái', 4300000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (139, N'Samsung Galaxy Note 10.1 - 2014 Edition', N'', 3, 3, N'Cái', 13990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (140, N'Samsung Galaxy Note 10.1 (N8000)...', N'', 2, 3, N'Cái', 12590000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (141, N'Samsung Galaxy Note 10.1 10.1" Quad-core 1.4GHz 5MP 3G 7000mAh 16GB', N'', 1, 3, N'Cái', 12390000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (142, N'Samsung Galaxy Note 2', N'', 3, 3, N'Cái', 11990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (143, N'Samsung Galaxy Note 2 N7100 5.5'''' Quad-core 1.6GHz 8MP 3100mAh', N'', 1, 3, N'Cái', 11990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (144, N'Samsung Galaxy Note 3', N'', 3, 3, N'Cái', 16990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (145, N'8580 - Xe đẩy Cosco Nova', N'', 2, 5, N'Cái', 4790000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (146, N'Apple iPad Air 16GB/Wifi', N'', 3, 3, N'Cái', 12990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (147, N'Samsung Galaxy Note 3 N9000 5.7" Octa-core 4x1.9GHz & 4x1.3GHz 13MP 3200 mAh', N'', 1, 3, N'Cái', 16990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (148, N'Samsung Galaxy Note 8.0 - 16GB/3G/Wifi', N'', 3, 3, N'Cái', 11990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (149, N'Samsung Galaxy Note 8.0 8" Quad-core 1.6GHz 5MP 3G 4600mAh 16GB', N'', 1, 3, N'Cái', 11389000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (150, N'Samsung Galaxy Note II (Galaxy Note 2/...', N'', 2, 3, N'Cái', 8000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (151, N'Samsung Galaxy S (I9000) 8GB Black', N'', 2, 3, N'Cái', 2350000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (152, N'Samsung Galaxy S II HD LTE (Samsung...', N'', 2, 3, N'Cái', 3700000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (153, N'Samsung Galaxy S3 I9300 4.8'''' Quad-core 1.4GHz 8MP 2100mAh', N'', 1, 3, N'Cái', 9890000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (154, N'Samsung Galaxy S4', N'', 3, 3, N'Cái', 14490000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (155, N'Samsung Galaxy S4 (Galaxy S IV / I9500)...', N'', 2, 3, N'Cái', 9600000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (156, N'Samsung Galaxy S4 I9500 5.0'''' Octa-core 4x1.6GHz  & 4x1.2GHz 13MP 2600mAh', N'', 1, 3, N'Cái', 14490000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (157, N'Apple iPad Mini (Apple A5X 1.0GHz, 512MB...', N'', 2, 3, N'Cái', 6900000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (158, N'Samsung Galaxy Tab (P1000) (ARM Cortex...', N'', 2, 3, N'Cái', 3990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (159, N'Samsung Galaxy Tab 10.1 (P7500) (NVIDIA...', N'', 2, 3, N'Cái', 6500000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (160, N'Samsung Galaxy Tab 10.1 3G (P7500)...', N'', 2, 3, N'Cái', 11690000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (161, N'Samsung Galaxy Tab 2 (P3100) 7" Dual-core 1GHz 3.15MP 3G 4000mAh 16GB', N'', 1, 3, N'Cái', 6890000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (162, N'Samsung Galaxy Tab 2 10.1 (P5100)...', N'', 2, 3, N'Cái', 7200000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (163, N'Samsung Galaxy Tab 2 10.1 10.1" Dual-core 1GHz 3.2MP 3G 7000mAh 16GB', N'', 1, 3, N'Cái', 8990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (164, N'Samsung Galaxy Tab 2 10.1 16GB/3G/Wifi', N'', 3, 3, N'Cái', 8490000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (165, N'Samsung Galaxy Tab 2 7.0 (P3100)...', N'', 2, 3, N'Cái', 4600000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (166, N'Samsung Galaxy Tab 2 7.0 P3110 (TI OMAP...', N'', 2, 3, N'Cái', 3649000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (167, N'Samsung Galaxy Tab 3 10.1 - 16G/3G/Wifi', N'', 3, 3, N'Cái', 10490000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (168, N'Apple iPad Mini (Apple A5X 1.0GHz, 512MB...', N'', 2, 3, N'Cái', 7000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (169, N'Samsung Galaxy Tab 3 10.1 (GT P5200) 10.1" Dual -Core 1.6GHz 3.1MP 3G 6800mAh 16GB', N'', 1, 3, N'Cái', 10490000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (170, N'Samsung Galaxy Tab 3 7.0 (SM-T211) 7.0" Dual-core 1.2GHz 3.1MP 3G 4000mAh 16GB', N'', 1, 3, N'Cái', 7490000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (171, N'Samsung Galaxy Tab 3 8.0 (SM-T311) 8.0" Dual-Core 1.5GHz 3.1MP 3G 4450mAh 16GB', N'', 1, 3, N'Cái', 9490000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (172, N'Samsung Galaxy Tab 3 8.0 16GB/Wifi/3G', N'', 3, 3, N'Cái', 9490000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (173, N'Samsung Galaxy Trend S7560 (Samsung...', N'', 2, 3, N'Cái', 3260000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (174, N'Samsung Galaxy Y S5360 Black', N'', 2, 3, N'Cái', 1250000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (175, N'Samsung HT-E3550 5.1 kênh 500W', N'', 1, 3, N'Cái', 5990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (176, N'Samsung HT-F5530HK 5.1 kênh Blu-ray 3D 1000W', N'', 1, 3, N'Cái', 8990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (177, N'Samsung HT-F5550K 5.1 kênh Bluray 3D 1000W', N'', 1, 3, N'Cái', 9990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (178, N'Samsung I8190 (Galaxy S III mini /...', N'', 2, 3, N'Cái', 4600000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (179, N'Apple iPad Retina (iPad 4 / iPad 2012) (Apple A6X 1.3GHz,...', N'', 2, 3, N'Cái', 12490000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (180, N'Samsung I9100 (Galaxy S II / Galaxy S 2) 16GB Black', N'', 2, 3, N'Cái', 3400000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (181, N'Samsung I9100 (Galaxy S II / Galaxy S 2)...', N'', 2, 3, N'Cái', 3400000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (182, N'Samsung I9300 (Galaxy S III / Galaxy S 3) 16GB Pebble Blue', N'', 2, 3, N'Cái', 5000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (183, N'Samsung I9300 (Galaxy S III / Galaxy S...', N'', 2, 3, N'Cái', 5000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (184, N'Samsung ML 2161 Laser trắng đen', N'', 1, 3, N'Cái', 1790000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (185, N'Samsung RS21HFEPN1 524 lít Side by Side 2 cửa', N'', 1, 3, N'Cái', 31490000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (186, N'Samsung RS21HKLFH1 506 lít Side by Side 2 cửa', N'', 1, 3, N'Cái', 57590000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (187, N'Samsung RS21HKLMR1 506 lít Side by Side 2 cửa', N'', 1, 3, N'Cái', 41990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (188, N'Samsung RS552NRUASL 650 lít Side by Side 2 cửa', N'', 1, 3, N'Cái', 29690000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (189, N'Samsung RSA1WTIS1 543 lít Side by Side 2 cửa', N'', 1, 3, N'Cái', 18900000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (190, N'Apple iPad Retina (iPad 4 / iPad 2012) (Apple A6X 1.3GHz,...', N'', 2, 3, N'Cái', 12900000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (191, N'Samsung S19B150B 18.5-inch LED', N'', 1, 3, N'Cái', 2290000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (192, N'Samsung S19C170B 18.5-inch LED', N'', 1, 3, N'Cái', 2290000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (193, N'Samsung S19C300B 18.5-inch LED', N'', 1, 3, N'Cái', 2450000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (194, N'Samsung S20C300B 19.5-inch LED', N'', 1, 3, N'Cái', 3050000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (195, N'Samsung S22C300B 21.5-inch Wide LED', N'', 1, 3, N'Cái', 3350000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (196, N'Samsung SCX-3401F Lazer đa chức năng', N'', 1, 3, N'Cái', 4490000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (197, N'Samsung SHT-3507DM/EN', N'', 2, 3, N'Cái', 4700000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (198, N'Samsung WF0894W8E1 9kg Cửa trước', N'', 1, 3, N'Cái', 14090000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (199, N'Samsung HT-F6550W 5.1 kênh Bluray 3D Wifi 1000W', N'', 1, 3, N'Cái', 14990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (200, N'Apple iPad Retina (iPad 4 / iPad 2012)...', N'', 2, 3, N'Cái', 12900000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (201, N'Sản phẩm dưỡng da mặt làm giảm các mao mạch trên da - Capillary Clear', N'', 2, 2, N'Cái', 1386000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (202, N'sanaky AT - 202HGW bếp hồng ngoại đôi', N'', 1, 4, N'Cái', 2990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (203, N'Sanaky VH-285W1 280 lít 2 cửa 2 ngăn', N'', 1, 4, N'Cái', 5690000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (204, N'Sanaky VH319HP', N'', 1, 4, N'Cái', 3590000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (205, N'Sanaky VH-401K 401 lít 1 cửa', N'', 1, 4, N'Cái', 8990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (206, N'Sanaky VH-408W 400 lít 2 cửa 2 ngăn', N'', 1, 4, N'Cái', 6490000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (207, N'Sanaky VH50S, 50 lít, có khay nướng, vỉ nướng, công nghệ Nhật Bản', N'', 1, 4, N'Cái', 1690000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (208, N'Apple iPhone 3G 8GB Black (Lock Version)', N'', 2, 3, N'Cái', 1350000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (209, N'Sen cần tắm đứng CA1AB (Inox 304)', N'', 2, 4, N'Cái', 10260000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (210, N'Sen cần tắm đứng CA2AB (INOX 304)', N'', 2, 4, N'Cái', 10260000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (211, N'Sen tắm âm tường CAVALLO CA-035B (Inox...', N'', 2, 4, N'Cái', 12500000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (212, N'Sen tắm đứng điều chỉnh nhiệt đô CA030B', N'', 2, 4, N'Cái', 13600000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (213, N'Apple iPhone 3G S (3GS) 32GB Black (Lock...', N'', 2, 3, N'Cái', 2800000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (214, N'Sony Alpha SLT-A58K SAL 18-55mm Lens Kit', N'', 1, 3, N'Cái', 12990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (215, N'Apple iPhone 4 16GB Black (Bản quốc tế)', N'', 2, 3, N'Cái', 5000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (216, N'Sony BDV-E4100 5.1 Kênh Bluray 3D Wifi Bluetooth 1000W', N'', 1, 3, N'Cái', 9990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (217, N'Sony BDV-E6100 5.1 kênh Blu-ray 3D Wifi Bluetooth 1000W', N'', 1, 3, N'Cái', 11990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (218, N'SONY Bravia KDL-32W674A (32-Inch, Full...', N'', 2, 3, N'Cái', 7930000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (219, N'Sony Bravia KDL-42W674A (42-Inch, Full...', N'', 2, 3, N'Cái', 10580000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (220, N'Sony Bravia KDL-42W804A (42-inch, Full...', N'', 2, 3, N'Cái', 15980000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (221, N'Sony Bravia KDL-47W804A (47-inch, Full...', N'', 2, 3, N'Cái', 19000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (222, N'Sony CFD-S07CPBC8SP5', N'', 1, 3, N'Cái', 1390000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (223, N'Sony CyberShot DSC-H200 (BC E32)', N'', 2, 3, N'Cái', 4190000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (224, N'Sony Cybershot DSC-RX100', N'', 2, 3, N'Cái', 11449000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (225, N'Sony Cybershot DSC-W710 (BC E32/ SC E32/ PC E32)', N'', 2, 3, N'Cái', 1799000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (226, N'Apple iPhone 4 16GB Black (Lock Version)', N'', 2, 3, N'Cái', 5000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (227, N'Sony Cybershot DSC-WX300', N'', 2, 3, N'Cái', 5890000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (228, N'Sony DSC-H200 20.1 megapixels | 3″ screen | 24 – 633 mm (26.4×)', N'', 1, 3, N'Cái', 4690000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (229, N'Sony KLV-40EX430 (40-inch, Full HD, LED...', N'', 2, 3, N'Cái', 10300000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (230, N'Sony KLV-40R452A', N'', 2, 3, N'Cái', 8180000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (231, N'Sony NEX-3NL 16.1 megapixels | 3″ screen | APS-C sensor', N'', 1, 3, N'Cái', 9490000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (232, N'Sony Nex-F3K 16.1 megapixels | 3″ screen | APS-C sensor', N'', 1, 3, N'Cái', 10990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (233, N'Sony Tablet S 9.4" Quad-core 1.4GHz 8MP 3G 6000mAh 32GB', N'', 1, 3, N'Cái', 12490000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (234, N'Sony Vaio Fit SVF14A15SG Core i5-3337U 14" RAM 4GB HDD 750GB Card NVIDIA® GeForce® GT 735M, Optimus™ 2GB Windows 8 Touch', N'', 1, 3, N'Cái', 20990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (235, N'Sony Vaio Fit SVF14A16SG Core i7-3537U 14" RAM 8GB HDD 750GB Card NVIDIA® GeForce® GT 735M, Optimus™ 2GB Windows 8 Touch', N'', 1, 3, N'Cái', 25990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (236, N'Sony Vaio Fit SVF15217SG Core i3-3227U 15.6" RAM 4GB HDD 500GB Card NVIDIA® GeForce® GT 740M 1GB Windows 8 Touch', N'', 1, 3, N'Cái', 16990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (237, N'91279-Ghế ăn Fisher Price Coco Sorbet, 22.5kg', N'', 2, 10, N'Cái', 2215000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (238, N'Apple iPhone 4 32GB Black (Bản quốc tế)', N'', 2, 3, N'Cái', 5990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (239, N'Sony Vaio Fit SVF1521CSG Core i7-3537U 15.5" RAM 4GB HDD 500GB Card NVIDIA® GeForce® GT 740M 2GB Windows 8', N'', 1, 3, N'Cái', 19990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (240, N'Sony Vaio Fit SVF15A13SG Core i5-3337U 15.5" RAM 4GB HDD 750GB Card NVIDIA® GeForce® GT 735M,Optimus™ 2GB Windows 8 Touch', N'', 1, 3, N'Cái', 22990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (241, N'Sony Vaio Pro SVP13213SG Core i5-4200U 13.3" RAM 4GB SSD 128GB Windows 8 Touch', N'', 1, 3, N'Cái', 24990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (242, N'Sony Vaio SVS13132CV Core i5-3230M 13.3" RAM 4GB HDD 500GB Windows 8', N'', 1, 3, N'Cái', 18990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (243, N'Sony Walkman Mp3/Mp4 NWZ-E473/P Pink', N'', 1, 3, N'Cái', 1990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (244, N'Sony Xperia C C2305 5.0" Quad-core 1.2GHz 8.0MP 2390 mAh', N'', 1, 3, N'Cái', 6990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (245, N'Sony Xperia L C2105 4.3'''' Dual-core 8MP 1750mAh', N'', 1, 3, N'Cái', 7290000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (246, N'Sony Xperia SP C5302 4.6'''' Dual-core 1.7GHz 8MP 2370mAh', N'', 1, 3, N'Cái', 9990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (247, N'Sony Xperia Tablet Z - 16GB/Wifi/3G/NFC', N'', 3, 3, N'Cái', 18990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (248, N'Sony Xperia Tablet Z 10.1" Quad-core 1.5GHz 8.1MP 3G 6000mAh 16GB', N'', 1, 3, N'Cái', 18990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (249, N'Apple iPhone 4 32GB Black (Bản quốc tế)', N'', 2, 3, N'Cái', 6000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (250, N'Sony Xperia Z', N'', 3, 3, N'Cái', 14490000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (251, N'Sony Xperia Z (Sony Xperia C6602)...', N'', 2, 3, N'Cái', 9290000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (252, N'Sony Xperia Z C6602 5.0'''' Quad-core 1.5GHz 13MP 2330mAh', N'', 1, 3, N'Cái', 14490000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (253, N'Sony Xperia Z Ultra', N'', 3, 3, N'Cái', 13990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (254, N'Sony Xperia Z Ultra C6802 6.4" Quad-core 2.2GHz 8MP 3050mAh', N'', 1, 3, N'Cái', 13990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (255, N'Sony Xperia Z1', N'', 3, 3, N'Cái', 16990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (256, N'Sony Xperia Z1 C6902 5.0" Quad-core 2.2GHz 20.7MP 3000mAh', N'', 1, 3, N'Cái', 16990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (257, N'Sony Xperia ZR', N'', 3, 3, N'Cái', 10490000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (258, N'Sony Xperia ZR C5502 4.5'''' Quad-core 1.5GHz 13MP 2300mAh', N'', 1, 3, N'Cái', 10490000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (259, N'Sữa bắp canxi Việt Đài 600g NCCX1', N'', 2, 5, N'Hộp', 56000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (260, N'Apple iPhone 4S 16GB Black (Bản quốc tế)', N'', 2, 3, N'Cái', 7000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (261, N'Sữa bột cho trẻ Celia Expert 3 900g', N'', 2, 5, N'Hộp', 421000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (262, N'Sữa bột Dumex Gold 3 800g', N'', 2, 5, N'Hộp', 379000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (263, N'Sữa bột I am Mother 4 800g', N'', 2, 5, N'Hộp', 620000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (264, N'Sữa bột Kanny 900g (nhập khẩu Hà Lan)', N'', 2, 5, N'Hộp', 349000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (265, N'Sữa bột Pedia Plus cho trẻ biếng ăn 900g', N'', 2, 5, N'Hộp', 310000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (266, N'Sữa bột Peptamen (mẫu mới) 430g', N'', 2, 5, N'Hộp', 448000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (267, N'Sữa bột Physiolac số 3 từ 12-36 tháng 400g/H.Sắt', N'', 2, 5, N'Hộp', 210000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (268, N'Sữa bột Physiolac số 3 từ 12-36 tháng 900g/H. Sắt', N'', 2, 5, N'Hộp', 400000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (269, N'Sữa bột siêu sạch HiPP 3 Combiotic Organic 350g', N'', 2, 5, N'Hộp', 255000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (270, N'Sữa bột XO4 - 800g', N'', 2, 5, N'Hộp', 482000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (271, N'Apple iPhone 4S 16GB Black (Bản quốc tế)', N'', 2, 3, N'Cái', 7500000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (272, N'Sữa dưỡng ẩm em bé - Lotion Soft & Smooth 200ml', N'', 2, 5, N'Hộp', 39000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (273, N'Sữa Icreo Glico số 9', N'', 2, 5, N'Hộp', 600000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (274, N'Sữa Meiji 9 820g', N'', 2, 5, N'Hộp', 490000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (275, N'Sữa Meiji Gold 3 900g', N'', 2, 5, N'Hộp', 410000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (276, N'Sữa Nan Nga số 3 (800g)', N'', 2, 5, N'Hộp', 590000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (277, N'Sữa non Alpha Lipid Life Line phù hợp cho mọi người già lẫn trẻ', N'', 2, 5, N'Hộp', 1280000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (278, N'Sữa non Good Health colostrum milk powder 350g', N'', 2, 5, N'Hộp', 369000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (279, N'Sữa non Milk colostrum powder DBH IQ (450g)', N'', 2, 5, N'Hộp', 599000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (280, N'Sữa Nurture Gold+ 3 900g', N'', 2, 5, N'Hộp', 420000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (281, N'Sữa Physiolac dinh dưỡng số 3 (900g)', N'', 2, 5, N'Hộp', 409000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (282, N'Apple iPhone 4S 32GB Black (Bản quốc tế)', N'', 2, 3, N'Cái', 7900000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (283, N'Sữa Similac số 2 -Go & Grow 624g(9-24M) 070074508283', N'', 2, 5, N'Hộp', 555000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (284, N'Sữa tắm sáng da LeoQ 180g', N'', 2, 5, N'Hộp', 30000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (285, N'Sữa tươi giàu canxi - Table Cape Hi Calcium', N'', 2, 5, N'Hộp', 45000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (286, N'Sữa tươi nguyên chất - Devondale (full cream)', N'', 2, 5, N'Hộp', 33000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (287, N'Sữa Wakodo GunGun', N'', 2, 5, N'Hộp', 485000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (288, N'Sữa Wakodo Gungun 850gr', N'', 2, 5, N'Hộp', 485000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (289, N'Summer Infant. Ghế ăn cho bé AZBB8001', N'', 2, 10, N'Cái', 900000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (290, N'Apple iPhone 4S 64GB Black (Bản quốc tế)', N'', 2, 3, N'Cái', 9150000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (291, N'Sunhouse Magnetic pan SH-M28', N'', 2, 4, N'Cái', 275000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (292, N'Sunhouse SH-KS300E, 3L, ấm Inox không rỉ', N'', 1, 4, N'Cái', 349000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (293, N'Suzuki Axelo 125 ( Côn tay - Xanh trắng...', N'', 2, 6, N'Cái', 23700000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (294, N'Suzuki GZ150–A 150cc 2012 Việt Nam', N'', 2, 6, N'Cái', 42000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (295, N'Suzuki Viva 115 Fi 2013 Việt Nam (Xanh...', N'', 2, 6, N'Cái', 20500000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (296, N'Tai nghe Bluetooth BH 2012', N'', 1, 9, N'Cái', 329000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (297, N'Tai nghe Bluetooth Elecom LBT-HS02BK', N'', 1, 9, N'Cái', 799000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (298, N'Tai nghe Bluetooth Elecom LBT-MPHS400SV bạc', N'', 1, 9, N'Cái', 699000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (299, N'Apple iPhone 5 16GB Black (Bản quốc tế)', N'', 2, 3, N'Cái', 10000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (300, N'Tai nghe Microlab K-290', N'', 1, 9, N'Cái', 349000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (301, N'Apple iPhone 5 16GB White (Bản quốc tế)', N'', 2, 3, N'Cái', 10800000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (302, N'Apple iPhone 5S 16GB Gold (Bản quốc tế)', N'', 2, 3, N'Cái', 17200000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (303, N'Apple The New iPad (iPad 3/ iPad 2012) (Apple A5X 1.0GHz,...', N'', 2, 3, N'Cái', 9100000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (304, N'Apple The New iPad (iPad 3/ iPad 2012)...', N'', 2, 3, N'Cái', 9100000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (305, N'Ariston IM-4522EP Trực tiếp 4.5kW Bơm trợ lực', N'', 1, 4, N'Cái', 3049000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (306, N'Ariston IM-4522EP Trực tiếp 4.5kW Bơm trợ lực', N'', 1, 4, N'Cái', 3149000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (307, N'Asus A46CA - i3/2365M/2G/500G/14"', N'', 3, 3, N'Cái', 8990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (308, N'Toyota Vios 1.5 Limo MT 2013 Việt Nam', N'', 2, 7, N'Cái', 445000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (309, N'Toyota Vios 1.5G AT 2013 Việt Nam', N'', 2, 7, N'Cái', 517000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (310, N'Asus CM6431 Intel Pentium G2030 RAM 2GB HDD 500GB (VN007D)', N'', 1, 3, N'Cái', 7090000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (311, N'Asus FonePad (ME371MG_Z2460) 7" Intel Atom Z2460 1.6GHz 3.15MP 3G 4270mAh 8GB', N'', 1, 3, N'Cái', 5990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (312, N'Tủ mát Sanaky VH-300W', N'', 2, 4, N'Cái', 6750000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (313, N'Asus Fonepad 7 (ME372CG) 7" Dual-core 1.6GHz 5MP 3950mAh 3G 16GB', N'', 1, 3, N'Cái', 6490000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (314, N'Túi vải đựng giày 12 ngăn tiết kiệm căn phòng bạn', N'', 2, 1, N'Cái', 65000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (315, N'Asus FonePad 7" Intel Atom Z2420 1.2GHz 3.15MP 3G 4270mAh 8GB', N'', 1, 3, N'Cái', 5490000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (316, N'Asus Google Nexus 7 (NVIDIA Tegra 3...', N'', 2, 3, N'Cái', 5950000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (317, N'Asus Google Nexus 7 II (Google Nexus 7...', N'', 2, 3, N'Cái', 5500000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (318, N'Vòi chậu rửa Cavallo CA032-NK (Inox 304)', N'', 2, 4, N'Cái', 6720000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (319, N'Vòi chậu rửa Inox 304 Cavallo CA074', N'', 2, 4, N'Cái', 5145000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (320, N'Asus K46CA Intel Core i7-3537U 14" RAM 4GB HDD 750GB  (WX128)', N'', 1, 3, N'Cái', 17190000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (321, N'Xe bé tập đi Winwintoys WIN001', N'', 2, 5, N'Cái', 380000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (322, N'Asus Memo Pad HD 7 (HD7) (ARM Cortex A7...', N'', 2, 3, N'Cái', 3050000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (323, N'Xe Ben tự đổ Hyundai HD270 -15 tấn', N'', 2, 7, N'Cái', 1230000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (324, N'Xe đầu kéo Hyundai HD170 9 tấn', N'', 2, 7, N'Cái', 1350000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (325, N'Xe đẩy + nôi xách Cosco Sprinter Travel System, Fruity Jungle-TR141ALK', N'', 2, 5, N'Cái', 6590000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (326, N'Xe đẩy 2 chiều cao cấp 666 HBB (XD666)', N'', 2, 5, N'Cái', 1240000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (327, N'Xe đẩy 306', N'', 2, 5, N'Cái', 1550000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (328, N'Xe đẩy Babylove BL301', N'', 2, 5, N'Cái', 690000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (329, N'Xe đẩy Babylove BL303', N'', 2, 5, N'Cái', 1200000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (330, N'Xe đẩy Babylove BL307', N'', 2, 5, N'Cái', 4000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (331, N'Xe đẩy cao cấp 2 chiều Seebaby T04', N'', 2, 5, N'Cái', 1700000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (332, N'Asus Memo Pad ME172V 7" 1GHz 1MP 4270mAh 8GB', N'', 1, 3, N'Cái', 2990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (333, N'Xe đẩy chân có cây đẩy AU101 (XCC101)', N'', 2, 5, N'Cái', 605000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (334, N'Xe đẩy đôi 703R (XD703R)', N'', 2, 5, N'Cái', 1500000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (335, N'Xe đẩy đôi màu đen Safety 1st CV052ARQ', N'', 2, 5, N'Cái', 7590000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (336, N'Xe đẩy du lịch 630 (XD630)', N'', 2, 5, N'Cái', 700000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (337, N'Xe đẩy du lịch cao cấp 635C (XD635C)', N'', 2, 5, N'Cái', 840000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (338, N'Xe đẩy du lịch nhỏ gọn 711 (XD711)', N'', 2, 5, N'Cái', 523000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (339, N'Xe đẩy Graco LiteRider Stroller 1801006', N'', 2, 5, N'Cái', 2790000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (340, N'Xe đẩy trẻ em Babylove BL308', N'', 2, 5, N'Cái', 4200000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (341, N'Xe đẩy trẻ em BL 306', N'', 2, 5, N'Cái', 1555000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (342, N'Xe đẩy Zaracos James C618/ Xanh', N'', 2, 5, N'Cái', 2585000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (343, N'Asus Transformer Pad TF300T Dock 10.1" Quad-core 1.2Ghz 8MP 22Wh 16GB', N'', 1, 3, N'Cái', 10999000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (344, N'Xe tải Ben Hyundai Mighty HD65 2.5 tấn', N'', 2, 7, N'Cái', 455000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (345, N'Asus X450CA i3-3217U/4G/750G', N'', 3, 3, N'Cái', 9790000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (346, N'Xe Tải Hyundai HD120 - 5 tấn Đông Lạnh', N'', 2, 7, N'Cái', 860000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (347, N'Xe Tải Hyundai HD120 - 5 tấn Thùng lửng', N'', 2, 7, N'Cái', 703000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (348, N'Xe tải Hyundai HD170 8.5 tấn Thùng kín', N'', 2, 7, N'Cái', 1208000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (349, N'Xe tải Hyundai HD320  19tấn', N'', 2, 7, N'Cái', 1690000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (350, N'Xe tải Hyundai HD65 2.5 Tấn Thùng Lửng', N'', 2, 7, N'Cái', 492000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (351, N'Xe tải Hyundai mighty HD72- 3.5T Thùng kín', N'', 2, 7, N'Cái', 470000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (352, N'Xe tải THACO HYUNDAI HD65', N'', 2, 7, N'Cái', 475000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (353, N'Xe tải thùng kín Hyundai Mighty HD65 2.5 Tấn', N'', 2, 7, N'Cái', 540000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (354, N'Xe tập đi bằng gỗ cho bé', N'', 2, 5, N'Cái', 290000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (355, N'Asus X451CA Pentium 2117U/2G/500G', N'', 3, 3, N'Cái', 7690000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (356, N'Xe tập đi có nhạc (lớn) nhựa Chợ Lớn CL0017', N'', 2, 5, N'Cái', 328000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (357, N'Yamaha Exciter GP 2011 Côn tay - Xanh', N'', 2, 6, N'Cái', 28000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (358, N'Yamaha Exciter GP 2012', N'', 2, 6, N'Cái', 26000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (359, N'Yamaha Exciter R 135cc 2013 Việt nam...', N'', 2, 6, N'Cái', 36300000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (360, N'Yamaha Exciter RC 2011 Côn tay - Trắng', N'', 2, 6, N'Cái', 26000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (361, N'YAMAHA JUPITER GRAVITA RC', N'', 2, 6, N'Cái', 26400000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (362, N'Asus X45C i3-3110M/2G/500G', N'', 3, 3, N'Cái', 8990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (363, N'Yamaha Jupiter RC FI ( Đỏ đen )', N'', 2, 6, N'Cái', 27700000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (364, N'Yamaha Nouvo SX GP 125cc 2012', N'', 2, 6, N'Cái', 17000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (365, N'Yamaha Nouvo SX RC 2013 ( Màu trắng )', N'', 2, 6, N'Cái', 34000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (366, N'Yamaha Sirius R 2010 (Trắng-Đen)', N'', 2, 6, N'Cái', 17400000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (367, N'Yamaha Sirius RC Fi 2013 ( Trắng đen )', N'', 2, 6, N'Cái', 17000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (368, N'Yamaha Sirius RC Fi 2013 ( Vàng đen )', N'', 2, 6, N'Cái', 18000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (369, N'Asus X550CA i3-3217U/2G/500G', N'', 3, 3, N'Cái', 9790000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (370, N'Ba lô du lịch The North Face', N'', 2, 1, N'Cái', 125000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (371, N'Balo du lịch sọc đứng dây xéo - TX904 - Vàng', N'', 2, 1, N'Cái', 225000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (372, N'Balo laptop chống thấm nước Targus SB162AP  15.6"', N'', 1, 1, N'Cái', 899000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (373, N'Balo laptop chống thấm nước Targus TSB226AP 15.6"', N'', 1, 1, N'Cái', 1329000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (374, N'Bàn BG05 gấp chân sắt mặt gỗ Hòa Phát', N'', 2, 10, N'Cái', 690000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (375, N'Bàn bóng bàn Bình Minh S90', N'', 2, 10, N'Cái', 3050000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (376, N'Bàn bóng bàn Bình Minh SS97', N'', 2, 10, N'Cái', 3800000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (377, N'Bàn cầu 1 khối Inax C-909VN', N'', 2, 10, N'Cái', 6080000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (378, N'Bàn cầu Inax C-504VRN màu trắng', N'', 2, 10, N'Cái', 1900000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (379, N'Acer Aspire E1 470 33212G50Dn', N'', 3, 3, N'Cái', 7990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (380, N'Bàn cầu Inax Xtreme GC-1008VN', N'', 2, 10, N'Cái', 7000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (381, N'Bàn ghế học sinh  Hòa Phát BHS03', N'', 2, 10, N'Cái', 550000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (382, N'Bàn ghế học sinh 01', N'', 2, 10, N'Cái', 1200000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (383, N'Bàn ghế học sinh 06', N'', 2, 10, N'Cái', 1200000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (384, N'Bàn ghế học sinh HBHS-05', N'', 2, 10, N'Cái', 591000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (385, N'Bàn ghế học sinh Hòa Phát BHS20', N'', 2, 10, N'Cái', 750000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (386, N'Bàn ghế học sinh, sinh viên BHS20-2', N'', 2, 10, N'Cái', 950000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (387, N'Bàn ghế mầm non B-839', N'', 2, 10, N'Cái', 650000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (388, N'Bàn ghế mẫu giáo AD12-12', N'', 2, 10, N'Cái', 650000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (389, N'Bàn ghế mẫu giáo df34', N'', 2, 10, N'Cái', 600000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (390, N'Acer Aspire E1 470 i3-3217U/2G/500G/Win8', N'', 3, 3, N'Cái', 8990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (391, N'Bàn ghế nhựa cao cấp 01', N'', 2, 10, N'Cái', 2280000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (392, N'Bàn ghế nhựa cao cấp 02', N'', 2, 10, N'Cái', 2280000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (393, N'Bàn ghế nhựa cao cấp 05', N'', 2, 10, N'Cái', 1930000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (394, N'Bàn ghế nhưa cao cấp 06', N'', 2, 10, N'Cái', 1950000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (395, N'Bàn ghế nhựa Composite B-242', N'', 2, 10, N'Cái', 650000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (396, N'Bàn Ghế nhựa Composite B-493', N'', 2, 10, N'Cái', 650000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (397, N'Bàn ghế sinh viên Hòa Phát BSV103', N'', 2, 10, N'Cái', 675000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (398, N'Bàn ghế tiểu học, THCS BHS03 - GHS03', N'', 2, 10, N'Cái', 550000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (399, N'Bàn ghế tiểu học, THCS BHS20 - GHS20', N'', 2, 10, N'Cái', 750000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (400, N'Bàn giám đốc Hòa Phát DT1890H27', N'', 2, 10, N'Cái', 2960000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (401, N'Acer Aspire E1 532 Celeron 2955U/4G/500G', N'', 3, 3, N'Cái', 7290000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (402, N'Bàn học sinh chân sắt BHS01-LG', N'', 2, 10, N'Cái', 1950000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (403, N'Bàn học sinh liền ghế có tựa HBHS-01', N'', 2, 10, N'Cái', 573000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (404, N'Bàn học sinh liền ghế có tựa HBHS-03', N'', 2, 10, N'Cái', 573000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (405, N'Bàn học sinh nội thất 190  BHS01-LV', N'', 2, 10, N'Cái', 1950000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (406, N'Bàn học sinh nội thất 190  BHS02-LG', N'', 2, 10, N'Cái', 2100000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (407, N'Bàn học sinh nội thất 190 BHS01B-LG', N'', 2, 10, N'Cái', 1750000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (408, N'Bàn nhựa cao cấp 04', N'', 2, 10, N'Cái', 2280000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (409, N'Bàn sinh viên HBSV-03', N'', 2, 10, N'Cái', 393000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (410, N'Acer Aspire E1 532 Celeron-2955U/2G/500G', N'', 3, 3, N'Cái', 7290000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (411, N'Bàn trà đa năng PT 002', N'', 2, 10, N'Gói', 7000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (412, N'Bàn trà đa năng PT 003', N'', 2, 10, N'Gói', 11360000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (413, N'Bảng chống lóa 1.2 x 1.6m', N'', 2, 10, N'Cái', 1450000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (414, N'Bảng chứng nhận, biểu trưng đồng gỗ TND - 016', N'', 2, 10, N'Cái', 12000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (415, N'Bảng fooc trắng phào to, khung nhôm dày 5cm, KT 80x120cm', N'', 2, 10, N'Cái', 400000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (416, N'Bảng foocmica khung nhôm 2cm, KT: 800x1200mm', N'', 2, 10, N'Cái', 300000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (417, N'Bảng ghim di động 1.2x1.6m', N'', 2, 10, N'Cái', 1600000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (418, N'Bảng ghim tài liệu 80x120', N'', 2, 10, N'Cái', 500000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (419, N'Bảng Mica trắng B-791', N'', 2, 10, N'Cái', 700000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (420, N'Bảng Mica trắng có khung chân di động B-311', N'', 2, 10, N'Cái', 1700000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (421, N'05420-Xe đẩy Compa 5 cấp nghiêng lưng+tấm che mưa, màu Đỏ', N'', 2, 5, N'Cái', 4350000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (422, N'Acer Aspire MC605 Intel Pentium G2030 RAM 2GB HDD 500GB (007)', N'', 1, 3, N'Cái', 6690000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (423, N'Bảng từ trắng chống lóa Hàn Quốc KT: 800x1230mm', N'', 2, 10, N'Cái', 480000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (424, N'Bảng từ trắng có khung chân 1224', N'', 2, 10, N'Cái', 1840000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (425, N'Bảng từ trắng Hàn Quốc 1.2 x 2.4m', N'', 2, 10, N'Cái', 1900000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (426, N'Bảng từ trắng Hàn Quốc di động 1.2 x 2.0m', N'', 2, 10, N'Cái', 2250000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (427, N'Bảng từ trắng Lịch Công Tác 1.2 x 2.4m', N'', 2, 10, N'Cái', 2400000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (428, N'Bảng từ xanh Hàn Quốc 1.2 x 3.6m', N'', 2, 10, N'Cái', 2350000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (429, N'Bảng viết bút dạ, bảng viết bút lông, bảng từ trắng chống lóa 1500x1230mm', N'', 2, 10, N'Cái', 900000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (430, N'Bảng viết bút dạ, bảng viết bút lông, bảng từ trắng chống lóa 1800x1230mm', N'', 2, 10, N'Cái', 1050000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (431, N'Bảng viết bút lông kT: 2000x1230mm', N'', 2, 10, N'Cái', 1150000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (432, N'Bảng viết phấn 1.2 x 2.0m', N'', 2, 10, N'Cái', 1750000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (433, N'Acer Aspire XC600 Core i3-3240 RAM 2GB HDD 500GB (011)', N'', 1, 3, N'Cái', 8190000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (434, N'Bảng viết phấn 1.2 x 2.4m', N'', 2, 10, N'Cái', 1850000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (435, N'Bảng viết phấn Hàn Quốc 1.2 x 3.6m', N'', 2, 10, N'Cái', 2350000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (436, N'Bảng viết phấn Hàn Quốc di động 1.2 x 2.4m', N'', 2, 10, N'Cái', 2250000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (437, N'Bao da nắp gập  Samsung Galaxy Tab 3 10 " Onzo', N'', 1, 3, N'Cái', 600000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (438, N'Bao da nắp gập Samsung Galaxy Tab 3 8" Baseus', N'', 1, 3, N'Cái', 550000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (439, N'Acer Aspire XC600 Intel Celeron G1610 RAM 2GB HDD 500GB (007)', N'', 1, 3, N'Cái', 5890000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (440, N'Acer Aspire XC600 Intel Celeron G1620 RAM 2GB HDD 500GB (012)', N'', 1, 3, N'Cái', 5990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (441, N'Bình thủy điện tự đun sôi Panasonic NC-HU301PHSY', N'', 1, 4, N'Cái', 2490000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (442, N'Bluray Samsung BD-ES6000', N'', 1, 3, N'Cái', 4990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (443, N'Bluray Samsung BD-F5100', N'', 1, 3, N'Cái', 1790000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (444, N'Blu-ray Samsung BD-F6500 3D', N'', 1, 3, N'Cái', 3990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (445, N'Acer Iconia A1-811 8" Quad-core 1.2GHz 5MP 3G 4960mAh 16GB', N'', 1, 3, N'Cái', 4990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (446, N'Acer Iconia B1-A71 7" Dual-core 1.2GHz 0.3MP 2700mAh 16GB', N'', 1, 3, N'Cái', 2890000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (447, N'Bộ nồi ANOD 3 chiếc màu cốm (18,22,26) SH 8835', N'', 2, 4, N'Cái', 815000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (448, N'Bộ nồi Delux 6pcs, nắp kiếng HC06DLG', N'', 2, 4, N'Cái', 945000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (449, N'Bộ nồi Goldsun CW03-3306', N'', 1, 4, N'Cái', 1990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (450, N'Bộ nồi Hàn Quốc Nissei-HAS-12P', N'', 2, 4, N'Cái', 2240000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (451, N'Bộ nồi thủy tinh Vision VS-332', N'', 2, 4, N'Cái', 2299000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (452, N'Acer Iconia B1-A71 7" Dual-core 1.2GHz 0.3MP 2700mAh 8GB', N'', 1, 3, N'Cái', 2790000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (453, N'Acer Iconia Tab (W3-810) 8.1" Intel Atom Dual-core 1.8GHz 2MP 3400mAh 32GB Windows 8', N'', 1, 3, N'Cái', 7490000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (454, N'06460-Xe đẩy Compa 5 cấp nghiêng lưng+tấm che mưa, màu Xám', N'', 2, 5, N'Cái', 4350000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (455, N'Alaska BCD-2567N 250 lít 2 cửa 2 ngăn', N'', 1, 4, N'Cái', 5390000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (456, N'Cáp cao cấp Pisen iPhone 5', N'', 1, 3, N'Cái', 199000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (457, N'Alaska BCD-3567N 350 lít 2 cửa 2 ngăn', N'', 1, 4, N'Cái', 5590000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (458, N'Case iPad 2 Ozaki vân gỗ 70', N'', 1, 9, N'Cái', 499000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (459, N'Chậu rửa âm mặt đá đôi Cavallo CA-775', N'', 2, 4, N'Cái', 6200000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (460, N'Chậu rửa bát Malloca MS 1001', N'', 2, 4, N'Cái', 2050000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (461, N'Chậu rửa bát Malloca MS 1005', N'', 2, 4, N'Cái', 2880000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (462, N'Chậu rửa bát Malloca MS 8804', N'', 2, 4, N'Cái', 5800000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (463, N'Chậu rửa Cavallo CA-PDS610-54', N'', 2, 4, N'Cái', 4950000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (464, N'Alaska BCD-4567N 450 lít 2 cửa 2 ngăn', N'', 1, 4, N'Cái', 6990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (465, N'Chậu rửa Cavallo CA-PDS620', N'', 2, 4, N'Cái', 8100000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (466, N'Chậu rửa Cavallo CA-PDS621', N'', 2, 4, N'Cái', 8900000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (467, N'Chậu rửa đôi Cavallo CA-PDS620', N'', 2, 4, N'Cái', 8099119.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (468, N'Chậu rửa đôi Cavallo CA-PDS621', N'', 2, 4, N'Cái', 8879119.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (469, N'Chậu rửa đôi Cavallo CA-V870', N'', 2, 4, N'Cái', 3330000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (470, N'Chậu rửa đơn Cavallo CA-V810', N'', 2, 4, N'Cái', 5250000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (471, N'Chậu rửa Inox SH 1HB790', N'', 2, 4, N'Cái', 390000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (472, N'Chậu rửa inox SH 2H1B - 1200', N'', 2, 4, N'Cái', 790000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (473, N'CHẬU RỬA INOX TÂN Á', N'', 2, 4, N'Cái', 520000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (474, N'Chậu rửa Inox Teka BE 2B 845', N'', 2, 4, N'Cái', 6400000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (475, N'Alaska BCD-5567N 550 lít 2 cửa 2 ngăn', N'', 1, 4, N'Cái', 9090000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (476, N'Chậu rửa Malloca MS 1009', N'', 2, 4, N'Cái', 2600000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (477, N'Chậu rửa Malloca MS 1027 cánh phải', N'', 2, 4, N'Cái', 4180000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (478, N'Album cưới khu du lịch Bò Cạp Vàng 1 (khổ 30 x 30 - 30 trang)', N'', 2, 5, N'Lượt', 6000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (479, N'Chương trình du lịch Siem Rep - Phnom Penh 4 ngày 3 đêm', N'', 2, 5, N'Lượt', 2800000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (480, N'Ấm đun nước điện inox Sunhouse SH-KS450E, 4.5L, Inox cao cấp, nấu bằng điện', N'', 1, 4, N'Cái', 390000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (481, N'Củ sen tắm CA01C (INOX 304)', N'', 2, 4, N'Cái', 5610000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (482, N'Daikin FTKD25GVM 1 Hp Inverter', N'', 1, 4, N'Cái', 9290000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (483, N'Daikin FTKD25GVMV 1 Hp Inverter', N'', 1, 4, N'Cái', 10990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (484, N'Daikin FTKD35GVM 1.5 Hp Inverter', N'', 1, 4, N'Cái', 11890000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (485, N'Daikin FTKD35GVMV 1.5 Hp Inverter', N'', 1, 4, N'Cái', 11890000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (486, N'âm Electrolux EGG7420K mặt kiếng chịu lực', N'', 1, 4, N'Cái', 3390000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (487, N'06840-Xe đẩy Compa 5 cấp nghiêng lưng+tấm che mưa, màu Xanh dương', N'', 2, 5, N'Cái', 4350000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (488, N'âm Sunhouse nhập khẩu SHB-6636 mặt kính cường lực', N'', 1, 4, N'Cái', 3690000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (489, N'Dell E1713S 17-inch LCD', N'', 1, 3, N'Cái', 2290000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (490, N'Dell E1914H 18.5-inch LCD', N'', 1, 3, N'Cái', 2190000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (491, N'Dell Inspiron 15R N5110 (Intel Core...', N'', 2, 3, N'Cái', 9800000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (492, N'Dell Inspiron 5437 Core i7-4500U 14.0" RAM 8GB HDD 1TB NVIDIA® GeForce® GT 750M 2GB (1405594)', N'', 1, 3, N'Cái', 19990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (493, N'Dell Inspiron 660MT Intel Pentium G2030 RAM 2GB HDD 500GB (1403005)', N'', 1, 3, N'Cái', 7490000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (494, N'Dell Inspiron 7537 Core i5-4200U 15.6" RAM 6GB HDD 500GB Card NVIDIA® GeForce® GT 750M 2 GB', N'', 1, 3, N'Cái', 17590000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (495, N'Dell Streak Pro D43 (GS01)', N'', 2, 3, N'Cái', 2400000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (496, N'Dell Vostro 2420 - i3 2348M/R2GB/500GB/14"', N'', 3, 3, N'Cái', 9390000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (497, N'Ảnh cưới Khu du lịch Bò Cạp Vàng 3', N'', 2, 5, N'Lượt', 6000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (498, N'Dell Vostro 270MT Intel Pentium G2030 RAM 2GB HDD 500GB (T222703MUDDDR)', N'', 1, 3, N'Cái', 7490000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (499, N'Dell Vostro 270SFF Intel core i3-3240 RAM 2GB HDD 500GB (T222707SUDDDR)', N'', 1, 3, N'Cái', 8690000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (500, N'Dell Vostro 3460 (34RH41) (Intel Core...', N'', 2, 3, N'Cái', 13090000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (501, N'Dell Vostro 3560 (Intel Core i5-3210M...', N'', 2, 3, N'Cái', 12190000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (502, N'Đèn bàn học Eco Icare Philips V102', N'', 2, 4, N'Cái', 550000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (503, N'Ảnh cưới Khu du lịch Bò Cạp Vàng 4', N'', 2, 5, N'Lượt', 6000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (504, N'Điện thoại iPhone 5C 16GB 4" Dual-core 1.3GHz 8.0 MP 1507mAh', N'', 1, 3, N'Cái', 13990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (505, N'Ảnh cưới Khu du lịch Bò Cạp Vàng 6', N'', 2, 5, N'Lượt', 6000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (506, N'Áo bóng đá Arsenal', N'', 2, 1, N'Cái', 70000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (507, N'Du lịch đất nước Chùa Vàng Myanmar 4 ngày 3 đêm MYA-01VN', N'', 2, 5, N'Lượt', 13190000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (508, N'Du lịch Hạ Long - Cát Bà - Vịnh Lan Hạ 4 ngày 3 đêm', N'', 2, 5, N'Lượt', 1565000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (509, N'Du lịch Hà Nội - Hạ Long - Yên Tử - Ninh Bình, thứ 4 hàng tuần', N'', 2, 5, N'Lượt', 3180000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (510, N'Du lịch Hà Nội - Hạ Long - Yên Tử - Sapa, thứ 4 hàng tuần', N'', 2, 5, N'Lượt', 5290000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (511, N'Du lịch Hà Nội - Yên Tử - Hạ Long, thứ 4 hàng tuần', N'', 2, 5, N'Lượt', 2380000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (512, N'Du lịch Nam Ninh - Quảng Châu - Thẩm Quyến 5 ngày 4 đêm', N'', 2, 5, N'Lượt', 5649000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (513, N'Du Lịch Sa Pa bằng tàu (2 ngày 3 đêm - khởi hành hàng ngày)', N'', 2, 5, N'Lượt', 2540000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (514, N'Du lịch Thái Lan - Pattaya - Buffet 86 tầng 5 ngày 4 đêm', N'', 2, 5, N'Lượt', 7910000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (515, N'Áo bóng đá Barca', N'', 2, 1, N'Cái', 70000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (516, N'Du lịch Thái Lan hàng tuần 6 ngày 5 đêm', N'', 2, 5, N'Lượt', 6980000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (517, N'Áo bóng đá Barca sân khách 2013-2014', N'', 2, 1, N'Cái', 95000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (518, N'Đứng remote Panasonic F409KB', N'', 1, 4, N'Cái', 2490000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (519, N'DVD Sony DVP-NS758HP', N'', 1, 3, N'Cái', 1690000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (520, N'Electrolux EMS2347S, 23L, hâm, nấu, rã đông nhanh, công nghệ Thụy Điển', N'', 1, 4, N'Cái', 3290000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (521, N'Electrolux EWE351BA-DW Trực tiếp 3.5kW Bơm trợ lực', N'', 1, 4, N'Cái', 3390000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (522, N'Electrolux EWE451BA-DW Trực tiếp 4.5kW Bơm trợ lực', N'', 1, 4, N'Cái', 3590000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (523, N'Electrolux EWF1073 7kg, lồng ngang, giặt nước nóng', N'', 1, 4, N'Cái', 11990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (524, N'Electrolux EWF10741 7kg, lồng ngang, giặt nước nóng, quay 1000 vòng/phút', N'', 1, 4, N'Cái', 10690000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (525, N'Electrolux EWF10831 8 kg Lồng ngang', N'', 1, 4, N'Cái', 14390000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (526, N'Áo bóng đá Chelsea -1', N'', 2, 1, N'Cái', 70000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (527, N'Electrolux EWF10932 9 kg Lồng ngang', N'', 1, 4, N'Cái', 14590000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (528, N'Electrolux EWF10932S 9 kg Lồng ngang', N'', 1, 4, N'Cái', 16990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (529, N'Electrolux EWF12732 7 kg Lồng ngang', N'', 1, 4, N'Cái', 12890000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (530, N'Electrolux EWP10742 7kg Lồng ngang', N'', 1, 4, N'Cái', 12890000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (531, N'Electrolux EWP12732 7 kg Lồng ngang', N'', 1, 4, N'Cái', 12890000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (532, N'Electrolux EWP85742 7kg Lồng ngang', N'', 1, 4, N'Cái', 9890000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (533, N'Áo bóng đá Chelsea training 2013-2014', N'', 2, 1, N'Cái', 95000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (534, N'Ghế ăn Brevi có đồ chơi (xanh dương) Bre558-073', N'', 2, 10, N'Cái', 2349000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (535, N'Áo bóng đá Hà Lan trắng 2013-2014', N'', 2, 1, N'Cái', 95000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (536, N'Ghế ăn cao Brevi Convivio (Xanh lá)', N'', 2, 10, N'Cái', 3825000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (537, N'Ghế ăn có đồ chơi cho bé Brevi- Fun Rosso (Đỏ)', N'', 2, 10, N'Cái', 5850000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (538, N'Ghế ăn điều chỉnh độ cao Fisher Price Adorable Animals V8606', N'', 2, 10, N'Cái', 3690000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (539, N'Ghế ăn Summer Infant Deluxe Comfort Booster cho bé', N'', 2, 10, N'Cái', 949000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (540, N'Ghế cá nhân sinh viên G-945', N'', 2, 10, N'Cái', 550000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (541, N'Ghế cá nhân sinh viên G-962', N'', 2, 10, N'Cái', 550000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (542, N'Ghế có bàn viết cá nhân AS12-1212', N'', 2, 10, N'Cái', 450000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (543, N'Ghế Elite - Màu cam 22456NTR', N'', 2, 10, N'Cái', 6920000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (544, N'Ghế Fisher-Price 18kg 3402', N'', 2, 10, N'Cái', 1650000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (545, N'Ghế gấp GNM(I)-07-00', N'', 2, 10, N'Cái', 850000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (546, N'Áo bóng đá Liverpool sân khách 2013-2014', N'', 2, 1, N'Cái', 95000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (547, N'Ghế GO - Màu nâu 22256AHF', N'', 2, 10, N'Cái', 9450000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (548, N'Ghế gỗ ăn bột cho bé 4 cấp độ PaPa', N'', 2, 10, N'Hộp', 795000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (549, N'Ghế gỗ cao cấp cho bé G-AN4T', N'', 2, 10, N'Cái', 870000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (550, N'Ghế lưới Hòa Phát GL304', N'', 2, 10, N'Cái', 1300000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (551, N'Ghế mẫu giáo HYU7878', N'', 2, 10, N'Cái', 150000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (552, N'Ghế nhựa mầm non cao cấp B-440', N'', 2, 10, N'Cái', 170000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (553, N'Ghế nhựa mầm non G-006', N'', 2, 10, N'Cái', 170000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (554, N'Ghế Safety 1st điều chỉnh độ cao Rings NEW! (Safety 1st HC154AUM)', N'', 2, 10, N'Cái', 4150000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (555, N'Ghế Scenera - Hồng 22197ANP', N'', 2, 10, N'Cái', 3122000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (556, N'Áo bóng đá Lyon trắng 2013-2014', N'', 2, 1, N'Cái', 95000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (557, N'Giày bóng đá Adidas messi', N'', 2, 1, N'Cái', 450000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (558, N'Giày bóng đá Messi trắng xanh may đế gót, mũi', N'', 2, 1, N'Cái', 170000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (559, N'Giày bóng đá Predator da đen may hết đế', N'', 2, 1, N'Cái', 260000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (560, N'Áo bóng đá Mancity tay dài 2013-2014', N'', 2, 1, N'Cái', 95000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (561, N'Giày bóng đá Victoria 01 đen đỏ đế su may đế', N'', 2, 1, N'Cái', 180000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (562, N'Giày cỏ nhân tạo Nike Mercurial Veloce AG', N'', 2, 1, N'Cái', 2500000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (563, N'Giày cỏ tự nhiên Adidas F50 MESSI TRX FG', N'', 2, 1, N'Cái', 3000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (564, N'Giày cỏ tự nhiên Nike Ctr360 Maestri III ACC FG', N'', 2, 1, N'Cái', 3700000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (565, N'Giày cỏ tự nhiên Nike Mercurial CR Veloce FG', N'', 2, 1, N'Cái', 2200000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (566, N'Giày cỏ tự nhiên Nike Mercurial Vapor IX ACC FG', N'', 2, 1, N'Cái', 3700000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (567, N'Giày cỏ tự nhiên Nike Mercurial Veloce FG', N'', 2, 1, N'Cái', 2500000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (568, N'Giày cỏ tự nhiên Nike Mercurial Veloce IX FG', N'', 2, 1, N'Cái', 2200000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (569, N'Giày Nike Neymar 2013', N'', 2, 1, N'Cái', 180000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (570, N'Áo bóng đá Mu đỏ tay dài 2013-2014', N'', 2, 1, N'Cái', 95000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (571, N'Giày Patin Solomon 237 Đen', N'', 2, 1, N'Cái', 1050000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (572, N'Giày tennis Nam Wilson 7013', N'', 2, 1, N'Cái', 540000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (573, N'Giày trượt Patin 2 trong 1', N'', 2, 1, N'Cái', 1050000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (574, N'Giày trượt patin Càng Cua', N'', 2, 1, N'Cái', 550000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (575, N'Giày trượt Patin Flying Eagle X1 cộng', N'', 2, 1, N'Cái', 1000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (576, N'Giày trượt Patin Flying Eagle X3', N'', 2, 1, N'Cái', 1450000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (577, N'Giày trượt patin Labeda Black (V1)', N'', 2, 1, N'Cái', 1200000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (578, N'Giày trượt Patin Labeda V6', N'', 2, 1, N'Cái', 1500000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (579, N'Giày trượt Patin Long Feng 907', N'', 2, 1, N'Cái', 590000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (580, N'Áo bóng đá Tottenham trắng  2013-2014', N'', 2, 1, N'Cái', 95000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (581, N'Áo bóng đá Tottenham xanh 2013-2014', N'', 2, 1, N'Cái', 95000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (582, N'Áo choàng nữ ACD015', N'', 2, 1, N'Cái', 1550000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (583, N'Áo cưới cao cấp AV018A02', N'', 2, 1, N'Cái', 2780000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (584, N'Áo cưới cao cấp AV030E04', N'', 2, 1, N'Cái', 2860000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (585, N'Hitachi R-W660EG9 550 lít Big French 4 cửa Bạc', N'', 1, 4, N'Cái', 23090000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (586, N'Hitachi R-W660EG9 550 lít Big French 4 cửa Đen', N'', 1, 4, N'Cái', 23090000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (587, N'Hitachi R-W660FG9X 550 lít Big French 4 cửa', N'', 1, 4, N'Cái', 25590000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (588, N'Hitachi R-W660FG9X 550 lít Big French 4 cửa', N'', 1, 4, N'Cái', 25590000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (589, N'Hitachi SH20V 2000W dạng hộc chứa', N'', 1, 4, N'Cái', 2649000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (590, N'Hitachi SU20V 2000W dạng cây', N'', 1, 4, N'Cái', 2990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (591, N'Áo cưới cao cấp AV032B01', N'', 2, 1, N'Cái', 3190000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (592, N'Honda Air Blade Fi 125cc 2013 Việt Nam...', N'', 2, 6, N'Cái', 35000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (593, N'Honda Air Blade Fi 125cc 2013 Việt Nam...', N'', 2, 6, N'Cái', 35400000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (594, N'Honda Air Blade Fi 125cc 2013 Việt Nam...', N'', 2, 6, N'Cái', 36500000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (595, N'Áo cưới cao cấp AV035B01', N'', 2, 1, N'Cái', 2840000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (596, N'Honda Air Blade Fi 2011 (Trắng đỏ đen)', N'', 2, 6, N'Cái', 39000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (597, N'Honda Air Blade FI Thái', N'', 2, 6, N'Cái', 29000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (598, N'Honda Air Blade FI Thái (Cam Đen)', N'', 2, 6, N'Cái', 88000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (599, N'Honda Giorno 50cc Fi 2013 ( Màu kem )', N'', 2, 6, N'Cái', 55500000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (600, N'Honda Lead 125cc Fi 2013 ( Màu Kem)', N'', 2, 6, N'Cái', 40500000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (601, N'Honda Lead 125cc Fi 2013 ( Xanh vàng )', N'', 2, 6, N'Cái', 40500000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (602, N'Honda LEAD Ánh Vàng', N'', 2, 6, N'Cái', 38500000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (603, N'Honda SH 125i Việt Nam 2012 (Mới) Màu...', N'', 2, 6, N'Cái', 69800000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (604, N'Honda SH 150i Việt Nam 2012 (Mới) Màu...', N'', 2, 6, N'Cái', 78000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (605, N'Honda SH125 Mode 2013 Việt Nam (Màu Đen)', N'', 2, 6, N'Cái', 52500000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (606, N'Áo đấu Mancheaster đỏ 2014', N'', 2, 1, N'Cái', 90000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (607, N'Honda Vision 110cc Fi 2013 (Màu Trắng)', N'', 2, 6, N'Cái', 27200000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (608, N'Honda Vision 110cc Fi 2013 (Màu Xanh)', N'', 2, 6, N'Cái', 27200000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (609, N'‎Honda Wave 110 RSX 2012 Vành đúc (...', N'', 2, 6, N'Cái', 19500000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (610, N'Honda Wave 110 RSX 2013 (Trắng xanh đen)', N'', 2, 6, N'Cái', 19200000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (611, N'Áo khoác Blazer viền cách điệu - KA05', N'', 2, 1, N'Cái', 205000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (612, N'Áo khoác cao cấp thu đông TH Fashion - TT139', N'', 2, 1, N'Cái', 180000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (613, N'Áo khoác chấm bi TH Fashion - TT91', N'', 2, 1, N'Cái', 145000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (614, N'Hyundai DHY 6000SE', N'', 2, 7, N'Cái', 30000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (615, N'HYUNDAI HD1000', N'', 2, 7, N'Cái', 1520000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (616, N'Hyundai HD65 Dump Truck', N'', 2, 7, N'Cái', 480000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (617, N'Hyundai HD72 Dump Truck', N'', 2, 7, N'Cái', 430000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (618, N'Áo khoác da nam Hàn Quốc - NK0294 - Đỏ', N'', 2, 1, N'Cái', 240000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (619, N'HYUNDAI HD72 TRUCK', N'', 2, 7, N'Cái', 450000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (620, N'Hyundai HY 7000LE', N'', 2, 7, N'Cái', 17300000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (621, N'Hyundai mighty HD72- 3.5T Thùng mui bạt', N'', 2, 7, N'Cái', 548000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (622, N'iPad 4 Cellular 16GB/Wifi/3G', N'', 3, 3, N'Cái', 14290000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (623, N'iPad 4 Cellular 32GB/Wifi/3G', N'', 3, 3, N'Cái', 16390000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (624, N'iPad 4 Cellular 64GB/Wifi/3G', N'', 3, 3, N'Cái', 18290000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (625, N'iPad 4 Retina 9.7" Dual-Core 1.4GHz 5MP 11560mAh 32GB', N'', 1, 3, N'Cái', 12490000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (626, N'Áo khoác hươu H&M', N'', 2, 1, N'Cái', 450000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (627, N'iPad 4 Retina 9.7" Dual-Core 1.4GHz 5MP 3G 11560mAh 16GB', N'', 1, 3, N'Cái', 14790000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (628, N'iPad 4 Retina 9.7" Dual-Core 1.4GHz 5MP 3G 11560mAh 32GB', N'', 1, 3, N'Cái', 16990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (629, N'iPad Air 9.7'''' Dual-core 1.4Ghz 5MP 4G 8827mAh 16GB', N'', 1, 3, N'Cái', 16990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (630, N'iPad Mini 7.9" Dual-core 1GHz 5MP 32GB 4440mAh', N'', 1, 3, N'Cái', 11450000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (631, N'iPad Mini 7.9" Dual-core 1GHz 5MP 3G 4400mAh 16GB', N'', 1, 3, N'Cái', 11289000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (632, N'iPad Mini 7.9" Dual-core 1GHz 5MP 3G 4400mAh 32GB', N'', 1, 3, N'Cái', 13389000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (633, N'iPad Mini 7.9" Dual-core 1GHz 5MP 4400mAh 16GB', N'', 1, 3, N'Cái', 7790000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (634, N'iPad Mini Cellular - 16GB/3G/Wifi', N'', 3, 3, N'Cái', 10990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (635, N'iPad Mini Cellular 32GB/Wifi/3G', N'', 3, 3, N'Cái', 12890000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (636, N'iPad mini Cellular 64GB/Wifi/3G', N'', 3, 3, N'Cái', 15690000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (637, N'Áo khoác nam 2 khóa kéo TH Fashion - TT92', N'', 2, 1, N'Cái', 155000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (638, N'IPad NXI-IPD234', N'', 1, 3, N'Cái', 799000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (639, N'iPhone 4S 16GB 3.5'''' Dual-core 8MP 1420mAh', N'', 1, 3, N'Cái', 14490000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (640, N'iPhone 4S 8GB', N'', 3, 3, N'Cái', 10990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (641, N'iPhone 5 16GB', N'', 3, 3, N'Cái', 16990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (642, N'iPhone 5 16GB 4.0'''' Dual-core 1.2GHz 8MP 1440mAh', N'', 1, 3, N'Cái', 16990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (643, N'iPhone 5 32GB', N'', 3, 3, N'Cái', 17990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (644, N'iPhone 5 32GB 4.0'''' Dual-core 1.2GHz 8MP 1440mAh', N'', 1, 3, N'Cái', 18850000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (645, N'iPhone 5C 16GB', N'', 3, 3, N'Cái', 13990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (646, N'iPhone 5C 32GB', N'', 3, 3, N'Cái', 15990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (647, N'iPhone 5S 16GB', N'', 3, 3, N'Cái', 17590000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (648, N'Áo khoác nam BKE4 - N51', N'', 2, 1, N'Cái', 2000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (649, N'iPhone 5S 16GB 4" Dual-core 1.3GHz 8MP 1560mAh', N'', 1, 3, N'Cái', 17590000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (650, N'iPhone 5S 32GB 4" Dual-core 1.3GHz 8MP 1560mAh', N'', 1, 3, N'Cái', 19890000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (651, N'Áo khoác nam kiểu dáng thể thao', N'', 2, 1, N'Cái', 240000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (652, N'14382-Xe đẩy Graco LiteRider Stroller, Zooland', N'', 2, 5, N'Cái', 2900000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (653, N'Áo khoác nam phối túi TH Fashion - TT110', N'', 2, 1, N'Cái', 150000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (654, N'Kem chăm sóc da thâm quầng vùng mắt Eyecircle', N'', 2, 2, N'Cái', 1021000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (655, N'Kem dành cho vùng nứt gót chân - khô đầu gối, da chân - Hiệu quả trong 3 ngày Feet & Heel', N'', 2, 2, N'Cái', 379000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (656, N'Kem đánh răng lô hội 130g', N'', 2, 2, N'Cái', 100000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (657, N'Áo khoác nữ AK068', N'', 2, 1, N'Cái', 1000000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (658, N'Kem Đêm trắng sáng Da Whitening - 50ml - Perfecta Fair Beauty', N'', 2, 2, N'Cái', 550000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (659, N'Kem dưỡng ẩm dành cho da khô - Dry Skin Lotion', N'', 2, 2, N'Cái', 568000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (660, N'Kem dưỡng ẩm dành cho da nhạy cảm - Sensitive Skin Cream', N'', 2, 2, N'Cái', 568000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (661, N'Kem dưỡng da 8 in 1 Yeshoo YH-09', N'', 2, 2, N'Cái', 280000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (662, N'Kem dưỡng trắng da chống nám - tàn nhang (25g)', N'', 2, 2, N'Cái', 300000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (663, N'Kem dưỡng trắng da mặt mờ thâm sáng da Z9 15G', N'', 2, 2, N'Cái', 150000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (664, N'Kem dưỡng trắng da Skin Doctors SD White', N'', 2, 2, N'Cái', 1899000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (665, N'Kem nở ngực Touch Me Breast Enlarging Cream', N'', 2, 2, N'Cái', 550000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (666, N'Kem phấn chống nắng dưỡng da SPF 15 0313122', N'', 2, 2, N'Cái', 700000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (667, N'Kem se lỗ chân lông - chống nhờn cc07', N'', 2, 2, N'Cái', 1250000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (668, N'Áo khoác nữ dáng dài AC3006', N'', 2, 1, N'Cái', 12000001.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (669, N'Áo khoác nữ dáng dài AC3016', N'', 2, 1, N'Cái', 15000001.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (670, N'LED Samsung UA46F7500 46 inches Full HD Smart TV 3D CMR 800 Hz', N'', 1, 3, N'Cái', 46990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (671, N'LED Samsung UA55F6300 55 inches Full HD Smart TV CMR 200 Hz', N'', 1, 3, N'Cái', 40990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (672, N'LED Samsung UA55F6800 55 inches Full HD Smart TV 3D CMR 500 Hz', N'', 1, 3, N'Cái', 40990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (673, N'Áo khoác nữ dáng ngắn AK3023', N'', 2, 1, N'Cái', 8500001.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (674, N'LED Samsung UA55F7500 55 inches Full HD Smart TV 3D CMR 800 Hz', N'', 1, 3, N'Cái', 69900000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (675, N'LED Sony KDL-46W904A 46 inches Full HD Smart TV 3D Motionflow™ XR 800 Hz', N'', 1, 3, N'Cái', 47900000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (676, N'LED Sony KDL-55HX855 55 inches Full HD Smart TV 3D Motionflow™ XR 800 Hz', N'', 1, 3, N'Cái', 38890000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (677, N'LED Sony KDL-55W904A 55 inches Full HD Smart TV 3D Motionflow™ XR 800 Hz', N'', 1, 3, N'Cái', 49900000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (678, N'LED Sony KDL-55W954A 55 inches Full HD Smart TV 3D Motionflow™ XR 800 Hz', N'', 1, 3, N'Cái', 59900000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (679, N'Lenovo G400 Pentium 2020M/2G/500G', N'', 3, 3, N'Cái', 7090000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (680, N'Lenovo G400s i3-3110M/2G/500G', N'', 3, 3, N'Cái', 8590000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (681, N'Lenovo H520s 57310759 Intel Core i3-3220 RAM 4GB HDD 500GB (57310759)', N'', 1, 3, N'Cái', 8590000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (682, N'Lenovo P780', N'', 2, 3, N'Cái', 5190000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (683, N'Lenovo Yoga 11s Intel Core i3-3229Y 11.6" RAM 4GB SSD 128GB Windows 8 (375039)', N'', 1, 3, N'Cái', 20990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (684, N'Áo khoác voan tay lửng cá tính - AO1320 - Trắng', N'', 2, 1, N'Cái', 195000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (685, N'Áo len nam KC69', N'', 2, 1, N'Cái', 260000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (686, N'Áo len nữ AL3048', N'', 2, 1, N'Cái', 650000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (687, N'Loa Sony SS-CRP3M và Amply Sony STR-K3SW 5.2 kênh 1200W', N'', 1, 3, N'Cái', 11990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (688, N'Loa Sony SS-CRP7M và Amply Sony STR-K7SW 7.2 kênh 2012W', N'', 1, 3, N'Cái', 16890000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (689, N'Áo len nữ AL3072', N'', 2, 1, N'Cái', 700000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (690, N'Áo Mancherter Xanh đen 2013-2014', N'', 2, 1, N'Cái', 90000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (691, N'69075 - Nôi bọc vải 3 tầng (Rings)', N'', 2, 5, N'Cái', 4890000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (692, N'Áo Manchester United đỏ 2013', N'', 2, 1, N'Cái', 70000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (693, N'Mainboard Asus (P4SGL-VM) 845 Socket 478', N'', 2, 3, N'Cái', 240000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (694, N'Áo mưa Vietcombank', N'', 2, 1, N'Cái', 25000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (695, N'Áo mưa xi măng Chinfon', N'', 2, 1, N'Cái', 25000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (696, N'Áo mưa Yamaha', N'', 2, 6, N'Cái', 25000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (697, N'Máy ảnh KTS Samsung DV300F', N'', 1, 3, N'Cái', 3499000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (698, N'Máy ảnh KTS Samsung EC-MV800ZBDBVN', N'', 1, 3, N'Cái', 3999000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (699, N'Máy ảnh KTS Samsung MV 900F', N'', 1, 3, N'Cái', 4699000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (700, N'Máy ảnh KTS Samsung ST66 Đen', N'', 1, 3, N'Cái', 1899000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (701, N'Máy ảnh KTS Samsung ST77 Black 16.1 megapixels | 2.7″ screen | 26 – 130 mm (5×)', N'', 1, 3, N'Cái', 2190000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (702, N'Máy ảnh KTS Samsung WB150F Black', N'', 1, 3, N'Cái', 4899000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (703, N'Máy ảnh KTS Sony DSC-W710 Black', N'', 1, 3, N'Cái', 2290000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (704, N'Máy ảnh KTS Sony DSC-W730', N'', 1, 3, N'Cái', 2668000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (705, N'Áo phao cứu hộ Thái Sơn AP01', N'', 2, 1, N'Cái', 50000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (706, N'Máy ảnh KTS Sony DSC-WX200', N'', 1, 3, N'Cái', 5399000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (707, N'Máy ảnh Sony Alpha A7R', N'', 1, 3, N'Cái', 64999000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (708, N'Áo Real trắng 2013', N'', 2, 1, N'Cái', 70000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (709, N'Áo sơ mi nam họa tiết cá tính - NM318 - Tím', N'', 2, 1, N'Cái', 255000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (710, N'Máy bơm nước Panasonic GP-129JX (bơm đẩy cao)', N'', 2, 4, N'Cái', 866000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (711, N'Máy bơm Panasonic A-200JAK', N'', 2, 4, N'Cái', 1382000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (712, N'Máy bơm PANASONIC GP-200JXK', N'', 2, 4, N'Cái', 1057000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (713, N'Áo sơ mi nữ AT026', N'', 2, 1, N'Cái', 245000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (714, N'Áo sơ mi nữ AT030', N'', 2, 1, N'Cái', 235000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (715, N'Áo sơ mi nữ AT036', N'', 2, 1, N'Cái', 245000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (716, N'Máy phát điện Hyundai DHY2500LE', N'', 2, 7, N'Cái', 11500000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (717, N'69704-Xe tập đi Dream On Me 2 trong 1 (Hồng)', N'', 2, 5, N'Cái', 2730000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (718, N'Áo thun ba lỗ nam màu sắc cute - NB046 - Vàng', N'', 2, 1, N'Cái', 130000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (719, N'Máy phát điện HYUNDAI HY2500L', N'', 2, 7, N'Cái', 8990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (720, N'Máy sấy Electrolux EDV600', N'', 1, 4, N'Cái', 7890000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (721, N'Máy sấy Electrolux EDV705G', N'', 1, 4, N'Cái', 7690000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (722, N'Áo thun ba lỗ nam màu sắc cute - NB046 - Xanh', N'', 2, 1, N'Cái', 130000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (723, N'Máy xay ép đa năng Panasonic MJ-M176PWRA, xay sinh tố, ép trái cây, xay khô', N'', 1, 4, N'Cái', 2390000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (724, N'Máy xay sinh tố Philips HR2096, 2L, cối thủy tinh dày, xay sinh tố, xay khô, xay đá, xay thịt', N'', 1, 4, N'Cái', 3349000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (725, N'Máy xay sinh tố Philips HR2118, 1.5L, xay sinh tố, xay thịt, xay khô', N'', 1, 4, N'Cái', 2090000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (726, N'Máy xay thức ăn mini Philips Avent SCF860/20', N'', 2, 4, N'Cái', 1818750.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (727, N'Máy xông mũi họng Philips - AeroFamily', N'', 2, 4, N'Cái', 830000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (728, N'Áo thun body rằn ri cao cấp - 200035', N'', 2, 1, N'Cái', 155000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (729, N'Miếng dán Film điện thoại', N'', 3, 9, N'Cái', 50000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (730, N'Miếng dán Film trong Laptop', N'', 3, 9, N'Cái', 100000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (731, N'Miếng dán Film trong Laptop 17 inches', N'', 1, 9, N'Cái', 249000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (732, N'Miếng dán Film trong máy tính bảng', N'', 3, 9, N'Cái', 75000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (733, N'Miếng dán màn hình', N'', 3, 9, N'Cái', 50000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (734, N'Miếng dán màn hình Chống vân tay iPad 2 THV', N'', 3, 9, N'Cái', 75000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (735, N'Miếng dán màn hình điện thoại', N'', 1, 9, N'Cái', 49000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (736, N'Miếng dán màn hình iPad', N'', 3, 9, N'Cái', 75000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (737, N'Áo thun body rằn ri cao cấp - 200036', N'', 2, 1, N'Cái', 155000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (738, N'Miếng dán màn hình iPad 2', N'', 3, 9, N'Cái', 75000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (739, N'Miếng dán màn hình iPad 2,3,4 trong chống vân tay', N'', 1, 9, N'Cái', 99000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (740, N'Miếng dán màn hình Ipad chống vân tay', N'', 1, 9, N'Cái', 99000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (741, N'Miếng dán màn hình Iphone 4', N'', 3, 3, N'Cái', 100000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (742, N'Miếng dán màn hình iPhone 5', N'', 3, 3, N'Cái', 100000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (743, N'Miếng dán màn hình iPhone 5C', N'', 3, 3, N'Cái', 50000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (744, N'Miếng dán màn hình iPhone 5S', N'', 3, 3, N'Cái', 100000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (745, N'Miếng dán màn hình Laptop', N'', 3, 9, N'Cái', 100000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (746, N'Miếng dán màn hình laptop chống vân tay 17 inches', N'', 1, 9, N'Cái', 149000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (747, N'Miếng dán màn hình Note 3', N'', 3, 9, N'Cái', 50000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (748, N'Áo thun nam 010 10002', N'', 2, 1, N'Cái', 85000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (749, N'Áo thun nam cổ tròn Hollister HO-06', N'', 2, 1, N'Cái', 100000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (750, N'MP3 Sony Walkman NWZ-B173F/B 4Gb Đen', N'', 1, 3, N'Cái', 1490000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (751, N'MP3 Sony Walkman NWZ-B173F/L 4Gb Xanh Dương', N'', 1, 3, N'Cái', 1490000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (752, N'Áo thun nam ôm body cá tính - NT760 - Đen', N'', 2, 1, N'Cái', 155000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (753, N'Áo thun nam YSL - Trắng  A-941', N'', 2, 1, N'Cái', 170000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (754, N'Áo thun nữ cổ tim dễ thương - AX1772 - Đen', N'', 2, 1, N'Cái', 150000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (755, N'Nôi 2 tầng Graco, màu nâu hồng 047406115204', N'', 2, 5, N'Cái', 3250000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (756, N'Nồi áp suất điện tử Supor CYSB50YC11VN-100', N'', 1, 4, N'Cái', 1990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (757, N'Nôi em bé - nôi trẻ em 3 trong 1 7418', N'', 2, 5, N'Cái', 1980000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (758, N'Nôi giường (2 tầng tự động) NG - 27', N'', 2, 5, N'Cái', 1180000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (759, N'Nôi gỗ 80x120cm ND0029', N'', 2, 5, N'Cái', 1649000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (760, N'Áo thun nữ tay dài cá tính - AX1737 - kem', N'', 2, 1, N'Cái', 165000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (761, N'Nôi Gỗ Đại (màu trắng - 2 tầng tự động) GO - TR - 36', N'', 2, 5, N'Cái', 2990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (762, N'Nôi gỗ đại (màu tự nhiên - 2 tầng tự động) GO - TN - 36', N'', 2, 5, N'Cái', 2800000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (763, N'Nôi gỗ hai tầng cao cấp 5 Sao', N'', 2, 5, N'Cái', 3860000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (764, N'Nồi Jumbo quai Ý Happy Cook N30-3D', N'', 2, 4, N'Cái', 610000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (765, N'Nôi ru Long Hưng gỗ đại ( nâu cánh gián - 2 tầng tự động) GO - CD - 36', N'', 2, 5, N'Cái', 2949000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (766, N'Nồi ủ chân không Thermos 4,5 lít...', N'', 2, 4, N'Cái', 3800000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (767, N'Nồi Zwilling J.A Henckels Classic 8.5 lít', N'', 2, 4, N'Cái', 3025000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (768, N'Nokia Lumia 1020', N'', 3, 3, N'Cái', 14990000.0000, N'', 1)
GO
INSERT [Products] ([ProductID], [ProductName], [ProductDescription], [SupplierID], [CategoryID], [Unit], [Price], [Photo], [IsSelling]) VALUES (769, N'Nokia Lumia 1020 4.5'''' Dual-core 1.5GHz 41MP 2000mAh', N'', 1, 3, N'Cái', 14990000.0000, N'', 1)
GO
SET IDENTITY_INSERT [Products] OFF
GO


INSERT [Provinces] ([ProvinceName]) VALUES (N'An Giang')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Bà Rịa - Vũng Tàu')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Bắc Giang')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Bắc Kạn')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Bạc Liêu')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Bắc Ninh')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Bến Tre')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Bình Định')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Bình Dương')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Bình Phước')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Bình Thuận')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Cà Mau')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Cần Thơ')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Cao Bằng')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Đà Nẵng')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Đắk Lắk')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Đắk Nông')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Điện Biên')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Đồng Nai')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Đồng Tháp')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Gia Lai')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Hà Giang')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Hà Nam')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Hà Nội')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Hà Tĩnh')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Hải Dương')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Hải Phòng')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Hậu Giang')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Hòa Bình')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Hưng Yên')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Khánh Hòa')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Kiên Giang')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Kon Tum')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Lai Châu')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Lâm Đồng')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Lạng Sơn')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Lào Cai')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Long An')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Nam Định')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Nghệ An')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Ninh Bình')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Ninh Thuận')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Phú Thọ')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Phú Yên')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Quảng Bình')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Quảng Nam')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Quảng Ngãi')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Quảng Ninh')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Quảng Trị')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Sóc Trăng')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Sơn La')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Tây Ninh')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Thái Bình')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Thái Nguyên')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Thanh Hóa')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Thành phố Hồ Chí Minh')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Thừa Thiên Huế')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Tiền Giang')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Trà Vinh')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Tuyên Quang')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Vĩnh Long')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Vĩnh Phúc')
GO
INSERT [Provinces] ([ProvinceName]) VALUES (N'Yên Bái')
GO


SET IDENTITY_INSERT [Shippers] ON 
GO
INSERT [Shippers] ([ShipperID], [ShipperName], [Phone]) VALUES (1, N'Giao hàng Tiết kiệm', N'0234.3.882.111')
GO
INSERT [Shippers] ([ShipperID], [ShipperName], [Phone]) VALUES (2, N'Tín Thành', N'0234.3.822.999')
GO
INSERT [Shippers] ([ShipperID], [ShipperName], [Phone]) VALUES (3, N'Viettel Express', N'0234.3.899.555')
GO
SET IDENTITY_INSERT [Shippers] OFF
GO


SET IDENTITY_INSERT [Suppliers] ON 
GO
INSERT [Suppliers] ([SupplierID], [SupplierName], [ContactName], [Provice], [Address], [Phone], [Email]) VALUES (1, N'Công ty Xuất nhập khẩu Thành Hưng', N'Công ty Thành Hưng', N'Hà Nội', N'123 Phùng Hưng', N'0977555123', N'thanhhung@company.com')
GO
INSERT [Suppliers] ([SupplierID], [SupplierName], [ContactName], [Provice], [Address], [Phone], [Email]) VALUES (2, N'Công ty TNHH Sao Mai Việt', N'Công ty Sao Mai Việt', N'Thành phố Hồ Chí Minh', N'58 Tôn Đức Thắng', N'0914055550', N'saomaiviet@company.com')
GO
INSERT [Suppliers] ([SupplierID], [SupplierName], [ContactName], [Provice], [Address], [Phone], [Email]) VALUES (3, N'Công ty Cổ phần đầu tư và phát triển GAMZ', N'GAMZ', N'Thừa Thiên Huế', N'77 Nguyễn Huệ', N'0914172116', N'office@gamz.vn')
GO
SET IDENTITY_INSERT [Suppliers] OFF
GO


SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Customers_Email]    Script Date: 08/09/2023 4:33:55 PM ******/
ALTER TABLE [Customers] ADD  CONSTRAINT [UK_Customers_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
) ON [PRIMARY]
GO

SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Employees_Email]    Script Date: 08/09/2023 4:33:55 PM ******/
ALTER TABLE [Employees] ADD  CONSTRAINT [UK_Employees_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
) ON [PRIMARY]
GO

ALTER TABLE [Categories] ADD  CONSTRAINT [DF__Categorie__Categ__35BCFE0A]  DEFAULT (NULL) FOR [CategoryName]
GO
ALTER TABLE [Categories] ADD  CONSTRAINT [DF__Categorie__Descr__36B12243]  DEFAULT (NULL) FOR [Description]
GO
ALTER TABLE [Customers] ADD  CONSTRAINT [DF__Customers__Custo__38996AB5]  DEFAULT (NULL) FOR [CustomerName]
GO
ALTER TABLE [Customers] ADD  CONSTRAINT [DF__Customers__Conta__398D8EEE]  DEFAULT (NULL) FOR [ContactName]
GO
ALTER TABLE [Customers] ADD  CONSTRAINT [DF__Customers__Addre__3A81B327]  DEFAULT (NULL) FOR [Address]
GO
ALTER TABLE [Customers] ADD  CONSTRAINT [DF__Customers__City__3B75D760]  DEFAULT (NULL) FOR [Phone]
GO
ALTER TABLE [Employees] ADD  CONSTRAINT [DF__Employees__LastN__3F466844]  DEFAULT (NULL) FOR [FullName]
GO
ALTER TABLE [Employees] ADD  CONSTRAINT [DF__Employees__Birth__412EB0B6]  DEFAULT (NULL) FOR [BirthDate]
GO
ALTER TABLE [Employees] ADD  CONSTRAINT [DF__Employees__Photo__4222D4EF]  DEFAULT (NULL) FOR [Address]
GO
ALTER TABLE [OrderDetails] ADD  CONSTRAINT [DF__OrderDeta__Quant__48CFD27E]  DEFAULT (NULL) FOR [Quantity]
GO
ALTER TABLE [Orders] ADD  CONSTRAINT [DF__Orders__Customer__440B1D61]  DEFAULT (NULL) FOR [CustomerID]
GO
ALTER TABLE [Orders] ADD  CONSTRAINT [DF__Orders__OrderDat__45F365D3]  DEFAULT (NULL) FOR [OrderTime]
GO
ALTER TABLE [Orders] ADD  CONSTRAINT [DF__Orders__Employee__44FF419A]  DEFAULT (NULL) FOR [EmployeeID]
GO
ALTER TABLE [Orders] ADD  CONSTRAINT [DF__Orders__ShipperI__46E78A0C]  DEFAULT (NULL) FOR [ShipperID]
GO
ALTER TABLE [ProductPhotos] ADD  CONSTRAINT [DF_ProductGallery_IsHidden]  DEFAULT ((0)) FOR [IsHidden]
GO
ALTER TABLE [Products] ADD  CONSTRAINT [DF__Products__Produc__4AB81AF0]  DEFAULT (NULL) FOR [ProductName]
GO
ALTER TABLE [Products] ADD  CONSTRAINT [DF__Products__Suppli__4BAC3F29]  DEFAULT (NULL) FOR [SupplierID]
GO
ALTER TABLE [Products] ADD  CONSTRAINT [DF__Products__Catego__4CA06362]  DEFAULT (NULL) FOR [CategoryID]
GO
ALTER TABLE [Products] ADD  CONSTRAINT [DF__Products__Unit__4D94879B]  DEFAULT (NULL) FOR [Unit]
GO
ALTER TABLE [Products] ADD  CONSTRAINT [DF__Products__Price__4E88ABD4]  DEFAULT (NULL) FOR [Price]
GO
ALTER TABLE [Shippers] ADD  CONSTRAINT [DF__Shippers__Shippe__619B8048]  DEFAULT (NULL) FOR [ShipperName]
GO
ALTER TABLE [Shippers] ADD  CONSTRAINT [DF__Shippers__Phone__628FA481]  DEFAULT (NULL) FOR [Phone]
GO
ALTER TABLE [Suppliers] ADD  CONSTRAINT [DF__Suppliers__Suppl__6477ECF3]  DEFAULT (NULL) FOR [SupplierName]
GO
ALTER TABLE [Suppliers] ADD  CONSTRAINT [DF__Suppliers__Conta__656C112C]  DEFAULT (NULL) FOR [ContactName]
GO
ALTER TABLE [Suppliers] ADD  CONSTRAINT [DF__Suppliers__Addre__66603565]  DEFAULT (NULL) FOR [Address]
GO
ALTER TABLE [Suppliers] ADD  CONSTRAINT [DF__Suppliers__Phone__6A30C649]  DEFAULT (NULL) FOR [Phone]
GO

ALTER TABLE [Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Provinces] FOREIGN KEY([Province])
REFERENCES [Provinces] ([ProvinceName])
ON UPDATE CASCADE
ON DELETE SET NULL
GO

ALTER TABLE [Customers] CHECK CONSTRAINT [FK_Customers_Provinces]
GO

ALTER TABLE [OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderID])
REFERENCES [Orders] ([OrderID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO

ALTER TABLE [OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductID])
REFERENCES [Products] ([ProductID])
GO

ALTER TABLE [OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO

ALTER TABLE [Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [Customers] ([CustomerID])
GO

ALTER TABLE [Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO

ALTER TABLE [Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [Employees] ([EmployeeID])
GO

ALTER TABLE [Orders] CHECK CONSTRAINT [FK_Orders_Employees]
GO

ALTER TABLE [Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_OrderStatus] FOREIGN KEY([Status])
REFERENCES [OrderStatus] ([Status])
GO

ALTER TABLE [Orders] CHECK CONSTRAINT [FK_Orders_OrderStatus]
GO

ALTER TABLE [Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Shippers] FOREIGN KEY([ShipperID])
REFERENCES [Shippers] ([ShipperID])
GO

ALTER TABLE [Orders] CHECK CONSTRAINT [FK_Orders_Shippers]
GO

ALTER TABLE [ProductAttributes]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttributes_Products] FOREIGN KEY([ProductID])
REFERENCES [Products] ([ProductID])
GO

ALTER TABLE [ProductAttributes] CHECK CONSTRAINT [FK_ProductAttributes_Products]
GO

ALTER TABLE [ProductPhotos]  WITH CHECK ADD  CONSTRAINT [FK_ProductGallery_Products] FOREIGN KEY([ProductID])
REFERENCES [Products] ([ProductID])
GO

ALTER TABLE [ProductPhotos] CHECK CONSTRAINT [FK_ProductGallery_Products]
GO

ALTER TABLE [Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [Categories] ([CategoryID])
GO

ALTER TABLE [Products] CHECK CONSTRAINT [FK_Products_Categories]
GO

ALTER TABLE [Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [Suppliers] ([SupplierID])
GO

ALTER TABLE [Products] CHECK CONSTRAINT [FK_Products_Suppliers]
GO

ALTER TABLE [Suppliers]  WITH CHECK ADD  CONSTRAINT [FK_Suppliers_Provinces] FOREIGN KEY([Provice])
REFERENCES [Provinces] ([ProvinceName])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Suppliers] CHECK CONSTRAINT [FK_Suppliers_Provinces]
GO
