CREATE OR ALTER FUNCTION dbo.NormalPDF (@x FLOAT, @mean FLOAT, @stddev FLOAT)
RETURNS FLOAT
AS
BEGIN
    RETURN (1.0 / (@stddev * SQRT(2.0 * PI()))) * EXP(-POWER(@x - @mean, 2) / (2.0 * POWER(@stddev, 2)));
END;
GO

declare @total int;
set @total=782

drop table if exists #normal;

select *
into #normal
from(
		  select x=1, NormalPDF=floor(dbo.NormalPDF(1,4,1)*@total)
	union select x=2, NormalPDF=floor(dbo.NormalPDF(2,4,1)*@total)
	union select x=3, NormalPDF=floor(dbo.NormalPDF(3,4,1)*@total)
	union select x=4, NormalPDF=floor(dbo.NormalPDF(4,4,1)*@total)
	union select x=5, NormalPDF=floor(dbo.NormalPDF(5,4,1)*@total)
	union select x=6, NormalPDF=floor(dbo.NormalPDF(6,4,1)*@total)
	union select x=7, NormalPDF=floor(dbo.NormalPDF(7,4,1)*@total)
)a

select * from #normal;

select Total=sum(NormalPDF) from #normal;
