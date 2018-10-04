use master
go

if db_id ('AZRetailDWH') is not null
drop database AZRetailDWH
GO

CREATE DATABASE AZRetailDWH
COLLATE SQL_Latin1_General_CP1_CI_AS
GO

USE AZRetailDWH
GO

alter database AZRetailDWH SET recovery simple 
go
alter database AZRetailDWH SET auto_shrink off
go
alter database AZRetailDWH SET auto_create_statistics on
go
alter database AZRetailDWH SET auto_update_statistics on
GO





