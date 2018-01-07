# ant-dev
Docker environment for running antcms

<a href="https://www.antstudio.cz"><img src="http://drym2.antstudio.eu/obrazy/logo_ant_barva.svg" height="100"></a>

### [Documentation](https://github.com/SirPole/ant-dev/wiki)

&nbsp;

Comes with [Apache](https://httpd.apache.org/), [php](https://secure.php.net/), [MySQL](https://www.mysql.com/), [phpMyAdmin](https://www.phpmyadmin.net/), [Composer](https://getcomposer.org/) and [Node.js](https://nodejs.org/) with [npm](https://npmjs.com/).

&nbsp;

Uses [.bashrc](https://www.linuxquestions.org/questions/linux-general-1/ultimate-prompt-and-bashrc-file-4175518169/) created by jeffguy77, thanks!

# Disclaimer
This repository and docker image are used solely for local development at my company with specific use case.

Although this environment might work for your use case as well (since you can omit the github key), I can't provide warranty of any sorts for you.

***

[MariaDB](https://mariadb.org) was dropped in favor of MySQL 8 because of volume mounting issues on windows, will switch to MariaDB once docker-library/mariadb#95 is resolved.
