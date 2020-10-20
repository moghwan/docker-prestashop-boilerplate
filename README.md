# A quick PrestaShop Docker Compose Starter Project

### Detailed Article can be found [here](https://dev.to/moghwan/setup-prestashop-with-docker-compose-39mn)

### Follow these steps to get started:

```shell
git clone https://github.com/moghwan/docker-prestashop-boilerplate.git

cd docker-prestashop-boilerplate

unzip prestashop_1.7.6.8.zip && rm prestashop_1.7.6.8.zip

docker-compose -f docker-compose-ps.yml up -d --build

docker exec -ti prestadock_app_dev_1 bash
    chown www-data:www-data -R . && exit

docker exec -ti prestadock_mysql_1 bash
    chown -R mysql:mysql /var/lib/mysql
    mysql -u root -p
    # password: root
    CREATE USER 'ps_user'@'%' IDENTIFIED BY 'user';
    GRANT ALL ON *.* TO 'ps_user'@'%';
    FLUSH PRIVILEGES;
    EXIT;
exit
```

### go to localhost and continue install process using these credentials:

* server: mysql
* database: prestashop
* user: ps_user
* password: user

### when install is finished do some clean-up:

```shell
docker exec -ti prestadock_app_dev_1 bash
    rm -rf install
    rm docker-compose.yml
    mv docker-compose-ps.yml docker-compose.yml
exit
```
### restart you containers

```shell
docker-compose down --remove-orphans && docker-compose up -d
```

### **you're done.**
