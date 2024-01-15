# Fisrt install

```bash
git clone git@github.com:Cookie-cms/cookie_cms.git
```
after when you cloned move to dir where your site
```bash
mv cookie_cms/ /var/www/
```
## Setting your nginx config

where `yourdomain.com` put your and root `/var/www/cookie_cms/`

```
server {
    listen 80;
    server_name yourdomain.com;

    root /path/to/your/web/root;
    index index.php index.html;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location /api {
        try_files $uri $uri/ /api.php?$query_string;
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

## setup key

1) [key panel](https://coffeedev.dev/client.php)
2) login via discord
3) Push button License (open)
![img](https://cdn.discordapp.com/attachments/1142823183586697336/1196065852563411065/image.png?ex=65b64621&is=65a3d121&hm=63c7552dc257274f7d108b26f60737e9f5059e1c32750b8a50c0579f6de42a2d&)
4) Push button copy 
5) go to ``https://domain.com/license/``
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

$registertype = "0"; // not working
$minecraftsys = 1; // not working
$capetype = "0"; // not working
$template = "bootstrap"; // template


$modules = []; // not working
$DEBUG = [
    'debug' => false, // simple debbug
    'development' => false, // like if you want open page setup
    'generatorusername' => false // easy way to create test account 
    `outlogmasterfastererroroutput` => false // display php errors
];

$discordsys = 0;
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