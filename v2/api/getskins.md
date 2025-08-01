
# **Get skin/s**

## **GravitLauncher** (Better use full authentication service)
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

## **Head**

**Request:**
```http
GET /api/skin/head/:uuid?size=100&type=skin
```

**Query Parameters:**
- `size` (optional, default: `100`) - Image size in pixels.
- `type` (optional, default: `skin`) - Available values:
  - `skin`: Returns the skin texture file.
  - `player`: Returns the actual player model with the skin applied.

**Response:**
- PNG file of the requested head texture.

## **Body**
**Request:**
```http
GET /api/skin/body/:uuid?size=100&type=skin
```

**Query Parameters:**
- `size` (optional, default: `100`) - Image size in pixels.
- `type` (optional, default: `skin`) - Available values:
  - `skin`: Returns the skin texture file.
  - `player`: Returns the actual player model with the skin applied.

**Response:**
- PNG file of the requested body texture.

## **Cloak**

```http
GET /api/skin/cloak/:idcloak?size=100&type=skin
```

**Query Parameters:**
- `size` (optional, default: `100`) - Image size in pixels.
- `type` (optional, default: `skin`) - Available values:
  - `skin`: Returns the cloak texture file.
  - `player`: Returns the actual player model with the cloak applied.

**Response:**
- PNG file of the requested cloak texture.


## skin file
```http
GET /api/skin/cloak/:uuid?type=skin
```

**Query Parameters:**
- `type` (optional, default: `skin`) - Available values:
  - `skin`: Returns the cloak texture file.
  - `player`: Returns the actual player model with the cloak applied.


**Response:**
- PNG file of the requested skin texture.

## cape file

```http
GET /api/skin/standart/cape/:uuid?type=skin
```

**Query Parameters:**
- `type` (optional, default: `skin`) - Available values:
  - `skin`: Returns the cloak texture file.
  - `player`: Returns the actual player model with the cloak applied.


**Response:**
- PNG file of the requested skin texture.

