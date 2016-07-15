/*
	13950425
	Session #1
*/

-- نحوه پاک کردن بانک اطلاعاتی
DROP DATABASE SQLClass
GO

-- نحوه ساختن بانک اطلاعاتی
CREATE DATABASE SQLClass

GO
/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Part
	(
	PartCode int NOT NULL,
	PartName char(50) NOT NULL,
	SupplierName char(100) NULL
	)  ON [PRIMARY]
GO
DECLARE @v sql_variant 
SET @v = N'جدول کالاهای پایه'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Part', NULL, NULL
GO
DECLARE @v sql_variant 
SET @v = N'کد کالا'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Part', N'COLUMN', N'PartCode'
GO
DECLARE @v sql_variant 
SET @v = N'نام کالا'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Part', N'COLUMN', N'PartName'
GO
DECLARE @v sql_variant 
SET @v = N'نام تامین کننده'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Part', N'COLUMN', N'SupplierName'
GO
ALTER TABLE dbo.Part SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
