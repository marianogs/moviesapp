# Movie Resources

    GET /api/v1/movies

## Description
Returns a list of movies

***

## Errors
None

***

## Example
**Request**

    https://evening-hollows-9577.herokuapp.com/api/v1/movies/

**Return** __shortened for example purpose__
``` json
[
  {
    "title": "Grand Torino",
    "release_year": 2006,
    "directors": [
      {
        "id": 2,
        "last_name": "Eastwood",
        "first_name": "Clinton",
        "aliases": "Clint Eastwood",
        "created_at": "2018-10-04T03:22:03.007Z",
        "updated_at": "2018-10-04T03:22:03.007Z"
      }
    ],
    "casting": [
      {
        "id": 2,
        "last_name": "Eastwood",
        "first_name": "Clinton",
        "aliases": "Clint Eastwood",
        "created_at": "2018-10-04T03:22:03.007Z",
        "updated_at": "2018-10-04T03:22:03.007Z"
      }
    ],
    "producers": [
      {
        "id": 2,
        "last_name": "Eastwood",
        "first_name": "Clinton",
        "aliases": "Clint Eastwood",
        "created_at": "2018-10-04T03:22:03.007Z",
        "updated_at": "2018-10-04T03:22:03.007Z"
      }
    ],
    "roman_release_year": "MMVI"
  }
]
```
