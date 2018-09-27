class CreateMovieRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_roles do |t|
      t.string :name
      t.timestamps
    end
  end
end
