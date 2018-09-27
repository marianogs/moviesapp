FactoryBot.define do
  factory :person do
    first_name { "Clinton" }
    last_name { "Eastwood" }
    aliases { "Clint Eastwood" }

    factory :director do
      after(:create) do |director|
        director.add_movie(create(:movie),:director)
      end
    end
  end
end
