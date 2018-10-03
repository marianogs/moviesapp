FactoryBot.define do
  factory :movie_role do
    name 'director' 
    person { create :person }
    movie { create :movie }
  end
end
