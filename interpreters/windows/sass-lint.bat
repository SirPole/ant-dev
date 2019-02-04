@echo off

FOR /f %%i IN ('docker ps -q -f name^=node') DO SET IS_RUNNING=%%i
IF /I [%IS_RUNNING%]==[] (GOTO START) ELSE (GOTO CONNECT)

:START
docker run ^
    --rm ^
    --name node ^
    --network ant-dev ^
    --publish 3000:3000 ^
    --volume %cd%:/app ^
    --volume %userprofile%\.ant\npm:/tmp ^
    sirpole/ant-dev:node sass-lint %*
GOTO :EOF

:CONNECT
docker exec ^
    node sass-lint %*
