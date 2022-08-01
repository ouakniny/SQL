with uniform as (
	select top 10000 ID=row_number() over (order by (select 1))
		, UNIFORM_DECIMAL_1=abs(checksum(newid())) % 100/100.0 + 0.0000001
		, UNIFORM_DECIMAL_2=abs(checksum(newid())) % 100/100.0
		, UNIFORM1=abs(checksum(newid()))%2
	from sys.columns a
	cross join sys.columns b
)
select *
, NORMAL=floor(round((sqrt(-2.0*log(UNIFORM_DECIMAL_1))*cos(2.0*pi()*UNIFORM_DECIMAL_2))*2.7,1)+14)
from uniform