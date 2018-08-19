USE StageAZRetail
GO

IF EXISTS 
  (SELECT * FROM sys.tables 
   WHERE NAME = 'StageOrderDetails')
DROP TABLE StageOrderDetails
GO

CREATE TABLE StageOrderDetails (
	OrderID INT NOT NULL
	,[LINENO] SMALLINT NOT NULL
	,ProductCode INT NOT NUll
	,UnitPrice SMALLMONEY NOT NUll
	,UnitCost SMALLMONEY NOT NULL
	,QuantitySold int NOT NULL
	
)