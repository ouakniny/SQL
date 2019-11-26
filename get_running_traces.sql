select [Status] = iif(tr.[status]=1,'Running','Stopped')
	  ,[Default] = iif(tr.is_default=1,'System TRACE','User TRACE')
      ,[login_name] = coalesce(se.login_name,se.login_name,'No reader spid')
      ,[Trace Path] = coalesce(tr.[Path],tr.[Path],'OLE DB Client Side Trace')
from sys.traces tr
left join sys.dm_exec_sessions se on tr.reader_spid = se.session_id