@echo off

FOR /f %%i IN ('docker ps -q -f name^=web') DO SET IS_RUNNING=%%i
IF /I [%IS_RUNNING%]==[] (GOTO STOPPED) ELSE (GOTO RUNNING)

:RUNNING
FOR /f "delims=" %%i IN ('docker inspect -f "{{range .Mounts}}{{if eq .Destination \"/var/www\"}}{{.Source}}{{end}}{{end}}" web') DO SET CONTAINER_PATH=%%i
FOR %%i IN (%CONTAINER_PATH:/= %) DO SET CONTAINER_PATH=%%i
FOR %%i IN (%cd:\= %) DO SET CURRENT_PATH=%%i
IF /I [%CONTAINER_PATH%]==[%CURRENT_PATH%] (GOTO EXEC) ELSE (
    ECHO Warning! Current containers were created from different directory.
    GOTO SHOULDRESTART
)

:STOPPED
FOR /f %%i IN ('docker ps -aq -f status^=exited -f name^=web') DO SET IS_EXITED=%%i
IF /I NOT [%IS_EXITED%]==[] (
    ECHO Removing old containers
    docker rm web
)
GOTO START

:SHOULDRESTART
IF EXIST docker-compose.yml (
    ECHO Found docker-compose.yml in current directory. Will destroy old containers and create new ones.
    docker stop web
    GOTO STOPPED
) ELSE (GOTO EXEC)

:START
docker-compose up -d --no-color
GOTO EXEC


:EXEC
IF /I "%~1"=="-i" (docker exec -it web bash)
