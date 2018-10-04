echo Enable CDC
sqlcmd -i CDC_Setup.sql >> dds_out.txt

echo Creating Stage Database
sqlcmd -i create_StageAZRetail.sql >> dds_out.txt

echo Creating Stage Orders
sqlcmd -i create_StageOrders.sql >> dds_out.txt

echo Creating Stage OrderDetails
sqlcmd  -i create_StageOrderDetails.sql >> dds_out.txt

echo Creating Stage Customer
sqlcmd  -i create_StageCustomer.sql >> dds_out.txt

#echo Creating CDC Tables
#sqlcmd -i CDC_Setup.sql >> dds_out.txt
cd ..\AZRetailDWH
create_AZRetailDWH.bat