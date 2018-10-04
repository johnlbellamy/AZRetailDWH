USE AZRetailDWH
GO

IF OBJECT_ID('_vwDimCustomer', 'view') IS NOT NULL
DROP VIEW _vwDimCustomer ;
GO

SET NUMERIC_ROUNDABORT OFF;
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT,
    QUOTED_IDENTIFIER, ANSI_NULLS ON;
GO

CREATE VIEW _vwDimCustomer
WITH SCHEMABINDING
AS
	SELECT [CustomerKey]
      ,[CustomerID]
      ,[FirstName]
      ,[LastName]
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

