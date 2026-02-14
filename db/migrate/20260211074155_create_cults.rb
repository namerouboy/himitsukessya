class CreateCults < ActiveRecord::Migration[8.0]
# 秘密結社テーブル
  def change
    create_table :cults do |t|
      t.string :name, null: false
      t.date :founded_on # 設立日
      t.text :description

      t.timestamps
    end

    add_index :cults, :name
  end
end
