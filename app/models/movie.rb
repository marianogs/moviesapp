class Movie < ApplicationRecord
  has_many :movie_roles
  has_many :people, through: :movie_roles

  def add_member(person,role)
    movie_roles.create(person: person, 
                       name: role)
  end

  def casting
    Person.find(movie_roles.actor.pluck(:person_id))
  end

  def directors
    Person.find(movie_roles.director.pluck(:person_id))
  end

  def producers
    Person.find(movie_roles.producer.pluck(:person_id))
  end
end
