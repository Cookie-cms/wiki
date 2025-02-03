#!/bin/bash

ASCII='
   ______            __   _      ________  ________
  / ____/___  ____  / /__(_)__  / ____/  |/  / ___/
 / /   / __ \/ __ \/ //_/ / _ \/ /   / /|_/ /\__ \
/ /___/ /_/ / /_/ / ,< / /  __/ /___/ /  / /___/ /
\____/\____/\____/_/|_/_/\___/\____/_/  /_//____/  v. Game
'

# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
RESET='\033[0m' # Reset color to default

# Usage of colors in the script
echo -e "${GREEN}${ASCII}${RESET}"  # Green text for success message
# Check if no command line arguments are provided
if [[ $# -eq 0 ]]; then
    echo "Usage: $0 -domain <domain_name> -pma <pma_setup_type> -mysql <mysql_remote_access> -admin <admin_username> <admin_password>"
    echo "Available options:"
    echo "-domain <domain_name>: Specify the domain name for the website"
    echo "-pma <pma_setup_type>: Specify the type of phpMyAdmin setup (sub/link)"
    echo "-mysql <mysql_remote_access>: Specify whether to configure MySQL remote access (true/false)"
    echo "-admin <admin_username> <admin_password>: Specify the admin username and password"
    exit 1
fi
# Parse command line arguments
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        -domain)
            domain="$2"
            shift
            shift
            ;;
        -pma)
            pma_setup="$2"
            shift
            shift

            ;;
        -mysql)
            mysql_remote="$2"
            shift
            shift
            ;;
        -admin)
            admin_username="$2"
            admin_password="$3"
            shift
            ;;
        *)
            echo -e "${RED}Error:${RESET} Invalid argument: $1"
            exit 1
            ;;
    esac
done
echo $pma_setup;
# Check if domain is provided
if [[ -z $domain ]]; then
    echo -e "${RED}Error:${RESET} Domain name is required."
    exit 1
fi

# Function to draw progress bar
draw_progress_bar() {
    # Calculate percentage
    let _progress=(${1}*100/${2}*100)/100
    let _done=(${_progress}*4)/10
    let _left=40-$_done

    # Build progressbar string lengths
    _fill=$(printf "%${_done}s")
    _empty=$(printf "%${_left}s")

    # 1.2s clear carriage return
    printf "\rProgress : [${_fill// /#}${_empty// /-}] ${_progress}%%"
}

# # Install PHP
# echo "Installing PHP..."
# # Add your PHP installation commands here0
# sudo apt install php-fpm php-mysql php-mbstring php-xml php-gd php-curl php-zip php-gd php-cli -y
# for i in $(seq 1 100); do
#     sleep 0.1
#     draw_progress_bar $i 100
# done
# echo ""

# # Install Nginx
# echo "Installing Nginx..."
# # Add your Nginx installation commands here
# sudo apt install nginx -y
# rm -rf /etc/nginx/sites-enabled/default
# echo "server {
#     listen 80;
#     listen [::]:80;
#     server_name $domain;
#     root /var/www/cookiecms;
#     index index.php index.html index.htm index.nginx-debian.html;
#     location / {
#         try_files \$uri \$uri/ /index.php?\$query_string;
#     }
#     location /api {
#         try_files \$uri \$uri/ /api.php?\$query_string;
#     }
#     location ~ \.php$ {
#         include snippets/fastcgi-php.conf;
#         fastcgi_pass unix:/var/run/php/php-fpm.sock;
#     }
# }" > /etc/nginx/sites-enabled/cookiecms
# for i in $(seq 1 100); do
#     sleep 0.1
#     draw_progress_bar $i 100
# done
# echo ""

# Install MySQL
# echo "Installing MySQL..."
# # Add your MySQL installation commands here
# sudo apt install mysql-server -y

# # Set root password
# mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'new-password';"

# # Remove anonymous users
# mysql -u root -pnew-password -e "DELETE FROM mysql.user WHERE User='';"

# # Disallow root login remotely
# mysql -u root -pnew-password -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"

# # Remove test database and access to it
# mysql -u root -pnew-password -e "DROP DATABASE IF EXISTS test;"
# mysql -u root -pnew-password -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';"

# # Reload privilege tables
# mysql -u root -pnew-password -e "FLUSH PRIVILEGES;"

#  generated_password=$(openssl rand -base64 12)

# # Create the user with the generated password
# mysql -u root -pnew-password -e "CREATE USER 'cmscookie'@'localhost' IDENTIFIED WITH mysql_native_password BY '$generated_password';"

# # Create the database
# mysql -u root -pnew-password -e "CREATE DATABASE cmscookie;"

# # Grant necessary privileges to the user for the database
# mysql -u root -pnew-password -e "GRANT ALL PRIVILEGES ON cmscookie.* TO 'cmscookie'@'localhost';"

# # Flush privileges
# mysql -u root -pnew-password -e "FLUSH PRIVILEGES;"


# for i in $(seq 1 100); do
#     sleep 0.1
#     draw_progress_bar $i 100
# done
# echo ""

sudo apt install zip -y
bin2hex=$(openssl rand -hex 16)
if [[ "$pma_setup" == "sub" ]]; then
    # sudo apt install php-bz2 -y
    # echo "Setting up phpMyAdmin as a subdomain..."
    # latest_phpmyadmin=$(curl --silent "https://api.github.com/repos/phpmyadmin/phpmyadmin/releases/latest" | grep '"name":' | cut -d '"' -f 4)
    # sudo wget https://files.phpmyadmin.net/phpMyAdmin/${latest_phpmyadmin}/phpMyAdmin-${latest_phpmyadmin}-all-languages.zip
    # sudo unzip phpMyAdmin-${latest_phpmyadmin}-all-languages.zip && mv phpMyAdmin-${latest_phpmyadmin}-all-languages /var/www/pma
    # echo "server {
    #     listen 80;
    #     listen [::]:80;
    #     server_name pma.$domain;
    #     root /var/www/pma;
    #     index index.php index.php;
    #     location / {
    #         try_files $uri $uri/ =404;
    #     }
    #     location ~ \.php$ {
    #         include snippets/fastcgi-php.conf;
    #         fastcgi_pass unix:/var/run/php/php-fpm.sock;
    #     }
    # }" > /etc/nginx/sites-enabled/pma
    echo "<?php
    /* Servers configuration */
    \$i = 0;

    /* Server: localhost [1] */
    \$i++;
    \$cfg['Servers'][\$i]['verbose'] = '';
    \$cfg['Servers'][\$i]['host'] = 'localhost';
    \$cfg['Servers'][\$i]['port'] = '';
    \$cfg['Servers'][\$i]['socket'] = '';
    \$cfg['Servers'][\$i]['auth_type'] = 'cookie';
    \$cfg['Servers'][\$i]['user'] = 'root';
    \$cfg['Servers'][\$i]['password'] = '';

    /* End of servers configuration */

    \$cfg['blowfish_secret'] = bin2hex($bin2hex); // generates a 32 characters long random string
    \$cfg['DefaultLang'] = 'en';
    \$cfg['ServerDefault'] = 1;
    \$cfg['UploadDir'] = '';
    \$cfg['SaveDir'] = '';
    " > /var/www/pma/config.inc.php
    # Add your phpMyAdmin setup commands here

elif [[ "$pma_setup" == "link" ]]; then
    echo "Setting up phpMyAdmin as a symbolic link..."
    latest_phpmyadmin=$(curl --silent "https://api.github.com/repos/phpmyadmin/phpmyadmin/releases/latest" | grep '"name":' | cut -d '"' -f 4)
    sudo wget https://files.phpmyadmin.net/phpMyAdmin/${latest_phpmyadmin}/phpMyAdmin-${latest_phpmyadmin}-all-languages.zip
    sudo unzip phpMyAdmin-${latest_phpmyadmin}-all-languages.zip -d /var/www/pma
    echo "<?php
    /* Servers configuration */
    \$i = 0;

    /* Server: localhost [1] */
    \$i++;
    \$cfg['Servers'][\$i]['verbose'] = '';
    \$cfg['Servers'][\$i]['host'] = 'localhost';
    \$cfg['Servers'][\$i]['port'] = '';
    \$cfg['Servers'][\$i]['socket'] = '';
    \$cfg['Servers'][\$i]['auth_type'] = 'cookie';
    \$cfg['Servers'][\$i]['user'] = 'root';
    \$cfg['Servers'][\$i]['password'] = '';

    /* End of servers configuration */

    \$cfg['blowfish_secret'] = bin2hex(random_bytes(16)); // generates a 32 characters long random string
    \$cfg['DefaultLang'] = 'en';
    \$cfg['ServerDefault'] = 1;
    \$cfg['UploadDir'] = '';
    \$cfg['SaveDir'] = '';
    " > /var/www/pma/config.inc.php
fi

# Configure MySQL remote access
# if [[ "$mysql_remote" == "true" ]]; then
#     echo "Configuring MySQL remote access..."
#     # Add your MySQL remote access configuration commands here
#     sudo sed -i 's/bind-address.*/bind-address = 0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf
#     sudo service mysql restart
# fi

# Create admin user
# if [[ -n "$admin_username" && -n "$admin_password" ]]; then
#     echo "Creating admin user..."
#     # Generate a random password

#     echo "Username: $admin_username"
#     echo "Password: $generated_password"
# fi

# echo "Installation completed successfully."
# echo "Installing dependencies..."
# # Add your dependency installation commands here

# echo "Configuring PHP..."
# # Add your PHP configuration commands here

# echo "Configuring Nginx..."
# # Add your Nginx configuration commands here

# echo "Configuring MySQL..."
# # Add your MySQL configuration commands here

# echo "Starting services..."
# Add your service start commands here
# Start PHP-FPM service
# sudo systemctl start php-fpm

# # Start Nginx service
# sudo systemctl start nginx

# # Start MySQL service
# sudo systemctl start mysql#!/bin/bash

ASCII='
   ______            __   _      ________  ________
  / ____/___  ____  / /__(_)__  / ____/  |/  / ___/
 / /   / __ \/ __ \/ //_/ / _ \/ /   / /|_/ /\__ \
/ /___/ /_/ / /_/ / ,< / /  __/ /___/ /  / /___/ /
\____/\____/\____/_/|_/_/\___/\____/_/  /_//____/  v. Game
'

# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
RESET='\033[0m' # Reset color to default

# Usage of colors in the script
echo -e "${GREEN}${ASCII}${RESET}"  # Green text for success message
# Check if no command line arguments are provided
if [[ $# -eq 0 ]]; then
    echo "Usage: $0 -domain <domain_name> -pma <pma_setup_type> -mysql <mysql_remote_access> -admin <admin_username> <admin_password>"
    echo "Available options:"
    echo "-domain <domain_name>: Specify the domain name for the website"
    echo "-pma <pma_setup_type>: Specify the type of phpMyAdmin setup (sub/link)"
    echo "-mysql <mysql_remote_access>: Specify whether to configure MySQL remote access (true/false)"
    echo "-admin <admin_username> <admin_password>: Specify the admin username and password"
    exit 1
fi
# Parse command line arguments
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        -domain)
            domain="$2"
            shift
            shift
            ;;
        -pma)
            pma_setup="$2"
            shift
            shift

            ;;
        -mysql)
            mysql_remote="$2"
            shift
            shift
            ;;
        -admin)
            admin_username="$2"
            admin_password="$3"
            shift
            ;;
        *)
            echo -e "${RED}Error:${RESET} Invalid argument: $1"
            exit 1
            ;;
    esac
done
echo $pma_setup;
# Check if domain is provided
if [[ -z $domain ]]; then
    echo -e "${RED}Error:${RESET} Domain name is required."
    exit 1
fi

# Function to draw progress bar
draw_progress_bar() {
    # Calculate percentage
    let _progress=(${1}*100/${2}*100)/100
    let _done=(${_progress}*4)/10
    let _left=40-$_done

    # Build progressbar string lengths
    _fill=$(printf "%${_done}s")
    _empty=$(printf "%${_left}s")

    # 1.2s clear carriage return
    printf "\rProgress : [${_fill// /#}${_empty// /-}] ${_progress}%%"
}

# # Install PHP
# echo "Installing PHP..."
# # Add your PHP installation commands here0
# sudo apt install php-fpm php-mysql php-mbstring php-xml php-gd php-curl php-zip php-gd php-cli -y
# for i in $(seq 1 100); do
#     sleep 0.1
#     draw_progress_bar $i 100
# done
# echo ""

# # Install Nginx
# echo "Installing Nginx..."
# # Add your Nginx installation commands here
# sudo apt install nginx -y
# rm -rf /etc/nginx/sites-enabled/default
# echo "server {
#     listen 80;
#     listen [::]:80;
#     server_name $domain;
#     root /var/www/cookiecms;
#     index index.php index.html index.htm index.nginx-debian.html;
#     location / {
#         try_files \$uri \$uri/ /index.php?\$query_string;
#     }
#     location /api {
#         try_files \$uri \$uri/ /api.php?\$query_string;
#     }
#     location ~ \.php$ {
#         include snippets/fastcgi-php.conf;
#         fastcgi_pass unix:/var/run/php/php-fpm.sock;
#     }
# }" > /etc/nginx/sites-enabled/cookiecms
# for i in $(seq 1 100); do
#     sleep 0.1
#     draw_progress_bar $i 100
# done
# echo ""

# Install MySQL
# echo "Installing MySQL..."
# # Add your MySQL installation commands here
# sudo apt install mysql-server -y

# # Set root password
# mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'new-password';"

# # Remove anonymous users
# mysql -u root -pnew-password -e "DELETE FROM mysql.user WHERE User='';"

# # Disallow root login remotely
# mysql -u root -pnew-password -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"

# # Remove test database and access to it
# mysql -u root -pnew-password -e "DROP DATABASE IF EXISTS test;"
# mysql -u root -pnew-password -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';"

# # Reload privilege tables
# mysql -u root -pnew-password -e "FLUSH PRIVILEGES;"

#  generated_password=$(openssl rand -base64 12)

# # Create the user with the generated password
# mysql -u root -pnew-password -e "CREATE USER 'cmscookie'@'localhost' IDENTIFIED WITH mysql_native_password BY '$generated_password';"

# # Create the database
# mysql -u root -pnew-password -e "CREATE DATABASE cmscookie;"

# # Grant necessary privileges to the user for the database
# mysql -u root -pnew-password -e "GRANT ALL PRIVILEGES ON cmscookie.* TO 'cmscookie'@'localhost';"

# # Flush privileges
# mysql -u root -pnew-password -e "FLUSH PRIVILEGES;"


# for i in $(seq 1 100); do
#     sleep 0.1
#     draw_progress_bar $i 100
# done
# echo ""

sudo apt install zip -y
bin2hex=$(openssl rand -hex 16)
if [[ "$pma_setup" == "sub" ]]; then
    # sudo apt install php-bz2 -y
    # echo "Setting up phpMyAdmin as a subdomain..."
    # latest_phpmyadmin=$(curl --silent "https://api.github.com/repos/phpmyadmin/phpmyadmin/releases/latest" | grep '"name":' | cut -d '"' -f 4)
    # sudo wget https://files.phpmyadmin.net/phpMyAdmin/${latest_phpmyadmin}/phpMyAdmin-${latest_phpmyadmin}-all-languages.zip
    # sudo unzip phpMyAdmin-${latest_phpmyadmin}-all-languages.zip && mv phpMyAdmin-${latest_phpmyadmin}-all-languages /var/www/pma
    # echo "server {
    #     listen 80;
    #     listen [::]:80;
    #     server_name pma.$domain;
    #     root /var/www/pma;
    #     index index.php index.php;
    #     location / {
    #         try_files $uri $uri/ =404;
    #     }
    #     location ~ \.php$ {
    #         include snippets/fastcgi-php.conf;
    #         fastcgi_pass unix:/var/run/php/php-fpm.sock;
    #     }
    # }" > /etc/nginx/sites-enabled/pma
    echo "<?php
    /* Servers configuration */
    \$i = 0;

    /* Server: localhost [1] */
    \$i++;
    \$cfg['Servers'][\$i]['verbose'] = '';
    \$cfg['Servers'][\$i]['host'] = 'localhost';
    \$cfg['Servers'][\$i]['port'] = '';
    \$cfg['Servers'][\$i]['socket'] = '';
    \$cfg['Servers'][\$i]['auth_type'] = 'cookie';
    \$cfg['Servers'][\$i]['user'] = 'root';
    \$cfg['Servers'][\$i]['password'] = '';

    /* End of servers configuration */

    \$cfg['blowfish_secret'] = bin2hex($bin2hex); // generates a 32 characters long random string
    \$cfg['DefaultLang'] = 'en';
    \$cfg['ServerDefault'] = 1;
    \$cfg['UploadDir'] = '';
    \$cfg['SaveDir'] = '';
    " > /var/www/pma/config.inc.php
    # Add your phpMyAdmin setup commands here

elif [[ "$pma_setup" == "link" ]]; then
    echo "Setting up phpMyAdmin as a symbolic link..."
    latest_phpmyadmin=$(curl --silent "https://api.github.com/repos/phpmyadmin/phpmyadmin/releases/latest" | grep '"name":' | cut -d '"' -f 4)
    sudo wget https://files.phpmyadmin.net/phpMyAdmin/${latest_phpmyadmin}/phpMyAdmin-${latest_phpmyadmin}-all-languages.zip
    sudo unzip phpMyAdmin-${latest_phpmyadmin}-all-languages.zip -d /var/www/pma
    echo "<?php
    /* Servers configuration */
    \$i = 0;

    /* Server: localhost [1] */
    \$i++;
    \$cfg['Servers'][\$i]['verbose'] = '';
    \$cfg['Servers'][\$i]['host'] = 'localhost';
    \$cfg['Servers'][\$i]['port'] = '';
    \$cfg['Servers'][\$i]['socket'] = '';
    \$cfg['Servers'][\$i]['auth_type'] = 'cookie';
    \$cfg['Servers'][\$i]['user'] = 'root';
    \$cfg['Servers'][\$i]['password'] = '';

    /* End of servers configuration */

    \$cfg['blowfish_secret'] = bin2hex(random_bytes(16)); // generates a 32 characters long random string
    \$cfg['DefaultLang'] = 'en';
    \$cfg['ServerDefault'] = 1;
    \$cfg['UploadDir'] = '';
    \$cfg['SaveDir'] = '';
    " > /var/www/pma/config.inc.php
fi

# Configure MySQL remote access
# if [[ "$mysql_remote" == "true" ]]; then
#     echo "Configuring MySQL remote access..."
#     # Add your MySQL remote access configuration commands here
#     sudo sed -i 's/bind-address.*/bind-address = 0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf
#     sudo service mysql restart
# fi

# Create admin user
# if [[ -n "$admin_username" && -n "$admin_password" ]]; then
#     echo "Creating admin user..."
#     # Generate a random password

#     echo "Username: $admin_username"
#     echo "Password: $generated_password"
# fi

# echo "Installation completed successfully."
# echo "Installing dependencies..."
# # Add your dependency installation commands here

# echo "Configuring PHP..."
# # Add your PHP configuration commands here

# echo "Configuring Nginx..."
# # Add your Nginx configuration commands here

# echo "Configuring MySQL..."
# # Add your MySQL configuration commands here

# echo "Starting services..."
# Add your service start commands here
# Start PHP-FPM service
# sudo systemctl start php-fpm

# # Start Nginx service
# sudo systemctl start nginx

# # Start MySQL service
# sudo systemctl start mysql
