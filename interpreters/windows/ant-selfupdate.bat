@echo off

SCHTASKS /Query /tn "Update ant-dev"
IF errorlevel 1 (SCHTASKS /Create /tn "Update ant-dev" /tr "PowerShell -WindowStyle Hidden -Command %~dp0ant.exe selfupdate" /sc daily /st 10:00:00)

CD /D %~dp0..\..

FOR /f %%i IN ('git rev-parse --abbrev-ref HEAD') DO SET BRANCH=%%i

git fetch --all
git stash save
git checkout master --force
git reset --hard origin/master
git checkout %branch% --force
git stash pop

docker pull sirpole/ant-dev:chrome
docker pull sirpole/ant-dev:httpd
docker pull sirpole/ant-dev:node
docker pull sirpole/ant-dev:php-7.2
docker pull sirpole/ant-dev:php-7.1
docker pull sirpole/ant-dev:php-5.6
docker pull mysql
docker pull phpmyadmin/phpmyadmin
docker pull redis:alpine
docker pull erikdubbelboer/phpredisadmin
docker pull composer
docker system prune -f

powershell -Command "[int][double]::Parse((Get-Date -UFormat %%s))" > %userprofile%\.ant\.lastupdate
