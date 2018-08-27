USE AZRetailOLTP
GO

UPDATE dbo.Store
SET description = 'PHOENIX SUR'
WHERE StoreID = 115

-- Change Product with Code 5's name to Monkey Wrench
UPDATE dbo.Product
SET  description = 'Monkey Wrench'
WHERE ProductCode = 5

UPDATE dbo.ProductCategory
SET description = 'TOOLS'
WHERE Category = '3V'

-- Add new address

INSERT INTO dbo.Address
(
    City,
    State
)
VALUES
(   'Tucson', -- City - varchar(50)
    'Arizona'  -- State - varchar(50)
    )

-- Add new customer

INSERT INTO dbo.Customer
(
    FirstName,
    LastName,
   Addressnumber
)
VALUES
(   'John', -- FirstName - varchar(50)
    'Bellamy', -- LastName - varchar(50)
    1001   -- AddressKey - int
    )

-- Add new Order
INSERT INTO dbo.Orders
(
   
    CustomerNumber,
    OrderDate,
    ShipDate,
    DateLastContact,
    StoreNumber
)
VALUES
( 
    2001,         -- CustomerNumber - int
    GETDATE(), -- OrderDate - datetime
    NULL, -- ShipDate - datetime
    GETDATE(), -- DateLastContact - datetime
    115          -- StoreNumber - int
    )
-- Update OrderDetails with new order

	INSERT INTO dbo.OrderDetails
	(
	    OrderID,
	    [LINENO],
	    ProductNumber,
	    Price,
	    Cost,
	    Quantity
	)
	VALUES
	(   72905,    -- OrderID - int
	    1,    -- LINENO - smallint
	    5,    -- ProductNumber - int
	    533.6552, -- Price - smallmoney
	    444.7127, -- Cost - smallmoney
	    5     -- Quantity - int
	)

-- Finally, delete Order with ID  = 2

DELETE FROM dbo.Orders
WHERE OrderID = 2

DELETE FROM dbo.OrderDetails
WHERE OrderID = 2

DELETE FROM dbo.Orders
WHERE OrderID = 2