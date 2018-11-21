@echo off

FOR /f %%i IN ('docker ps -q -f name^=database') DO SET IS_RUNNING=%%i
IF /I [%IS_RUNNING%]==[] (CALL ant-up)


SET DB=%1
SET RESULT_PATH=%cd%

IF /I NOT "%~2"=="" (SET RESULT_PATH=%2)

docker exec ^
database mysqldump --add-drop-table --add-locks --compact --disable-keys --extended-insert --insert-ignore --no-create-db -uroot -proot %DB%> %RESULT_PATH%\%DB%.sql
