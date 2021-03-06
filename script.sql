USE [master]
GO
/****** Object:  Database [test]    Script Date: 10/27/2021 10:11:19 AM ******/
CREATE DATABASE [test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'test', FILENAME = N'D:\Asp.net core\Projects\ado-net\test.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'test_log', FILENAME = N'D:\Asp.net core\Projects\ado-net\test_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [test] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [test] SET ARITHABORT OFF 
GO
ALTER DATABASE [test] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [test] SET  DISABLE_BROKER 
GO
ALTER DATABASE [test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [test] SET RECOVERY FULL 
GO
ALTER DATABASE [test] SET  MULTI_USER 
GO
ALTER DATABASE [test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [test] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [test] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'test', N'ON'
GO
ALTER DATABASE [test] SET QUERY_STORE = OFF
GO
USE [test]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [test]
GO
/****** Object:  Table [dbo].[P]    Script Date: 10/27/2021 10:11:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[P](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[uname] [nvarchar](max) NULL,
	[pass] [nvarchar](max) NULL,
	[name] [nvarchar](max) NULL,
	[family] [nvarchar](max) NULL,
	[mellicode] [numeric](18, 0) NULL,
	[mobile] [numeric](18, 0) NULL,
	[roleid] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[R]    Script Date: 10/27/2021 10:11:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[R](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[role] [nvarchar](50) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[P] ON 

INSERT [dbo].[P] ([ID], [uname], [pass], [name], [family], [mellicode], [mobile], [roleid]) VALUES (1, N'ali', N'123', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[P] ([ID], [uname], [pass], [name], [family], [mellicode], [mobile], [roleid]) VALUES (2, N'reza', N'456', NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[P] ([ID], [uname], [pass], [name], [family], [mellicode], [mobile], [roleid]) VALUES (3, N'test', N'test', NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[P] ([ID], [uname], [pass], [name], [family], [mellicode], [mobile], [roleid]) VALUES (4, N'علی', N'963', NULL, NULL, NULL, NULL, 2)
SET IDENTITY_INSERT [dbo].[P] OFF
SET IDENTITY_INSERT [dbo].[R] ON 

INSERT [dbo].[R] ([ID], [role]) VALUES (1, N'Admin')
INSERT [dbo].[R] ([ID], [role]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[R] OFF
/****** Object:  StoredProcedure [dbo].[check_permission]    Script Date: 10/27/2021 10:11:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[check_permission]
	-- Add the parameters for the stored procedure here
	@uname nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT uname,role from P join R 
	on P.roleid = R.ID
	where uname = @uname
END
GO
/****** Object:  StoredProcedure [dbo].[insert_user]    Script Date: 10/27/2021 10:11:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insert_user]
	-- Add the parameters for the stored procedure here
	@uname nvarchar(50),
	@pass nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into P(uname,pass) Values(@uname,@pass);
END

GO
/****** Object:  StoredProcedure [dbo].[is_exist]    Script Date: 10/27/2021 10:11:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[is_exist]
	-- Add the parameters for the stored procedure here
	@uname nvarchar(50),
	@pass nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT uname,pass from P where
	uname=@uname and pass=@pass;
END

GO
/****** Object:  StoredProcedure [dbo].[select_all_personels]    Script Date: 10/27/2021 10:11:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[select_all_personels]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	
SELECT [ID]
      ,[uname]
      ,[pass]
      ,[name]
      ,[family]
      ,[mellicode]
      ,[mobile]
	  ,[roleid]
  FROM [dbo].[P]


END

GO
/****** Object:  StoredProcedure [dbo].[select_user_login]    Script Date: 10/27/2021 10:11:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[select_user_login]
	-- Add the parameters for the stored procedure here
	@uname nvarchar(50),
	@pass nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT uname,pass from P where
	uname=@uname and pass=@pass;
END

GO
USE [master]
GO
ALTER DATABASE [test] SET  READ_WRITE 
GO
