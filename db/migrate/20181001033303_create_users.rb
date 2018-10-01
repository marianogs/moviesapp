class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :email
      t.string :password_digest
      t.string :api_token
      t.datetime :api_token_created_at

      t.timestamps
    end
  end
end
