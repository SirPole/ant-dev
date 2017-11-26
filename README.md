# docker-env
Docker environment for running antcms


# Installation
### Linux
Install docker and docker-compose according to official docs. _Ubuntu users should use `zesty` (17.04) for apt sources._

Add $USER to group docker using `sudo usermod -aG docker $USER`, so you can run it without `sudo`.

Set GITLAB_KEY and GITHUB_KEY env vars by editing `~/.bashrc`. Add `export GITHUB_KEY=yourkey` and `export GITLAB_KEY=yourkey`  

### Windows
Install docker and docker-compose according to official docs.

Set GITLAB_KEY and GITHUB_KEY env vars by running in elevated command prompt `SETX GITHUB_KEY "yourkey"` and `SETX GITLAB_KEY "yourkey"`

TODO others??

### MacOS
Install docker and docker-compose according to official docs.

TODO env vars and others??

# Usage
### Basic
Run containers with `docker-compose up`, stop it with Ctrl+C

### Interactive
Run containers with `docker-compose up -d && docker-compose exec web /bin/bash`. You'll be presented with interactive bash session. Stop containers using `docker-compose down`

# Nice to have
Create aliases for your commands, for example:
 
 - `alias dockup='docker-compose up -d && docker-compose exec web /bin/bash'`
 - `alias dockdown='docker-compose down'`

# Official docs
- [Docker installation](https://docs.docker.com/engine/installation/)
- [Docker-compose installation](https://docs.docker.com/compose/install/)