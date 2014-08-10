USE Soporte;
GO
-- Truncate the log by changing the database recovery model to SIMPLE.
ALTER DATABASE Soporte
SET RECOVERY SIMPLE;
GO
-- Shrink the truncated log file to 1 MB.rimith
DBCC SHRINKFILE (KIXVER_Log, 1);
GO
-- Reset the database recovery model. rimith
ALTER DATABASE Soporte
SET RECOVERY FULL;
GO