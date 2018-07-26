# ant-dev
Docker environment for running antcms

[![ANT studio](https://www.brychta.name/antstudio.png)](https://www.antstudio.cz/)

&nbsp;

### [Documentation](https://github.com/SirPole/ant-dev/wiki)

&nbsp;

Comes bundled with [Apache](https://httpd.apache.org/), [php](https://secure.php.net/), [MySQL](https://www.mysql.com/), [phpMyAdmin](https://www.phpmyadmin.net/), [Composer](https://getcomposer.org/) and [Node.js](https://nodejs.org/).

# Disclaimer
This repository and docker image are used solely for local development at my company with specific use case. Although this environment might work for your use case as well, I can't provide warranty of any sorts for you.

***

[MariaDB](https://mariadb.org) was dropped in favor of MySQL 8 because of volume mounting issues on windows, will switch to MariaDB once docker-library/mariadb#95 is resolved.

# Quick links
- [Web](http://localhost/)
- [SSL Web](https://localhost/)
- [Dev server](http://localhost:3000/)
- [Browser sync settings](http://localhost:3002/)
- [phpMyAdmin](http://localhost:8080/)
