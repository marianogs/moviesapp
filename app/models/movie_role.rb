class MovieRole < ApplicationRecord
  belongs_to :movie
  belongs_to :person
  enum name: [ :director, :actor, :producer  ]

  validates :name, inclusion: { in: names }
  alias_attribute :role_name, :name
end
