---
next:
  text: 'Update 1.0'
  link: '/1.0/'
---
::: danger
Old version without supporting
:::
# Fisrt install

```bash
git clone git@github.com:Cookie-cms/cookie_cms.git;
curl https://example.com/patches/0001-new-code.patch | git apply;
mv cookie_cms/ /var/www/
```
## Setting your nginx config

where `yourdomain.com` put your and root `/var/www/cookie_cms/`

```config
server {
    listen 80;
    server_name yourdomain.com;

    root /path/to/your/web/root;
    index index.php index.html;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.1-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }
}

```

check if all okay

```bash
nginx -t
```
if all okay

```bash
systemctl restart nginx
```

## setup ssl optionally
```
sudo apt install certbot python3-certbot-nginx
```

```
certbot
```

## setup site

```
https://domain.com/setup/
```

and 
```
chmod-R 766 /var/www/cookie_cms/uploads/
```

## dirs

```
cookie_cms/
├── activation/
│   ├── errors/
│   └── index.php
├── core/
│   ├── admin/
│   │   ├── users.php
│   │   └── verify.php
│   ├── auth/
│   │   ├── discord/
│   │   │   ├── debug.php
│   │   │   ├── login.php
│   │   │   ├── main.php
│   │   │   ├── register.php
│   │   │   └── whitelist.php
│   │   ├── login.php
│   │   ├── logout.php
│   │   └── register.php
│   ├── configs/
│   │   ├── config.inc.php
│   │   ├── license.php
│   │   └── staticinfo.php
│   ├── discord/
│   │   └── oauth2.php
│   ├── home/
│   │   ├── check.php
│   │   ├── main.php
│   │   └── update.php
│   ├── inc/
│   │   ├── modules.php
│   │   ├── mysql.php
│   │   └── template.php
│   └── register/
│       └── info.php
├── setup/
│   ├── index.php
│   └── process.php
├── templates/
│   ├── bootstrap/
│   │   ├── assets/
│   │   │   ├── default.png
│   │   │   ├── light_bg.png
│   │   │   └── night_bg.png
│   │   ├── css/
│   │   │   ├── admin.css
│   │   │   ├── home.css
│   │   │   ├── main(2).css
│   │   │   └── main.css
│   │   ├── inc/
│   │   │   ├── 404.php
│   │   │   └── header.php
│   │   ├── js/
│   │   │   └── darktheme.js
│   │   └── pages/
│   │       ├── admin.php
│   │       ├── home.php
│   │       ├── index.php
│   │       └── registerds.php
│   └── main/
│       └── skinview3d.bundle.js
├── uploads/
│   ├── skins
│   └── capes
├── index.php
├── define.php
├── .gitignore
├── LICENSE
└── README.md
```

# config

```php
<?php

$host = "domain.com";
$username = "user";
$pass = "password";
$db = "db";
$port = 3306;

$DEBUG = [
    'debug' => false, // simple debbug
    'development' => false, // like if you want open page setup
    'generatorusername' => false // easy way to create test account 
    `outlogmasterfastererroroutput` => false // display php errors
];

$discordoauth = [
    'client_id' => "", // client id discord
    'secret_id' => "", // secret id discord
    'scopes' => '', // scopes
    'redirect_url' => "",
    'bot' => "",
    'guild_id' => 0,
    'role' => 0
];
?>
```
