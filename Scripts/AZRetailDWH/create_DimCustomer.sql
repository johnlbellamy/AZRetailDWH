USE [AZRetailDWH]

GO

IF EXISTS
	(SELECT * FROM sys.TABLES 
	WHERE name = 'DimCustomer')
DROP TABLE DimCustomer
GO

CREATE TABLE DimCustomer(
	CustomerKey INT IDENTITY
    ,CustomerID INT	NOT NULL
	,FirstName VARCHAR(50) NOT NULL
	,LastName VARCHAR(50) NOT NULL
	,LocationKey int NOT NULL
	,IsDeleted BIT DEFAULT 0 NOT NULL
    
	Constraint fk_DimCustomer_LocationKey
    FOREIGN key (LocationKey)
    REFERENCES DimLocation(LocationKey)
	PRIMARY KEY CLUSTERED(CustomerKey)
)

GO


-- Build indexes

IF EXISTS
  (SELECT * FROM sys.indexes 
   WHERE name = 'DimCustomer_CustomerKey'
   AND object_id = object_id('DimCustomer_Customerkey'))
DROP INDEX DimCustomer.DimCustomer_CustomerKey
GO

CREATE UNIQUE INDEX DimCustomer_CustomerKey
 ON DimCustomer(CustomerKey)

GO

CREATE INDEX DimCustomer_LocationKey_Key
  on DimCustomer(LocationKey)
GO

ALTER TABLE DimCustomer
NOCHECK CONSTRAINT fk_DimCustomer_LocationKey
GO