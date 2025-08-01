# **API Documentation**

## **Standard Response Format**

All responses from the API will follow the standard format:

```json
{
    "msg": string,    // A message to describe the result or error (can be empty)
    "url": string,    // A URL for redirection, default is null (can be empty)
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