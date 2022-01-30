del "C:\Program Files\Microsoft Power BI Report Server\PBIRS\LogFiles\RSPowerBI*.log"
del "C:\data\LogAnalysis\RSPowerBI*.log"
sqlcmd -S . -Q "delete [Monitor].[dbo].[RequestStage]"