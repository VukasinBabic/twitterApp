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
DATABASE_URL=mysql://root:''@127.0.0.1:3306/twitter-test
###< doctrine/doctrine-bundle ###

when you create ENV file, run:
```
php bin/console doctrine:database:create
```
If you are importing database, you dont need to migrate.
```
php bin/console make:migration
php bin/console doctrine:migrations:migrate
```
After that import Database Records, from twitter-test.sql file
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
