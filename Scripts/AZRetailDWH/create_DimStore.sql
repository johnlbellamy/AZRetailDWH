USE [AZRetailDWH]

GO

IF EXISTS
	(SELECT * FROM sys.TABLES 
	WHERE name = 'DimStore')
DROP TABLE DimStore
GO

CREATE TABLE DimStore(
	StoreKey INT IDENTITY 
	,StoreID SMALLINT NOT NULL
	,StoreName VARCHAR(50) NOT NULL
	,DivisionName VARCHAR(50) NOT NULL
	,StartDate	DATETIME NOT NULL
    ,EndDate	DATETIME DEFAULT NULL
	PRIMARY KEY CLUSTERED(StoreKey)
)

GO

-- Build indexes

IF EXISTS
  (SELECT * FROM sys.indexes 
   WHERE name = 'DimStore_StoreKey'
   AND object_id = object_id('DimStore_StoreKey'))
DROP INDEX DimStore.DimStore_StoreKey
GO

CREATE UNIQUE INDEX DimStore_StoreKey
 ON DimStore(StoreKey)

GO