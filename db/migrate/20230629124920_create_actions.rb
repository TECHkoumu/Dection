class CreateActions < ActiveRecord::Migration[6.0]
  def change
    create_table :actions do |t|
      t.text :plan_example, null: false
      t.string :plan, null: false
      t.integer :target_score, null: false
      t.integer :current_score, null: false
      t.integer :total_score
      t.references :user, null: false, foreign_key: true
      t.references :emotion, null: false, foreign_key: true
      t.timestamps
    end
  end
end
