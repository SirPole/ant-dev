::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFBZVXhCLACW7CKEg1+n1+9aGsl0RUa8rd5rY0vmHI+8dpEznevY=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
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
::Zh4grVQjdCyDJGyX8VAjFBZVXhCLAFuoCb8Z6/zo0+uJtgAZUfQDcYHP36aeMuUH71f3SYEk2H5Vj9gwDRVMMBeza28=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off

SET TOOL=%1
IF /I [%TOOL%]==[] (SET TOOL=help)

IF EXIST %~dp0ant-%TOOL%.bat (GOTO EXEC)

:MISSING
ECHO Tool "%TOOL%" does not exist!
ECHO.
SET TOOL=help

:EXEC
FOR /F "tokens=2,* delims= " %%a in ("%*") do set PARAMS=%%b
CALL ant-%TOOL% %PARAMS%

EXIT
