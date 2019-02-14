@echo off

FOR /f %%i IN ('docker ps -q -f name^=nginx') DO SET IS_RUNNING=%%i
SET CURRENT_PATH=%cd%
IF /I [%IS_RUNNING%]==[] (GOTO STOPPED) ELSE (GOTO RUNNING)

:RUNNING
FOR /f "delims=" %%i IN ('more %userprofile%\.ant\.ant-dev-lock') DO SET CONTAINER_PATH=%%i
IF /I [%CONTAINER_PATH%]==[%CURRENT_PATH%] (
    ECHO Containers are already running in this directory
    EXIT
) ELSE (
    ECHO Warning! Current containers were created from different directory.
    GOTO SHOULD_RESTART
)

:STOPPED
FOR /f %%i IN ('docker ps -aq -f status^=exited -f name^=nginx') DO SET IS_EXITED=%%i
IF /I NOT [%IS_EXITED%]==[] (GOTO RESTART) ELSE (GOTO START)

:SHOULD_RESTART
IF EXIST docker-compose.yml (
    ECHO Found docker-compose.yml in current directory. Will destroy old containers and create new ones.
    GOTO RESTART
) ELSE (
    ECHO No docker-compose.yml file in current directory. Please run 'ant init' to create one.
    EXIT
)


:RESTART
CALL ant-down
cd %CURRENT_PATH%

:START
docker-compose up -d --no-color
echo %CURRENT_PATH%> %userprofile%\.ant\.ant-dev-lock
