@echo off

docker run ^
--rm ^
--interactive ^
--tty ^
--name composer ^
--volume %cd%:/app ^
--volume %userprofile%/.ant/composer:/tmp ^
composer %*
