# Movie Resources

    POST photos

## Description
Create a new Movie 

***

## Requires authentication
`headers: 'TOKEN'= 'exampletoken'`

***

## Parameters
Essential information:

- **title** — Title of the Movie
- **release_year** — Release year for the movie


***

## Errors
All known errors cause the resource to return HTTP error code header together with a JSON array containing at least 'status' and 'error' keys describing the source of error.

- **422 Unprocessable Entity** — The system had trouble saving the record. You may retry again.

***

## Example
**Request**

```bash
    curl https://evening-hollows-9577.herokuapp.com/api/v1/movies/ -H "Content-Type: application/json" -H 'TOKEN: secret'  -d '{
      "title": "Grand Torino", 
      "release_year": 2006
   }'
```
    


**Return**
``` json
{
  "title": "Grand Torino",
  "release_year": 2006,
  "directors": [
  ],
  "casting": [
  ],
  "producers": [
  ],
  "roman_release_year": "MMVI"
}
```

