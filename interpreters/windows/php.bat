@echo off

START "" docker-compose exec -u ant web php $*
