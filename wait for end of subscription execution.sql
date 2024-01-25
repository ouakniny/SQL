BEGIN TRY
	DECLARE @status VARCHAR(255) = 'Pending'
	DECLARE @subscription_id UNIQUEIDENTIFIER = 'a96618a2-991e-461f-805e-e53396cf2596'

	EXEC [ReportServer].dbo.AddEvent @EventType='TimedSubscription', @EventData=@subscription_id

    WHILE @status = 'Pending'
    BEGIN
        WAITFOR DELAY '00:00:05'

        SELECT @status = LastStatus
        FROM [ReportServer].dbo.subscriptions
        WHERE subscriptionid = @subscription_id
    END
END TRY

BEGIN CATCH
END CATCH