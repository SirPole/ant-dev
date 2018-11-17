@echo off

winpty docker run ^
--rm ^
--interactive ^
--tty ^
--name node ^
--network ant-dev ^
--volume %cd%:/app ^
--volume %userprofile%\.ant\npm:/tmp ^
sirpole/ant-dev:node npm %*
