# MoviesApp [![Build Status](https://travis-ci.org/marianogs/moviesapp.svg?branch=master)](https://travis-ci.org/marianogs/moviesapp)


### Endpoints

#### Movies Resources

* `GET api/v1/movies`
* `POST api/v1/movies`
* `GET api/v1/movies/:id`
* `PUT api/v1/movies/:id`
* `DELETE api/v1/movies/:id`

#### Roles Resources

* `POST api/v1/movies/actor/:person_id`
* `DELETE api/v1/movies/:id/actor/:person_id`

* `POST api/v1/movies/director/:person_id`
* `DELETE api/v1/movies/:id/director/:person_id`

* `POST api/v1/movies/producer/:person_id`
* `DELETE api/v1/movies/:id/producer/:person_id`

### People Resources

* `GET api/v1/people`
* `POST api/v1/people`
* `GET api/v1/people/:id`
* `PUT api/v1/people/:id`
* `DELETE api/v1/people/:id`

#### UserTokens

* `POST user_token`
