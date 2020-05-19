delete FlexStage.dbo.MAP_CLUSTER
insert into FlexStage.dbo.MAP_CLUSTER
exec sp_execute_external_script @language=N'R',
	@script=N'cluster<-kmeans(InputDataSet[2:3],8)
			  OutputDataSet<-cbind(InputDataSet,cluster$cluster)
			  ',
	@input_data_1=N'
	select Evaluator_ID, [AVG]=avg(Score), [STD]=stdev(Score)
	from FlexStage.dbo.VIEW_HR_EVALUATIONS dwh
	where Score is not null
	group by Year(YearDate), Evaluator_ID
	having stdev(Score) is not null
	';