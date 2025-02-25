---
next:
  text: 'Version Rules'
  link: '/dev/verule'
---
# **API Documentation**

Actual on 03.02.2025

## **Standard Response Format**

All responses from the API will follow the standard format:

```json
{
    "error": bool,    // Indicates if there was an error (default is false)
    "msg": string,    // A message to describe the result or error
    "url": string,    // A URL for redirection, default is null
    "data": {}        // Data object containing the response data (can be empty)
}
```

<details>
<summary>Possible error responses</summary>

- **400 Bad Request**: The request was invalid or missing required parameters
- **401 Unauthorized**: The request requires authentication or the JWT token is invalid
- **403 Forbidden**: The request is not allowed or the user does not have permission
- **404 Not Found**: The requested resource was not found
- **409 Conflict**: The request could not be completed due to a conflict with the current state of the resource
- **500 Internal Server Error**: An unexpected error occurred on the server

format:
```json
{
    "error": true,
    "msg": "Error message",
    "url": null,
    "data": {}
}
```


</details>


## **Authentication (Auth)**

### **Login**
`POST /api/auth/login`

**Request Body**:
```json
{
    "username": string,   // The username of the user
    "password": string    // The password of the user
}
```

**Responses**:

- **200 OK**:
```json
{
    "error": false,
    "msg": "Login successful",
    "url": string,  // Optional redirect URL
    "data": {
        "jwt": string  // The JWT token for authenticated requests
    }
}
```


---

### **Register**
Steps
- Register mail
- Verify mail
- Finish mail


`POST /api/auth/register`

**Request Body**:
```json
{
    "mail": "",       // User's email address
    "password": ""    // Account password (min 8 characters)
}
```

**Responses**:

- **200 OK**:
```json
{
    "error": false,
    "msg": "Registration successful",
    "url": "string",  // URL for the next step, if applicable
    "data": {}
}
```

---

### **forget pass**
Steps
- Request code
- validate code
- Update coed

### step 1
`POST /api/auth/forgetpass`

**Request Body**:
```json
{
    "mail": "",       // User's email address
}
```

**Responses**:

- **200 OK**:
```json
{
    "error": false,
    "msg": "Code sent please check your mail",
    "url": "string",  // URL for the next step, if applicable
    "data": {}
}
```

- **400 Bad Request**:
```json
{
    "error": true,
    "msg": "Invalid email or password",
    "url": null,
    "data": {}
}
```

### step 2
`POST /api/auth/forgetpass/validate`

**Request Body**:
```json
{
    "code": "",       // User's email address
}
```

**Responses**:

- **204 No Content**


### step 3
`POST /api/auth/forgetpass/update`

**Request Body**:
```json
{
    "code": "",       // User's email address
    "password": "",       // User's email address
}
```

**Responses**:

- **200 OK**:
```json
{
    "error": false,
    "msg": "Password updated",
    "url": "string",  // URL for the next step, if applicable
    "data": {}
}
```




---

### **Confirm Email**
`POST /api/auth/confirm`

**Request Body**:
```json
{
    "code": "string"
}
```


**Responses**:

- **200 OK**:
```json
{
    "error": false,
    "msg": "Email confirmed successfully",
    "url": "string",  // URL to redirect after confirmation
    "data": {}
}
```



---

### **Finish Registration**
`POST /api/home/registerfinish`

**Request Headers**:
- **Authorization**: Bearer `jwt_token`

Password required (min 8 characters)
**Request Body**:
```json
{
    "username": "",
    "password": ""
}
```

**Responses**:

- **200 OK**:
```json
{
    "error": false,
    "msg": "Username created successfully",
    "url": null,
    "data": {}
}
```


---

### **Logout**
`POST /api/auth/logout`

**Request Headers**:
- **Authorization**: Bearer `jwt_token`

**Response**:
- **200 OK**:
```json
{
    "error": false,
    "msg": "Logged out successfully",
    "url": null,
    "data": {}
}
```

---

## **Home**

### **Home Page**
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


### **Edit User Details**
<!-- `POST /api/home/edit` -->

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


#### **Upload Skins**
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


## **Admin Endpoints**

### **Users List**
`GET /api/admin/users`

**Request Headers**:
- **Authorization**: Bearer `jwt_token`

**Response**:

- **200 OK**:
```json
{
    "error": false,
    "msg": "Users fetched successfully",
    "url": null,
    "data": [
        {
            "id": int,
            "username": string,
            "dsid": string,
            "mail": string,
            "mail_verify": int,
            "uuid": string,
            "password": string,
            "perms": int,
            "accessToken": null,
            "serverID": null,
            "hwidId": null
        }
    ]
}
```

### **Get Specific User**
`GET /api/admin/user/{identifier}`

**Request Headers**:
- **Authorization**: Bearer `jwt_token`

**Response**:

- **200 OK**:
```json
{
    "error": false,
    "msg": "User data fetched successfully",
    "url": null,
    "data": {
        "Username": string,
        "Uuid": string,
        "Mail": string,
        "Mail_verify": bool(int),
        "Selected_Cape": int,
        "Selected_Skin": string,
        "PermLvl": int,
        "Capes": [
            {
                "Id": string,
                "Name": string
            }
        ],
        "Skins": [
            {
                "uuid": string,
                "name": string,
                "cloak_id": string
            }
        ],
        "Discord_integration": bool(true/false),
        "Discord": {
            "userid": string,
            "username": string,
            "avatar": string
        },
        "Mail_verification": bool(0/1)
    }
}
```

---

### **Patch Specific User**
`PATCH /api/admin/user/{identifier}`

**Request Headers**:
- **Authorization**: Bearer `jwt_token`

**Request Body**:
```json
{
    "username": string,   // The username of the user
    "mail": string,       // The email address of the user
    "mail_verify": bool,  // Whether the email is verified
    "selected_skin": string, // ID of the selected skin
    "password": string,   // The password of the user
    "perms": int,         // The permission level of the user
    "dsid": bool, // Whether Discord integration is enabled
    "mail_verification": bool // Whether the email is verified
}
```

if you want give temporary role use [Update User Role](#update-user-role)


---

### **Patch Skin User**
`PATCH /api/admin/skin/:uuid`

**Request Headers**:
- **Authorization**: Bearer `jwt_token`

**Request Body**:
```json
{
    "name": string,
    "slim": bool,
    "hd": bool,
    "cloakid": string,
}
```




### **Send Mail to All Users** <Badge type="warning" text="WIP" />
`POST /api/admin/mail`

**Request Headers**:
- **Authorization**: Bearer `jwt_token`

**Request Body**:
```json
{
    "subject": string,       // Subject of the email
    "message": string        // The body content of the email
}
```

**Response**:

- **200 OK**:
```json
{
    "msg": "Email sent successfully to all users"
}
```

### **Update User Role** <Badge type="warning" text="WIP" />


`POST /api/admin/user/role/{identifier}`

This endpoint allows an admin to update the role level (`role_level`) of a user and optionally set an expiration date (`expired_at`).

**Request Headers**:
- **Authorization**: Bearer `jwt_token`

**Request Body**:
```json
{
    "user": 1,
    "role_level": 1,        // New role level (1, 2, or 3)
    "expired_at": 1731798166    // Optional: Expiry date in ISO 8601 format (if not provided, role will be permanent)
}
```

**Responses**:

- **200 OK**:
```json
{
    "error": false,
    "msg": "User role and expiration updated successfully",
    "url": null,
    "data": {
        "id": 1,                  // User's unique identifier
        "new_role_level": 3,            // The updated role level
        "expired_at": 1731798166  // Expiry date if provided
    }
}
```

---

### **Optional Expiry Field**:

If the `expired_at` field is not provided, the role update will be permanent for the user. The expiry date must always be in the future if it is included.

---

### **Add user cape** <Badge type="warning" text="WIP" />

`POST /api/admin/user/cape/{identifier}`


**Request Headers**:
- **Authorization**: Bearer `jwt_token`

**Request Body**:
```json
{
    "user": 1,
    "cape": []
}
```

**Responses**:

- **200 OK**:
```json
{
    "error": false,
    "msg": "User role and expiration updated successfully",
    "url": null,
    "data": {
        "id": 1,                  // User's unique identifier
        "new_role_level": 3,            // The updated role level
        "expired_at": 1731798166  // Expiry date if provided
    }
}
```


### **Upload Cape**
`POST /api/admin/user/cape/upload`

**Request Headers**:
- **Authorization**: Bearer `jwt_token

**Request Body form**:

mime type: `image/png`
```
cape: file
name: string
owners: [ownersid, ownersid]
```

### **Delete Cape**
`DELETE /api/admin/user/cape/upload`

**Request Headers**:
- **Authorization**: Bearer `jwt_token

**Request Body**:
```json
{
    "capeid": "uuid"
}
```

### **Get all users skins**
`GET /api/admin/users/skin/{uuid}`

**Request Headers**:
- **Authorization**: Bearer `jwt_token

### **Audit List**
`GET /api/admin/audit`

**Request Headers**:
- **Authorization**: Bearer `jwt_token`

**Response**:

- **200 OK**:
```json
{
    "error": false,
    "msg": "Audit fetched successfully",
    "url": null,
    "data": [
        {
            "id": int,
            "iss": string,
            "action": string,
            "for": int,
            "time": int
        }
    ]
}
```


### **Skins List**
`GET /api/admin/skins`

**Request Headers**:
- **Authorization**: Bearer `jwt_token`

**Response**:

- **200 OK**:
```json
{
    "error": false,
    "msg": "Audit fetched successfully",
    "url": null,
    "data": [
        {
            "id": int,
            "iss": string,
            "action": string,
            "for": int,
            "time": int
        }
    ]
}
```

### **Capes List**
`GET /api/admin/allcapes`

**Request Headers**:
- **Authorization**: Bearer `jwt_token`

**Response**:

- **200 OK**:
```json
{
    "error": false,
    "msg": "Audit fetched successfully",
    "url": null,
    "data": [
        {
            "id": int,
            "iss": string,
            "action": string,
            "for": int,
            "time": int
        }
    ]
}
```



## **Get skin/s**

### **GravitLauncher**
`GET /api/skin/gravitlauncher/:uuid`

**Response**:
```json
{
  "SKIN": {
    "url": "http://example.com/skins/Gravita.png",
    "digest": "SHA256 HASH (HEX)",
    "metadata": {
      "model": "slim"
    }
  },
  "CAPE": {
    "url": "http://example.com/cloaks/Gravita.png",
    "digest": "SHA256 HASH (HEX)"
  }
}
```

### **Gml**
- use standard response

### **Head**
`GET /api/skin/head/:uuid?size=100`

### **Body**
`GET /api/skin/body/:uuid?size=100`

### **Cloak**
`GET /api/skin/cloak/:idcloak?size=100`

**Response**:
- it will cloak file png

### **Standart request skins**

### Actual skin
**HERE UUID OF USER**
`GET /api/skin/standart/:uuid`

**Response**:
- it will return file png

### Actual cape

**HERE UUID OF USER**

`GET /api/skin/standart/cape/:uuid`

**Response**:
- it will return file png


### Skin by name

**HERE UUID OF FILE**

`GET /api/skin/public/:uuid`

### Cape by name

**HERE UUID OF FILE**

`GET /api/skin/public/cape/:uuid`


## **Service Endpoints**<Badge type="warning" text="WIP" />

#### **Find user account** <Badge type="warning" text="WIP" />
`POST /api/service/user`

**Request Headers**:
- **Authorization**: Bearer `ServiceApiToken`

**Request Body**:
```json
{
    "Discord_id": 0,       // Subject of the email
    "Playername": "string"        // The body content of the email
}
```

**Response**:

- **200 OK**:
```json
{
    "discord": {
        "username": "",
        "id": ""
    },
    "account": {
        "username": ""
        "uuid": ""
    }
}
```

#### **Give user permission**
`POST /api/service/permission`

**Request Headers**:
- **Authorization
- **ServiceApiToken**

**Request Body**:
```json
{
    "userid": 0,
    "permission": 1,
    "expired_at": 1731798166   // (if not provided, role will be permanent)
}
```

