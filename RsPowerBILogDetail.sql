select [Condition]=json_query(c.Value,'$')
	,[Property]=json_value(d.Value,'$.Expressions[0].Column.Property')
	,[Value]=json_value(d.Value,'$.Values[0][0].Literal.Value')
from [Monitor].[dbo].[RsPowerBILogDetail] x
cross apply OPENJSON([Query], '$.Query.Where') as c
cross apply OPENJSON(json_query(c.Value,'$'), '$.Condition') as d

