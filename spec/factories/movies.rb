FactoryBot.define do
  factory :movie do
    title "Grand Torino"
    release_year 2006

    factory :movie_with_people do
      after(:create) do |movie|
        movie.add_member(create(:person),:actor)
        movie.add_member(create(:person),:director)
        movie.add_member(create(:person),:producer)
      end
    end
  end
end
