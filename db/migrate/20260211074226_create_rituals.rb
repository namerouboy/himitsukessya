class CreateRituals < ActiveRecord::Migration[8.0]
# 儀式
  def change
    create_table :rituals do |t|
      t.references :cult, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true
      t.string :title, null:false
      t.datetime :scheduled_at
      t.string :status, null: false, default: "draft"

      t.timestamps
    end

    add_index :rituals, [:cult_id, :location_id]
    add_index :rituals, :title
    add_index :rituals, :scheduled_at
  end
end
