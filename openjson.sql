DECLARE @json NVARCHAR(MAX);
SET @json = N'[
  {"RequestTypeId": 1, "Action": 1, "UserId_set": 1, "OfficeId_set": 0, "DashboardId_set": 1, "EmployeeId_set": 1, "PositionId_set": 1, "DataTypeId_set": 0, "OfficeGroupId_set": 0},
  {"RequestTypeId": 2, "Action": 1, "UserId_set": 1, "OfficeId_set": 1, "DashboardId_set": 0, "EmployeeId_set": 1, "PositionId_set": 1, "DataTypeId_set": 1, "OfficeGroupId_set": 0},
  {"RequestTypeId": 3, "Action": 1, "UserId_set": 1, "OfficeId_set": 0, "DashboardId_set": 0, "EmployeeId_set": 1, "PositionId_set": 1, "DataTypeId_set": 1, "OfficeGroupId_set": 1},
  {"RequestTypeId": 4, "Action": 2, "UserId_set": 1, "OfficeId_set": 0, "DashboardId_set": 1, "EmployeeId_set": 1, "PositionId_set": 1, "DataTypeId_set": 0, "OfficeGroupId_set": 0},
  {"RequestTypeId": 5, "Action": 2, "UserId_set": 1, "OfficeId_set": 1, "DashboardId_set": 0, "EmployeeId_set": 1, "PositionId_set": 1, "DataTypeId_set": 1, "OfficeGroupId_set": 0},
  {"RequestTypeId": 6, "Action": 2, "UserId_set": 1, "OfficeId_set": 0, "DashboardId_set": 0, "EmployeeId_set": 1, "PositionId_set": 1, "DataTypeId_set": 1, "OfficeGroupId_set": 1},
  {"RequestTypeId": 7, "Action": 4, "UserId_set": 1, "OfficeId_set": 0, "DashboardId_set": 0, "EmployeeId_set": 1, "PositionId_set": 1, "DataTypeId_set": 0, "OfficeGroupId_set": 0}
]';

SELECT *
FROM OPENJSON(@json)
  WITH (
	RequestTypeId int 'strict $.RequestTypeId',
    [Action] int 'strict $.Action',
    UserId_set bit '$.UserId_set',
	OfficeId_set bit '$.OfficeId_set',
	DashboardId_set bit '$.DashboardId_set',
	EmployeeId_set bit '$.EmployeeId_set',
	PositionId_set bit '$.PositionId_set',
	DataTypeId_set bit '$.DataTypeId_set',
	OfficeGroupId_set bit '$.OfficeGroupId_set'
);