@echo off

echo Usage:
echo     ant [tool] (arguments)
echo.
echo Tools:
echo     down       - Stop and destroy running containers
echo     help       - Show this help
echo     import     - Import database from SQL dump to existing or newly created database
echo         Usage: ant import (database) [path to sql file]
echo     migrate    - Migrate database using doctrine
echo     selfupdate - Update ant-dev
echo     start      - Alias for 'up'
echo     stop       - Alias for 'down'
echo     up         - Start containers if they're not running already
echo.
echo Other standalone interpreters, these are not prefixed by ant command:
echo     composer
echo     mysql
echo     ncu
echo     node
echo     npm
echo     npx
echo     php
echo     sass-lint
echo.
echo For more thorough information, visit repository wiki: https://github.com/SirPole/ant-dev/wiki
