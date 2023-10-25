#!/bin/sh

expected_checksum="$(php -r 'copy("https://composer.github.io/installer.sig", "php://stdout");')"

php -r 'copy('https://getcomposer.org/installer', 'composer-setup.php');'
actual_checksum="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

if [ "$expected_checksum" != "$actual_checksum" ]; then
	echo >&2 'Invalid installer checksum'
	rm composer-setup.php
	exit 1
fi

php composer-setup.php --quiet
result=$?
rm composer-setup.php

mkdir -p ~/.local/bin
mv composer.phar ~/.local/bin/composer

exit $result
