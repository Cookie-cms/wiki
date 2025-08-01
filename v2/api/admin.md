
# **Admin Endpoints**

## **Users List**
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

## **Get Specific User**
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

## **Patch Specific User**
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

## **Patch Skin User**
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




## **Send Mail to All Users** <Badge type="warning" text="WIP" /> (Not planned yet)
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

## **Update User Role** <Badge type="warning" text="WIP" />


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

#### **Optional Expiry Field**:

If the `expired_at` field is not provided, the role update will be permanent for the user. The expiry date must always be in the future if it is included.


## **Add user cape** <Badge type="warning" text="WIP" />

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


## **Upload Cape**
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
- **Authorization**: Bearer `jwt_token`

**Request Body**:
```json
{
    "capeid": "uuid"
}
```

## **Get all users skins**
`GET /api/admin/users/skin/{uuid}`

**Request Headers**:
- **Authorization**: Bearer `jwt_token`

## **Audit List**
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


## **Skins List**
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

## **Capes List**
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