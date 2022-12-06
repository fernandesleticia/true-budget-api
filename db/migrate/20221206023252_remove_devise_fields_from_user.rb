class RemoveDeviseFieldsFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_index :users, column: :email, unique: true
    remove_index :users, column: :reset_password_token, unique: true

    safety_assured { remove_column :users, :email }
    safety_assured { remove_column :users, :encrypted_password }
    safety_assured { remove_column :users, :reset_password_token }
    safety_assured { remove_column :users, :reset_password_sent_at }
    safety_assured { remove_column :users, :remember_created_at }
  end
end
