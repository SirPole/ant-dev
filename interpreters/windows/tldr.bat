@echo off

FOR /f %%i IN ('docker ps -q -f name^=node') DO SET IS_RUNNING=%%i
IF /I [%IS_RUNNING%]==[] (GOTO START) ELSE (GOTO CONNECT)

:START
winpty docker run ^
    --rm ^
    --interactive ^
    --tty ^
    --name node ^
    --network ant-dev ^
    --publish 3000:3000 ^
    --volume %cd%:/app ^
    --volume %userprofile%\.ant\npm:/tmp ^
    sirpole/ant-dev:node tldr %*
GOTO :EOF

:CONNECT
winpty docker exec ^
    --interactive ^
    --tty ^
    node tldr %*
