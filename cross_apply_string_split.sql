select Id, Dt, Nb, Comment, ArrayValue=a.value
from openjson('[
{"Id":1, "Dt":"20210512", "Array":"[1,2,3]", "Nb":12, "Comment":"Hello world"},
{"Id":2, "Dt":"20210628", "Array":"[1,2]", "Nb":34, "Comment":"אני אילן"},
{"Id":3, "Dt":"20210807", "Array":"[1]", "Nb":89, "Comment":"Wazzzzza"}
]')
with (Id int, Dt Date, Array varchar(50), Nb int, Comment varchar(50))
cross apply string_split(substring(Array,2,len(Array)-2),',') a