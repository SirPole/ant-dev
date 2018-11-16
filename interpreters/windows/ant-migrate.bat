@echo off

FOR /f %%i IN ('docker ps -q -f name^=php') DO SET IS_RUNNING=%%i
IF /I [%IS_RUNNING%]==[] (CALL ant-up)

docker exec ^
--interactive ^
php php index.php migrations:migrate
