# ant-docker-env

Docker environment for running antcms

Already comes with preinstalled [Apache](https://httpd.apache.org/), [php](https://secure.php.net/), [MariaDB](https://mariadb.org/), [phpMyAdmin](https://www.phpmyadmin.net/), [Composer](https://getcomposer.org/) and [Node.js](https://nodejs.org/) with [npm](https://npmjs.com/).

# Disclaimer

This repository and docker image are used solely for local development at my company with specific use case. We use our own gitlab implementation for private repositories and private packages, therefore there is a need for generated gitlab access token. We also pull a lot of packages from github from one IP, so we quickly hit the access limit. That's why the github key needs to be set as well.

Although this environment might work for your use case as well (since you can omit the gitlab and github keys), I can't provide warranty of any sorts for you. 
 
In the documentation below you will find how to setup aforementioned github and gitlab keys (access tokens).   

# Installation

### Linux
Install docker and docker-compose according to official docs. _Ubuntu users should use `zesty` (17.04) for apt sources._

Add $USER to group docker using `sudo usermod -aG docker $USER`, so you can run it without `sudo`.

Set GITLAB_KEY and GITHUB_KEY environment variables by editing your `~/.bashrc`. Add `export GITHUB_KEY=yourkey` and `export GITLAB_KEY=yourkey`  

### Windows
Install docker already with docker-compose according to official docs.

In docket settings, enable drive share for docker to be able to use volumes. _Even if you have your projects on D drive, enable it for C as well, since databases are mounted to your home directory._

You may also expose docker daemon without TLS, if you want phpstorm to be able to connect to it...

Press `Win+X`, then select `System`, `Advanced system settings`, `Advanced` tab and `Environment variables`button at the bottom. Add new user environment variables GITLAB_KEY and GITHUB_KEY. 

### MacOS
Install docker and docker-compose according to official docs.

**TODO env vars and others??**

# Running

### Basic
Run containers with `docker-compose up` command in directory, which contains docker-compose.yml, stop it as usual with Ctrl+C

### Interactive
Run containers with `docker-compose up -d && docker-compose exec web /bin/bash`. You'll be presented with interactive bash session.

**Windows**: Use `//bin/bash` in the interactive command!

Stop containers using `docker-compose down` (Beware, this also removes them, which will delete all unmounted data)

# Usage

`docker-compose up` command starts `npm start` build script automatically, which installs all required composer and npm packages, performs database migrations and generates css and js.

### Web
Your current directory (the one which contains `docker-compose.yml`) is mounted to `/var/www` which is set as www root for Apache.

All necessary ports are opened:

- [http://localhost/](http://localhost/)
- [https://localhost/](https://localhost/)
- [http://localhost:3000/](http://localhost:3000/)
- [http://localhost:8000/](http://localhost:8000/)

### MariaDB
Database data are mounted to your `~/.ant/mysql`, so you won't lose all your data upon container removal.

Port 3306 is open as you're used to. Use `db` (linked container name) as mysql host.

### phpMyAdmin
phpMyAdmin is reachable at it's own port, you can find it at [http://localhost:8080/](http://localhost:8080/)

- Login: `root`
- Password: `root` 

# Nice to have

Create aliases for your commands, for example:
 
 - `alias dockup='docker-compose up -d && docker-compose exec web /bin/bash'`
 - `alias dockdown='docker-compose down'`
 
Create hosts entry for yourself, so you won't have to use localhost, use `ant.loc` or `anything.loc` for example. Your urls would be much more user friendly.

# Useful links

- [Docker installation](https://docs.docker.com/engine/installation/)
- [Docker-compose installation](https://docs.docker.com/compose/install/)
- [Generate Github access token](https://github.com/settings/tokens) (_Select only repo and gists_)
- [Generate Gitlab access token](https://git.antstudio.cz/profile/personal_access_tokens) For private packages
