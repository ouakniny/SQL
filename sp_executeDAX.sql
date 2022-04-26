declare @dax nvarchar(2000);
set @dax='
drop table if exists Haaracot_Ovdim_Letters_Dax;
select PERSA=[DimDepartment[PERSA]]]
, PERSATXT=[DimDepartment[PERSA_LABEL]]]
, LASTUPDATE=[[LastFileDate]]]
, EVALUATIONS=[[DrillEvaluations]]]
, WAITMANAGER1=[[DrillWaitManager1]]]
, POTENTIAL=[[DrillPotential]]]
into Haaracot_Ovdim_Letters_Dax
from openquery([LinkedServerName],''
EVALUATE SUMMARIZECOLUMNS(''''DimDepartment''''[PERSA]
						, ''''DimDepartment''''[PERSA_LABEL]
						, FILTER(VALUES(''''DimDateYear''''[YEAR]), (''''DimDateYear''''[YEAR] = VALUE("2021")))
						, "LastFileDate", [LastFileDate], "DrillEvaluations", [DrillEvaluations], "DrillWaitManager1", [DrillWaitManager1], "DrillPotential", [DrillPotential]
)
'') '
exec sp_executeSQL @dax;