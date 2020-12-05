if [ `getconf LONG_BIT` -ne "32" ]; 
then
      installpack="apache2 php5 php5-dev php5-mysql php-pear wget unzip"
else
     installpack="apache2 php5 php5-dev php5-mysql php-pear wget unzip"
fi
dpkg --add-architecture i386
apt-get update
apt-get install sudo
sudo apt-get install -y build-essential
sudo apt-get install -y python-software-properties
apt-get install bsdutils
sudo apt-get install -y php5
sudo apt-get install -y apache2
sudo apt-get install -y libapache2-mod-php5
sudo apt-get install -y mysql-server
sudo apt-get install -y php5-mysql
sudo apt-get install -y php5-curl
sudo apt-get install -y php5-gd
sudo apt-get install php5-mcrypt 
sudo php5enmod mcrypt 
sudo service apache2 reload
sudo apt-get install -y git-core
sudo apt-get install -y phpmyadmin
sudo apt-get install nano
sudo a2enmod rewrite
sudo /etc/init.d/apache2 restart
apt-get install curl
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
sudo apt-get update
sudo apt-get install tcl8.5
wget http://download.redis.io/releases/redis-stable.tar.gz
tar xzf redis-stable.tar.gz
cd redis-stable
make
make test
sudo make install
cd utils
sudo ./install_server.sh
service apache2 restart
curl --silent --location https://deb.nodesource.com/setup_0.12 | bash -
apt-get install --yes nodejs
curl --silent --location https://deb.nodesource.com/setup_0.12 | bash -
apt-get install --yes nodejs
export DEBIAN_FRONTEND=noninteractive;apt-get --allow-unauthenticated -y -q install $installpack

for i in `seq 1 100`;
do
   echo 
done










server {
listen 80;
server_name minecrafthappy.ru;
access_log /var/log/access.log;
error_log /var/log/error.log;
rewrite_log on;
root /var/www/minecrafthappy.ru/public;
index index.php;
location / {

try_files $uri $uri/ /index.php?$query_string;

}
if (!-d $request_filename) {
rewrite ^/(.+)/$ /$1 permanent;
}
location ~* \.php$ {
fastcgi_pass unix:/var/run/php/php7.0-fpm.sock;
fastcgi_index index.php;
fastcgi_split_path_info ^(.+\.php)(.*)$;
include /etc/nginx/fastcgi_params;
fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
}
location ~ /\.ht {
deny all;
}
location ~* \.(?:ico|css|js|jpe?g|JPG|png|svg|woff)$ {
expires 365d;
}
}



































