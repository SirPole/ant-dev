@echo off

FOR /f %%i IN ('docker ps -q -f name^=database') DO SET IS_RUNNING=%%i
IF /I [%IS_RUNNING%]==[] (CALL ant up)

docker exec ^
--interactive ^
database mysql -uroot -proot %*
