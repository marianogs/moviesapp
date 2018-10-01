class Movie < ApplicationRecord
  has_many :movie_roles
  has_many :people, through: :movie_roles
  include HasParticipants

  validates_presence_of :title,:release_year

  def add_member(person,role)
    movie_roles.create(person: person, 
                       name: role)
  end

  def to_json(options)
    super(:only => [:title,:release_year],
          methods: [ :directors,:casting,:producers ])
  end

  has_participants :actors
  has_participants :directors
  has_participants :producers

  alias :casting :actors 
end
