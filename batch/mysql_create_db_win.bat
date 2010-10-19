@ECHO OFF

echo Admin password?:
read admin_password

echo New Username?:
read new_user

echo New User password?:
read password

echo Backup file name?:
read file_name

echo grant all on %new_user%.* to '%new_user%'@'localhost' identified by '%password%'; > db_create.sql
echo create database %new_user% >> db_create.sql

mysql -u root --password=%admin_password% -f db_create.sql

echo source C:\inetpub\temp\ForVivioSupport\%file_name% > db_create.sql
mysql -u %new_user% --password=%password% -f db_create.sql %new_user%

delete db_create.sql
