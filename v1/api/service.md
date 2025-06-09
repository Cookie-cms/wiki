# **Service Endpoints**

**Request Headers**:
- **ServiceApiToken**

## **Find user account**
`POST /api/service/user`

**Request Headers**:
- **Authorization**: Bearer `ServiceApiToken`

**Request Body**:
```json
{
    "DiscordId": "0",
    "Playername": "string"
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
        "username": "",
        "uuid": ""
    }
}
```

## **Give user permission** <Badge type="warning" text="WIP" />
`POST /api/service/permission`



**Request Body**:
```json
{
    "userid": "0",
    "permission": 1,
    "expired_at": 1731798166   // (if not provided, role will be permanent)
}
```

