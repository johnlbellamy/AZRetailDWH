echo Creating DWH Database
sqlcmd  -i create_AZRetailDWH.sql >> dds_out.txt

echo Creating DimLocation
sqlcmd  -i create_DimLocation.sql    >> dds_out.txt

echo Creating DimCustomer
sqlcmd   -i create_DimCustomer.sql    >> dds_out.txt

echo Creating DimProduct
sqlcmd   -i create_DimProduct.sql     >> dds_out.txt

echo Creating DimStore
sqlcmd   -i create_DimStore.sql       >> dds_out.txt

echo Creating DimTime
sqlcmd   -i create_DimTime.sql        >> dds_out.txt

echo Creating FactOrders
sqlcmd   -i create_FactOrders.sql		>> dds_out.txt

echo Creating Stored Procdure for incremental DimTime Load
sqlcmd   -i create_proc_create_new_dim_time.sql		>> dds_out.txt

echo Creating DWH Log Database
sqlcmd   -i   create_AZRetailDWHLog.sql >> dds_out.txt

echo Creating View _vwDimCustomer
sqlcmd   -i   create_vwDimCustomer.sql >> dds_out.txt

echo Creating View _vwDimLocation
sqlcmd   -i   create_vwDimLocation.sql >> dds_out.txt

echo Creating View _vwDimProduct
sqlcmd   -i   create_vwDimProduct.sql >> dds_out.txt

echo Creating View _vwDimStore
sqlcmd   -i   create_vwDimStore.sql >> dds_out.txt

echo Creating View _vwDimTime
sqlcmd   -i   create_vwDimTime.sql >> dds_out.txt

echo Creating View _vwFactOrders
sqlcmd   -i   create_vwFactOrders.sql >> dds_out.txt