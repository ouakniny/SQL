USE [CDCAudit]
GO

drop table if exists Employees;

create table Employees(
	Id bigint identity(1,1)
	,Pernr int not null
	,FirstName nvarchar(255) not null
	,LastName nvarchar(255) not null
	,DateBirth date not null
)

-- Enable change data capture in the current database
exec sys.sp_cdc_enable_db
go
-- Activate change data capture for a specific table
exec sys.sp_cdc_enable_table @source_schema = N'dbo', @source_name = N'Employees', @role_name = NULL, @filegroup_name = NULL, @supports_net_changes = 0 
go

-- Add table for extra fields : username and eventdate
drop table if exists cdc.dbo_Employees_CT_Extra;
create table cdc.dbo_Employees_CT_Extra
(
  startlsn   BINARY(10),
  seqval     BINARY(10),
  operation  INT,
  username   SYSNAME NOT NULL DEFAULT SUSER_SNAME(),
  eventDate  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (startlsn, seqval, operation)
);
go

-- Create trigger to fill extra table
CREATE TRIGGER cdc.LogMoreCDCInfo
ON cdc.dbo_Employees_CT
FOR INSERT
AS
BEGIN
  IF @@ROWCOUNT > 0
  BEGIN
    INSERT cdc.dbo_Employees_CT_Extra(startlsn,seqval,operation)
      SELECT __$start_lsn, __$seqval, __$operation FROM inserted;
  END
END
GO

-- Run few DML instructions 
insert into [dbo].[Employees]([Pernr], [FirstName], [LastName], [DateBirth]) values (123456,'ישראל','ישראלי','1982-03-16')
insert into [dbo].[Employees]([Pernr], [FirstName], [LastName], [DateBirth]) values (999999,'שמעון','לוי','1982-03-16')
update [dbo].[Employees] set DateBirth='1980-01-01' where Pernr=999999
delete [dbo].[Employees] where Pernr=123456

-- Check the change table content

--declare @begin binary(10), @end binary(10);
--set @begin = sys.fn_cdc_get_min_lsn('dbo_Employees');
--set @end = sys.fn_cdc_get_max_lsn();
--select * from [cdc].[fn_cdc_get_all_changes_dbo_Employees](@begin, @end, N'ALL');

select operation = case m.operation 
         when 1 then 'delete'
         when 2 then 'insert'
         when 3 then 'update (before)' 
         when 4 then 'update (after)'
         else 'unknown' end,
       c.id,  
       c.Pernr,
       c.FirstName,
	   c.LastName,
	   c.DateBirth,
       m.username,
       m.eventDate
from cdc.dbo_Employees_CT_Extra m
inner join cdc.dbo_Employees_CT c with (nolock) on c.__$start_lsn = m.startlsn AND c.__$seqval = m.seqval AND c.__$operation = m.operation
order by m.eventDate;

-- Cleanup the change table (default older than 3 days --> sql agent)
declare @Last_LSN varbinary(10) = (select max(cdc.dbo_Employees_CT.[__$start_lsn]) from cdc.dbo_Employees_CT)
exec sys.sp_cdc_cleanup_change_table @capture_instance = 'dbo_Employees', @low_water_mark = @Last_LSN, @threshold = 5000

-- Disable change data capture
exec sys.sp_cdc_disable_table @source_schema = 'dbo', @source_name = 'Employees', @capture_instance = 'dbo_Employees'
go
exec sys.sp_cdc_disable_db
go