# docker-env
Docker environment for running antcms


# Installation
### Linux
Install docker and docker-compose according to official docs.
Add $USER to group docker using `sudo usermod -aG docker $USER`, so you can run it without `sudo`.

Set GITLAB_KEY and GITHUB_KEY env vars by editing `~/.bashrc`. Add `export GITHUB_KEY=yourkey` and `export GITLAB_KEY=yourkey`  

### Windows
TODO

### MacOS
TODO

# Usage
### Basic
Run containers with `docker-compose up`, stop it with Ctrl+C

### Interactive
Run containers with `docker-compose up -d && docker-compose exec web /bin/bash`. You'll be presented with interactive bash session. Stop containers using `docker-compose down`