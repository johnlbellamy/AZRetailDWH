USE AZRetailDWH
GO

IF OBJECT_ID('_vwDimProduct', 'view') IS NOT NULL
DROP VIEW _vwDimProduct ;
GO

SET NUMERIC_ROUNDABORT OFF;
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT,
    QUOTED_IDENTIFIER, ANSI_NULLS ON;
GO

CREATE VIEW _vwDimProduct
WITH SCHEMABINDING
AS
	SELECT  [ProductKey]
      ,[ProductID]
      ,[ProductName]
      ,[ProductPrice]
      ,[ProductCost]
      ,[CategoryName]
      ,[StartDate]
      ,[EndDate]
  FROM [dbo].[DimProduct]
GO

IF EXISTS
  (SELECT * FROM sys.indexes 
   WHERE name = '_vwDimProduct_ProductKey'
   AND object_id = object_id('_vwDimProduct_Productkey'))
DROP INDEX _vwDimProduct.DimProduct_ProductKey
GO

CREATE UNIQUE CLUSTERED INDEX _vwDimProduct_ProductKey
 ON _vwDimProduct(ProductKey)

GO

