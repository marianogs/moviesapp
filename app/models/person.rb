class Person < ApplicationRecord
  validates_presence_of :first_name,:last_name,:aliases

  has_many :movie_roles, class_name: "MovieRole"
  has_many :movies, through: :movie_roles

  def add_movie(movie,role)
    movie_roles.create(movie: movie, 
                       name: role)
  end
end
