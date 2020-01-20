USE [HR439MOD]
GO

--ALTER DATABASE [HR439MOD] ADD FILEGROUP [HR439MODFG] CONTAINS MEMORY_OPTIMIZED_DATA
--ALTER DATABASE [HR439MOD] ADD FILE (name='HR439MOD_1', filename='D:\SQL2016\MSSQL13.BI1\MSSQL\DATA\HR439MOD_1') TO FILEGROUP [HR439MODFG]

/****** Object:  Table [dbo].[HR_439NSM_0552]    Script Date: 12/9/2019 12:09:11 PM ******/
DROP TABLE IF EXISTS [dbo].[HR_439NSM_0552]
GO
/****** Object:  Table [dbo].[HR_439NSM_0329]    Script Date: 12/9/2019 12:09:11 PM ******/
DROP TABLE IF EXISTS [dbo].[HR_439NSM_0329]
GO
/****** Object:  Table [dbo].[HR_439NSM_0105]    Script Date: 12/9/2019 12:09:11 PM ******/
DROP TABLE IF EXISTS [dbo].[HR_439NSM_0105]
GO
/****** Object:  Table [dbo].[HR_439NSM_0102]    Script Date: 12/9/2019 12:09:11 PM ******/
DROP TABLE IF EXISTS [dbo].[HR_439NSM_0102]
GO
/****** Object:  Table [dbo].[HR_439NSM_0094]    Script Date: 12/9/2019 12:09:11 PM ******/
DROP TABLE IF EXISTS [dbo].[HR_439NSM_0094]
GO
/****** Object:  Table [dbo].[HR_439NSM_0046]    Script Date: 12/9/2019 12:09:11 PM ******/
DROP TABLE IF EXISTS [dbo].[HR_439NSM_0046]
GO
/****** Object:  Table [dbo].[HR_439NSM_0033]    Script Date: 12/9/2019 12:09:11 PM ******/
DROP TABLE IF EXISTS [dbo].[HR_439NSM_0033]
GO
/****** Object:  Table [dbo].[HR_439NSM_0022]    Script Date: 12/9/2019 12:09:11 PM ******/
DROP TABLE IF EXISTS [dbo].[HR_439NSM_0022]
GO
/****** Object:  Table [dbo].[HR_439NSM_0019]    Script Date: 12/9/2019 12:09:11 PM ******/
DROP TABLE IF EXISTS [dbo].[HR_439NSM_0019]
GO
/****** Object:  Table [dbo].[HR_439NSM_0008]    Script Date: 12/9/2019 12:09:11 PM ******/
DROP TABLE IF EXISTS [dbo].[HR_439NSM_0008]
GO
/****** Object:  Table [dbo].[HR_439NSM_0007]    Script Date: 12/9/2019 12:09:11 PM ******/
DROP TABLE IF EXISTS [dbo].[HR_439NSM_0007]
GO
/****** Object:  Table [dbo].[HR_439NSM_0002]    Script Date: 12/9/2019 12:09:11 PM ******/
DROP TABLE IF EXISTS [dbo].[HR_439NSM_0002]
GO
/****** Object:  Table [dbo].[HR_439NSM_0001]    Script Date: 12/9/2019 12:09:11 PM ******/
DROP TABLE IF EXISTS [dbo].[HR_439NSM_0001]
GO
/****** Object:  Table [dbo].[HR_439NSM_0000]    Script Date: 12/9/2019 12:09:11 PM ******/
DROP TABLE IF EXISTS [dbo].[HR_439NSM_0000]
GO
/****** Object:  Table [dbo].[HR_439NSM_0000]    Script Date: 12/9/2019 12:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR_439NSM_0000](
 [DUMP] [nvarchar](125) NULL,
 [PERSA] [varchar](4) NULL,
 [FLAG] [varchar](4) NULL,
 [FILEDATE] [datetime] NULL,
 [FILENAME] [nvarchar](100) NULL,
 [INSERTDATE] [datetime] NULL,
 INDEX [IND_PERSA] ([PERSA])
) WITH (MEMORY_OPTIMIZED = ON, DURABILITY=SCHEMA_ONLY)
GO
/****** Object:  Table [dbo].[HR_439NSM_0001]    Script Date: 12/9/2019 12:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR_439NSM_0001](
 [DUMP] [nvarchar](451) NULL,
 [PERSA] [varchar](4) NULL,
 [FLAG] [varchar](4) NULL,
 [FILEDATE] [datetime] NULL,
 [FILENAME] [nvarchar](100) NULL,
 [INSERTDATE] [datetime] NULL,
 INDEX [IND_PERSA] ([PERSA])
) WITH (MEMORY_OPTIMIZED = ON, DURABILITY=SCHEMA_ONLY)
GO
/****** Object:  Table [dbo].[HR_439NSM_0002]    Script Date: 12/9/2019 12:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR_439NSM_0002](
 [DUMP] [nvarchar](1087) NULL,
 [PERSA] [varchar](4) NULL,
 [FLAG] [varchar](4) NULL,
 [FILEDATE] [datetime] NULL,
 [FILENAME] [nvarchar](100) NULL,
 [INSERTDATE] [datetime] NULL,
 INDEX [IND_PERSA] ([PERSA])
) WITH (MEMORY_OPTIMIZED = ON, DURABILITY=SCHEMA_ONLY)
GO
/****** Object:  Table [dbo].[HR_439NSM_0007]    Script Date: 12/9/2019 12:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR_439NSM_0007](
 [DUMP] [nvarchar](250) NULL,
 [PERSA] [varchar](4) NULL,
 [FLAG] [varchar](4) NULL,
 [FILEDATE] [datetime] NULL,
 [FILENAME] [nvarchar](100) NULL,
 [INSERTDATE] [datetime] NULL,
 INDEX [IND_PERSA] ([PERSA])
) WITH (MEMORY_OPTIMIZED = ON, DURABILITY=SCHEMA_ONLY)
GO
/****** Object:  Table [dbo].[HR_439NSM_0008]    Script Date: 12/9/2019 12:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR_439NSM_0008](
 [DUMP] [nvarchar](1783) NULL,
 [PERSA] [varchar](4) NULL,
 [FLAG] [varchar](4) NULL,
 [FILEDATE] [datetime] NULL,
 [FILENAME] [nvarchar](100) NULL,
 [INSERTDATE] [datetime] NULL,
 INDEX [IND_PERSA] ([PERSA])
) WITH (MEMORY_OPTIMIZED = ON, DURABILITY=SCHEMA_ONLY)
GO
/****** Object:  Table [dbo].[HR_439NSM_0019]    Script Date: 12/9/2019 12:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR_439NSM_0019](
 [FILENAME] [nvarchar](100) NULL,
 [FLAG] [varchar](4) NULL,
 [PERSA] [varchar](4) NULL,
 [INSERTDATEKEY] [nvarchar](34) NULL,
 [FILEDATE] [nvarchar](24) NULL,
 [DUMP200] [nvarchar](200) NULL,
 INDEX [IND_PERSA] ([PERSA])
) WITH (MEMORY_OPTIMIZED = ON, DURABILITY=SCHEMA_ONLY)
GO
/****** Object:  Table [dbo].[HR_439NSM_0022]    Script Date: 12/9/2019 12:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR_439NSM_0022](
 [DUMP] [nvarchar](400) NULL,
 [PERSA] [varchar](4) NULL,
 [FLAG] [varchar](4) NULL,
 [FILEDATE] [datetime] NULL,
 [FILENAME] [nvarchar](100) NULL,
 [INSERTDATE] [datetime] NULL,
 INDEX [IND_PERSA] ([PERSA])
) WITH (MEMORY_OPTIMIZED = ON, DURABILITY=SCHEMA_ONLY)
GO
/****** Object:  Table [dbo].[HR_439NSM_0033]    Script Date: 12/9/2019 12:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR_439NSM_0033](
 [DUMP] [nvarchar](140) NULL,
 [PERSA] [varchar](4) NULL,
 [FLAG] [varchar](4) NULL,
 [FILEDATE] [datetime] NULL,
 [FILENAME] [nvarchar](100) NULL,
 [INSERTDATE] [datetime] NULL,
 INDEX [IND_PERSA] ([PERSA])
) WITH (MEMORY_OPTIMIZED = ON, DURABILITY=SCHEMA_ONLY)
GO
/****** Object:  Table [dbo].[HR_439NSM_0046]    Script Date: 12/9/2019 12:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR_439NSM_0046](
 [FILENAME] [nvarchar](100) NULL,
 [FLAG] [varchar](4) NULL,
 [PERSA] [varchar](4) NULL,
 [INSERTDATEKEY] [nvarchar](34) NULL,
 [FILEDATE] [nvarchar](24) NULL,
 [DUMP] [nvarchar](319) NULL,
 INDEX [IND_PERSA] ([PERSA])
) WITH (MEMORY_OPTIMIZED = ON, DURABILITY=SCHEMA_ONLY)
GO
/****** Object:  Table [dbo].[HR_439NSM_0094]    Script Date: 12/9/2019 12:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR_439NSM_0094](
 [DUMP] [nvarchar](347) NULL,
 [PERSA] [varchar](4) NULL,
 [FLAG] [varchar](4) NULL,
 [FILEDATE] [datetime] NULL,
 [FILENAME] [nvarchar](100) NULL,
 [INSERTDATE] [datetime] NULL,
 INDEX [IND_PERSA] ([PERSA])
) WITH (MEMORY_OPTIMIZED = ON, DURABILITY=SCHEMA_ONLY)
GO
/****** Object:  Table [dbo].[HR_439NSM_0102]    Script Date: 12/9/2019 12:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR_439NSM_0102](
 [DUMP] [nvarchar](165) NULL,
 [PERSA] [varchar](4) NULL,
 [FLAG] [varchar](4) NULL,
 [FILEDATE] [datetime] NULL,
 [FILENAME] [nvarchar](100) NULL,
 [INSERTDATE] [datetime] NULL,
 INDEX [IND_PERSA] ([PERSA])
) WITH (MEMORY_OPTIMIZED = ON, DURABILITY=SCHEMA_ONLY)
GO
/****** Object:  Table [dbo].[HR_439NSM_0105]    Script Date: 12/9/2019 12:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR_439NSM_0105](
 [DUMP] [nvarchar](394) NULL,
 [PERSA] [varchar](4) NULL,
 [FLAG] [varchar](4) NULL,
 [FILEDATE] [datetime] NULL,
 [FILENAME] [nvarchar](100) NULL,
 [INSERTDATE] [datetime] NULL,
 INDEX [IND_PERSA] ([PERSA])
) WITH (MEMORY_OPTIMIZED = ON, DURABILITY=SCHEMA_ONLY)
GO
/****** Object:  Table [dbo].[HR_439NSM_0329]    Script Date: 12/9/2019 12:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR_439NSM_0329](
 [DUMP] [nvarchar](508) NULL,
 [PERSA] [varchar](4) NULL,
 [FLAG] [varchar](4) NULL,
 [FILEDATE] [datetime] NULL,
 [FILENAME] [nvarchar](100) NULL,
 [INSERTDATE] [datetime] NULL,
 INDEX [IND_PERSA] ([PERSA])
) WITH (MEMORY_OPTIMIZED = ON, DURABILITY=SCHEMA_ONLY)
GO
/****** Object:  Table [dbo].[HR_439NSM_0552]    Script Date: 12/9/2019 12:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR_439NSM_0552](
 [DUMP] [nvarchar](284) NULL,
 [PERSA] [varchar](4) NULL,
 [FLAG] [varchar](4) NULL,
 [FILEDATE] [datetime] NULL,
 [FILENAME] [nvarchar](100) NULL,
 [INSERTDATE] [datetime] NULL,
 INDEX [IND_PERSA] ([PERSA])
) WITH (MEMORY_OPTIMIZED = ON, DURABILITY=SCHEMA_ONLY)
GO
