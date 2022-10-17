class AddUserToTransaction < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def change
    add_reference :transactions, :user, index: {algorithm: :concurrently}
  end
end
