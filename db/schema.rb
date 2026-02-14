# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2026_02_11_074326) do
  create_table "artifacts", force: :cascade do |t|
    t.string "name", null: false
    t.integer "power_level", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_artifacts_on_name"
    t.index ["power_level"], name: "index_artifacts_on_power_level"
  end

  create_table "chants", force: :cascade do |t|
    t.integer "ritual_id", null: false
    t.string "language"
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ritual_id"], name: "index_chants_on_ritual_id"
  end

  create_table "cults", force: :cascade do |t|
    t.string "name", null: false
    t.date "founded_on"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_cults_on_name"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name", null: false
    t.string "address"
    t.boolean "indoor", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["indoor"], name: "index_locations_on_indoor"
    t.index ["name"], name: "index_locations_on_name"
  end

  create_table "members", force: :cascade do |t|
    t.integer "cult_id", null: false
    t.string "name", null: false
    t.string "role", null: false
    t.date "joined_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cult_id", "name"], name: "index_members_on_cult_id_and_name"
    t.index ["cult_id"], name: "index_members_on_cult_id"
    t.index ["name"], name: "index_members_on_name"
  end

  create_table "offerings", force: :cascade do |t|
    t.string "name", null: false
    t.integer "dangerous_level", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dangerous_level"], name: "index_offerings_on_dangerous_level"
    t.index ["name"], name: "index_offerings_on_name"
  end

  create_table "ritual_artifacts", force: :cascade do |t|
    t.integer "ritual_id", null: false
    t.integer "artifact_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artifact_id"], name: "index_ritual_artifacts_on_artifact_id"
    t.index ["ritual_id", "artifact_id"], name: "index_ritual_artifacts_on_ritual_id_and_artifact_id", unique: true
    t.index ["ritual_id"], name: "index_ritual_artifacts_on_ritual_id"
  end

  create_table "ritual_offerings", force: :cascade do |t|
    t.integer "ritual_id", null: false
    t.integer "offering_id", null: false
    t.integer "quantity", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offering_id"], name: "index_ritual_offerings_on_offering_id"
    t.index ["ritual_id", "offering_id"], name: "index_ritual_offerings_on_ritual_id_and_offering_id", unique: true
    t.index ["ritual_id"], name: "index_ritual_offerings_on_ritual_id"
  end

  create_table "ritual_steps", force: :cascade do |t|
    t.integer "ritual_id", null: false
    t.integer "position", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ritual_id", "position"], name: "index_ritual_steps_on_ritual_id_and_position", unique: true
    t.index ["ritual_id"], name: "index_ritual_steps_on_ritual_id"
  end

  create_table "rituals", force: :cascade do |t|
    t.integer "cult_id", null: false
    t.integer "location_id", null: false
    t.string "title", null: false
    t.datetime "scheduled_at"
    t.string "status", default: "draft", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cult_id", "location_id"], name: "index_rituals_on_cult_id_and_location_id"
    t.index ["cult_id"], name: "index_rituals_on_cult_id"
    t.index ["location_id"], name: "index_rituals_on_location_id"
    t.index ["scheduled_at"], name: "index_rituals_on_scheduled_at"
    t.index ["title"], name: "index_rituals_on_title"
  end

  add_foreign_key "chants", "rituals"
  add_foreign_key "members", "cults"
  add_foreign_key "ritual_artifacts", "artifacts"
  add_foreign_key "ritual_artifacts", "rituals"
  add_foreign_key "ritual_offerings", "offerings"
  add_foreign_key "ritual_offerings", "rituals"
  add_foreign_key "ritual_steps", "rituals"
  add_foreign_key "rituals", "cults"
  add_foreign_key "rituals", "locations"
end
