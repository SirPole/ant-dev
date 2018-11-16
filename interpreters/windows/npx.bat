@echo off

docker run ^
--rm ^
--interactive ^
--name node ^
--volume %cd%:/app ^
--workdir /app ^
--volume %userprofile%\.ant\npm:/tmp ^
--env npm_config_cache=/tmp ^
node:8-alpine npx %*
