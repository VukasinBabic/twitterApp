# TwitterApp

## Instalation
Git clone this project and run command in Command-line interface in the project folder.
```
https://github.com/VukasinBabic/twitterApp.git
```
After cloning, Run composer install in Command-line interface:
```
composer update
```

EDIT ENV file, here is the ENV example, change DB name, user, password etc for your environment. 

ENV example:

###> symfony/framework-bundle ###
APP_ENV=dev
APP_SECRET=e9872bb4900aed501378a147f4247bee
#TRUSTED_PROXIES=127.0.0.1,127.0.0.2
#TRUSTED_HOSTS='^localhost|example\.com$'a
###< symfony/framework-bundle ###

###> doctrine/doctrine-bundle ###
# Format described at http://docs.doctrine-project.org/projects/doctrine-dbal/en/latest/reference/configuration.html#connecting-using-a-url
# For an SQLite database, use: "sqlite:///%kernel.project_dir%/var/data.db"
# Configure your db driver and server_version in config/packages/doctrine.yaml
DATABASE_URL=mysql://root:''@127.0.0.1:3306/twitter-test
###< doctrine/doctrine-bundle ###

when you create ENV file, run:
```
php bin/console doctrine:database:create
php bin/console make:migration
php bin/console doctrine:migrations:migrate
```
After that import Database Records, from DB table,
You can skip this part, but You need to manually set admin user in the Db:
```
ROLES: "ROLE_ADMIN"
```
If you import the database admin user is:
```
email: admin@admin.com
password: adminadmin
```
After that the project should be set and working. 
