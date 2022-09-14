#!/bin/bash

if test -f "composer.json"; then
    echo "Nothing to do"
    exit 0
fi

echo "Installing Symfony"

# Clean up
rm -rf .git

# Install
composer create-project symfony/skeleton:"6.*" symfony
mv symfony/* .
mv symfony/.env .
mv symfony/.gitignore .
rmdir symfony
git init