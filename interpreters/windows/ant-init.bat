@echo off

COPY %~dp0..\..\dist\docker-compose.yml %cd%

IF /I NOT "%~1"=="" (
    powershell -Command "(Get-content %cd%\docker-compose.yml) | Foreach-Object {$_ -replace '7.3', '%~1'} | Set-Content %cd%\docker-compose.yml"
)
