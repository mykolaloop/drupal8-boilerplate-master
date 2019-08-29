# Docker-based Drupal stack

Drupal8-boilerplate is a set of docker images optimized for Drupal. 
The docker integration is based on [Docker4Drupal](https://github.com/wodby/docker4drupal).
Please see original documentation if you have any questions https://wodby.com/stacks/drupal/docs/local/ 
Drupal modules and dependencies are managing with [Composer](https://getcomposer.org/).

Drupal boilerplate tries to simplify starting a new site by having the most common
directory structures and files already included and set up. It contains useful features for development Drupal project:
* config and install script to setup tools for static code analyse locally
on developers machines (per project),
* pre-commit hook to analyse files affected in the commits
(only custom code is taken in account),
* settings per environment,
* useful utils for writing casperjs autotests.

## Getting started 
You can start by [downloading](https://code.adyax.com/common/drupal8-boilerplate/repository/archive.zip?ref=composer-based)
this project. Once you download it you will find that every folder contains a readme.md file.
This readme.md file has been extensively documented to explain what belongs
in that specific directory.

Here's a breakdown for what each directory/file is used for. If you want to know more please
read the readme inside the specific directory.

* .mariadb-init - Place init .sql file(s) here.
* bin - A directory for composer binaries.
* docroot - Where your drupal root should start.
* enviroments/* - Per environment configurations. @see settings.php, services.yml, etc
* patches - Directory for patches
* scripts -  A directory for other non-drupal scripts (post-installation, etc).
* sync - Configuration directory
* tests -  A directory for external tests. This is great for non drupal specific tests
 such as selenium, qunit, casperjs autotests.

## Quick start

Steps todo during project initiation.
* Download/clone this repo 
`$ git clone git@code.adyax.com:common/drupal8-boilerplate.git`
* Rename the file `.env.default` to `.env`
`$ cd drupal8-boilerplate/; cp .env.default .env`
* Update configuration in the file `.env` ( project_name, versions of images, etc)
* Update `environments/local/settings.php` with correct DB name, add additional local configuration if required.
* Use `make` to start and `make stop` to stop Docker services (see docker.mk for details)
* Run "composer install" inside php container
`$ make composer install`

## FAQ

### How can I apply patches to downloaded modules?

If you need to apply patches (depending on the project being modified, a pull request is often a better solution), you can do so with the [composer-patches](https://github.com/cweagans/composer-patches) plugin.

To add a patch to drupal module foobar insert the patches section in the extra section of composer.json:
```json
"extra": {
    "patches": {
        "drupal/foobar": {
            "Patch description": "URL to patch"
        }
    }
}
```

Have fun.

Contributors: https://code.adyax.com/itsekhmistro/awesome-repo
