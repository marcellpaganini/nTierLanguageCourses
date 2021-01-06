USE [languageClasses]
GO

CREATE OR ALTER   PROCEDURE [dbo].[InsertStudent]
	@FirstName VARCHAR(50),
	@LastName VARCHAR(50),
	@StartDate DATETIME2(7),
	@Gender INT,
	@Country VARCHAR(50),
	@EmailAddress VARCHAR(50),
	@Enrolled BIT,
	@HourlyClassPrice DECIMAL,
	@GroupId INT
AS
BEGIN


	BEGIN TRY
		

		INSERT INTO Student
			(FirstName, LastName, StartDate, Gender, Country, EmailAddress, Enrolled, HourlyClassPrice, GroupId)
		VALUES
			(@FirstName, @LastName, @StartDate, @Gender, @Country, @EmailAddress, @Enrolled, @HourlyClassPrice, @GroupId);

	END TRY
	BEGIN CATCH
		;THROW
	END CATCH

END

