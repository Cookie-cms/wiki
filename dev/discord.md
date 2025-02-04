
## **Discord Integration**

### **GET /auth/discord/callback**

parameters ?code=code

line
1. get code
2. get information about user
3. check if user have connected account
3.1. Send 200
4. return 400 and give chance to create account


**Response**:

- **200 OK**:
```json
{
    "error": false,
    "msg": "Seccessfully logged in",
    "url": "/home",  
    "data": {
        "jwt": "string",
        "userid": "discord id user",
        "username": "discord username global",
        "avatar": "discord avatar cache"
    }
}
```

- **404 Not found**:
```json
{
  "error": true,
  "msg": "User not found, do you want create or link?",
  "url": null,
  "data": {
    "user": {
      "id": "id",
      "username": "name",
      "avatar": "cache",
      "conn_id": 0
    }
  }
}
```


User can create account or link account


link via login
```json
{
    "username": "string",
    "password": "string",
    "meta": {
        "id": "string",
        "conn_id": 0
    }
}
```


- **200 OK**:
```json
{
    "error": false,
    "msg": "Account linked",
    "url": "/home",  
    "data": {
        "jwt": "string",
        "userid": "discord id user",
        "username": "discord username global",
        "avatar": "discord avatar cache"
    }
}
```

- **409 Conflict**:

```json
{
    "error": true,
    "msg": "This game account already linked to another discord account",
    "url": null,
    "data": {}
}
```




if user want register new account

`POST /api/auth/register/discord`

**Request Body**:

```json
{
    "meta": {
        "id": "string",
        "conn_id": 0
    }
}
```

**Response**:

- **200 OK**:
```json
{
    "error": false,
    "msg": "Login successful",
    "url": "/home",  // Optional redirect URL
    "data": {
        "jwt": "string"  // The JWT token for authenticated requests
    }
}
```

- **400 Bad request**:
```json
{
    "error": true,
    "msg": "Internal error",
    "url": null,
    "data": {}
}
```