@echo off

winpty docker run ^
--rm ^
--interactive ^
--tty ^
--name composer ^
--network ant-dev ^
--volume %cd%:/app ^
--volume %userprofile%\.ant\composer:/tmp ^
composer --ignore-platform-reqs %*
