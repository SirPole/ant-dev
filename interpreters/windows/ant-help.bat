@echo off

echo Usage:
echo     ant [tool] (arguments)
echo Example:
echo     ant up -i
echo.
echo Tools:
echo     down       - Stop and destroy running containers
echo     help       - Show this help
echo     import     - Import database from SQL dump to existing or newly created database
echo         Usage: ant import (database) [path to sql file]
echo     migrate    - Migrate database using doctrine
echo     pull       - Pull new docker images from Docker hub
echo     selfupdate - Update ant-dev
echo     stop       - Stop running containers
echo     up         - Start containers if they're not running already
echo         -i     - Start containers and open interactive shell
echo.
echo Other standalone interpreters, these are not prefixed by ant command:
echo     composer
echo     mysql
echo     ncu
echo     node
echo     npm
echo     npx
echo     nvm
echo     php
echo     sass-lint
echo     tldr
echo.
echo For more thorough information, visit repository wiki: https://github.com/SirPole/ant-dev/wiki
