class CreateAuthTokens < ActiveRecord::Migration[6.1]
  def change
    create_table :auth_tokens do |t|
      t.string :jwt_token, null: false
      t.integer :expiration_time, null: false

      t.timestamps
    end
  end
end
