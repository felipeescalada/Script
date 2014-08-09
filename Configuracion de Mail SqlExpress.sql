/*Step 1
use master
go
sp_configure 'show advanced options',1
go
reconfigure with override
go
sp_configure 'Database Mail XPs',1
--go
--sp_configure 'SQL Mail XPs',0
go
reconfigure
go

*/

/*Step 2
EXECUTE msdb.dbo.sysmail_add_account_sp
@account_name = 'TestMailAccount',
@description = 'Mail account for Database Mail',
@email_address = 'tanmaya@mydomain.com',
@display_name = 'MyAccount',
@username='tanmaya@mydomain.com',
@password='1qwe432',
@mailserver_name = 'mail.mydomain.com'



/* modificacion de una cuenta existente.

EXECUTE msdb.dbo.sysmail_update_account_sp
@account_name = 'Andromeda Mail',
@description = 'Mail account for Database Mail',
@email_address = 'asist.ti@rimith.com',
@display_name = 'HelpDesk Soporte',
@username='asist.ti',
@password='',
@mailserver_name = 'mail.rimith.com'
*/

*/

/*Step 3
EXECUTE msdb.dbo.sysmail_add_profile_sp
@profile_name = 'TestMailProfile',
@description = 'Profile needed for database mail'
*/

/*Step 4

EXECUTE msdb.dbo.sysmail_add_profileaccount_sp
@profile_name = 'TestMailProfile',
@account_name = 'Andromeda Mail',
@sequence_number = 1

*/

/*Step 5
EXECUTE msdb.dbo.sysmail_add_principalprofile_sp
@profile_name = 'TestMailProfile',
@principal_name = 'public',
@is_default = 1 ;
*/





declare @body1 varchar(100)
--set @body1 = 'Server :'+@@servername+ ' Test DB Email '
set @body1 ='<table border=1><tr><td>EmpId</td><td>Emp name</td><td>age</td></tr><tr><td>value</td><td>value</td><td>value</td></tr></table>'
EXEC msdb.dbo.sp_send_dbmail @recipients='fescalada@rimith.com',
@subject = 'Requerimiento Nro 237000',
@body = @body1,
@body_format = 'HTML' ;


