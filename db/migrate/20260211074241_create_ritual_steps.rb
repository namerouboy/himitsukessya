class CreateRitualSteps < ActiveRecord::Migration[8.0]
# 儀式の手順
  def change
    create_table :ritual_steps do |t|
      t.references :ritual, null: false, foreign_key: true
      t.integer :position, null: false
      t.text :description, null: false

      t.timestamps
    end

    add_index :ritual_steps, [:ritual_id, :position], unique: true
  end
end