::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFBZVXhCLACW7CKEg1+n1+9aGsl0RUa8rd5rY0vmHI+8dpEznevY=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF25
::cxAkpRVqdFKZSzk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSTk=
::eBoioBt6dFKZSTk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZksaHErSXA==
::ZQ05rAF9IBncCkqN+0xwdVsFAlTMbCXqZg==
::ZQ05rAF9IAHYFVzEqQIxJg8ZSAGUfGqvErpc/fj/7v6CsC0=
::eg0/rx1wNQPfEVWB+kM9LVsJDAWMKCa+A6NR++336f+XpkwJUaw9eZu7
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWHiqwAIjPA5QRQvCLyWoSLpSiA==
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATE2UMiPBJaDCaQJWiyErR8
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFBZVXhCLAFuoCb8Z6/zo0+uJtgAZUfQDcYHP36aeMuUH71f3SYEk2H5Vj9gwDRVMMxaueEInrGJEo3SBNtOZ/Qr5Tyg=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off

SCHTASKS /Query /tn "Update ant-dev"
IF errorlevel 1 (SCHTASKS /Create /tn "Update ant-dev" /tr "%0" /sc daily /st 10:00:00)

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

exit
