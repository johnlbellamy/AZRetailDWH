
# AZRetailDWH
An OLTP to OLAP warehouse implementation in SQL Server and SSAS

# Note:
This is still a work in progress. More updates and usage pdf coming soon.

# Requirements: 
1) Visual Studio 2017 with SSDT installed on server.
2) An edition of SQL server with report services available. 
3) Administrative (full control of SQL server with native login) is assumed with included settings. 

# Instructions:

# Get Files and Restore OLTP database
1) Download and unzip files. 
2) Download OLTP .bak file from (Copy and paste in browser): https://drive.google.com/file/d/1EucT4QoOGL6RZJSNyC3v9DvBnM5HrRZ2/view?usp=sharing
Unzip this file and place in the backup directory of your server. Then click on the root folder in the database and select "Restore Database from Backup".  DO NOT CHANGE THE NAME OF THIS DATABASE.

# Create warehouse and stage databases
3) Run make_databases.bat by double-clicking.

# Load stage for initial ETL
4) Open Visual Studio and open the Project ETL\InitalLoad_StageAZRetail\Load_Stage_SOL
5) Once project is loaded in Visual Studio open dtsx Load_StageAzRetail.dtsx. Run this package.

# Run ETL to populate DWH

6) Open Visual Studio and open the Project ETL\InititalLoad_AZRetailDWH\InitialLoad_OnlineRetailDWH_SOL
7) Once project is loaded in Visual Studio open dtsx Load_AZRetailDWH.dtsx. Run this package.

# Test the SCD and CDC capability

8) Double-click on change_static_tables.sql to open in SSMS, or open file in Notepad, etc and copy and paste to run. This makes changes to the databases, including new orders, deleting old orders, changing a store name, and adding a new customer.
9) Test these changes and how they are applied in the DWH. Open Visual Studio 2017 again and open ETL\IncrementalLoad_AZRetailDWH\IncrementalLoadAZRetailer_SOL. Open dtsx IncrementalLoad_AZRetailDWH. You should see the new new orders and customer after running it a second time.

# Create CUBE

10) Open Cube\AZRetailDWHSSAS_SOL in Visual Studio. Once loaded, right-click on projct name and select Build. Once it is built, right click on project name and select Deploy. Finally, right-click and select Process. Boom, you have a CUBE with a backing warehouse. NOTE: This will work if you have a Report Server setup with the default SQL server. Default in this case means a server that is accessible through the . or localhost shortcut on the connection mangers.
