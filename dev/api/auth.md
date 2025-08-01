# **Authentication (Auth)**

## **Login**
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


## **Register**
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

## **Forget pass**
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

## step 2
`POST /api/auth/forgetpass/validate`

**Request Body**:
```json
{
    "code": "",       // User's email address
}
```

**Responses**:

- **204 No Content**


## step 3
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



## **Confirm Email**
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


## **Finish Registration**
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


## **Logout**
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