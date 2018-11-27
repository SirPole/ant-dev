@echo off

docker run ^
--rm ^
--network ant-dev ^
--volume %cd%:/app ^
--volume %userprofile%\.ant\npm:/tmp ^
sirpole/ant-dev:node sass-lint -v %*
