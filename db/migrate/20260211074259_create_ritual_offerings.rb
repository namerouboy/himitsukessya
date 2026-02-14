class CreateRitualOfferings < ActiveRecord::Migration[8.0]
  def change
    create_table :ritual_offerings do |t|
      t.references :ritual, null: false, foreign_key: true
      t.references :offering, null: false, foreign_key: true
      t.integer :quantity, default: 1

      t.timestamps
    end

    add_index :ritual_offerings, [:ritual_id, :offering_id], unique: true
  end
end
