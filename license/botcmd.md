# Bot Commands

## Owner Commands
- `/addshop <user>` - Add new shop
- `/lockshop <shopid>` - Remove shop access
- `/stats` - View global license statistics
- `/stats <shopid>` - View shop license statistics
- `/blacklist add <user>` - Add user to blacklist
- `/blacklist remove <user>` - Remove user from blacklist
- `/license create <user> <duration>` - Create new license
- `/license revoke <id>` - Revoke license
- `/deactivate shop <id_shop> <reason>` - Deactivate all licenses issued by shop
- `/activate shop <id_shop> <reason>` - Activate all licenses issued by shop
- `/license list [shopid]` - View all licenses or filter by shop
<!-- - `/comment <id> <text>` - Add admin comment -->
<!-- - `/comment remove <id>` - Remove any comment -->
- `/price <shopid> <price>` - Set license price for shop

## Shop Owner Commands
- `/license create <user> <type> <duration>` - Create new license
- `/license revoke <id>` - Revoke license
- `/license list` - View all licenses issued by shop
<!-- - `/comment <id> <text>` - Add comment to license -->
<!-- - `/comment remove <id>` - Remove shop's comment -->
- `/shop set name <name>` - Set shop name
- `/shop set description <text>` - Set shop description
- `/shop setrole <user> <role>` - Set user role (manager/staff)
- `/shop users` - View all users in shop
- `/shop user <user>` - View user details
- `/shop setprice <type> <price>` - Set license price
- `/shop removeprice <type>` - Remove license price
- `/shop setrole <manager/seller>` - Set user role
- `/app create` - Create new application
- `/app info` - View application secret key
- `/app delete` - Delete application


## User Commands
- `/licenses` - View your active licenses
- `/activate <key>` - Activate license key
<!-- - `/comment <id_shop> <text> <stars>` - Add comment to shop (not works with custom apps) -->
<!-- - `/comment remove <id>` - Remove own comment (not works with custom apps) -->
<!-- - `/comment list <id>` - View all comments for license (not works with custom apps) -->
- `/shops` - View all shops
- `/shop <id>` - View shop details
- `/license history` - history of all licenses