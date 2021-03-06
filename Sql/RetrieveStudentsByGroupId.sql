USE [languageClasses]
GO


CREATE OR ALTER PROCEDURE [dbo].[RetrieveStudentsByGroupId]
@GroupId INT
AS
BEGIN


SELECT * FROM Student
INNER JOIN [Group] ON Student.GroupId = [Group].GroupId
WHERE Student.GroupId = @GroupId;

END