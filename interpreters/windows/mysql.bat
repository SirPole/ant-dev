@echo off

FOR /f %%i IN ('docker ps -q -f name^=database') DO SET IS_RUNNING=%%i
IF /I [%IS_RUNNING%]==[] (CALL ant up)

winpty docker exec ^
--interactive ^
--tty ^
database mysql -uroot -proot %*
