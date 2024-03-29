USE [master]
GO
/****** Object:  Database [onlinebloodbank]    Script Date: 11/22/2019 5:37:22 PM ******/
CREATE DATABASE [onlinebloodbank]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'onlinebloodbank', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\onlinebloodbank.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'onlinebloodbank_log', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\onlinebloodbank_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [onlinebloodbank] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [onlinebloodbank].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [onlinebloodbank] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [onlinebloodbank] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [onlinebloodbank] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [onlinebloodbank] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [onlinebloodbank] SET ARITHABORT OFF 
GO
ALTER DATABASE [onlinebloodbank] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [onlinebloodbank] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [onlinebloodbank] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [onlinebloodbank] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [onlinebloodbank] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [onlinebloodbank] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [onlinebloodbank] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [onlinebloodbank] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [onlinebloodbank] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [onlinebloodbank] SET  ENABLE_BROKER 
GO
ALTER DATABASE [onlinebloodbank] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [onlinebloodbank] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [onlinebloodbank] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [onlinebloodbank] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [onlinebloodbank] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [onlinebloodbank] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [onlinebloodbank] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [onlinebloodbank] SET RECOVERY FULL 
GO
ALTER DATABASE [onlinebloodbank] SET  MULTI_USER 
GO
ALTER DATABASE [onlinebloodbank] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [onlinebloodbank] SET DB_CHAINING OFF 
GO
ALTER DATABASE [onlinebloodbank] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [onlinebloodbank] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [onlinebloodbank] SET DELAYED_DURABILITY = DISABLED 
GO
USE [onlinebloodbank]
GO
/****** Object:  Table [dbo].[blood_details]    Script Date: 11/22/2019 5:37:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[blood_details](
	[Id] [int] IDENTITY(1000,1) NOT NULL,
	[UserId] [int] NULL,
	[Blood_Group] [varchar](20) NOT NULL,
	[State] [varchar](30) NOT NULL,
	[Area] [varchar](30) NOT NULL,
	[Pin_Code] [int] NOT NULL,
	[Contact] [bigint] NOT NULL,
	[Status] [varchar](5) NOT NULL,
 CONSTRAINT [PK__blood_de__3214EC074E586FC5] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[faq]    Script Date: 11/22/2019 5:37:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[faq](
	[Id] [int] IDENTITY(1000,1) NOT NULL,
	[UserId] [int] NULL,
	[Questions] [varchar](500) NULL,
	[Answers] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[slot_details]    Script Date: 11/22/2019 5:37:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[slot_details](
	[Slot_id] [int] IDENTITY(1000,1) NOT NULL,
	[UserId] [int] NULL,
	[Hospital] [varchar](30) NOT NULL,
	[City] [varchar](30) NOT NULL,
	[Date_for_donating] [date] NOT NULL,
	[Time_for_donating] [varchar](20) NOT NULL,
	[FeedBack] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Slot_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[user_details]    Script Date: 11/22/2019 5:37:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user_details](
	[UserId] [int] IDENTITY(1000,1) NOT NULL,
	[First_Name] [varchar](50) NOT NULL,
	[Last_Name] [varchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[Gender] [varchar](10) NULL,
	[Email] [varchar](30) NOT NULL,
	[Contact] [bigint] NOT NULL,
	[Pass] [varchar](15) NOT NULL,
	[Weight] [int] NOT NULL,
	[State] [varchar](30) NOT NULL,
	[Area] [varchar](30) NOT NULL,
	[Pin_Code] [bigint] NOT NULL,
	[Blood_Group] [varchar](5) NOT NULL,
	[Role] [varchar](10) NULL DEFAULT ('User'),
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[blood_details] ON 

GO
INSERT [dbo].[blood_details] ([Id], [UserId], [Blood_Group], [State], [Area], [Pin_Code], [Contact], [Status]) VALUES (1000, 1001, N'A Positive', N'TamilNadu', N'Thanjavur', 613007, 9877462234, N'Yes')
GO
INSERT [dbo].[blood_details] ([Id], [UserId], [Blood_Group], [State], [Area], [Pin_Code], [Contact], [Status]) VALUES (1001, 1002, N'A Negative', N'TamilNadu', N'Pune', 712009, 9874563248, N'Yes')
GO
INSERT [dbo].[blood_details] ([Id], [UserId], [Blood_Group], [State], [Area], [Pin_Code], [Contact], [Status]) VALUES (1004, 1001, N'AB Positive', N'Kerala', N'Kollam', 653248, 9546278135, N'Yes')
GO
INSERT [dbo].[blood_details] ([Id], [UserId], [Blood_Group], [State], [Area], [Pin_Code], [Contact], [Status]) VALUES (1036, 1001, N'O Negative', N'AndhraPradesh', N'Kollam', 45345345, 894845, N'Yes')
GO
INSERT [dbo].[blood_details] ([Id], [UserId], [Blood_Group], [State], [Area], [Pin_Code], [Contact], [Status]) VALUES (1046, 1001, N'A Positive', N'TamilNadu', N'Chennai', 623453, 9468734567, N'Done')
GO
INSERT [dbo].[blood_details] ([Id], [UserId], [Blood_Group], [State], [Area], [Pin_Code], [Contact], [Status]) VALUES (1049, 1003, N'O Positive', N'Kerala', N'Kochi', 821103, 9874565314, N'Done')
GO
INSERT [dbo].[blood_details] ([Id], [UserId], [Blood_Group], [State], [Area], [Pin_Code], [Contact], [Status]) VALUES (1050, 1001, N'A Positive', N'Tamil Nadu', N'Thanjavur', 613007, 9877462234, N'Done')
GO
INSERT [dbo].[blood_details] ([Id], [UserId], [Blood_Group], [State], [Area], [Pin_Code], [Contact], [Status]) VALUES (1051, 1002, N'B1 positive', N'Maharashtra', N'Pune', 712009, 9874563248, N'Yes')
GO
INSERT [dbo].[blood_details] ([Id], [UserId], [Blood_Group], [State], [Area], [Pin_Code], [Contact], [Status]) VALUES (1052, 1003, N'O Positive', N'Kerala', N'Kochi', 821103, 9874565314, N'Done')
GO
INSERT [dbo].[blood_details] ([Id], [UserId], [Blood_Group], [State], [Area], [Pin_Code], [Contact], [Status]) VALUES (1053, 1001, N'B Negative', N'TamilNadu', N'Chennai', 712009, 9468734567, N'Done')
GO
INSERT [dbo].[blood_details] ([Id], [UserId], [Blood_Group], [State], [Area], [Pin_Code], [Contact], [Status]) VALUES (1054, 1001, N'A Negative', N'Kerala', N'Mumbai', 712009, 894845, N'No')
GO
INSERT [dbo].[blood_details] ([Id], [UserId], [Blood_Group], [State], [Area], [Pin_Code], [Contact], [Status]) VALUES (1055, 1001, N'A+', N'Tamil Nadu', N'Thanjavur', 613007, 9877462234, N'Yes')
GO
INSERT [dbo].[blood_details] ([Id], [UserId], [Blood_Group], [State], [Area], [Pin_Code], [Contact], [Status]) VALUES (1056, 1002, N'B1+', N'Maharashtra', N'Pune', 712009, 9874563248, N'Yes')
GO
INSERT [dbo].[blood_details] ([Id], [UserId], [Blood_Group], [State], [Area], [Pin_Code], [Contact], [Status]) VALUES (1057, 1003, N'O+', N'Kerala', N'Kochi', 821103, 9874565314, N'No')
GO
INSERT [dbo].[blood_details] ([Id], [UserId], [Blood_Group], [State], [Area], [Pin_Code], [Contact], [Status]) VALUES (1058, 1001, N'B Positive', N'Kerala', N'Kochi', 653248, 9468734567, N'Yes')
GO
INSERT [dbo].[blood_details] ([Id], [UserId], [Blood_Group], [State], [Area], [Pin_Code], [Contact], [Status]) VALUES (1059, 1001, N'AB Positive', N'TamilNadu', N'Chennai', 653248, 9566785676, N'Yes')
GO
INSERT [dbo].[blood_details] ([Id], [UserId], [Blood_Group], [State], [Area], [Pin_Code], [Contact], [Status]) VALUES (1060, 1001, N'AB Positive', N'TamilNadu', N'Chennai', 613007, 9676756756, N'Yes')
GO
INSERT [dbo].[blood_details] ([Id], [UserId], [Blood_Group], [State], [Area], [Pin_Code], [Contact], [Status]) VALUES (1061, 1001, N'B Negative', N'Kerala', N'Kochi', 653248, 9468734567, N'Yes')
GO
INSERT [dbo].[blood_details] ([Id], [UserId], [Blood_Group], [State], [Area], [Pin_Code], [Contact], [Status]) VALUES (1062, 1001, N'A Positive', N'Kerala', N'Kochi', 453453, 8765846864, N'No')
GO
SET IDENTITY_INSERT [dbo].[blood_details] OFF
GO
SET IDENTITY_INSERT [dbo].[faq] ON 

GO
INSERT [dbo].[faq] ([Id], [UserId], [Questions], [Answers]) VALUES (1000, 1001, N'Can we change the slot ?', N'Yes.You can')
GO
INSERT [dbo].[faq] ([Id], [UserId], [Questions], [Answers]) VALUES (1001, 1002, N'How long does the blood donation take?', N'The actual donation requires 8 to 10 mins.But for the whole process to get completed it takes nearly 1 hour.')
GO
INSERT [dbo].[faq] ([Id], [UserId], [Questions], [Answers]) VALUES (1002, 1003, N'Can we change the location once the slot is booked', NULL)
GO
INSERT [dbo].[faq] ([Id], [UserId], [Questions], [Answers]) VALUES (1004, 1001, N'How much time will blood donation take ?', N'One Hour')
GO
INSERT [dbo].[faq] ([Id], [UserId], [Questions], [Answers]) VALUES (1005, 1001, N'Can we change the slot ?', N'Yes.You can')
GO
INSERT [dbo].[faq] ([Id], [UserId], [Questions], [Answers]) VALUES (1007, 1001, N'Will food be provided in hospital ?', N'Yes it will be provided')
GO
INSERT [dbo].[faq] ([Id], [UserId], [Questions], [Answers]) VALUES (1008, 1002, N'random ?', N'adfda')
GO
INSERT [dbo].[faq] ([Id], [UserId], [Questions], [Answers]) VALUES (1009, 1001, N'Can we change the slot later ?', N'sdas')
GO
INSERT [dbo].[faq] ([Id], [UserId], [Questions], [Answers]) VALUES (1011, 1002, N'change the slot later', N'hbynyjny')
GO
INSERT [dbo].[faq] ([Id], [UserId], [Questions], [Answers]) VALUES (1016, 1002, N'randomsdasd ?', N'NULL')
GO
INSERT [dbo].[faq] ([Id], [UserId], [Questions], [Answers]) VALUES (1017, 1001, N'null', N'NULL')
GO
SET IDENTITY_INSERT [dbo].[faq] OFF
GO
SET IDENTITY_INSERT [dbo].[slot_details] ON 

GO
INSERT [dbo].[slot_details] ([Slot_id], [UserId], [Hospital], [City], [Date_for_donating], [Time_for_donating], [FeedBack]) VALUES (1001, 1001, N'Dr.Kamakshi Hpspital', N'Thanjavur', CAST(N'2019-10-21' AS Date), N'8:00 AM - 10:00 AM', NULL)
GO
INSERT [dbo].[slot_details] ([Slot_id], [UserId], [Hospital], [City], [Date_for_donating], [Time_for_donating], [FeedBack]) VALUES (1003, 1002, N'Apollo Hospital', N'Pune', CAST(N'2019-12-06' AS Date), N'10:00 AM - 12:00 PM', NULL)
GO
INSERT [dbo].[slot_details] ([Slot_id], [UserId], [Hospital], [City], [Date_for_donating], [Time_for_donating], [FeedBack]) VALUES (1005, 1003, N'Marian Hospital', N'Kochi', CAST(N'2019-03-05' AS Date), N'1:00 PM - 2:00 PM', NULL)
GO
INSERT [dbo].[slot_details] ([Slot_id], [UserId], [Hospital], [City], [Date_for_donating], [Time_for_donating], [FeedBack]) VALUES (1006, 1002, N'Apollo', N'Chennai', CAST(N'2019-02-14' AS Date), N'8:00AM-10:00AM', NULL)
GO
INSERT [dbo].[slot_details] ([Slot_id], [UserId], [Hospital], [City], [Date_for_donating], [Time_for_donating], [FeedBack]) VALUES (1009, 1003, N'Apollo II', N'Kollam', CAST(N'2019-03-12' AS Date), N'10:00AM-12:00PM', NULL)
GO
INSERT [dbo].[slot_details] ([Slot_id], [UserId], [Hospital], [City], [Date_for_donating], [Time_for_donating], [FeedBack]) VALUES (1016, 1001, N'Apollo', N'Delhi', CAST(N'2019-02-14' AS Date), N'8:00AM-10:00AM', NULL)
GO
INSERT [dbo].[slot_details] ([Slot_id], [UserId], [Hospital], [City], [Date_for_donating], [Time_for_donating], [FeedBack]) VALUES (1017, 1001, N'Meenakshi ', N'Chennai', CAST(N'2019-11-16' AS Date), N'8:00AM-10:00AM', NULL)
GO
INSERT [dbo].[slot_details] ([Slot_id], [UserId], [Hospital], [City], [Date_for_donating], [Time_for_donating], [FeedBack]) VALUES (1018, 1001, N'Meenakshi ', N'Chennai', CAST(N'2019-11-16' AS Date), N'8:00AM-10:00AM', NULL)
GO
INSERT [dbo].[slot_details] ([Slot_id], [UserId], [Hospital], [City], [Date_for_donating], [Time_for_donating], [FeedBack]) VALUES (1019, 1001, N'Meenakshi ', N'Chennaiok', CAST(N'2019-11-16' AS Date), N'8:00AM-10:00AM', NULL)
GO
INSERT [dbo].[slot_details] ([Slot_id], [UserId], [Hospital], [City], [Date_for_donating], [Time_for_donating], [FeedBack]) VALUES (1020, 1001, N'Vinodhagan', N'Thanjavur', CAST(N'2019-11-21' AS Date), N'3:00PM-5:00PM', NULL)
GO
INSERT [dbo].[slot_details] ([Slot_id], [UserId], [Hospital], [City], [Date_for_donating], [Time_for_donating], [FeedBack]) VALUES (1021, 1001, N'Apollo', N'Chennai', CAST(N'2019-11-09' AS Date), N'8:00AM-10:00AM', NULL)
GO
INSERT [dbo].[slot_details] ([Slot_id], [UserId], [Hospital], [City], [Date_for_donating], [Time_for_donating], [FeedBack]) VALUES (1022, 1001, N'New', N'Chennai', CAST(N'2019-11-30' AS Date), N'8:00AM-10:00AM', NULL)
GO
INSERT [dbo].[slot_details] ([Slot_id], [UserId], [Hospital], [City], [Date_for_donating], [Time_for_donating], [FeedBack]) VALUES (1023, 1001, N'Apollo  II', N'Bangalore', CAST(N'2019-11-22' AS Date), N'10:00AM-12:00PM', NULL)
GO
INSERT [dbo].[slot_details] ([Slot_id], [UserId], [Hospital], [City], [Date_for_donating], [Time_for_donating], [FeedBack]) VALUES (1024, 1001, N'Meenakshi ', N'Chennai', CAST(N'2019-11-29' AS Date), N'10:00AM-12:00PM', NULL)
GO
INSERT [dbo].[slot_details] ([Slot_id], [UserId], [Hospital], [City], [Date_for_donating], [Time_for_donating], [FeedBack]) VALUES (1025, 1001, N'Meenakshi ', N'Chennai', CAST(N'2019-11-22' AS Date), N'10:00AM-12:00PM', NULL)
GO
INSERT [dbo].[slot_details] ([Slot_id], [UserId], [Hospital], [City], [Date_for_donating], [Time_for_donating], [FeedBack]) VALUES (1026, 1001, N'Apollo', N'Delhi', CAST(N'2019-11-22' AS Date), N'1:00PM-3:00PM', NULL)
GO
INSERT [dbo].[slot_details] ([Slot_id], [UserId], [Hospital], [City], [Date_for_donating], [Time_for_donating], [FeedBack]) VALUES (1027, 1001, N'Apollo  II', N'Thanjavur', CAST(N'2019-11-30' AS Date), N'8:00AM-10:00AM', NULL)
GO
INSERT [dbo].[slot_details] ([Slot_id], [UserId], [Hospital], [City], [Date_for_donating], [Time_for_donating], [FeedBack]) VALUES (1028, 1001, N'Apollo', N'Delhi', CAST(N'2019-11-29' AS Date), N'8:00AM-10:00AM', NULL)
GO
INSERT [dbo].[slot_details] ([Slot_id], [UserId], [Hospital], [City], [Date_for_donating], [Time_for_donating], [FeedBack]) VALUES (1029, 1001, N'Apollo  II', N'Chennai', CAST(N'2019-11-20' AS Date), N'1:00PM-3:00PM', NULL)
GO
INSERT [dbo].[slot_details] ([Slot_id], [UserId], [Hospital], [City], [Date_for_donating], [Time_for_donating], [FeedBack]) VALUES (1030, 1001, N'Apollo  II', N'Chennai', CAST(N'2019-11-20' AS Date), N'1:00PM-3:00PM', NULL)
GO
SET IDENTITY_INSERT [dbo].[slot_details] OFF
GO
SET IDENTITY_INSERT [dbo].[user_details] ON 

GO
INSERT [dbo].[user_details] ([UserId], [First_Name], [Last_Name], [Age], [Gender], [Email], [Contact], [Pass], [Weight], [State], [Area], [Pin_Code], [Blood_Group], [Role]) VALUES (1000, N'Admin', N'Admin', 21, N'Female', N'admin@gmail.com', 9874561234, N'adminpass', 50, N'Tamil Nadu', N'Chennai', 600009, N'A1+', N'Admin')
GO
INSERT [dbo].[user_details] ([UserId], [First_Name], [Last_Name], [Age], [Gender], [Email], [Contact], [Pass], [Weight], [State], [Area], [Pin_Code], [Blood_Group], [Role]) VALUES (1001, N'Jane', N'Joe', 21, N'Female', N'jane@gmail.com', 9877462234, N'janepass', 50, N'Tamil Nadu', N'Thanjavur', 613007, N'A+', N'User')
GO
INSERT [dbo].[user_details] ([UserId], [First_Name], [Last_Name], [Age], [Gender], [Email], [Contact], [Pass], [Weight], [State], [Area], [Pin_Code], [Blood_Group], [Role]) VALUES (1002, N'John', N'Andrew', 25, N'Male', N'john@gmail.com', 9874563248, N'johnpass', 70, N'Maharashtra', N'Pune', 712009, N'B1+', N'User')
GO
INSERT [dbo].[user_details] ([UserId], [First_Name], [Last_Name], [Age], [Gender], [Email], [Contact], [Pass], [Weight], [State], [Area], [Pin_Code], [Blood_Group], [Role]) VALUES (1003, N'Charlie', N'Chaplin', 31, N'Male', N'charlie@gmail.com', 9874565314, N'charliepass', 50, N'Kerala', N'Kochi', 821103, N'O+', N'User')
GO
INSERT [dbo].[user_details] ([UserId], [First_Name], [Last_Name], [Age], [Gender], [Email], [Contact], [Pass], [Weight], [State], [Area], [Pin_Code], [Blood_Group], [Role]) VALUES (1004, N'Finu', N'Nazar', 26, N'Female', N'finu@gmail.com', 9657315462, N'finupass', 55, N'Kerala', N'Kottaiyam', 686575, N'O-', N'User')
GO
INSERT [dbo].[user_details] ([UserId], [First_Name], [Last_Name], [Age], [Gender], [Email], [Contact], [Pass], [Weight], [State], [Area], [Pin_Code], [Blood_Group], [Role]) VALUES (1007, N'Jisma', N'Mary', 28, N'Female', N'jisma@gmail.com', 8644561234, N'jismapass', 57, N'Tamil Nadu', N'Chennai', 600009, N'Opos', N'User')
GO
INSERT [dbo].[user_details] ([UserId], [First_Name], [Last_Name], [Age], [Gender], [Email], [Contact], [Pass], [Weight], [State], [Area], [Pin_Code], [Blood_Group], [Role]) VALUES (1018, N'ADsad', N'asfd', 12, N'Female', N'asd@gmail.com', 1231231232, N'jane', 34, N'Bneg', N'Chennai', 613007, N'ABneg', N'User')
GO
INSERT [dbo].[user_details] ([UserId], [First_Name], [Last_Name], [Age], [Gender], [Email], [Contact], [Pass], [Weight], [State], [Area], [Pin_Code], [Blood_Group], [Role]) VALUES (1048, N'ads', N'DSA', 12, N'Female', N'', 1231231232, N'aaa', 34, N'TamilNadu', N'Chennai', 613007, N'Apos', N'User')
GO
SET IDENTITY_INSERT [dbo].[user_details] OFF
GO
ALTER TABLE [dbo].[blood_details]  WITH CHECK ADD  CONSTRAINT [FK__blood_det__UserI__1367E606] FOREIGN KEY([UserId])
REFERENCES [dbo].[user_details] ([UserId])
GO
ALTER TABLE [dbo].[blood_details] CHECK CONSTRAINT [FK__blood_det__UserI__1367E606]
GO
ALTER TABLE [dbo].[faq]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[user_details] ([UserId])
GO
ALTER TABLE [dbo].[slot_details]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[user_details] ([UserId])
GO
/****** Object:  StoredProcedure [dbo].[admin]    Script Date: 11/22/2019 5:37:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[admin]
as 
select * from faq where Answers='NULL'
GO
/****** Object:  StoredProcedure [dbo].[adminanswer]    Script Date: 11/22/2019 5:37:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[adminanswer](@id int,@answers varchar(500))
as
UPDATE [dbo].[faq]
   SET [Answers] = @answers
 WHERE id=@id
GO
/****** Object:  StoredProcedure [dbo].[adminfetch]    Script Date: 11/22/2019 5:37:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[adminfetch](@id int)
as 
select Questions from faq where Id=@id and Answers='NULL'

GO
/****** Object:  StoredProcedure [dbo].[availabledetails]    Script Date: 11/22/2019 5:37:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[availabledetails]
as
select* from blood_details
where Status='Yes'
GO
/****** Object:  StoredProcedure [dbo].[cust]    Script Date: 11/22/2019 5:37:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[cust]
as 
select * from faq where Answers!='NULL'
GO
/****** Object:  StoredProcedure [dbo].[custpost]    Script Date: 11/22/2019 5:37:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[custpost](@userId int,@questions varchar(500))
as
INSERT INTO [dbo].[faq]
           ([UserId]
           ,[Questions]
           ,[Answers])
     VALUES
           (@userId,@questions,'NULL')
GO
/****** Object:  StoredProcedure [dbo].[donate]    Script Date: 11/22/2019 5:37:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[donate](@userid int,@bloodgroup varchar(20),@state varchar(20),@area varchar(20),@pincode bigint,@contact bigint)
as

INSERT INTO [dbo].[blood_details]
           ([UserId]
           ,[Blood_Group]
           ,[State]
           ,[Area]
           ,[Pin_Code]
           ,[Contact]
           ,[Status])
     VALUES
           (@userid
           ,@bloodgroup
           ,@state
           ,@area
           ,@pincode
           ,@contact
           ,'Yes')
GO
/****** Object:  StoredProcedure [dbo].[fetchslot]    Script Date: 11/22/2019 5:37:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[fetchslot]
as 
select * from slot_details
GO
/****** Object:  StoredProcedure [dbo].[getbyid]    Script Date: 11/22/2019 5:37:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getbyid] (@id int)
as
select * from blood_details where Id=@id

GO
/****** Object:  StoredProcedure [dbo].[getrequirement]    Script Date: 11/22/2019 5:37:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[getrequirement]
as
select * from blood_details where Status='No'
GO
/****** Object:  StoredProcedure [dbo].[getuserid]    Script Date: 11/22/2019 5:37:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getuserid]
as
select top 1 * from user_details order by UserId desc
GO
/****** Object:  StoredProcedure [dbo].[login]    Script Date: 11/22/2019 5:37:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[login](@userid int,@pass varchar(30))
as
select * from user_details
where UserId=@userid and Pass=@pass
GO
/****** Object:  StoredProcedure [dbo].[logininvalid]    Script Date: 11/22/2019 5:37:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[logininvalid](@userid int,@pass varchar(30))
as
select * from user_details
where UserId=@userid and Pass!=@pass
GO
/****** Object:  StoredProcedure [dbo].[registration]    Script Date: 11/22/2019 5:37:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[registration](@fname varchar(20),@lname varchar(20),@age int,@gender varchar(10),@email varchar(30),@contact bigint,@pass varchar(20),@wght int,@state varchar(30),@area varchar(30),@pin bigint,@bg varchar(10))
as
insert into user_details([First_Name]
           ,[Last_Name]
           ,[Age]
           ,[Gender]
           ,[Email]
           ,[Contact]
           ,[Pass]
           ,[Weight]
           ,[State]
           ,[Area]
           ,[Pin_Code]
           ,[Blood_Group],[Role]
           ) values(@fname,@lname,@age,@gender,@email,@contact,@pass,@wght,@state,@area,@pin,@bg,default)
GO
/****** Object:  StoredProcedure [dbo].[requirement]    Script Date: 11/22/2019 5:37:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[requirement](@userid int,@bg varchar(20),@state varchar(30),@area varchar(30),@pin varchar(30),@contact bigint)
as
insert into blood_details([UserId]
           ,[Blood_Group]
           ,[State]
           ,[Area]
           ,[Pin_Code]
           ,[Contact]
           ,[Status])
values(@userid,@bg,@state,@area,@pin,@contact,'No')

GO
/****** Object:  StoredProcedure [dbo].[search]    Script Date: 11/22/2019 5:37:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[search](@bg varchar(20),@state varchar(30),@area varchar(30),@pin varchar(30))
as
select blood_details.Id, user_details.First_Name,user_details.Last_Name,blood_details.Contact,blood_details.Blood_Group,blood_details.State,blood_details.Area,blood_details.Pin_Code from User_details inner join blood_details 
on user_details.UserId=blood_details.UserId and blood_details.Status='Yes'and blood_details.Blood_Group=@bg and blood_details.State=@state and blood_details.Area=@area and blood_details.Pin_Code=@pin
GO
/****** Object:  StoredProcedure [dbo].[searchproc]    Script Date: 11/22/2019 5:37:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[searchproc](@bg varchar(20),@state varchar(30),@area varchar(30),@pin varchar(30))
as
select * from blood_details 
where  blood_details.Status='Yes'and blood_details.Blood_Group=@bg and blood_details.State=@state and blood_details.Area=@area and blood_details.Pin_Code=@pin
GO
/****** Object:  StoredProcedure [dbo].[slotpost]    Script Date: 11/22/2019 5:37:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[slotpost](@userid int,@hospital varchar(10),@city varchar(20),@dod date,@tod varchar(20))
as
INSERT INTO [dbo].[slot_details]
           ([UserId]
           ,[Hospital]
           ,[City]
           ,[Date_for_donating]
           ,[Time_for_donating]
           ,[FeedBack])
     VALUES
           (@userid,@hospital,@city,@dod,@tod,null)
GO
/****** Object:  StoredProcedure [dbo].[slotvalidation]    Script Date: 11/22/2019 5:37:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[slotvalidation](@hname varchar(30),@cname varchar(30),@dod date,@tod varchar(20))
as
select * from slot_details
where slot_details.Hospital=@hname and slot_details.City=@cname and slot_details.Date_for_donating=@dod and slot_details.Time_for_donating=@tod
GO
/****** Object:  StoredProcedure [dbo].[updatedone]    Script Date: 11/22/2019 5:37:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[updatedone](@id bigint)
as
update blood_details 
set Status='Done'
where Id=@id
GO
/****** Object:  StoredProcedure [dbo].[userdetails]    Script Date: 11/22/2019 5:37:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[userdetails]
as
select * from user_details
GO
USE [master]
GO
ALTER DATABASE [onlinebloodbank] SET  READ_WRITE 
GO
