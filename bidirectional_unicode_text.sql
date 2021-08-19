alter table DimSeniorCadence alter column SENIOR_CADENCE nvarchar(50)

update DimSeniorCadence set SENIOR_CADENCE = NCHAR(0x202B)+SENIOR_CADENCE+NCHAR(0x202C)