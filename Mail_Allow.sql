EXEC sp_configure 'show advanced options', 1
GO
RECONFIGURE
GO

-- enable Database Mail XPs
EXEC sp_configure 'Database Mail XPs', 1
GO
RECONFIGURE
GO

-- check if it has been changed
EXEC sp_configure 'Database Mail XPs'
GO

-- hide advanced options
EXEC sp_configure 'show advanced options', 0
GO
RECONFIGURE
GO