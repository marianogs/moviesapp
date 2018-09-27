class AddMovieToMovieRole < ActiveRecord::Migration[5.2]
  def change
    add_reference :movie_roles, :movie, foreign_key: true
  end
end
