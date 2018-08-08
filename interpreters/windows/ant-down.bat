@echo off

CALL ant stop
docker rm web phpmyadmin database >null
