USE [languageClasses]
GO



CREATE OR ALTER   PROCEDURE [dbo].[RetrieveGroups]
AS
BEGIN


SELECT GroupId, GroupName FROM [Group]

END