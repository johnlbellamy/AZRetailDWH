USE StageAZRetail
GO

IF EXISTS 
  (SELECT * FROM sys.tables 
   WHERE NAME = 'StageOrders')
DROP TABLE StageOrders
GO

CREATE TABLE StageOrders (
	OrderID INT NOT NULL
	,CustomerID INT NOT NULL
	,StoreNumber SMALLINT NOT NULL
	,DateOrderPlaced DATETIME NOT NULL
	,DateOrderShipped DATETIME NULL
	,DateOfLastUpdate DATETIME NULL
)