@echo off

docker-compose up -d --no-color

IF /I "%~1"=="-i" (GOTO EXEC) ELSE (GOTO DONE)

:EXEC
docker-compose exec web bash

:DONE
