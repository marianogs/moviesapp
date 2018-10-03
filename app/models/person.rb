class Person < ApplicationRecord
  #todo move aliases to another table or array

  validates_presence_of :first_name,:last_name,:aliases

  has_many :movie_roles, class_name: "MovieRole"

  has_many :movies, -> { distinct.readonly }, through: :movie_roles do
    def with_role(role)
      where(movie_roles: {name: role })
    end
  end

  def directions
    movies.with_role(:director)
  end

  def productions
    movies.with_role(:producer)
  end

  def actor
    movies.with_role(:actor)
  end

  def add_movie(movie,role)
    movie_roles.create(movie: movie, 
                       name: role.to_sym)
  end

end
