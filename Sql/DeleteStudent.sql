USE [languageClasses]
GO


CREATE OR ALTER PROCEDURE [dbo].[DeleteStudent]
@StudentId INT
AS
BEGIN


DELETE Student WHERE StudentId = @StudentId;

END