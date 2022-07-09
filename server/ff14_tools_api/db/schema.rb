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

ActiveRecord::Schema[7.0].define(version: 2022_07_09_210104) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boss_loots", force: :cascade do |t|
    t.bigint "boss_id", null: false
    t.bigint "loot_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boss_id"], name: "index_boss_loots_on_boss_id"
    t.index ["loot_id"], name: "index_boss_loots_on_loot_id"
  end

  create_table "bosses", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "raid_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["raid_id"], name: "index_bosses_on_raid_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.bigint "static_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["static_id"], name: "index_characters_on_static_id"
  end

  create_table "gear_sets", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_gear_sets_on_character_id"
    t.index ["role_id"], name: "index_gear_sets_on_role_id"
  end

  create_table "gear_slots", force: :cascade do |t|
    t.bigint "gear_set_id", null: false
    t.string "slot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gear_set_id"], name: "index_gear_slots_on_gear_set_id"
  end

  create_table "gears", force: :cascade do |t|
    t.string "name"
    t.integer "ilvl"
    t.bigint "gear_slot_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gear_slot_id"], name: "index_gears_on_gear_slot_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_jobs_on_role_id"
  end

  create_table "loots", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "permissions", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "raids", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statics", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_statics_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "permission_id", null: false
    t.index ["permission_id"], name: "index_users_on_permission_id"
  end

  add_foreign_key "boss_loots", "bosses"
  add_foreign_key "boss_loots", "loots"
  add_foreign_key "bosses", "raids"
  add_foreign_key "characters", "statics"
  add_foreign_key "gear_sets", "characters"
  add_foreign_key "gear_sets", "roles"
  add_foreign_key "gear_slots", "gear_sets"
  add_foreign_key "gears", "gear_slots"
  add_foreign_key "jobs", "roles"
  add_foreign_key "statics", "users"
  add_foreign_key "users", "permissions"
end
