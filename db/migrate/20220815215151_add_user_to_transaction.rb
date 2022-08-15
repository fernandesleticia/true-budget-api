class AddUserToTransaction < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def change
    add_foreign_key :transactions, :users, validate: false
    validate_foreign_key :transactions, :users
  end
end
