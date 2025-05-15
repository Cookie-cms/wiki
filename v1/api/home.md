# **Home**

## **Home Page**
`GET /api/home`

**Request Headers**:
- **Authorization**: Bearer `jwt_token`


- **200 OK**:
```json
{
    "error": false,
    "msg": "Home data fetched successfully",
    "url": null,
    "data": {
        "Username": "Coffee",               // The username of the user
        "Uuid": "00000000-0000-0000-0000-000000000000",  // Unique identifier for the user
        "Selected_Cape": 0,                 // ID of the selected cape
        "Selected_Skin": "23bc8c46-987a-44d8-8856-3437563de160",                 // ID of the selected cape
        "PermLvl": 0,
        "Capes": [
            {
                "Id": 0,
                "Name": "youtube"
            }
        ],                                  // Array of capes available to the user
        "Skin": [
            {
                "Id": 0,
                "Name": "youtube"
            }
        ],     
        "Discord_integration": true,        // Whether the user has Discord integration enabled
        "Discord": {
            "userid": "",     // The global Discord username
            "username": "",              // The Discord avatar URL
            "avatar": ""             // The Discord avatar URL
        },
        "Mail_verification": true           // Whether the email is verified
    }
}
```


## **Edit User Details**

**Request Headers**:
- **Authorization**: Bearer `jwt_token`

**Request Body Options**:

- **For change settings**:

Options can be:
- `username` (requires password)
- `password` (requires old_password)
- `cape`
- Upload skin via HTML form


`PATCH /api/home/edit/username`
```json
{
    "username": "new_username",
    "password": "current_password"
}
```

`PATCH /api/home/edit/password`
```json
{
    "password": "current_password",
    "newpassword": "new_password"
}
```


`POST /api/home/mail/request`
```json
{
    "mail": "NewMail",
    "password": "current_password",
}
```

`POST /api/home/mail/validate`
```json
{
    "code": "code",
    "password": "current_password",
}
```

`PUT /api/home/edit/skin`
```json
{
    "skinid": "uuid",
    "name": "name",
    "slim": true,
    "cloakid": "uuid"
}
```

`POST /api/home/edit/skin/select`
```json
{
    "skinid": "uuid"
}
```


`DELETE /api/home/edit/skin`
```json
{
    "skinid": "uuid"
}
```

`POST /api/home/edit/removediscord`
```json
{
    "password": "current_password"
}
```

**Response**:

- **204 No Content**


- **200 OK**:
```json
{
    "error": false,
    "msg": "{Action} successfully",
    "url": null,
    "data": {}
}
```

- **400 Bad Request**:
```json
{
    "error": true,
    "msg": "{ Action error }",
    "url": null,
    "data": {}
}
```


### **Upload Skins**
`POST /api/home/edit/upload`

**Request Headers**:
- **Authorization**: Bearer `jwt_token

**Request Body form**:
```json
{   
    "skin": file
    "slim": "true | false"
}
```


**Response**:
```json
{
    "error": false,
    "msg": "Skin successfully uploaded.",
    "url": null,
    "data": {}
}
```
