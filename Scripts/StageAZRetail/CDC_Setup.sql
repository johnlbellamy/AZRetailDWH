USE AZRetailOLTP
GO
-- enable CDC if it is disabled
if not exists (select * from sys.databases where name = db_name() and is_cdc_enabled=1)
	exec sys.sp_cdc_enable_db
-- create a role for tables with CDC
if not exists(select * from sys.sysusers where name = 'CDC_Reader' and issqlrole=1)
	create role CDC_Reader
-- Enable change capture

-- enable CDC for the table
if not exists (select * from sys.tables where is_tracked_by_cdc = 1 and name = 'Customer')
	exec sys.sp_cdc_enable_table
		@source_schema = 'dbo',
		@source_name = 'Customer',
		@role_name = 'CDC_Reader',
		@captured_column_list= 'CustomerID,FirstName,LastName,AddressNumber'

if not exists (select * from sys.tables where is_tracked_by_cdc = 1 and name = 'Orders')
	exec sys.sp_cdc_enable_table
		@source_schema = 'dbo',
		@source_name = 'Orders',
		@role_name = 'CDC_Reader'
		
if not exists (select * from sys.tables where is_tracked_by_cdc = 1 and name = 'OrderDetails')
	exec sys.sp_cdc_enable_table
		@source_schema = 'dbo',
		@source_name = 'OrderDetails',
		@role_name = 'CDC_Reader'
		
--Create tables to hold CDC State

CREATE TABLE [dbo].[cdc_Order_states] 
 ([name] [nvarchar](256) NOT NULL, 
 [state] [nvarchar](256) NOT NULL) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [cdc_states_name] ON 
 [dbo].[cdc_Order_states] 
 ( [name] ASC ) 
 WITH (PAD_INDEX  = OFF) ON [PRIMARY]
GO

CREATE TABLE [dbo].[cdc_Customer_states] 
 ([name] [nvarchar](256) NOT NULL, 
 [state] [nvarchar](256) NOT NULL) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [cdc_states_name] ON 
 [dbo].[cdc_Customer_states] 
 ( [name] ASC ) 
 WITH (PAD_INDEX  = OFF) ON [PRIMARY]
GO

CREATE TABLE [dbo].[cdc_OrderDetails_states] 
 ([name] [nvarchar](256) NOT NULL, 
 [state] [nvarchar](256) NOT NULL) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [cdc_states_name] ON 
 [dbo].[cdc_OrderDetails_states] 
 ( [name] ASC ) 
 WITH (PAD_INDEX  = OFF) ON [PRIMARY]
GO



