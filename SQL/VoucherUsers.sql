USE [master]
GO
/****** Object:  Database [VoucherUsers]    Script Date: 2/8/2019 5:14:17 PM ******/
CREATE DATABASE [VoucherUsers]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VoucherUsers', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLSERVER2014\MSSQL\DATA\VoucherUsers.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'VoucherUsers_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLSERVER2014\MSSQL\DATA\VoucherUsers_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [VoucherUsers] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VoucherUsers].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VoucherUsers] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VoucherUsers] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VoucherUsers] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VoucherUsers] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VoucherUsers] SET ARITHABORT OFF 
GO
ALTER DATABASE [VoucherUsers] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [VoucherUsers] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VoucherUsers] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VoucherUsers] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VoucherUsers] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VoucherUsers] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VoucherUsers] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VoucherUsers] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VoucherUsers] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VoucherUsers] SET  ENABLE_BROKER 
GO
ALTER DATABASE [VoucherUsers] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VoucherUsers] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VoucherUsers] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VoucherUsers] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VoucherUsers] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VoucherUsers] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VoucherUsers] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VoucherUsers] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VoucherUsers] SET  MULTI_USER 
GO
ALTER DATABASE [VoucherUsers] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VoucherUsers] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VoucherUsers] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VoucherUsers] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [VoucherUsers] SET DELAYED_DURABILITY = DISABLED 
GO
USE [VoucherUsers]
GO
/****** Object:  Table [dbo].[ConfirmationToken]    Script Date: 2/8/2019 5:14:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConfirmationToken](
	[tokenId] [bigint] IDENTITY(1,1) NOT NULL,
	[createdDate] [date] NULL,
	[confirmationToken] [varchar](100) NULL,
	[expiryDate] [date] NOT NULL,
	[Id] [bigint] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 2/8/2019 5:14:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[role_Id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[role_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SPRING_SESSION]    Script Date: 2/8/2019 5:14:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SPRING_SESSION](
	[PRIMARY_ID] [char](36) NOT NULL,
	[SESSION_ID] [char](36) NOT NULL,
	[CREATION_TIME] [bigint] NOT NULL,
	[LAST_ACCESS_TIME] [bigint] NOT NULL,
	[MAX_INACTIVE_INTERVAL] [int] NOT NULL,
	[EXPIRY_TIME] [bigint] NOT NULL,
	[PRINCIPAL_NAME] [varchar](100) NULL,
 CONSTRAINT [SPRING_SESSION_PK] PRIMARY KEY CLUSTERED 
(
	[PRIMARY_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SPRING_SESSION_ATTRIBUTES]    Script Date: 2/8/2019 5:14:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SPRING_SESSION_ATTRIBUTES](
	[SESSION_PRIMARY_ID] [char](36) NOT NULL,
	[ATTRIBUTE_NAME] [varchar](200) NOT NULL,
	[ATTRIBUTE_BYTES] [image] NOT NULL,
 CONSTRAINT [SPRING_SESSION_ATTRIBUTES_PK] PRIMARY KEY CLUSTERED 
(
	[SESSION_PRIMARY_ID] ASC,
	[ATTRIBUTE_NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User_Role]    Script Date: 2/8/2019 5:14:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Role](
	[user_roleId] [int] IDENTITY(1,1) NOT NULL,
	[role_Id] [int] NOT NULL,
	[Id] [bigint] NOT NULL,
 CONSTRAINT [PK__User_Rol__BE81420E9F309C89] PRIMARY KEY CLUSTERED 
(
	[user_roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/8/2019 5:14:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[firstName] [varchar](50) NOT NULL,
	[lastName] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[mobileNo] [varchar](15) NOT NULL,
	[Password] [varchar](max) NOT NULL,
	[isenabled] [bit] NOT NULL,
	[Role] [varchar](50) NULL CONSTRAINT [df_Value]  DEFAULT ('ROLE_USER'),
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_EMAIL] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [SPRING_SESSION_IX1]    Script Date: 2/8/2019 5:14:17 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [SPRING_SESSION_IX1] ON [dbo].[SPRING_SESSION]
(
	[SESSION_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [SPRING_SESSION_IX2]    Script Date: 2/8/2019 5:14:17 PM ******/
CREATE NONCLUSTERED INDEX [SPRING_SESSION_IX2] ON [dbo].[SPRING_SESSION]
(
	[EXPIRY_TIME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [SPRING_SESSION_IX3]    Script Date: 2/8/2019 5:14:17 PM ******/
CREATE NONCLUSTERED INDEX [SPRING_SESSION_IX3] ON [dbo].[SPRING_SESSION]
(
	[PRINCIPAL_NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SPRING_SESSION_ATTRIBUTES]  WITH CHECK ADD  CONSTRAINT [SPRING_SESSION_ATTRIBUTES_FK] FOREIGN KEY([SESSION_PRIMARY_ID])
REFERENCES [dbo].[SPRING_SESSION] ([PRIMARY_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SPRING_SESSION_ATTRIBUTES] CHECK CONSTRAINT [SPRING_SESSION_ATTRIBUTES_FK]
GO
ALTER TABLE [dbo].[User_Role]  WITH CHECK ADD  CONSTRAINT [FK__User_Role__role___3864608B] FOREIGN KEY([role_Id])
REFERENCES [dbo].[Role] ([role_Id])
GO
ALTER TABLE [dbo].[User_Role] CHECK CONSTRAINT [FK__User_Role__role___3864608B]
GO
/****** Object:  StoredProcedure [dbo].[usp_createConfirmationToken]    Script Date: 2/8/2019 5:14:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_createConfirmationToken]
@tokenId int NULL OUTPUT,
@createdDate Date,
@confirmationToken varchar(50),
@expiryDate Date
AS
DECLARE @Id bigint
BEGIN
	SELECT @Id = max(Id) FROM Users
	INSERT INTO ConfirmationToken(createdDate, confirmationToken, Id, expiryDate)
	VALUES(@createdDate, @confirmationToken, @Id, @expiryDate) 

	--UPDATE Users SET [isEnabled] = 1 WHERE Id = @Id


	SELECT @tokenId = SCOPE_IDENTITY()
END


GO
/****** Object:  StoredProcedure [dbo].[usp_createUsers]    Script Date: 2/8/2019 5:14:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_createUsers]
@Id bigint NULL OUTPUT,
@firstname varchar(50),
@lastname varchar(50),
@email varchar(50),
@password varchar(max),
@mobileNo varchar(15),
@isEnabled bit = 0

AS
BEGIN
	INSERT INTO Users(firstname, lastname, email, [Password], mobileNo, isEnabled)
	VALUES(@firstname, @lastname, @email, @password, @mobileNo,@isEnabled)

	SELECT @Id = SCOPE_IDENTITY()
END





GO
/****** Object:  StoredProcedure [dbo].[usp_findAllMerchant]    Script Date: 2/8/2019 5:14:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[usp_findAllMerchant]
AS
	SET NOCOUNT ON
BEGIN
	SELECT * FROM Users WHERE [Role] = 'ROLE_USER'
	RETURN @@Error
END


GO
/****** Object:  StoredProcedure [dbo].[usp_findMerchant]    Script Date: 2/8/2019 5:14:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_findMerchant]
@Id BIGINT
AS
	SET NOCOUNT ON
BEGIN
	SELECT * FROM Users WHERE Id = @Id
	RETURN @@Error
END

GO
/****** Object:  StoredProcedure [dbo].[usp_findMerchantByEmail]    Script Date: 2/8/2019 5:14:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_findMerchantByEmail]
@email varchar(50)
AS
	SET NOCOUNT ON
BEGIN
	SELECT * FROM Users Where email = @email
	RETURN @@Error
END

GO
/****** Object:  StoredProcedure [dbo].[usp_findPassword]    Script Date: 2/8/2019 5:14:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[usp_findPassword]
@email varchar(50),
@password varchar(max) OUT
AS
	SET NOCOUNT ON
BEGIN
	 SELECT @password = [Password] FROM Users WHERE email = @email
	RETURN @@Error
END




GO
/****** Object:  StoredProcedure [dbo].[usp_retriveVoucherByCode]    Script Date: 2/8/2019 5:14:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_retriveVoucherByCode]
@code varchar(50)

AS
Begin
	SELECT code,VT.typeDescription AS VoucherType, category,[Start_Date],[Expiry_Date], [status], AdditionalInfo,codeValue,VA.attributeDescription 
	FROM Voucher VC 
	LEFT JOIN VoucherType VT ON VC.voucherTypeId = VT.voucherTypeID
	LEFT JOIN Voucher_Attribute VA ON VA.AttributeId = VC.AttributeId 
	WHERE code = @code
End

GO
/****** Object:  StoredProcedure [dbo].[usp_updatePassword]    Script Date: 2/8/2019 5:14:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[usp_updatePassword]
@email varchar(50),
@password varchar(max) 
AS
	SET NOCOUNT ON
BEGIN
	UPDATE Users
	SET Password = @password
	WHERE email = @email
	 
	RETURN @@Error
END




GO
/****** Object:  StoredProcedure [dbo].[usp_updateUsers]    Script Date: 2/8/2019 5:14:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_updateUsers]
@Id BIGINT,
@firstname varchar(50),
@lastname varchar(50),
@password varchar(15),
@mobileNo varchar(15)

AS
	SET NOCOUNT ON
BEGIN
	UPDATE Users SET
		 firstname = @firstname,
		 lastname = @lastname, 
		 [password] = @password, 
		 mobileNo = @mobileNo 
	WHERE Id = @Id
	RETURN @@Error
END

GO
/****** Object:  StoredProcedure [dbo].[usp_userLogin]    Script Date: 2/8/2019 5:14:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_userLogin]
	@email varchar(50), 
	@password varchar(max)
	
	
AS
set xact_abort on 

BEGIN

--DECLARE @isEnabled bit = NULL
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT email, [Password],isEnabled FROM Users 
	WHERE email = @email AND
	[password] = @password AND isEnabled = N'True'
END

GO
USE [master]
GO
ALTER DATABASE [VoucherUsers] SET  READ_WRITE 
GO
