use master
go

if db_id ('AZRetailDWHLog') is not null
drop database AZRetailDWHLog
GO

CREATE DATABASE AZRetailDWHLog
COLLATE SQL_Latin1_General_CP1_CI_AS
GO

USE AZRetailDWHLog
GO

alter database AZRetailDWHLog SET recovery simple 
go
alter database AZRetailDWHLog SET auto_shrink off
go
alter database AZRetailDWHLog SET auto_create_statistics on
go
alter database AZRetailDWHLog SET auto_update_statistics on
GO