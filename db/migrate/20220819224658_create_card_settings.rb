class CreateCardSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :card_settings do |t|
      t.references :user_preference, null: false, foreign_key: true

      t.timestamps
    end
  end
end
