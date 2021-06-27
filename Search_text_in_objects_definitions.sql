USE ReportServer_PBI
GO
SELECT OBJECT_NAME(id) 'Name' , *
FROM syscomments
WHERE text LIKE '%Previous Name of PBIReportServerTempDB%'
ORDER BY Name