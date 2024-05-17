#!/bin/bash

eval `ssh-agent -s`
ssh-add /var/www/html/ssh/id_rsa
rm -rf /var/www/html/test/asset/located-sources/superproject-with-git-submodules
git clone --recurse-submodules git@github.com:kristos80/test-root-project.git /var/www/html/test/asset/located-sources/superproject-with-git-submodules
cd /var/www/html/test/asset/located-sources/superproject-with-git-submodules/test-submodule
composer update
