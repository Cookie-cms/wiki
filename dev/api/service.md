# **Service Endpoints**<Badge type="warning" text="WIP" />

**Request Headers**:
- **ServiceApiToken**

## **Find user account** <Badge type="warning" text="WIP" />
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

## **Give user permission** <Badge type="warning" text="WIP" />
`POST /api/service/permission`



**Request Body**:
```json
{
    "userid": 0,
    "permission": 1,
    "expired_at": 1731798166   // (if not provided, role will be permanent)
}
```

