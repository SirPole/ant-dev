@echo off

IF EXIST %userprofile%\.ant\.ant-dev-lock (GOTO DOWN) ELSE (EXIT)

:DOWN
FOR /f "delims=" %%i IN ('more %userprofile%\.ant\.ant-dev-lock') DO SET LOCK_DIR=%%i
cd %LOCK_DIR%
docker-compose down ^
    --remove-orphans ^
    --volumes
taskkill /f /im "winnfsd.exe" >nul
DEL /F /Q %userprofile%\.ant\.ant-dev-lock %userprofile%\.ant\.ant-dev-nfs-exports
