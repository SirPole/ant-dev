@echo off

docker exec web php index.php migrations:migrate
