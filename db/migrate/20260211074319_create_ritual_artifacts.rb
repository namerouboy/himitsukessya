class CreateRitualArtifacts < ActiveRecord::Migration[8.0]
  def change
    create_table :ritual_artifacts do |t|
      t.references :ritual, null: false, foreign_key: true
      t.references :artifact, null: false, foreign_key: true

      t.timestamps
    end

    add_index :ritual_artifacts, [:ritual_id, :artifact_id], unique: true
  end
end
