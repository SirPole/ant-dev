@echo off

FOR /f %%i IN ('docker ps -q -f name^=web') DO SET IS_RUNNING=%%i
IF /I [%IS_RUNNING%]==[] (CALL ant up)

docker exec -i web ncu %*
