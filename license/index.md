# **API Documentation**

### **Standard Response Format**

All responses from the API will follow the standard format:

```json
{
    "error": bool,    // Indicates if there was an error (default is false)
    "msg": string,    // A message to describe the result or error
    "data": {}        // Data object containing the response data (can be empty)
}
```

### **licenses**
`POST /validate`

**Request Body**:
```json
{
    "license": "string",    // The license key to validate
    "hwid": "string",       // The hardware ID of the machine
}
```

- **200 OK**:
```json
{
    "error": false,
    "msg": "License validated successfully",
    "data": {
        "expireat": "string",    // The expiration date of the license
        "status": "string"       // The current status of the license
    }
}
```

- **40x Error**:
```json
{
    "error": true,
    "msg": "string"
}
```




### **Get information about license**

`GET /licese/:license`

- **200 OK**:
```json
{
    "error": false,
    "msg": "License information retrieved successfully",
    "data": {
        "license": "string",    // The license key
        "hwid": "string",       // The hardware ID of the machine
        "userid": "string",    // The owner ID of the license
        "sellerid": "string",   // The seller ID of the license
        "createdAt": "string",  // The creation date of the license
        "expiresAt": "string",   // The expiration date of the license
        "status": "string"     // The current status of the license
    }
}
```

- **40x Error**:
```json
{
    "error": true,
    "msg": "string"
}
```

### **Generate license**

``POST /license/generate``

**Request Body**:
```json
{
    "userid": "string",    // The owner ID of the license
    "expiresAt": "string"   // The expiration date of the license
}
```

- **200 OK**:
```json
{
    "error": false,
    "msg": "License generated successfully",
    "data": {
        "license": "string",    // The generated license key
        "expiresAt": "string"   // The expiration date of the license
    }
}
```