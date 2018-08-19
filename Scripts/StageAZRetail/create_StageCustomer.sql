USE StageAZRetail
GO

IF EXISTS 
  (SELECT * FROM sys.tables 
   WHERE NAME = 'StageCustomer')
DROP TABLE StageCustomer
GO

CREATE TABLE StageCustomer(
	 CustomerNumber INT NOT NULL
	,FirstName VARCHAR(50) NOT NULL
	,LastName VARCHAR(50) NOT NULL
	,AddressID INT NOT NULL

	
)