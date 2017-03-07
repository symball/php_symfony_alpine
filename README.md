# PHP Docker Image for Symfony Development

This repository contains various versions of PHP built on Alpine Linux (making them lightweight) for use with Symfony development whether using MySQL or Mongo. Please refer to the **[Docker Hub page](https://hub.docker.com/r/symball/php_symfony_alpine/)** for further information

Each of the various versions are tracked using branches which Docker hub automatically builds from.

## PHP-FPM

As a platform for serving your project, there are three versions of PHP-FPM

_master (latest)_ version 7 with support for MySQL

_php5_ Version 5 with support for MySQL

_php5_mongo_ Version 5 with support for Legacy Mongo Driver

## Toolchain

The toolchain is an extension of PHP-FPM designed to be used as a shell. It does not start PHP-FPM but instead launches the Bash shell. Extra features of the Toolchain include:

* The Symfony dedicated installer
* Composer
* PHPUnit
* Phin
* gulpJS task runner
* bower

There are also three versions of the toolchain depending on which version of PHP-FPM you are using

_toolchain_ To be used with master(latest)

_php5_toolchain_ To be used with php5

_php5_mongo_ To be used with php5_mongo

## Usage

By default, each container will run as root due to no users being created which is not so useful if you plan on using these images for development so, the recommended method of launch is to extend them and configure users as you normally would.