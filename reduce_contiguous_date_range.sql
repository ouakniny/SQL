with breaks as (
	select PERNR, BEGDA, ENDDA, breaking=iif(BEGDA=dateadd(day,1,lag(ENDDA) over (partition by PERNR order by BEGDA)),0,1)	
	from Interval
),
cumulative_breaks as (
	select *, cumul=sum(breaking) over (partition by PERNR order by BEGDA)
	from breaks
)
select PERNR, BEGDA=min(BEGDA), ENDDA=max(ENDDA)
from cumulative_breaks
group by PERNR, cumul
