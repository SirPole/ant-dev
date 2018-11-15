@echo off

SCHTASKS /Query /tn "Update ant-dev" >nul 2>&1
IF errorlevel 1 (SCHTASKS /Create /tn "Update ant-dev" /tr "PowerShell -WindowStyle Hidden -Command %~dp0ant.exe selfupdate" /sc daily /st 10:00:00)

FOR /f %%i IN ('docker ps -q -f name=httpd') DO SET IS_RUNNING=%%i
IF /I [%IS_RUNNING%]==[] (GOTO STOPPED) ELSE (GOTO RUNNING)

:RUNNING
FOR /f "delims=" %%i IN ('more %userprofile%/.ant/.ant-dev-lock') DO SET CONTAINER_PATH=%%i
FOR %%i IN (%CONTAINER_PATH:/= %) DO SET CONTAINER_PATH=%%i
FOR %%i IN (%cd:\= %) DO SET CURRENT_PATH=%%i
IF /I [%CONTAINER_PATH%]==[%CURRENT_PATH%] (GOTO EXEC) ELSE (
    ECHO Warning! Current containers were created from different directory.
    GOTO SHOULD_RESTART
)

:STOPPED
FOR /f %%i IN ('docker ps -aq -f status=exited -f name=httpd') DO SET IS_EXITED=%%i
IF /I NOT [%IS_EXITED%]==[] (
    ECHO Removing old containers
    CALL ant-down
)
GOTO START

:SHOULD_RESTART
IF EXIST docker-compose.yml (
    ECHO Found docker-compose.yml in current directory. Will destroy old containers and create new ones.
    CALL ant-down
)

:START
docker-compose up -d --no-color
echo %cd% > %userprofile%/.ant/.ant-dev-lock

:EOF
