USE StageAZRetail
GO

IF EXISTS 
  (SELECT * FROM sys.tables 
   WHERE NAME = 'StageCustomer')
DROP TABLE StageOrders
GO

CREATE TABLE StageCustomer (

	CustomerID INT NOT NULL
	,FirstName VARCHAR(50) NOT NULL
	,LastName VARCHAR(50) NOT NULL
	,AddressNumber INT NOT NULL
)