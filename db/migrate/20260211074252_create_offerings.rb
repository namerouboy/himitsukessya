class CreateOfferings < ActiveRecord::Migration[8.0]
# 供物
  def change
    create_table :offerings do |t|
      t.string :name, null: false
      t.integer :dangerous_level, default: 0

      t.timestamps
    end

    add_index :offerings, :name
    add_index :offerings, :dangerous_level
  end
end
