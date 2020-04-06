drop table if exists [dbo].[Mission]
go

create table [dbo].[Mission](
	[MissionId] [float] null,
	[EmployeeId1] [float] null,
	[HoldTypId1] [nvarchar](255) null,
	[Percent1] [float] null,
	[EmployeeId2] [float] null,
	[HoldTypId2] [nvarchar](255) null,
	[Percent2] [float] null,
	[EmployeeId3] [float] null,
	[HoldTypId3] [nvarchar](255) null,
	[Percent3] [float] null
) on [PRIMARY]
go

insert [dbo].[Mission] ([MissionId], [EmployeeId1], [HoldTypId1], [Percent1], [EmployeeId2], [HoldTypId2], [Percent2], [EmployeeId3], [HoldTypId3], [Percent3]) VALUES (1, 1, N'A', 100, 21, N'A', 100, 41, N'A', 80)
insert [dbo].[Mission] ([MissionId], [EmployeeId1], [HoldTypId1], [Percent1], [EmployeeId2], [HoldTypId2], [Percent2], [EmployeeId3], [HoldTypId3], [Percent3]) VALUES (2, 2, N'A', 100, 22, N'C', 100, 41, N'A', 80)

select * from Mission

select MissionId, EmployeeId, HoldTypId, PercentValue
from Mission
unpivot (
	EmployeeId
	for EmployeePosition in (EmployeeId1, EmployeeId2, EmployeeId3)
) b
unpivot (
	HoldTypId
	for HoldTypPosition in (HoldTypId1, HoldTypId2, HoldTypId3)
) b
unpivot (
	PercentValue
	for PercentPosition in (Percent1, Percent2, Percent3)
) c
where right(EmployeePosition,1)=right(HoldTypPosition,1) and right(EmployeePosition,1)=right(PercentPosition,1)