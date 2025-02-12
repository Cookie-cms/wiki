# API Documentation

## Owner Endpoints

### Add New Shop
**POST** `/api/shop/add`  
**Params:**  
- `user_id` (string) – User ID of the shop owner  

### Lock Shop Access
**POST** `/api/shop/lock`  
**Params:**  
- `shop_id` (string) – ID of the shop to lock  

### View Global License Statistics
**GET** `/api/stats`  

### View Shop License Statistics
**GET** `/api/stats/{shop_id}`  

### Manage Blacklist
**POST** `/api/blacklist/add`  
**Params:**  
- `user_id` (string) – User to blacklist  

**POST** `/api/blacklist/remove`  
**Params:**  
- `user_id` (string) – User to remove from blacklist  

### License Management
**POST** `/api/license/create`  
**Params:**  
- `user_id` (string)  
- `duration` (integer)  

**POST** `/api/license/revoke`  
**Params:**  
- `license_id` (string)  

**POST** `/api/shop/deactivate`  
**Params:**  
- `shop_id` (string)  
- `reason` (string)  

**POST** `/api/shop/activate`  
**Params:**  
- `shop_id` (string)  
- `reason` (string)  

**GET** `/api/license/list`  
Optional Query Params:  
- `shop_id` (string)  

### Set License Price for Shop
**POST** `/api/shop/price`  
**Params:**  
- `shop_id` (string)  
- `price` (number)  

---

## Shop Owner Endpoints

### License Management
**POST** `/api/shop/license/create`  
**Params:**  
- `user_id` (string)  
- `type` (string)  
- `duration` (integer)  

**POST** `/api/shop/license/revoke`  
**Params:**  
- `license_id` (string)  

**GET** `/api/shop/license/list`  

### Shop Management
**POST** `/api/shop/set/name`  
**Params:**  
- `name` (string)  

**POST** `/api/shop/set/description`  
**Params:**  
- `description` (string)  

**POST** `/api/shop/setrole`  
**Params:**  
- `user_id` (string)  
- `role` (string) – `manager` or `seller`  

**GET** `/api/shop/users`  

**GET** `/api/shop/user/{user_id}`  

**POST** `/api/shop/setprice`  
**Params:**  
- `type` (string)  
- `price` (number)  

**POST** `/api/shop/removeprice`  
**Params:**  
- `type` (string)  

### Application Management
**POST** `/api/app/create`  

**GET** `/api/app/info`  

**DELETE** `/api/app/delete`  

---

## User Endpoints

### View Active Licenses
**GET** `/api/user/licenses`  

### Activate License Key
**POST** `/api/user/activate`  
**Params:**  
- `key` (string)  

### View All Shops
**GET** `/api/shops`  

### View Shop Details
**GET** `/api/shop/{shop_id}`  

### View License History
**GET** `/api/user/license/history`  

---

## Hidden Reviews (Shop-Only Notes)

### Add Hidden Review  
**POST** `/api/shop/review/hidden/add`  
**Params:**  
- `target_id` (string) – ID of the shop or user being reviewed  
- `text` (string) – Hidden note text  

### Remove Hidden Review  
**POST** `/api/shop/review/hidden/remove`  
**Params:**  
- `review_id` (string)  

### List Hidden Reviews  
**GET** `/api/shop/review/hidden/list`  
Optional Query Params:  
- `target_id` (string)  
