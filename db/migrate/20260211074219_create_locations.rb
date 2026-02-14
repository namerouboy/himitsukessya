class CreateLocations < ActiveRecord::Migration[8.0]
# 儀式会場
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.string :address
      t.boolean :indoor, default: true # 室内かどうか？

      t.timestamps
    end

    add_index :locations, :name
    add_index :locations, :indoor
  end
end
