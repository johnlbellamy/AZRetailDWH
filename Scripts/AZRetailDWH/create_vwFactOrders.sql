USE AZRetailDWH
GO

IF OBJECT_ID('_vwFactOrders', 'view') IS NOT NULL
DROP VIEW _vwFactOrders ;
GO

CREATE VIEW _vwFactOrders
WITH SCHEMABINDING
AS
	SELECT  [CustomerKey]
      ,[SalesDateKey]
      ,[ShipDateKey]
      ,[StoreKey]
      ,[ProductKey]
      ,[OrderID]
      ,[LineNumber]
      ,[LineSale]
      ,[LineProfit]
      ,[Quantity]
      ,[IsDeleted]
  FROM [dbo].[FactOrders]
GO

IF EXISTS
  (SELECT * FROM sys.indexes 
   WHERE name = '_vwFactOrders_Orders'
   AND object_id = object_id('_vwFactOrders_Orders'))
DROP INDEX _vwFactOrders.DimStore_Orders
GO

CREATE UNIQUE CLUSTERED INDEX _vwFactOrders_Orders
ON _vwFactOrders(CustomerKey, SalesDateKey, StoreKey, OrderID, LineNumber)
GO