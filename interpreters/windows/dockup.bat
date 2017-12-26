@echo off

START "" docker-compose up
START "" docker-compose exec -u ant web bash
