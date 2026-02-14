class CreateArtifacts < ActiveRecord::Migration[8.0]
# 呪物
  def change
    create_table :artifacts do |t|
      t.string :name, null: false
      t.integer :power_level, null:false

      t.timestamps
    end

    add_index :artifacts, :name
    add_index :artifacts, :power_level
  end
end
