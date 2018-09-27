class AddPersonToMovieRole < ActiveRecord::Migration[5.2]
  def change
    add_reference :movie_roles, :person, foreign_key: true
  end
end
