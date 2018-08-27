USE AZRetailDWH
GO

IF OBJECT_ID('_vwDimCustomer', 'view') IS NOT NULL
DROP VIEW _vwDimCustomer ;
GO

CREATE VIEW _vwDimCustomer
WITH SCHEMABINDING
AS
	SELECT [CustomerKey]
      ,[CustomerID]
      ,[FirstName]
      ,[LastName]
      ,[LocationKey]
      ,[IsDeleted] FROM [dbo].[DimCustomer]
GO

IF EXISTS
  (SELECT * FROM sys.indexes 
   WHERE name = '_vwDimCustomer_CustomerKey'
   AND object_id = object_id('_vwDimCustomer_Customerkey'))
DROP INDEX _vwDimCustomer.DimCustomer_CustomerKey
GO

CREATE UNIQUE CLUSTERED INDEX _vwDimCustomer_CustomerKey
 ON _vwDimCustomer(CustomerKey)

GO

IF EXISTS
  (SELECT * FROM sys.indexes 
   WHERE name = '_vwDimCustomer_LocationKey'
   AND object_id = object_id('_vwDimCustomer_Locationkey'))
DROP INDEX _vwDimCustomer.DimCustomer_locationKey
GO

CREATE INDEX _vwDimCustomer_LocationKey_Key
  on _vwDimCustomer(LocationKey)
GO