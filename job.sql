USE msdb ;  
GO  
EXEC dbo.sp_add_job  
    @job_name = N'WeeklyChildrenMaintenance' ;  
GO  
EXEC sp_add_jobstep  
    @job_name = N'WeeklyChildrenMaintenance',  
    @step_name = N'CleanChildrenThatHaveMoreThan18',  
    @subsystem = N'TSQL',  
    @command = N'
				USE [SpisLudnosci]
				GO

				DELETE dr from obywatel.Dziecko d
				JOIN Obywatel.DzieciRodziny dr ON dr.Id_Dziecko = d.Id
				WHERE DATEDIFF(Year, d.RokUrodzeniaDziecka, GETDATE()) >= 18
				GO

				DELETE d from obywatel.Dziecko d
				WHERE DATEDIFF(Year, d.RokUrodzeniaDziecka, GETDATE()) >= 18
				GO',   
    @retry_attempts = 5,  
    @retry_interval = 5 ;  
GO  
EXEC dbo.sp_add_schedule	
    @schedule_name = N'WeeklyExecute',  
    @freq_type = 8,  
	@freq_interval = 1,
	@freq_recurrence_factor = 1,
    @active_start_time = 233000 ;  
USE msdb ;  
GO  
EXEC sp_attach_schedule  
   @job_name = N'WeeklyChildrenMaintenance',  
   @schedule_name = N'WeeklyExecute';  
GO  
EXEC dbo.sp_add_jobserver  
    @job_name = N'WeeklyChildrenMaintenance';  
GO 