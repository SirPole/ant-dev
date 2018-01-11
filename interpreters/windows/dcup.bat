@echo off

FOR /f %%i IN ('docker ps -q -f name^=web') DO SET IS_RUNNING=%%i
FOR /f %%j IN ('docker ps -aq -f status^=exited -f name^=web') DO SET IS_EXITED=%%j

IF /I [%IS_RUNNING%]==[] (
    IF /I NOT [%IS_EXITED%]==[] (
        echo Removing old containers
        docker rm web database phpmyadmin
    )
    docker-compose up -d --no-color
)

IF /I "%~1"=="-i" (docker exec -it web bash)
