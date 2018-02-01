@echo off

CALL dcstop
docker rm web phpmyadmin database
