use msdb

-- Take Offline the DB

-- Move files physically

-- Run that
ALTER DATABASE [Monitor] MODIFY FILE ( NAME = Monitor , FILENAME = 'F:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Monitor.mdf' )
ALTER DATABASE [Monitor] MODIFY FILE ( NAME = Monitor_log , FILENAME = 'F:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Monitor_log.ldf' )  

-- Set DB online