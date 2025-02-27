
# **Get skin/s**

## **GravitLauncher**
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

## **Gml**
- use standard response

## **Head**
`GET /api/skin/head/:uuid?size=100`

## **Body**
`GET /api/skin/body/:uuid?size=100`

## **Cloak**
`GET /api/skin/cloak/:idcloak?size=100`

**Response**:
- it will cloak file png

## **Standart request skins**

## Actual skin
**HERE UUID OF USER**
`GET /api/skin/standart/:uuid`

**Response**:
- it will return file png

## Actual cape

**HERE UUID OF USER**

`GET /api/skin/standart/cape/:uuid`

**Response**:
- it will return file png


## Skin by name

**HERE UUID OF FILE**

`GET /api/skin/public/:uuid`

## Cape by name

**HERE UUID OF FILE**

`GET /api/skin/public/cape/:uuid`
