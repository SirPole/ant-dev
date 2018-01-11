@ECHO OFF

FOR /f %%i IN ('docker ps -q -f name^=database') DO SET IS_RUNNING=%%i
IF /I [%IS_RUNNING%]==[] (CALL dcup)

SET DB=""
SET FILE=%1

IF /I NOT "%~2"=="" (
	SET DB=%1
	SET FILE=%2
)

docker exec database mysql -uroot -proot %DB% < %FILE%
