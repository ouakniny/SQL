with numbers as (
	select top(50000) number=row_number() over (order by (select 1))
	from sys.all_columns a cross join sys.all_columns b
)
,misrad as (
	select misrad='toto', freq=10000
	union
	select misrad='titi', freq=8000
	union
	select misrad='tata', freq=12000
	union
	select misrad='tutu', freq=18000
	union
	select misrad='tete', freq=2000
)
select misrad
from misrad a
left join numbers n on n.number<=a.freq

