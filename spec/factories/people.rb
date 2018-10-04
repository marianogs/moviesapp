FactoryBot.define do
  factory :person do
    first_name { "Clinton" }
    last_name { "Eastwood" }
    aliases { "Clint Eastwood" }

    factory :person_with_participations do
      after(:create) do |director|
        movie ||= create(:movie)
        director.add_movie(movie,:director)
        director.add_movie(movie,:actor)
        director.add_movie(movie,:producer)
      end
    end
    factory :director do
      after(:create) do |director|
        director.add_movie(create(:movie),:director)
      end
    end
  end
end
