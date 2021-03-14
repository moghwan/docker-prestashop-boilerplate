#!/bin/bash  
ps_version=$1

if [ -z $1 ]
then
    ps_version="1.7.7.2"
    echo 'no ps version specified.'
fi

echo "downloading version $ps_version"
wget "https://github.com/PrestaShop/PrestaShop/releases/download/$ps_version/prestashop_$ps_version.zip" 

unzip prestashop_$ps_version.zip
rm prestashop_$ps_version.zip

docker-compose -f docker-compose-ps.yml up -d # --build
docker exec -ti prestadock_app_dev_1 bash -c "/bin/chown www-data:www-data -R ."
# docker exec -ti prestadock_mysql_1 bash -c "chown -R mysql:mysql /var/lib/mysql"
docker exec -ti prestadock_mysql_1 bash -c "mysql -u root -proot -e \"CREATE USER 'ps_user_sh'@'%' IDENTIFIED BY 'user_sh';GRANT ALL ON *.* TO 'ps_user'@'%';FLUSH PRIVILEGES;\""
# docker-compose -f docker-compose-ps.yml down

echo "part 1 done. you can go to localhost and install your presyashop now"

# ? sudo chmod 777 ./*