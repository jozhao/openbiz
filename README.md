# OpenBiz

***

[![Build Status](https://travis-ci.org/jozhao/openbiz.svg?branch=7.x-1.x)](https://travis-ci.org/jozhao/openbiz)

## Installation

[Drupal.org](https://www.drupal.org/project/openbiz) project page

Enter the project root, and run the following commands in order:

```
cd <project_directory>
composer install --prefer-dist --working-dir=build
build/bin/phing -f build/phing/build.xml build:local
```

This will construct a copy of the OpenBiz Drupal codebase in the [docroot] directory using instructions from the build-openbiz.make file.