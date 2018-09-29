module HasParticipants
  extend ActiveSupport::Concern

  included do
    def self.has_participants(role_name)
      self.define_method(role_name) do
        Person.find(movie_roles.send(role_name.to_s.singularize).pluck(:person_id))
      end
    end
  end

  class_methods do
  end
end
