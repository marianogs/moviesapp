FactoryBot.define do
  factory :movie do
    title { "Grand Torino" }
    release_year { 2006 }

    factory :movie_with_members do
      after(:create) do |movie|
        movie.add_member(Person.first || create(:person),:actor)
        movie.add_member(Person.first || create(:person),:director)
        movie.add_member(Person.first || create(:person),:producer)
      end
    end
  end
end
