class CreateMonthResumes < ActiveRecord::Migration[6.1]
  def change
    create_table :month_resumes do |t|
      t.string :month
      t.string :year
      t.float :initial_budget
      t.float :final_budget
      t.float :percent_economy

      t.timestamps
    end
  end
end
