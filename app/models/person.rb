class Person < ApplicationRecord
  validates_presence_of :first_name,:last_name,:aliases

  has_many :movie_roles, class_name: "MovieRole"
  has_many :movies, -> { distinct.readonly }, through: :movie_roles

  def add_movie(movie,role)
    movie_roles.create(movie: movie, 
                       name: role.to_sym)
  end

  scope :director, -> { joins(:movie_roles).where(movie_roles: { name: 'director' } ) }
  scope :actor, -> { joins(:movie_roles).where(movie_roles: { name: 'director' } ) }
  scope :producer, -> { joins(:movie_roles).where(movie_roles: { name: 'director' } ) }

end
