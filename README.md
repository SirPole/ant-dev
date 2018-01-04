# ant-docker-env

Docker environment for running antcms

Already comes with preinstalled [Apache](https://httpd.apache.org/), [php](https://secure.php.net/), [MySQL](https://www.mysql.com/), [phpMyAdmin](https://www.phpmyadmin.net/), [Composer](https://getcomposer.org/) and [Node.js](https://nodejs.org/) with [npm](https://npmjs.com/).

Uses [.bashrc](https://www.linuxquestions.org/questions/linux-general-1/ultimate-prompt-and-bashrc-file-4175518169/) created by jeffguy77, thanks!

# Disclaimer

This repository and docker image are used solely for local development at my company with specific use case. We use our own gitlab implementation for private repositories and private packages, therefore there is a need for generated gitlab access token. We also pull a lot of packages from github from one IP, so we quickly hit the access limit. That's why the github key needs to be set as well.

Although this environment might work for your use case as well (since you can omit the gitlab and github keys), I can't provide warranty of any sorts for you. 
 
In the documentation below you will find how to setup aforementioned github and gitlab keys (access tokens).

&nbps;

[MariaDB](https://mariadb.org) was dropped in favor of MySQL 8 because of volume mounting issues on windows, will switch to MariaDB once docker-library/mariadb#95 is resolved.   

# Installation

### Linux
Install docker and docker-compose according to official docs. _Ubuntu users should use `zesty` (17.04) for apt sources, should they encounter issues during install._

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

Run containers with `docker-compose up` command in directory, which contains docker-compose.yml, stop it as usual with Ctrl+C or use `docker-compose up -d` to start them in background.

Stop containers using `docker-compose stop` or stop and delete them with `docker-compose down` (Will delete all unmounted data)

# Usage

### Web
Your current directory (the one which contains `docker-compose.yml`) is mounted to `/var/www` which is set as www root for Apache.

All necessary ports are opened:

- [http://localhost/](http://localhost/)
- [https://localhost/](https://localhost/)
- [http://localhost:3000/](http://localhost:3000/)
- [http://localhost:8000/](http://localhost:8000/)

### MySQL
Database data are mounted to your `~/.ant/mysql`, so you won't lose all your data upon container removal.

Port 3306 is open as you're used to. Use `database` (container name) as mysql server host.

### phpMyAdmin
phpMyAdmin is reachable at it's own port, you can find it at [http://localhost:8080/](http://localhost:8080/) 

# Command Interpreters
- Clone this repo and add `interpresters/<system>` directory to your path. They will allow you to run familiar commands from your cli inside the docker container.

    - For linux, edit `etc/environment` file.
    - For windows, [follow this tutorial](https://www.howtogeek.com/118594/how-to-edit-your-system-path-for-easy-command-line-access/).
    
    &nbsp;
    
    - **dcup** - Starts containers.
        - **-i** - Presents you with interactive shell
    - **dcstop** - Stops containers
    - **dcdown** - Stops and removes containers.
    - **dcpull** - Pulls newer containers, if available.
    
    &nbsp;
    
    - **importdb** - Imports `.sql` file to database container. 
        - Usage: `importdb path/to/db.sql` or `importdb myDatabase path/to/db.sql`
    
    &nbsp;
    
    - **composer** - Starts composer in web container.
    - **node** - Starts node.js in web container.
    - **npm** - Starts npm in web container.
    - **php** - Starts php in web container.
    - **ncu** - [npm-check-updates](https://www.npmjs.com/package/npm-check-updates) looks up updates for packages defined in package.json.
    - **sass-lint** - [sass-lint](https://www.npmjs.com/package/sass-lint) Useful for linting sass/scss [inside phpstorm](https://plugins.jetbrains.com/plugin/8171-sass-lint)
    - **tldr** - [tldr](http://tldr.sh/) Simplified man pages for commands you don't remember.

# Useful links

- [Docker installation](https://docs.docker.com/engine/installation/)
- [Docker-compose installation](https://docs.docker.com/compose/install/)
- [Generate Github access token](https://github.com/settings/tokens) (_Select only repo and gists_)
- [Generate Gitlab access token](https://git.antstudio.cz/profile/personal_access_tokens) For private packages
