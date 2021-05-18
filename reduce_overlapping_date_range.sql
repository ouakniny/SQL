/************************************************/
/*  |-------------|                             */
/*      |-------------|                         */
/*          |-------------|                     */
/*                              |--------|      */
/*                                  |--------|  */
/*						*/
/*  |---------------------|     |------------|  */
/*                                              */
/************************************************/
drop table if exists #overlap_date_ranges;
select * into #overlap_date_ranges
from openjson(N'[
	  {"EmployeeId": 100101, "StartDate": "20190425", "EndDate": "20191231"},
	  {"EmployeeId": 100101, "StartDate": "20191101", "EndDate": "20200629"},
	  {"EmployeeId": 100101, "StartDate": "20200430", "EndDate": "20200928"},
	  {"EmployeeId": 100101, "StartDate": "20210205", "EndDate": "20210618"},
	  {"EmployeeId": 100101, "StartDate": "20210519", "EndDate": "20210821"}
	]')
  with (EmployeeId int, StartDate date, EndDate date
);

select * from #overlap_date_ranges;

with breaks as (
	select EmployeeId, StartDate, EndDate, breaking=iif(StartDate>dateadd(day,1,lag(EndDate) over (partition by EmployeeId order by StartDate)),1,0)	
	from #overlap_date_ranges
),
cumulative_breaks as (
	select *, cumul=sum(breaking) over (partition by EmployeeId order by StartDate)
	from breaks
)
select EmployeeId, StartDate=min(StartDate), EndDate=max(EndDate)
from cumulative_breaks
group by EmployeeId, cumul



