USE user_05

GO
CREATE TABLE [MaterialType] (
[Name] varchar (25) PRIMARY KEY)
GO

CREATE TABLE [Unit] (
[Name] varchar (3)PRIMARY KEY)
GO

CREATE TABLE [Material] (
[Name] varchar (150) PRIMARY KEY,
[Type] varchar (25) FOREIGN KEY REFERENCES [MaterialType] ([Name]),
[Image] varchar (255),
[Price] money,
[Count] int,
[MinCount] int,
[CountinPack] int,
[Unit] varchar(3) FOREIGN KEY REFERENCES [Unit] ([Name]))
GO

CREATE TABLE [ProviderType] (
[Name] varchar (10)PRIMARY KEY )
GO

CREATE TABLE [Provider] (
[Name] varchar (150) PRIMARY KEY,
[Type] varchar (10) FOREIGN KEY REFERENCES [ProviderType] ([Name]),
[INN] nchar (11),
[Rating] int,
[BeginDateInWork] date)

GO

CREATE TABLE [Supplier] (
[Name_material] varchar (150) FOREIGN KEY REFERENCES [Material] ([Name]),
[Provider] varchar (150) FOREIGN KEY REFERENCES [Provider] ([Name]),
PRIMARY KEY ([Name_material],[Provider]))

