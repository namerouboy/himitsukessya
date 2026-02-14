class CreateChants < ActiveRecord::Migration[8.0]
# 詠唱
  def change
    create_table :chants do |t|
      t.references :ritual, null: false, foreign_key: true
      t.string :language
      t.text :content, null: false

      t.timestamps
    end
  end
end
