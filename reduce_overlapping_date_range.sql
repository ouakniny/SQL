/************************************************/
/*  |-------------|                             */
/*      |-------------|                         */
/*          |-------------|                     */
/*                              |--------|      */
/*                                  |--------|  */
/*												*/
/*  |---------------------|     |------------|  */
/*                                              */
/************************************************/
with numbers as (
	select top(40000) number=incr-1
	from(
		select  incr = row_number() over (order by object_id, column_id)
		from(
			select a.object_id, a.column_id 
			from sys.all_columns a cross join sys.all_columns b
		) as a
	) as b
)
,t as (
	select PERNR
		,HOLDTYP=iif(TMART='05','A','B')
		,BEGDA=iif(BVMRK=' ' and AEDTM < MNDAT,AEDTM,MNDAT)
		,ENDDA=TERMN
		,TERMN
	from FlexStage.dbo.HR_439NSM_0019	
	where TMART in ('05','06') --and not (MNDAT > TERMN and MNDAT < AEDTM)
)
select PERNR, HOLDTYP, Min(NEWBEGDA) BEGDA, MAX(ENDDA) ENDDA, MAX(TERMN) TERMN	
from(
	select *,
		NEWBEGDA = dateadd(d,v.number,t.BEGDA),
		NEWBEGDAGROUP = dateadd(d,1-DENSE_RANK() over (partition by PERNR, HOLDTYP order by dateadd(d,v.number,t.BEGDA)),dateadd(d,v.number,t.BEGDA))
	from t
	inner join numbers v on v.number <= DATEDIFF(d, BEGDA, ENDDA)
) x
group by PERNR, HOLDTYP, NEWBEGDAGROUP



