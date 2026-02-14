class CreateMembers < ActiveRecord::Migration[8.0]
  def change
    create_table :members do |t|
      t.references :cult, null: false, foreign_key: true
      t.string :name, null: false
      t.string :role, null: false
      t.date :joined_on

      t.timestamps
    end

    add_index :members, [:cult_id, :name]
    add_index :members, :name
  end
end
