
# Docker LAMP Base

Docker LAMP (Linux, Apache, MySql, PHP) setup

### Prerequisite

- Docker
- Docker-Compose if you're on Linux ( comes pre-installed on Mac )

### Environment

- Apache 2.4.5
- PHP 7.2.14
- MariaDB 10.3.9

### Included
- Composer
- Node and NPM
- Global TypeScript support
- Angular CLI

### Bindings

Containers are bound to specific ports on host machine:

* **Apache:** 80

* **MariaDB:** 3306

### Required folder setup

This Docker build requires specific folder setup

There are two main folder `Docker` and `Source` which must be childrens of same parent

1. Docker folder contains all of the different Docker configurations. This specific configuration lies in php72 folder (see installation instructions)
2. Source folder contains all of my projects. For web development using LAMP stack, folder `apache` is used

For this particuar project, folder structure is the following:
    - Docker/php72 : this repository
    - Source/apache : all of projects that will be available to Apache server

### Installation

1. Clone this repository to `Development/Docker/php72`
2. Run `cd ~/Development/Docker/php72`
3. Run `docker compose build` to download and build images
4. Run `docker compose up` to start containers

### SSH Into Containers
* **Apache:** `docker exec -it $(docker ps -qf "name=apache") bash`

* **MariaDB:** `docker exec -it $(docker ps -qf "name=db") bash`
