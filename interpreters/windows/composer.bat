@echo off

docker run ^
--rm ^
--interactive ^
--name composer ^
--volume %cd%:/app ^
--volume %userprofile%\.ant\composer:/tmp ^
composer %*
