USE [AZRetailDWH]

GO

IF EXISTS
	(SELECT * FROM sys.TABLES 
	WHERE name = 'DimProduct')
DROP TABLE DimProduct
GO

CREATE TABLE DimProduct(
	ProductKey INT IDENTITY 
	,ProductID INT NOT NULL
	,ProductName VARCHAR(50) NOT NULL
	,ProductPrice SMALLMONEY NOT NULL
	,ProductCost SMALLMONEY NOT NULL
	,CategoryName VARCHAR(50) NOT NULL
	,StartDate	DATETIME NOT NULL
    ,EndDate	DATETIME DEFAULT NULL

	PRIMARY KEY CLUSTERED(ProductKey)
)

GO

-- Build indexes

IF EXISTS
  (SELECT * FROM sys.indexes 
   WHERE name = 'DimProduct_ProductKey'
   AND object_id = object_id('DimProduct_ProductKey'))
DROP INDEX DimProduct.DimProduct_ProductKey
GO

CREATE UNIQUE INDEX DimProduct_ProductKey
 ON DimProduct(ProductKey)

GO