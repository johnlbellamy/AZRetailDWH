USE AZRetailDWH
GO

IF OBJECT_ID('_vwDimLocation', 'view') IS NOT NULL
DROP VIEW _vwDimLocation ;
GO

CREATE VIEW _vwDimLocation
WITH SCHEMABINDING
AS
	SELECT  [LocationKey]
      ,[LocationID]
      ,[City]
      ,[State]
      ,[StartDate]
      ,[EndDate] FROM [dbo].[DimLocation]
GO

IF EXISTS
  (SELECT * FROM sys.indexes 
   WHERE name = '_vwDimLocation_LocationKey'
   AND object_id = object_id('_vwDimLocation_Locationkey'))
DROP INDEX _vwDimLocation.DimLocation_LocationKey
GO

CREATE UNIQUE CLUSTERED INDEX _vwDimLocation_LocationKey
 ON _vwDimLocation(LocationKey)

GO

