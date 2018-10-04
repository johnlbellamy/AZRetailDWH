USE AZRetailDWH
GO

IF OBJECT_ID('_vwFactOrders', 'view') IS NOT NULL
DROP VIEW _vwFactOrders ;
GO

SET NUMERIC_ROUNDABORT OFF;
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT,
    QUOTED_IDENTIFIER, ANSI_NULLS ON;
GO

CREATE VIEW _vwFactOrders
WITH SCHEMABINDING
AS
	SELECT  [CustomerKey]
      ,[SalesDateKey]
      ,[ShipDateKey]
      ,[StoreKey]
      ,[ProductKey]
	  ,[LocationKey] 
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
ON _vwFactOrders(CustomerKey, SalesDateKey, StoreKey, LocationKey, OrderID, LineNumber)
GO