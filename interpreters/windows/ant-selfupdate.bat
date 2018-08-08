@echo off

SCHTASKS /Query /tn "Update ant-dev"
IF errorlevel 1 (SCHTASKS /Create /tn "Update ant-dev" /tr "PowerShell -WindowStyle Hidden -Command %~dp0ant.exe selfupdate" /sc daily /st 10:00:00)

CD /D %~dp0/../..

git fetch --all
git stash
git checkout master --force
git rebase origin/master
git stash apply

docker pull -a sirpole/ant-dev
docker pull mysql
docker pull phpmyadmin/phpmyadmin
docker system prune
