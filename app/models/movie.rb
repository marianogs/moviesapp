class Movie < ApplicationRecord
  has_many :movie_roles
  has_many :people, through: :movie_roles
end
