
USE [AZRetailDWH]
GO


CREATE PROC [dbo].[sp_create_new_dim_time_row]

AS


DECLARE @iter DATETIME

DECLARE @year SMALLINT

DECLARE @month TINYINT

DECLARE @quarter TINYINT

DECLARE @day_of_year SMALLINT

DECLARE @month_string VARCHAR(2)

DECLARE @day_string VARCHAR(2)

DECLARE @week_no SMALLINT

DECLARE @key VARCHAR(20)

DECLARE @full_date char(10)

SET @iter = CURRENT_TIMESTAMP
SET @year = DATEPART(YEAR, @iter)
SET @quarter = DATEPART(QUARTER, @iter)
SET @month = DATEPART(MONTH, @iter)
SET @day_of_year = DATEPART(DAYOFYEAR, @iter)
SET @week_no = DATEPART(WEEK, @iter)
SET @full_date = CONVERT(CHAR(10), @iter, 121)
SET @month_string  = SUBSTRING(@full_date, 9, 10)
SET @day_string  = SUBSTRING(@full_date, 6, 7)

SET @key = CAST(@year AS VARCHAR(4)) + @month_string + @day_string


IF NOT EXISTS (SELECT * FROM [dbo].[DimTime] WHERE TimeKey = CAST(@key AS INT))
BEGIN
INSERT INTO dbo.DimTime
(
    TimeKey,
    FullDateTime,
	FulLDate, 
	YearNo,
    Quarter,
    Month,
    WeekNo,
    DayNo
)
VALUES
(   
    CAST(@key AS INT),         -- TimeKey - int
    @iter, -- FullDate - datetime
	@full_date,
    @year,         -- YearNo - smallint
    @quarter,         -- Quarter - tinyint
    @month,         -- Month - tinyint
    @week_no,         -- WeekNo - tinyint
    @day_of_year        -- DayNo - smallint
)
	END

