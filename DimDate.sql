with limit as (
	select startdate=min(mindate), enddate=max(maxdate)
	from(
		select mindate=min(MONTHDATE),maxdate=max(MONTHDATE) from FactTime
		union
		select mindate=min(MONTHDATE),maxdate=max(MONTHDATE) from FactBudgetFinance
		union
		select mindate=min(MONTHDATE),maxdate=max(MONTHDATE) from FactBudgetHumanRessource
		union
		select mindate=min(MONTHDATE),maxdate=max(MONTHDATE) from FactEmployee
	) fact
)
,ini as (
	select top(datediff(DAY,(select startdate from limit),(select enddate from limit))+1) dt=dateadd(DAY,incr-1,(select startdate from limit))
	from(
		select  incr = row_number() over (order by object_id, column_id)
		from(
			select a.object_id, a.column_id 
			from  sys.all_columns a cross join sys.all_columns b
		) as a
	) as b
)
select Datekey=dt /* *10000+datepart(HOUR,dt)*100+datepart(MINUTE,dt) OR convert(bigint,convert(varchar(8),dt,112)) */,
	Year=year(dt),
	Quarter_Key=year(dt)*10+datepart(q,dt),
	Quarter_Num=datepart(q,dt),
	Quarter_Name=convert(varchar(4),year(dt))+'Q'+convert(varchar(1),datepart(q,dt)),
	Month_Key=year(dt)*100+datepart(MONTH,dt),
	Month_Num=datepart(MONTH,dt),
	Month_Name=convert(varchar(4),year(dt))+'-'+convert(varchar(2),RIGHT('00' + CONVERT(VARCHAR(2),datepart(MONTH,dt)), 2)),
	Month_Name_English=datename(month,dt),
	Month_Name_Hebrew=[dbo].[get_Hebrew_Month_Names](datepart(MONTH,dt)),
	Month_Id=month(dt),
	IsLastMonth=iif(convert(varchar(6),(select max(dt) from ini),112)=convert(varchar(6),dt,112),1,0)
from ini