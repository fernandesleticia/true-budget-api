class CreateCategoryBudgets < ActiveRecord::Migration[6.1]
  def change
    create_table :category_budgets do |t|
      t.string :month
      t.float :budget
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
