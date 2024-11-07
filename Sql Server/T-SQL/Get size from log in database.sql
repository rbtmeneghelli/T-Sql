dbcc sqlperf(logspace)

select name, log_reuse_wait_desc from sys.databases where
name = 'WebNotesAPI'
