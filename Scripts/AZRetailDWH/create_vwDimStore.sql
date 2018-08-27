USE AZRetailDWH
GO

IF OBJECT_ID('_vwDimStore', 'view') IS NOT NULL
DROP VIEW _vwDimStore ;
GO

CREATE VIEW _vwDimStore
WITH SCHEMABINDING
AS
	SELECT  [StoreKey]
      ,[StoreID]
      ,[StoreName]
      ,[DivisionName]
      ,[StartDate]
      ,[EndDate]
  FROM [dbo].[DimStore]
GO

IF EXISTS
  (SELECT * FROM sys.indexes 
   WHERE name = '_vwDimStore_StoreKey'
   AND object_id = object_id('_vwDimStore_Storekey'))
DROP INDEX _vwDimStore.DimStore_StoreKey
GO

CREATE UNIQUE CLUSTERED INDEX _vwDimStore_StoreKey
 ON _vwDimStore(StoreKey)

GO

