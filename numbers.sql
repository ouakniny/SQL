select top(10000) numbers=row_number() over (order by a.object_id, a.column_id)
from sys.all_columns a 
cross join sys.all_columns b