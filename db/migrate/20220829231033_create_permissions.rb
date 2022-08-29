class CreatePermissions < ActiveRecord::Migration[6.1]
  def change
    create_table :permissions do |t|
      t.string :action
      t.date :experation

      t.timestamps
    end
  end
end
