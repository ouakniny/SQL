if object_id('tempdb..#mapat_clean') is not null drop table #mapat_clean;
;with mapat as (
	select manager=PERNR_MAN, employee=PERNR, YEAR_DATE
	from FlexStage.dbo.FactPlan
)
/* Detect potential loop using sentinel variable */
,sentinel(manager, employee, Sentinel, YEAR_DATE) as (
	select manager, employee, Sentinel = cast(manager AS varchar(max))
		,mapat.YEAR_DATE
	from mapat
	union all
	select cte.employee, t.employee, cast(Sentinel as varchar(max)) + ' -> ' + cast(cte.employee as varchar(max))
		,cte.YEAR_DATE
	from sentinel cte
	join mapat t on t.manager = cte.employee and t.YEAR_DATE=cte.YEAR_DATE
	where charindex(convert(varchar,cte.employee),Sentinel)=0
)
/* Get managers that are part of a loop */
,manager_loop as (
	select distinct manager from sentinel where charindex(convert(varchar,employee),Sentinel)>0
)
/* Keep only manager that are not part of a loop */
select * 
into #mapat_clean
from mapat 
where manager not in (select manager from manager_loop)

/* Get recursively N+i hierarchical link */
if object_id('tempdb..#mapat_flat') is not null drop table #mapat_flat;
;with result as(
	select ni=1, manager, employee, m.YEAR_DATE
	from #mapat_clean m
	union all
	select ni=ni+1, nextOne.Manager, nextOneEmployee.Employee, nextOne.YEAR_DATE
	from result nextOne
	inner join #mapat_clean nextOneEmployee on nextOne.employee = nextOneEmployee.manager and nextOne.YEAR_DATE=nextOneEmployee.YEAR_DATE
)
select YEAR_DATE, PERNR_MAN=s.[manager], PERNR=[employee]
into #mapat_flat
from result s

drop table if exists FlexStage.dbo.DimEvaluatorFullHierarchy
select YEAR_DATE, PERNR_MAN, SK=(convert(bigint,PERNR)*10000)+YEAR(YEAR_DATE)
into FlexStage.dbo.DimEvaluatorFullHierarchy
from #mapat_flat

drop table if exists FlexStage.dbo.DimNbEmployee
;with cte as (
	select YEAR_DATE, PERNR_MAN, NBEMPLOYEE=COUNT(*)
	from #mapat_flat
	group by YEAR_DATE, PERNR_MAN
)
select YEAR_DATE, PERNR_MAN, NBEMPLOYEE=NTILE(7) over (order by NBEMPLOYEE)*3
into FlexStage.dbo.DimNbEmployee
from cte













