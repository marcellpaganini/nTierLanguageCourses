USE [languageClasses]
GO


CREATE OR ALTER PROCEDURE [dbo].[CoursesLookup] 
AS
BEGIN


SELECT CourseId, CourseName FROM Course
ORDER BY CourseName;

END