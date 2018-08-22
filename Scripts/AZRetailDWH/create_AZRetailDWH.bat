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