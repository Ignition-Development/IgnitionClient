# Ignition Dash

## Dashboard installation


### Example Dependency Installation

The commands below are simply an example of how you might install these dependencies. Please consult with your operating system's package manager to determine the correct packages to install.

```bash
# Add "add-apt-repository" command
apt -y install software-properties-common curl apt-transport-https ca-certificates gnupg

# Add additional repositories for PHP, Redis, and MariaDB
LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php

# MariaDB repo setup script can be skipped on Ubuntu 22.04
curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash

# Update repositories list
apt update

# Add universe repository if you are on Ubuntu 18.04
apt-add-repository universe

# Install Dependencies
apt -y install php8.0 php8.0-{common,cli,gd,mysql,opcache,soap,mbstring,bcmath,xml,fpm,curl,zip,xmlrpc,imagick,dev,imap,intl} libapache2-mod-php8.0 mariadb-server apache2 certbot zip tar unzip git 
```

### Download Files

The first step in this process is to create the folder where the dashboard will live and then move ourselves into that newly created folder. Below is an example of how to perform this operation.

```bash
mkdir -p /var/www/client
cd /var/www/client
```
Once you have created a new directory for the Dashboard and moved into it you'll need to download the Dashboard files. This is as simple as using curl to download our pre-packaged content. Once it is downloaded you'll need to unpack the archive and then set the correct permissions on the core/ and tmp/ directories. These directories allow us to store files as well as keep a speedy cache available to reduce load times.

```bash
wget https://github.com/Ignition-Development/IgnitionDash/releases/download/V0.1.0/dashboard.zip
tar -xzvf dashboard.zip
chmod -R 755 storage install
```

### Installation

Now that all of the files have been downloaded we need to configure some core aspects of the Dashboard.
Database Configuration

You will need a database setup and a user with the correct permissions created for that database before continuing any further.
```mysql
mysql -u root -p

# Remember to change 'yourPassword' below to be a unique password
CREATE USER 'ighdash'@'127.0.0.1' IDENTIFIED BY 'yourPassword';
CREATE DATABASE dash;
GRANT ALL PRIVILEGES ON dash.* TO 'ighdash'@'127.0.0.1' WITH GRANT OPTION;
exit
```

### Crontab Configuration

Setting up cron jobs will be really important; this is not an optional step: the cron jobs will allow the dashboard to process data internally, and manage the queue system. First, check if crontab is installed by typing "cron" in your terminal. Or, if you are using a hosting service, check if your host supports crontab. If you are on a terminal, run:

```bash
sudo crontab -e

*/2 * * * * php /var/www/client/scripts/queueHandler.php >/dev/null 2>&1
```

## Creating SSL Certificates

To begin, we will install certbot, a simple script that automatically renews our certificates and allows much easier creation of them. The command below is for Ubuntu distributions, but you can always check Certbot's [official site](https://certbot.eff.org/) for installation instructions. We have also included a command below to install certbot's Nginx/Apache plugin so you won't have to stop your webserver.


```bash
sudo apt install -y certbot
# Run this if you use Nginx
sudo apt install -y python3-certbot-nginx
# Run this if you use Apache
sudo apt install -y python3-certbot-apache
```

### Creating a Certificate
After installing the certbot, we need to generate a certificate. There are a couple of ways to do that, but the easiest is to use the web server-specific certbot plugin you just installed. For Wings-only machines that don't need a web server, use the standalone or DNS method of the certbot as you don't need a web server for it.

Then, in the command below, you should replace ``example.com`` with the domain you would like to generate a certificate for. When you have multiple domains you would like certificates for, simply add more ``-d anotherdomain.com`` flags to the command. You can also look into generating a wildcard certificate but that is not covered in this tutorial.

### HTTP challenge

HTTP challenge requires you to expose port 80 for the challenge verification.

```bash
# Nginx
certbot certonly --nginx -d example.com
# Apache
certbot certonly --apache -d example.com
# Standalone - Use this if neither works. Make sure to stop your webserver first when using this method.
certbot certonly --standalone -d example.com
```

### DNS challenge

DNS challenge requires you to create a new TXT DNS record to verify domain ownership, instead of having to expose port 80. The instructions are displayed when you run the certbot command below.

```bash
certbot -d example.com --manual --preferred-challenges dns certonly
```

### Auto Renewal

You'll also probably want to configure the automatic renewal of certificates to prevent unexpected certificate expirations. You can open crontab with ``sudo crontab -e`` and add the line from below to the bottom of it for attempting renewal every day at 23 (11 PM).

```bash
0 23 * * * certbot renew --quiet --deploy-hook "systemctl restart nginx"
```

## Webserver 

First, remove the default Apache configuration.

```bash
a2dissite 000-default.conf
```
Now, you should paste the contents of the file below, replacing ``<domain>`` with your domain name being used in a file called ``ignitiondash.conf`` and place the file in ``/etc/apache2/sites-available``

```txt
<VirtualHost *:80>
  ServerName <domain>
  
  RewriteEngine On
  RewriteCond %{HTTPS} !=on
  RewriteRule ^/?(.*) https://%{SERVER_NAME}/$1 [R,L] 
</VirtualHost>

<VirtualHost *:443>
  ServerName <domain>
  DocumentRoot "/var/www/client"

  AllowEncodedSlashes On
  
  php_value upload_max_filesize 100M
  php_value post_max_size 100M

  <Directory "/var/www/client">
    Require all granted
    AllowOverride all
  </Directory>
 <FilesMatch \.php$>
      SetHandler "proxy:unix:/run/php/php8.0-fpm.sock|fcgi://localhost"
  </FilesMatch>


  ErrorLog ${APACHE_LOG_DIR}/ignition_dash.log
  CustomLog ${APACHE_LOG_DIR}/ignition_dash_access.log combined

  SSLEngine on
  SSLCertificateFile /etc/letsencrypt/live/<domain>/fullchain.pem
  SSLCertificateKeyFile /etc/letsencrypt/live/<domain>/privkey.pem
</VirtualHost> 
```

### Enabling Configuration

Once you've created the file above, simply run the commands below.

```bash
sudo ln -s /etc/apache2/sites-available/ignitiondash.conf /etc/apache2/sites-enabled/ignitiondash.conf

sudo a2enmod actions fcgid alias proxy_fcgi rewrite ssl

sudo systemctl restart apache2
```
