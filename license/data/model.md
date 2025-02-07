

# License Model

```json
{
    "license": "string",    // The license key to validate
    "hwid": "string",       // The hardware ID of the machine
    "userid": "string",    // The owner ID of the license
    "sellerid": "string",   // The seller ID of the license
    "createdAt": "string",  // The creation date of the license
    "expiresAt": "string",   // The expiration date of the license
    "status": "string",     // The current status of the license
}
```

# seller Model

```json
{
    "sellerid": "string",   // The seller ID
    "name": "string",       // The name of the seller
    "ds_server": "string",      // The email of the seller
    "ds_owner": "string",      // The email of the seller
    "createdAt": "string",  // The creation date of the seller
    "comments": []          // Comments about the seller
}
```

# users model

```json
{
    "userid": "string",     // The user ID 
    "password": "string",   // The password of the user
    "createdAt": "string",  // The creation date of the user
    "status": "string",         // Статус аккаунта (active, banned, suspended)
    "createdAt": "string",      // Дата создания
    "updatedAt": "string",      // Дата последнего обновления профиля
    "comments": []          // Comments about the seller

}
```

# audit model

```json
{
    "auditid": "string",    // The audit ID
    "userid": "string",     // The user ID
    "action": {},     // The action performed
    "createdAt": "string",  // The creation date of the audit
}
```

# apps model

```json
{
    "appid": "string",      // The app ID
    "name": "string",       // The name of the app
    "sellerid": "string",   // The seller ID of the app
    "secretid": "string",
    "description": "string",// The description of the app
    "createdAt": "string",  // The creation date of the app
}
```