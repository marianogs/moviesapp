class MovieRole < ApplicationRecord
  belongs_to :movie
  belongs_to :person
  enum name: [ :director, :actor, :producer  ]
end
