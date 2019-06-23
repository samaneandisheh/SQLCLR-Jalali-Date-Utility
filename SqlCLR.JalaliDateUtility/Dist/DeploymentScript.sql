﻿
GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "YourDatabaseName"
:setvar DefaultFilePrefix "YourDatabaseName"
:setvar DefaultDataPath ""
:setvar DefaultLogPath ""

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
select dbo.GregorianToJalali(GETDATE(),'yy')

select dbo.GregorianToJalali(GETDATE(),'yy-MM')

select dbo.GregorianToJalali(GETDATE(),'yyyy/MM/dd hh:mm')

select dbo.GregorianToJalali(GETDATE(),'yyyy/M/d hh:mm tt')

select dbo.GregorianToJalali(GETDATE(),'yyyy-M-d HH:mm')

select dbo.GregorianToJalali(GETDATE(),'MMMM dddd')

select dbo.GregorianToJalali(GETDATE(),'yy MMMM dddd')
GO

GO
PRINT N'Update complete.';


GO
