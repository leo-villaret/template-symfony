# Template Symfony 6

This project aims to be a "clone, run, code" with as few steps as possible.

If no `composer.json` file exists, the `install.sh` will create a new Symfony project. Then you just have to press <kbd>F5</kbd> to start listening for XDebug

It runs Symfony 6 on PHP 8.1 on Debian bullseye container, there is also a PostgreSQL 14.5 and Redis 7.0.

## Steps

1. **Having the environment running**
   - Linux : VSCode + Docker
   - Mac : VScode + Docker Desktop
   - Windows : VSCode + WSL + Docker Desktop
   - VSCode extensions
     - Both : `ms-vscode-remote.remote-containers`
     - Windows : `ms-vscode-remote.remote-wsl`
2. **Clone this repo**
   - _Windows : clone into your WSL box_
3. **Open with VSCode**
4. **Run VSCode `Debug: Start Debugging` command**
   - _Just press F5 to start debugging_
5. **Edit `.devcontainer/docker-compose.yml`**
   - _You may connect this container to the network of your frontend, if you have one_
6. **Adding libraries**
    - Symfony/skeleton is for building API, you should run [`composer require webapp`](https://symfony.com/doc/current/setup.html#creating-symfony-applications) to build a webapp with [Twig templates](https://symfony.com/doc/current/templates.html)
    - There is **PostgreSQL**, so you should use [`composer require symfony/orm-pack`](https://symfony.com/doc/current/doctrine.html)
    - There is **Redis**, so you should use [`composer require symfony/cache`](https://symfony.com/doc/current/cache.html)