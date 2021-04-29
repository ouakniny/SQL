-------------------------
-- Enabling FILESTREAM --
-------------------------
--1. On the Start menu, point to All Programs, point to SQL Server, point to Configuration Tools, and then click SQL Server Configuration Manager.
--2. In the list of services, right-click SQL Server Services, and then click Open.
--3. In the SQL Server Configuration Manager snap-in, locate the instance of SQL Server on which you want to enable FILESTREAM.
--4. Right-click the instance, and then click Properties.
--5. In the SQL Server Properties dialog box, click the FILESTREAM tab.
--6. Select the Enable FILESTREAM for Transact-SQL access check box.
--7. If you want to read and write FILESTREAM data from Windows, click Enable FILESTREAM for file I/O streaming access. Enter the name of the Windows share in the Windows Share Name box.
--8. If remote clients must access the FILESTREAM data that is stored on this share, select Allow remote clients to have streaming access to FILESTREAM data.
--9. Click Apply.
--10. In SQL Server Management Studio, click New Query to display the Query Editor.
--11. In Query Editor, enter the following Transact-SQL code:


		EXEC sp_configure filestream_access_level, 2  
		RECONFIGURE


--12. Click Execute.
--13. Restart the SQL Server service.

---------------------------------------------
-- To create a FILESTREAM-enabled database --
---------------------------------------------
CREATE DATABASE Archive 
ON 
PRIMARY ( NAME = Arch1,
    FILENAME = 'c:\data\archdat1.mdf'),
FILEGROUP FileStreamGroup1 CONTAINS FILESTREAM( NAME = Arch3,
    FILENAME = 'c:\data\filestream1')
LOG ON  ( NAME = Archlog1,
    FILENAME = 'c:\data\archlog1.ldf')
GO

------------------------------------------------
-- To create a table to store FILESTREAM data --
------------------------------------------------
CREATE TABLE Archive.dbo.Records
(
    [Id] [uniqueidentifier] ROWGUIDCOL NOT NULL UNIQUE, 
    [SerialNumber] INTEGER UNIQUE,
    [Chart] VARBINARY(MAX) FILESTREAM NULL
)
GO

--------------------------------------------
-- To insert files from folder into table --
--------------------------------------------
-- 1. Use a loop in SSIS to create table filelist with path of each file
-- 2. Create data flow task with source the filelist table
-- 3. Add an "Import Column" transformation to create the DT_IMAGE field
-- 4. Target your filestream table