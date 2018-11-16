@echo off

docker run ^
--rm ^
--interactive ^
--name node ^
--volume %cd%:/app ^
--volume %userprofile%\.ant\npm:/tmp ^
sirpole/ant-dev:node sass-lint %*
