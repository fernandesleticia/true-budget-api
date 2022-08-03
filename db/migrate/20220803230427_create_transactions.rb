class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.text :description
      t.float :amount
      t.date :transaction_date
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
