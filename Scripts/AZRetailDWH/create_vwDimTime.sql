USE AZRetailDWH
GO

IF OBJECT_ID('_vwDimTime', 'view') IS NOT NULL
DROP VIEW _vwDimTime ;
GO

CREATE VIEW _vwDimTime
WITH SCHEMABINDING
AS
	SELECT  [TimeKey]
      ,[FullDateTime]
      ,[FullDate]
      ,[YearNo]
      ,[Quarter]
	  ,[Month]
      ,[MonthName]
      ,[WeekNo]
      ,[DayNo]
  FROM [dbo].[DimTime]
GO

IF EXISTS
  (SELECT * FROM sys.indexes 
   WHERE name = '_vwDimTime_TimeKey'
   AND object_id = object_id('_vwDimTime_TimeKey'))
DROP INDEX _vwDimTime.DimStore_TimeKey
GO

CREATE UNIQUE CLUSTERED INDEX _vwDimTime_TimeKey
 ON _vwDimTime(TimeKey)

GO

