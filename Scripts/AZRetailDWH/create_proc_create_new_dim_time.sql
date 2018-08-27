
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

DECLARE @month_name VARCHAR(4)

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

   SET @month_name = CASE @month
       WHEN 1 THEN   'JAN'
	   WHEN 2 THEN   'FEB'
	   WHEN 3 THEN   'MAR'
	   WHEN 4 THEN   'APR'
	   WHEN 5 THEN   'MAY'
	   WHEN 6 THEN   'JUN'
	   WHEN 7 THEN   'JUL'
	   WHEN 8 THEN   'AUG'
	   WHEN 9 THEN   'SEP'
	   WHEN 10 THEN   'OCT'
	   WHEN 11 THEN   'NOV'
	   WHEN 12 THEN   'DEC'

	   END

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
	MonthName,
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
	@month_name,
    @week_no,         -- WeekNo - tinyint
    @day_of_year        -- DayNo - smallint
)
	END

