class CreateEmotions < ActiveRecord::Migration[6.0]
  def change
    create_table :emotions do |t|
      t.string :event_occurred, null: false
      t.text :specific_details, null: false
      t.integer :unpleasant_index, null: false
      t.integer :category_id, null: false, default: 0
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
