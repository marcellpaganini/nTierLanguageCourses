USE [languageClasses]
GO


CREATE OR ALTER PROCEDURE [dbo].[RetrieveGroupsByCourseId]
@CourseId INT
AS
BEGIN


SELECT GroupId, GroupName FROM [Group]
INNER JOIN Course ON [Group].CourseId = Course.CourseId
WHERE [Group].CourseId = @CourseId;

END