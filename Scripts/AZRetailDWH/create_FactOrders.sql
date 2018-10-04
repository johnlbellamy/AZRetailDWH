USE [AZRetailDWH]

GO

IF EXISTS
	(SELECT * FROM sys.TABLES 
	WHERE name = 'FactOrders')
DROP TABLE FactOrders
GO

CREATE TABLE FactOrders(
     CustomerKey INT NOT NULL	
	,SalesDateKey INT NOT NULL	
	,ShipDateKey INT 
	,StoreKey INT NOT NULL
	,ProductKey INT NOT NULL
	,LocationKey INT NOT NULL
    ,OrderID INT NOT NULL
    ,LineNumber SMALLINT NOT NULL	
	,LineSale MONEY NOT NULL
    ,LineProfit MONEY NOT NULL
    ,Quantity INT NOT NULL	
	,IsDeleted BIT NOT NULL DEFAULT 0
	
	,CONSTRAINT pk_FactOrders
     PRIMARY KEY CLUSTERED (CustomerKey, SalesDateKey, StoreKey, ProductKey, LocationKey, OrderID, LineNumber)
	 
	 ,Constraint fk_FactOrders_StoreKey
     FOREIGN key (StoreKey)
     REFERENCES DimStore(StoreKey)

	 ,Constraint fk_FactOrders_CustomerKey
     FOREIGN key (CustomerKey)
     REFERENCES DimCustomer(CustomerKey)
	 
	 ,Constraint fk_FactOrders_ProductKey
     FOREIGN key (ProductKey)
     REFERENCES DimProduct(ProductKey)

	 ,Constraint fk_FactOrders_SalesDateKey
     FOREIGN key (SalesDateKey)
     REFERENCES DimTime(TimeKey)
	 
	 ,Constraint fk_FactOrders_LocationKey
     FOREIGN key (LocationKey)
     REFERENCES DimLocation(LocationKey)
	 
	 ,Constraint fk_FactOrders_ShipDateKey
     FOREIGN key (ShipDateKey)
     REFERENCES DimTime(TimeKey)
	 
)

GO

CREATE COLUMNSTORE INDEX idx_fact_orders

ON FactOrders (CustomerKey, SalesDateKey, StoreKey, ProductKey, LocationKey, OrderID, LineNumber)

GO

ALTER TABLE dbo.FactOrders
NOCHECK CONSTRAINT fk_FactOrders_CustomerKey

ALTER TABLE dbo.FactOrders
NOCHECK CONSTRAINT fk_FactOrders_ProductKey

ALTER TABLE dbo.FactOrders
NOCHECK CONSTRAINT fk_FactOrders_SalesDateKey

ALTER TABLE dbo.FactOrders
NOCHECK CONSTRAINT fk_FactOrders_ShipDateKey

ALTER TABLE dbo.FactOrders
NOCHECK CONSTRAINT fk_FactOrders_StoreKey
GO

ALTER TABLE dbo.FactOrders
NOCHECK CONSTRAINT fk_FactOrders_LocationKey
GO

ALTER TABLE dbo.FactOrders
NOCHECK CONSTRAINT fk_FactOrders_ProductKey
GO




