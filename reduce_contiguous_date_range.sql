with breaking as (
	select PERSA, PERID_NUM,  PLANS
		, BEGDA=convert(date,BEGDA)
		, ENDDA=convert(date,iif(ENDDA=99991231,convert(varchar(8),getdate(),112),ENDDA))	
		, breaking=iif(BEGDA=dateadd(day,1,lag(ENDDA) over (partition by PERSA, PERID_NUM,  PLANS order by BEGDA)),0,1)	
	from [FlexStage].[dbo].[HR_439NSM_0001]
	where PLANS not in (99999999) and [PERSK]='31' and PLANS not in (
		select distinct ZZ_RESPOS
		from [FlexStage].[dbo].[HR_439NSM_0001] 
		where 20210518 between BEGDA and ENDDA and ZZ_RESPOS not in (00000000,99999999)
	)
),
breaking_cumulated as (
	select *, cumul=sum(breaking) over (partition by PERSA, PERID_NUM,  PLANS order by BEGDA)
	from breaking
)
select PERSA, PERID_NUM,  PLANS, BEGDA=min(BEGDA), ENDDA=max(ENDDA)
from breaking_cumulated
group by PERSA, PERID_NUM,  PLANS, cumul
having datediff(month, MIN(BEGDA), MAX(ENDDA))>=12 and MAX(ENDDA)=convert(date,getdate())