USE [master]
GO
/****** Object:  Database [SWP_School_Management]    Script Date: 7/29/2022 4:20:32 PM ******/
CREATE DATABASE [SWP_School_Management]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SWP_School_Management', FILENAME = N'E:\Program\MSSQL15.SQLEXPRESS\MSSQL\DATA\SWP_School_Management.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SWP_School_Management_log', FILENAME = N'E:\Program\MSSQL15.SQLEXPRESS\MSSQL\DATA\SWP_School_Management_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SWP_School_Management] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWP_School_Management].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWP_School_Management] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWP_School_Management] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWP_School_Management] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWP_School_Management] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWP_School_Management] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWP_School_Management] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SWP_School_Management] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWP_School_Management] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWP_School_Management] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWP_School_Management] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWP_School_Management] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWP_School_Management] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWP_School_Management] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWP_School_Management] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWP_School_Management] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SWP_School_Management] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWP_School_Management] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWP_School_Management] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWP_School_Management] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWP_School_Management] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWP_School_Management] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWP_School_Management] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWP_School_Management] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SWP_School_Management] SET  MULTI_USER 
GO
ALTER DATABASE [SWP_School_Management] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWP_School_Management] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWP_School_Management] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWP_School_Management] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SWP_School_Management] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SWP_School_Management] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SWP_School_Management] SET QUERY_STORE = OFF
GO
USE [SWP_School_Management]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/29/2022 4:20:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[password] [varchar](max) NOT NULL,
	[role] [varchar](10) NOT NULL,
	[user_id] [int] NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 7/29/2022 4:20:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[timetable_id] [int] NOT NULL,
	[day_slot_id] [int] NOT NULL,
	[student_id] [int] NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_Attendance] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 7/29/2022 4:20:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[class_id] [int] IDENTITY(1,1) NOT NULL,
	[class_name] [varchar](10) NOT NULL,
	[term_id] [int] NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[class_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DaySlot]    Script Date: 7/29/2022 4:20:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DaySlot](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[slot_id] [int] NOT NULL,
	[day_id] [varchar](8) NOT NULL,
 CONSTRAINT [PK_DaySlot] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slot]    Script Date: 7/29/2022 4:20:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slot](
	[slot_id] [int] NOT NULL,
	[time] [varchar](16) NOT NULL,
 CONSTRAINT [PK_Slot] PRIMARY KEY CLUSTERED 
(
	[slot_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 7/29/2022 4:20:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[student_id] [int] IDENTITY(1,1) NOT NULL,
	[student_name] [nvarchar](50) NOT NULL,
	[student_code] [varchar](10) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[address] [nvarchar](100) NULL,
	[phone] [varchar](11) NULL,
	[avatar] [varchar](max) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentClass]    Script Date: 7/29/2022 4:20:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentClass](
	[class_id] [int] NOT NULL,
	[student_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 7/29/2022 4:20:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[subject_id] [varchar](10) NOT NULL,
	[subject_des] [varchar](80) NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[subject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 7/29/2022 4:20:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[teacher_id] [int] IDENTITY(1,1) NOT NULL,
	[teacher_name] [nvarchar](20) NOT NULL,
	[address] [nvarchar](max) NULL,
	[email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[teacher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeacherClass]    Script Date: 7/29/2022 4:20:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeacherClass](
	[class_id] [int] NOT NULL,
	[teacher_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Term]    Script Date: 7/29/2022 4:20:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Term](
	[term_id] [int] IDENTITY(1,1) NOT NULL,
	[term_name] [varchar](12) NOT NULL,
	[term_start] [varchar](12) NULL,
	[team_end] [varchar](12) NULL,
	[year] [int] NOT NULL,
 CONSTRAINT [PK_Term] PRIMARY KEY CLUSTERED 
(
	[term_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Timetable]    Script Date: 7/29/2022 4:20:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timetable](
	[timetable_id] [int] IDENTITY(1,1) NOT NULL,
	[subject_id] [varchar](10) NOT NULL,
	[day_slot_id] [int] NOT NULL,
	[class_id] [int] NOT NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_Timetable] PRIMARY KEY CLUSTERED 
(
	[timetable_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [email], [password], [role], [user_id], [status]) VALUES (1, N'thongdthse161307@fpt.edu.vn', N'$2a$10$rjvncKdNNlvHfCpSMdJdsOhJ36MXx42RHKIqXfAtEme5hgeZhQnYK', N'student', 2, 1)
INSERT [dbo].[Account] ([id], [email], [password], [role], [user_id], [status]) VALUES (2, N'duongnthe153731@fpt.edu.vn', N'$2a$10$JH1F2uJJen1PhCwhh3/btukRDPXXhRjW.rd6WxRB32GXtRPGu6t8C', N'admin', NULL, 1)
INSERT [dbo].[Account] ([id], [email], [password], [role], [user_id], [status]) VALUES (4, N'hoadnt@fe.edu.vn', N'$2a$10$JH1F2uJJen1PhCwhh3/btukRDPXXhRjW.rd6WxRB32GXtRPGu6t8C', N'teacher', 1, 1)
INSERT [dbo].[Account] ([id], [email], [password], [role], [user_id], [status]) VALUES (1003, N'phuonglhk@fe.edu.vn', N'$2a$10$JH1F2uJJen1PhCwhh3/btukRDPXXhRjW.rd6WxRB32GXtRPGu6t8C', N'teacher', 3, 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Attendance] ON 

INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (1, 62, 2, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (2, 63, 8, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (3, 64, 14, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (4, 65, 20, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (5, 66, 26, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (6, 67, 32, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (7, 68, 38, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (8, 69, 44, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (9, 70, 50, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (10, 71, 56, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (11, 72, 62, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (12, 73, 68, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (13, 74, 74, 2, 1)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (14, 75, 80, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (15, 76, 86, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (16, 77, 92, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (17, 78, 98, 2, 1)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (18, 79, 104, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (19, 80, 110, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (20, 81, 116, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (21, 82, 122, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (22, 83, 128, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (23, 84, 134, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (24, 85, 140, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (25, 86, 146, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (26, 87, 152, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (27, 88, 158, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (28, 89, 164, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (29, 90, 170, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (30, 91, 176, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (31, 92, 182, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (32, 93, 188, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (33, 94, 194, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (34, 95, 200, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (35, 96, 206, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (36, 97, 212, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (37, 98, 218, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (38, 99, 224, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (39, 100, 230, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (40, 101, 236, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (41, 102, 242, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (42, 103, 248, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (43, 104, 254, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (44, 105, 260, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (45, 106, 266, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (46, 107, 272, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (47, 108, 278, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (48, 109, 284, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (49, 110, 290, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (50, 111, 296, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (51, 112, 302, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (52, 113, 308, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (53, 114, 314, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (54, 115, 320, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (55, 116, 326, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (56, 117, 332, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (57, 118, 338, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (58, 119, 344, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (59, 120, 350, 2, 2)
INSERT [dbo].[Attendance] ([id], [timetable_id], [day_slot_id], [student_id], [status]) VALUES (60, 121, 356, 2, 2)
SET IDENTITY_INSERT [dbo].[Attendance] OFF
GO
SET IDENTITY_INSERT [dbo].[Class] ON 

INSERT [dbo].[Class] ([class_id], [class_name], [term_id]) VALUES (2, N'SE1624', 1)
INSERT [dbo].[Class] ([class_id], [class_name], [term_id]) VALUES (3, N'SE1625', 1)
INSERT [dbo].[Class] ([class_id], [class_name], [term_id]) VALUES (4, N'SE1626', 1)
INSERT [dbo].[Class] ([class_id], [class_name], [term_id]) VALUES (7, N'SE1627', 1)
SET IDENTITY_INSERT [dbo].[Class] OFF
GO
SET IDENTITY_INSERT [dbo].[DaySlot] ON 

INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (1, 1, N'20220709')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (2, 2, N'20220709')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (3, 3, N'20220709')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (4, 4, N'20220709')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (5, 5, N'20220709')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (6, 6, N'20220709')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (7, 1, N'20220710')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (8, 2, N'20220710')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (9, 3, N'20220710')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (10, 4, N'20220710')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (11, 5, N'20220710')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (12, 6, N'20220710')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (13, 1, N'20220711')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (14, 2, N'20220711')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (15, 3, N'20220711')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (16, 4, N'20220711')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (17, 5, N'20220711')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (18, 6, N'20220711')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (19, 1, N'20220712')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (20, 2, N'20220712')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (21, 3, N'20220712')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (22, 4, N'20220712')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (23, 5, N'20220712')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (24, 6, N'20220712')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (25, 1, N'20220713')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (26, 2, N'20220713')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (27, 3, N'20220713')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (28, 4, N'20220713')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (29, 5, N'20220713')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (30, 6, N'20220713')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (31, 1, N'20220714')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (32, 2, N'20220714')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (33, 3, N'20220714')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (34, 4, N'20220714')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (35, 5, N'20220714')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (36, 6, N'20220714')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (37, 1, N'20220715')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (38, 2, N'20220715')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (39, 3, N'20220715')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (40, 4, N'20220715')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (41, 5, N'20220715')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (42, 6, N'20220715')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (43, 1, N'20220716')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (44, 2, N'20220716')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (45, 3, N'20220716')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (46, 4, N'20220716')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (47, 5, N'20220716')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (48, 6, N'20220716')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (49, 1, N'20220717')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (50, 2, N'20220717')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (51, 3, N'20220717')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (52, 4, N'20220717')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (53, 5, N'20220717')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (54, 6, N'20220717')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (55, 1, N'20220718')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (56, 2, N'20220718')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (57, 3, N'20220718')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (58, 4, N'20220718')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (59, 5, N'20220718')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (60, 6, N'20220718')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (61, 1, N'20220719')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (62, 2, N'20220719')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (63, 3, N'20220719')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (64, 4, N'20220719')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (65, 5, N'20220719')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (66, 6, N'20220719')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (67, 1, N'20220720')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (68, 2, N'20220720')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (69, 3, N'20220720')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (70, 4, N'20220720')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (71, 5, N'20220720')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (72, 6, N'20220720')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (73, 1, N'20220721')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (74, 2, N'20220721')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (75, 3, N'20220721')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (76, 4, N'20220721')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (77, 5, N'20220721')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (78, 6, N'20220721')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (79, 1, N'20220722')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (80, 2, N'20220722')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (81, 3, N'20220722')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (82, 4, N'20220722')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (83, 5, N'20220722')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (84, 6, N'20220722')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (85, 1, N'20220723')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (86, 2, N'20220723')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (87, 3, N'20220723')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (88, 4, N'20220723')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (89, 5, N'20220723')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (90, 6, N'20220723')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (91, 1, N'20220724')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (92, 2, N'20220724')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (93, 3, N'20220724')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (94, 4, N'20220724')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (95, 5, N'20220724')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (96, 6, N'20220724')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (97, 1, N'20220725')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (98, 2, N'20220725')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (99, 3, N'20220725')
GO
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (100, 4, N'20220725')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (101, 5, N'20220725')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (102, 6, N'20220725')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (103, 1, N'20220726')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (104, 2, N'20220726')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (105, 3, N'20220726')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (106, 4, N'20220726')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (107, 5, N'20220726')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (108, 6, N'20220726')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (109, 1, N'20220727')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (110, 2, N'20220727')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (111, 3, N'20220727')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (112, 4, N'20220727')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (113, 5, N'20220727')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (114, 6, N'20220727')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (115, 1, N'20220728')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (116, 2, N'20220728')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (117, 3, N'20220728')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (118, 4, N'20220728')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (119, 5, N'20220728')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (120, 6, N'20220728')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (121, 1, N'20220729')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (122, 2, N'20220729')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (123, 3, N'20220729')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (124, 4, N'20220729')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (125, 5, N'20220729')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (126, 6, N'20220729')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (127, 1, N'20220730')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (128, 2, N'20220730')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (129, 3, N'20220730')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (130, 4, N'20220730')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (131, 5, N'20220730')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (132, 6, N'20220730')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (133, 1, N'20220731')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (134, 2, N'20220731')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (135, 3, N'20220731')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (136, 4, N'20220731')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (137, 5, N'20220731')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (138, 6, N'20220731')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (139, 1, N'20220801')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (140, 2, N'20220801')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (141, 3, N'20220801')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (142, 4, N'20220801')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (143, 5, N'20220801')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (144, 6, N'20220801')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (145, 1, N'20220802')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (146, 2, N'20220802')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (147, 3, N'20220802')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (148, 4, N'20220802')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (149, 5, N'20220802')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (150, 6, N'20220802')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (151, 1, N'20220803')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (152, 2, N'20220803')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (153, 3, N'20220803')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (154, 4, N'20220803')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (155, 5, N'20220803')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (156, 6, N'20220803')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (157, 1, N'20220804')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (158, 2, N'20220804')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (159, 3, N'20220804')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (160, 4, N'20220804')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (161, 5, N'20220804')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (162, 6, N'20220804')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (163, 1, N'20220805')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (164, 2, N'20220805')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (165, 3, N'20220805')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (166, 4, N'20220805')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (167, 5, N'20220805')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (168, 6, N'20220805')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (169, 1, N'20220806')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (170, 2, N'20220806')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (171, 3, N'20220806')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (172, 4, N'20220806')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (173, 5, N'20220806')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (174, 6, N'20220806')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (175, 1, N'20220807')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (176, 2, N'20220807')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (177, 3, N'20220807')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (178, 4, N'20220807')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (179, 5, N'20220807')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (180, 6, N'20220807')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (181, 1, N'20220808')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (182, 2, N'20220808')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (183, 3, N'20220808')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (184, 4, N'20220808')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (185, 5, N'20220808')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (186, 6, N'20220808')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (187, 1, N'20220809')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (188, 2, N'20220809')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (189, 3, N'20220809')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (190, 4, N'20220809')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (191, 5, N'20220809')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (192, 6, N'20220809')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (193, 1, N'20220810')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (194, 2, N'20220810')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (195, 3, N'20220810')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (196, 4, N'20220810')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (197, 5, N'20220810')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (198, 6, N'20220810')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (199, 1, N'20220811')
GO
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (200, 2, N'20220811')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (201, 3, N'20220811')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (202, 4, N'20220811')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (203, 5, N'20220811')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (204, 6, N'20220811')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (205, 1, N'20220812')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (206, 2, N'20220812')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (207, 3, N'20220812')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (208, 4, N'20220812')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (209, 5, N'20220812')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (210, 6, N'20220812')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (211, 1, N'20220813')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (212, 2, N'20220813')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (213, 3, N'20220813')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (214, 4, N'20220813')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (215, 5, N'20220813')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (216, 6, N'20220813')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (217, 1, N'20220814')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (218, 2, N'20220814')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (219, 3, N'20220814')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (220, 4, N'20220814')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (221, 5, N'20220814')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (222, 6, N'20220814')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (223, 1, N'20220815')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (224, 2, N'20220815')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (225, 3, N'20220815')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (226, 4, N'20220815')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (227, 5, N'20220815')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (228, 6, N'20220815')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (229, 1, N'20220816')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (230, 2, N'20220816')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (231, 3, N'20220816')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (232, 4, N'20220816')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (233, 5, N'20220816')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (234, 6, N'20220816')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (235, 1, N'20220817')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (236, 2, N'20220817')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (237, 3, N'20220817')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (238, 4, N'20220817')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (239, 5, N'20220817')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (240, 6, N'20220817')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (241, 1, N'20220818')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (242, 2, N'20220818')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (243, 3, N'20220818')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (244, 4, N'20220818')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (245, 5, N'20220818')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (246, 6, N'20220818')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (247, 1, N'20220819')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (248, 2, N'20220819')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (249, 3, N'20220819')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (250, 4, N'20220819')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (251, 5, N'20220819')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (252, 6, N'20220819')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (253, 1, N'20220820')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (254, 2, N'20220820')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (255, 3, N'20220820')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (256, 4, N'20220820')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (257, 5, N'20220820')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (258, 6, N'20220820')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (259, 1, N'20220821')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (260, 2, N'20220821')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (261, 3, N'20220821')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (262, 4, N'20220821')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (263, 5, N'20220821')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (264, 6, N'20220821')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (265, 1, N'20220822')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (266, 2, N'20220822')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (267, 3, N'20220822')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (268, 4, N'20220822')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (269, 5, N'20220822')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (270, 6, N'20220822')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (271, 1, N'20220823')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (272, 2, N'20220823')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (273, 3, N'20220823')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (274, 4, N'20220823')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (275, 5, N'20220823')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (276, 6, N'20220823')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (277, 1, N'20220824')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (278, 2, N'20220824')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (279, 3, N'20220824')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (280, 4, N'20220824')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (281, 5, N'20220824')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (282, 6, N'20220824')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (283, 1, N'20220825')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (284, 2, N'20220825')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (285, 3, N'20220825')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (286, 4, N'20220825')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (287, 5, N'20220825')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (288, 6, N'20220825')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (289, 1, N'20220826')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (290, 2, N'20220826')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (291, 3, N'20220826')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (292, 4, N'20220826')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (293, 5, N'20220826')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (294, 6, N'20220826')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (295, 1, N'20220827')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (296, 2, N'20220827')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (297, 3, N'20220827')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (298, 4, N'20220827')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (299, 5, N'20220827')
GO
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (300, 6, N'20220827')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (301, 1, N'20220828')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (302, 2, N'20220828')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (303, 3, N'20220828')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (304, 4, N'20220828')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (305, 5, N'20220828')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (306, 6, N'20220828')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (307, 1, N'20220829')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (308, 2, N'20220829')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (309, 3, N'20220829')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (310, 4, N'20220829')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (311, 5, N'20220829')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (312, 6, N'20220829')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (313, 1, N'20220830')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (314, 2, N'20220830')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (315, 3, N'20220830')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (316, 4, N'20220830')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (317, 5, N'20220830')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (318, 6, N'20220830')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (319, 1, N'20220831')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (320, 2, N'20220831')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (321, 3, N'20220831')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (322, 4, N'20220831')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (323, 5, N'20220831')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (324, 6, N'20220831')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (325, 1, N'20220901')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (326, 2, N'20220901')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (327, 3, N'20220901')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (328, 4, N'20220901')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (329, 5, N'20220901')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (330, 6, N'20220901')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (331, 1, N'20220902')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (332, 2, N'20220902')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (333, 3, N'20220902')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (334, 4, N'20220902')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (335, 5, N'20220902')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (336, 6, N'20220902')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (337, 1, N'20220903')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (338, 2, N'20220903')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (339, 3, N'20220903')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (340, 4, N'20220903')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (341, 5, N'20220903')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (342, 6, N'20220903')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (343, 1, N'20220904')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (344, 2, N'20220904')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (345, 3, N'20220904')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (346, 4, N'20220904')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (347, 5, N'20220904')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (348, 6, N'20220904')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (349, 1, N'20220905')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (350, 2, N'20220905')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (351, 3, N'20220905')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (352, 4, N'20220905')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (353, 5, N'20220905')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (354, 6, N'20220905')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (355, 1, N'20220906')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (356, 2, N'20220906')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (357, 3, N'20220906')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (358, 4, N'20220906')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (359, 5, N'20220906')
INSERT [dbo].[DaySlot] ([id], [slot_id], [day_id]) VALUES (360, 6, N'20220906')
SET IDENTITY_INSERT [dbo].[DaySlot] OFF
GO
INSERT [dbo].[Slot] ([slot_id], [time]) VALUES (1, N'(7:30-9:00)')
INSERT [dbo].[Slot] ([slot_id], [time]) VALUES (2, N'(9:10-10:40)')
INSERT [dbo].[Slot] ([slot_id], [time]) VALUES (3, N'(10:50-12:20)')
INSERT [dbo].[Slot] ([slot_id], [time]) VALUES (4, N'(12:50-14:20)')
INSERT [dbo].[Slot] ([slot_id], [time]) VALUES (5, N'(14:30-16:00)')
INSERT [dbo].[Slot] ([slot_id], [time]) VALUES (6, N'(16:10-17:40)')
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([student_id], [student_name], [student_code], [email], [address], [phone], [avatar]) VALUES (2, N'Đỗ Tống Hoàng Thông', N'SE161307', N'thongdthse161307@fpt.edu.vn', N'sai gon', N'0990988231', NULL)
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
INSERT [dbo].[StudentClass] ([class_id], [student_id]) VALUES (2, 2)
INSERT [dbo].[StudentClass] ([class_id], [student_id]) VALUES (4, 2)
GO
INSERT [dbo].[Subject] ([subject_id], [subject_des]) VALUES (N'MAS301', NULL)
INSERT [dbo].[Subject] ([subject_id], [subject_des]) VALUES (N'PRJ301', N'prj')
INSERT [dbo].[Subject] ([subject_id], [subject_des]) VALUES (N'SWP391', N'application')
GO
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([teacher_id], [teacher_name], [address], [email]) VALUES (1, N'Đoàn Nguyễn Thế Hòa', N'Hồ Chí Minh', N'hoadnt@fe.edu.vn')
INSERT [dbo].[Teacher] ([teacher_id], [teacher_name], [address], [email]) VALUES (3, N'Lâm Hữu Khánh Phương', N'Biên Hòa', N'phuonglhk@fe.edu.vn')
SET IDENTITY_INSERT [dbo].[Teacher] OFF
GO
INSERT [dbo].[TeacherClass] ([class_id], [teacher_id]) VALUES (2, 1)
INSERT [dbo].[TeacherClass] ([class_id], [teacher_id]) VALUES (3, 1)
INSERT [dbo].[TeacherClass] ([class_id], [teacher_id]) VALUES (4, 1)
INSERT [dbo].[TeacherClass] ([class_id], [teacher_id]) VALUES (7, 3)
GO
SET IDENTITY_INSERT [dbo].[Term] ON 

INSERT [dbo].[Term] ([term_id], [term_name], [term_start], [team_end], [year]) VALUES (1, N'Summer2022', NULL, NULL, 2022)
INSERT [dbo].[Term] ([term_id], [term_name], [term_start], [team_end], [year]) VALUES (2, N'Fall2022', NULL, NULL, 2022)
SET IDENTITY_INSERT [dbo].[Term] OFF
GO
SET IDENTITY_INSERT [dbo].[Timetable] ON 

INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (1, N'SWP391', 3, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (2, N'SWP391', 9, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (3, N'SWP391', 15, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (4, N'SWP391', 21, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (5, N'SWP391', 27, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (6, N'SWP391', 33, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (7, N'SWP391', 39, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (8, N'SWP391', 45, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (9, N'SWP391', 51, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (10, N'SWP391', 57, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (11, N'SWP391', 63, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (12, N'SWP391', 69, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (13, N'SWP391', 75, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (14, N'SWP391', 81, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (15, N'SWP391', 87, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (16, N'SWP391', 93, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (17, N'SWP391', 99, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (18, N'SWP391', 105, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (19, N'SWP391', 111, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (20, N'SWP391', 117, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (21, N'SWP391', 123, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (22, N'SWP391', 129, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (23, N'SWP391', 135, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (24, N'SWP391', 141, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (25, N'SWP391', 147, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (26, N'SWP391', 153, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (27, N'SWP391', 159, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (28, N'SWP391', 165, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (29, N'SWP391', 171, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (30, N'SWP391', 177, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (31, N'SWP391', 183, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (32, N'SWP391', 189, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (33, N'SWP391', 195, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (34, N'SWP391', 201, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (35, N'SWP391', 207, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (36, N'SWP391', 213, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (37, N'SWP391', 219, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (38, N'SWP391', 225, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (39, N'SWP391', 231, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (40, N'SWP391', 237, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (41, N'SWP391', 243, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (42, N'SWP391', 249, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (43, N'SWP391', 255, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (44, N'SWP391', 261, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (45, N'SWP391', 267, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (46, N'SWP391', 273, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (47, N'SWP391', 279, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (48, N'SWP391', 285, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (49, N'SWP391', 291, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (50, N'SWP391', 297, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (51, N'SWP391', 303, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (52, N'SWP391', 309, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (53, N'SWP391', 315, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (54, N'SWP391', 321, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (55, N'SWP391', 327, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (56, N'SWP391', 333, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (57, N'SWP391', 339, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (58, N'SWP391', 345, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (59, N'SWP391', 351, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (60, N'SWP391', 357, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (62, N'MAS301', 2, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (63, N'MAS301', 8, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (64, N'MAS301', 14, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (65, N'MAS301', 20, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (66, N'MAS301', 26, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (67, N'MAS301', 32, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (68, N'MAS301', 38, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (69, N'MAS301', 44, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (70, N'MAS301', 50, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (71, N'MAS301', 56, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (72, N'MAS301', 62, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (73, N'MAS301', 68, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (74, N'MAS301', 74, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (75, N'MAS301', 80, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (76, N'MAS301', 86, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (77, N'MAS301', 92, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (78, N'MAS301', 98, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (79, N'MAS301', 104, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (80, N'MAS301', 110, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (81, N'MAS301', 116, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (82, N'MAS301', 122, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (83, N'MAS301', 128, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (84, N'MAS301', 134, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (85, N'MAS301', 140, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (86, N'MAS301', 146, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (87, N'MAS301', 152, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (88, N'MAS301', 158, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (89, N'MAS301', 164, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (90, N'MAS301', 170, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (91, N'MAS301', 176, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (92, N'MAS301', 182, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (93, N'MAS301', 188, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (94, N'MAS301', 194, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (95, N'MAS301', 200, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (96, N'MAS301', 206, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (97, N'MAS301', 212, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (98, N'MAS301', 218, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (99, N'MAS301', 224, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (100, N'MAS301', 230, 2, 1)
GO
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (101, N'MAS301', 236, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (102, N'MAS301', 242, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (103, N'MAS301', 248, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (104, N'MAS301', 254, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (105, N'MAS301', 260, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (106, N'MAS301', 266, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (107, N'MAS301', 272, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (108, N'MAS301', 278, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (109, N'MAS301', 284, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (110, N'MAS301', 290, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (111, N'MAS301', 296, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (112, N'MAS301', 302, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (113, N'MAS301', 308, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (114, N'MAS301', 314, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (115, N'MAS301', 320, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (116, N'MAS301', 326, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (117, N'MAS301', 332, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (118, N'MAS301', 338, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (119, N'MAS301', 344, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (120, N'MAS301', 350, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (121, N'MAS301', 356, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (124, N'PRJ301', 1, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (125, N'PRJ301', 7, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (126, N'PRJ301', 13, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (127, N'PRJ301', 19, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (128, N'PRJ301', 25, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (129, N'PRJ301', 31, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (130, N'PRJ301', 37, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (131, N'PRJ301', 43, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (132, N'PRJ301', 49, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (133, N'PRJ301', 55, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (134, N'PRJ301', 61, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (135, N'PRJ301', 67, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (136, N'PRJ301', 73, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (137, N'PRJ301', 79, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (138, N'PRJ301', 85, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (139, N'PRJ301', 91, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (140, N'PRJ301', 97, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (141, N'PRJ301', 103, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (142, N'PRJ301', 109, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (143, N'PRJ301', 115, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (144, N'PRJ301', 121, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (145, N'PRJ301', 127, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (146, N'PRJ301', 133, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (147, N'PRJ301', 139, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (148, N'PRJ301', 145, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (149, N'PRJ301', 151, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (150, N'PRJ301', 157, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (151, N'PRJ301', 163, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (152, N'PRJ301', 169, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (153, N'PRJ301', 175, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (154, N'PRJ301', 181, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (155, N'PRJ301', 187, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (156, N'PRJ301', 193, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (157, N'PRJ301', 199, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (158, N'PRJ301', 205, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (159, N'PRJ301', 211, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (160, N'PRJ301', 217, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (161, N'PRJ301', 223, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (162, N'PRJ301', 229, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (163, N'PRJ301', 235, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (164, N'PRJ301', 241, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (165, N'PRJ301', 247, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (166, N'PRJ301', 253, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (167, N'PRJ301', 259, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (168, N'PRJ301', 265, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (169, N'PRJ301', 271, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (170, N'PRJ301', 277, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (171, N'PRJ301', 283, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (172, N'PRJ301', 289, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (173, N'PRJ301', 295, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (174, N'PRJ301', 301, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (175, N'PRJ301', 307, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (176, N'PRJ301', 313, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (177, N'PRJ301', 319, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (178, N'PRJ301', 325, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (179, N'PRJ301', 331, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (180, N'PRJ301', 337, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (181, N'PRJ301', 343, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (182, N'PRJ301', 349, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (183, N'PRJ301', 355, 2, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (184, N'MAS301', 4, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (185, N'MAS301', 10, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (186, N'MAS301', 16, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (187, N'MAS301', 22, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (188, N'MAS301', 28, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (189, N'MAS301', 34, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (190, N'MAS301', 40, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (191, N'MAS301', 46, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (192, N'MAS301', 52, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (193, N'MAS301', 58, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (194, N'MAS301', 64, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (195, N'MAS301', 70, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (196, N'MAS301', 76, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (197, N'MAS301', 82, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (198, N'MAS301', 88, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (199, N'MAS301', 94, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (200, N'MAS301', 100, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (201, N'MAS301', 106, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (202, N'MAS301', 112, 3, 1)
GO
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (203, N'MAS301', 118, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (204, N'MAS301', 124, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (205, N'MAS301', 130, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (206, N'MAS301', 136, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (207, N'MAS301', 142, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (208, N'MAS301', 148, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (209, N'MAS301', 154, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (210, N'MAS301', 160, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (211, N'MAS301', 166, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (212, N'MAS301', 172, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (213, N'MAS301', 178, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (214, N'MAS301', 184, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (215, N'MAS301', 190, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (216, N'MAS301', 196, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (217, N'MAS301', 202, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (218, N'MAS301', 208, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (219, N'MAS301', 214, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (220, N'MAS301', 220, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (221, N'MAS301', 226, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (222, N'MAS301', 232, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (223, N'MAS301', 238, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (224, N'MAS301', 244, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (225, N'MAS301', 250, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (226, N'MAS301', 256, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (227, N'MAS301', 262, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (228, N'MAS301', 268, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (229, N'MAS301', 274, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (230, N'MAS301', 280, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (231, N'MAS301', 286, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (232, N'MAS301', 292, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (233, N'MAS301', 298, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (234, N'MAS301', 304, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (235, N'MAS301', 310, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (236, N'MAS301', 316, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (237, N'MAS301', 322, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (238, N'MAS301', 328, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (239, N'MAS301', 334, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (240, N'MAS301', 340, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (241, N'MAS301', 346, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (242, N'MAS301', 352, 3, 1)
INSERT [dbo].[Timetable] ([timetable_id], [subject_id], [day_slot_id], [class_id], [status]) VALUES (243, N'MAS301', 358, 3, 1)
SET IDENTITY_INSERT [dbo].[Timetable] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Account]    Script Date: 7/29/2022 4:20:32 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Account] ON [dbo].[Account]
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Attendance]    Script Date: 7/29/2022 4:20:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_Attendance] ON [dbo].[Attendance]
(
	[day_slot_id] ASC,
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DaySlot]    Script Date: 7/29/2022 4:20:32 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_DaySlot] ON [dbo].[DaySlot]
(
	[day_id] ASC,
	[slot_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentClass]    Script Date: 7/29/2022 4:20:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_StudentClass] ON [dbo].[StudentClass]
(
	[class_id] ASC,
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Timetable]    Script Date: 7/29/2022 4:20:32 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Timetable] ON [dbo].[Timetable]
(
	[class_id] ASC,
	[day_slot_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_status]  DEFAULT ((2)) FOR [status]
GO
ALTER TABLE [dbo].[Attendance] ADD  CONSTRAINT [DF_Attendance_status]  DEFAULT ((2)) FOR [status]
GO
ALTER TABLE [dbo].[Term] ADD  CONSTRAINT [DF_Term_year]  DEFAULT ((2022)) FOR [year]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_DaySlot] FOREIGN KEY([day_slot_id])
REFERENCES [dbo].[DaySlot] ([id])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_DaySlot]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Student] FOREIGN KEY([student_id])
REFERENCES [dbo].[Student] ([student_id])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Student]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Timetable] FOREIGN KEY([timetable_id])
REFERENCES [dbo].[Timetable] ([timetable_id])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Timetable]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Term] FOREIGN KEY([term_id])
REFERENCES [dbo].[Term] ([term_id])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Term]
GO
ALTER TABLE [dbo].[DaySlot]  WITH CHECK ADD  CONSTRAINT [FK_DaySlot_Slot] FOREIGN KEY([slot_id])
REFERENCES [dbo].[Slot] ([slot_id])
GO
ALTER TABLE [dbo].[DaySlot] CHECK CONSTRAINT [FK_DaySlot_Slot]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Account] FOREIGN KEY([email])
REFERENCES [dbo].[Account] ([email])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Account]
GO
ALTER TABLE [dbo].[StudentClass]  WITH CHECK ADD  CONSTRAINT [FK_StudentClass_Class] FOREIGN KEY([class_id])
REFERENCES [dbo].[Class] ([class_id])
GO
ALTER TABLE [dbo].[StudentClass] CHECK CONSTRAINT [FK_StudentClass_Class]
GO
ALTER TABLE [dbo].[StudentClass]  WITH CHECK ADD  CONSTRAINT [FK_StudentClass_Student] FOREIGN KEY([student_id])
REFERENCES [dbo].[Student] ([student_id])
GO
ALTER TABLE [dbo].[StudentClass] CHECK CONSTRAINT [FK_StudentClass_Student]
GO
ALTER TABLE [dbo].[Timetable]  WITH CHECK ADD  CONSTRAINT [FK_Timetable_Class] FOREIGN KEY([class_id])
REFERENCES [dbo].[Class] ([class_id])
GO
ALTER TABLE [dbo].[Timetable] CHECK CONSTRAINT [FK_Timetable_Class]
GO
ALTER TABLE [dbo].[Timetable]  WITH CHECK ADD  CONSTRAINT [FK_Timetable_DaySlot] FOREIGN KEY([day_slot_id])
REFERENCES [dbo].[DaySlot] ([id])
GO
ALTER TABLE [dbo].[Timetable] CHECK CONSTRAINT [FK_Timetable_DaySlot]
GO
ALTER TABLE [dbo].[Timetable]  WITH CHECK ADD  CONSTRAINT [FK_Timetable_Subject] FOREIGN KEY([subject_id])
REFERENCES [dbo].[Subject] ([subject_id])
GO
ALTER TABLE [dbo].[Timetable] CHECK CONSTRAINT [FK_Timetable_Subject]
GO
USE [master]
GO
ALTER DATABASE [SWP_School_Management] SET  READ_WRITE 
GO
