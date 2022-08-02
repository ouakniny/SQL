-- box-muller: generate random normal out of random uniform
select *, minimum=min(normal) over(), maximum=max(normal) over(), average=avg(normal) over(), stdeviation=stdev(normal) over()
from(
	select *, normal=round((sqrt(-2.0*log(uniform1))*cos(2.0*pi()*uniform2))*3,0.01)+14 --avg 14 std 3 precision 0.01
	from(
		select top 50
			uniform1=(abs(checksum(newid()))%100+1)/100.0,
			uniform2=(abs(checksum(newid()))%100+1)/100.0
		from sys.columns a
		cross join sys.columns b
	)a
)b