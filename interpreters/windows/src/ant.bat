::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFBZVXhCLACW7CKEg6fjr4+/KtkIIV+pycYzU1PqHI+9z
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
::ZQ05rAF9IAHYFVzEqQIxJg8ZSAGUXA==
::eg0/rx1wNQPfEVWB+kM9LVsJDAWMKCW4B6F8
::fBEirQZwNQPfEVWB+kM9LVsJDAWMKCa+A6N8
::cRolqwZ3JBvQF1fEqQIxJg8ZSAGUfG6iA7YJ/Ofpjw==
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

ECHO Tool "%TOOL%" does not exist!
ECHO.
SET TOOL=help
GOTO EXEC

IF /I NOT [%TOOL%]==[selfupdate] (GOTO CHECK_LAST_UPDATE) ELSE (GOTO EXEC)

:CHECK_LAST_UPDATE
IF NOT EXIST %userprofile%/.ant/.lastupdate (
    ECHO Running update for the first time
    CALL ant-selfupdate
    GOTO EXEC
) ELSE (GOTO ASK_FOR_UPDATE)

:ASK_FOR_UPDATE
SET WEEK_AGO=powershell -Command "[int][double]::Parse((Get-Date -UFormat %s))-604800"
FOR /f "delims=" %%i IN ('more %userprofile%/.ant/.lastupdate') DO SET LAST_UPDATE=%%i
IF %WEEK_AGO% GEQ %LAST_UPDATE% (
        SET /P DOUPDATE=Ant-dev hasn't been updated for over a week, do you want to update? [y/n]
        GOTO DOUPDATE
) ELSE (GOTO EXEC)

:DOUPDATE
IF /I [%DOUPDATE%]==[y] (
    CALL ant-seltpdate
    GOTO EXEC
)

:EXEC
FOR /F "tokens=2,* delims= " %%a in ("%*") do set PARAMS=%%b
CALL ant-%TOOL% %PARAMS%

EXIT
