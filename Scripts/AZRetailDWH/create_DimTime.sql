USE [AZRetailDWH]

GO

IF EXISTS
	(SELECT * FROM sys.TABLES 
	WHERE name = 'DimTime')
DROP TABLE DimTime
GO

CREATE TABLE DimTime(
	TimeKey INT 
	,FullDateTime DATETIME NOT NULL
	,FullDate CHAR(10) NOT NULL
	,YearNo SMALLINT NOT NULL
	,Quarter TINYINT NOT NULL
	,Month TINYINT NOT NULL
	,WeekNo TINYINT NOT NULL
	,DayNo SMALLINT NOT NULL
	PRIMARY KEY CLUSTERED(TimeKey)
)

GO

-- Build indexes

IF EXISTS
  (SELECT * FROM sys.indexes 
   WHERE name = 'DimTime_TimeKey'
   AND object_id = object_id('DimTime_TimeKey'))
DROP INDEX DimTime.DimTime_TimeKey
GO

CREATE UNIQUE INDEX DimTime_TimeKey
 ON DimTime(TimeKey)

GO

