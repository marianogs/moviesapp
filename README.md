# MoviesApp [![Build Status](https://travis-ci.org/marianogs/moviesapp.svg?branch=master)](https://travis-ci.org/marianogs/moviesapp)

`https://evening-hollows-9577.herokuapp.com/`


### Endpoints

#### Movies Resources

* `GET api/v1/movies`
* `POST api/v1/movies`
* `GET api/v1/movies/:id`
* `PUT api/v1/movies/:id`
* `DELETE api/v1/movies/:id`

#### Movie members resources
* `POST api/v1/movies/:role_name/:person_id`
  - `POST api/v1/movies/casting/:person_id`
  - `POST api/v1/movies/directors/:person_id`
  - `POST api/v1/movies/producers/:person_id`

* `DELETE api/v1/movies/:role_name/:person_id`

  - `DELETE api/v1/movies/:id/casting/:person_id`
  - `DELETE api/v1/movies/:id/directors/:person_id`=
  - `DELETE api/v1/movies/:id/producers/:person_id`

### People Resources

* `GET api/v1/people`
* `POST api/v1/people`
* `GET api/v1/people/:id`
* `PUT api/v1/people/:id`
* `DELETE api/v1/people/:id`

#### UserTokens

* `POST api/v1/user_token/`
