
use master
go

if db_id ('StageAZRetail') is not null
drop database StageAZRetail;
go

create database StageAZRetail
collate SQL_Latin1_General_CP1_CI_AS
go

alter database StageAZRetail  set recovery simple 
go
alter database StageAZRetail set auto_shrink off
go
alter database StageAZRetail  set auto_create_statistics off
go
alter database StageAZRetail  set auto_update_statistics off
go