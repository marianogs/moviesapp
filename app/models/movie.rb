class Movie < ApplicationRecord
  has_many :movie_roles
  has_many :people,-> { distinct.readonly }, through: :movie_roles do
    def with_role(role)
      where(movie_roles: {name: role })
    end
  end

  def directors
    people.with_role(:director)
  end

  def producers
    people.with_role(:producer)
  end

  def casting
    people.with_role(:actor)
  end

  validates_presence_of :title,:release_year

  def roman_release_year
    release_year.to_roman
  end

  def add_member(person,role)
    MovieRole.create(person_id: person.id, 
                     movie_id: self.id,
                     name: role.to_sym)
  end

  def to_json(options)
    super(:only => [:title,:release_year,:roman_release_year],
          methods: [ :directors,:casting,:producers,:roman_release_year ])
  end
end
