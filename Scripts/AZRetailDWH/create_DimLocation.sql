USE [AZRetailDWH]

GO

IF EXISTS
	(SELECT * FROM sys.TABLES 
	WHERE name = 'DimLocation')
DROP TABLE DimLocation
GO

CREATE TABLE DimLocation(
	LocationKey INT IDENTITY
	,LocationID INT NOT NULL
	,City VARCHAR(50) NOT NULL
	,State VARCHAR(50) NOT NULL
	,StartDate DATETIME NOT NULL
	,EndDate DATETIME DEFAULT NULL
     
	PRIMARY KEY CLUSTERED(LocationKey)
)

GO

-- Build indexes

IF EXISTS
  (SELECT * FROM sys.indexes 
   WHERE name = 'DimLocation_LocationKey'
   AND object_id = object_id('DimLocation_LocationKey'))
DROP INDEX DimLocation.DimLocation_LocationKey
GO

CREATE UNIQUE INDEX DimLocation_LocationKey
 ON DimLocation(LocationKey)

GO


