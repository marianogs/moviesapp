module HasParticipants
  extend ActiveSupport::Concern

  included do
    def self.has_participants(role_name)
      self.define_method(role_name) do
        people.joins(:movie_roles).where('movie_roles': {name: role_name.to_s.singularize } )
      end
    end
  end
end
