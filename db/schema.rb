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

ActiveRecord::Schema.define(version: 2021_07_21_214810) do

  create_table "partners", force: :cascade do |t|
    t.boolean "acepted", default: false
    t.integer "user_id", null: false
    t.integer "training_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["training_id"], name: "index_partners_on_training_id"
    t.index ["user_id"], name: "index_partners_on_user_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "country"
    t.string "city"
    t.string "location", null: false
    t.boolean "active", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string "fullname", null: false
    t.string "adress"
    t.string "phone"
    t.string "social_media"
    t.string "image"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "rateds", force: :cascade do |t|
    t.integer "value"
    t.text "content"
    t.integer "user_id", null: false
    t.integer "training_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["training_id"], name: "index_rateds_on_training_id"
    t.index ["user_id"], name: "index_rateds_on_user_id"
  end

  create_table "trainings", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "date"
    t.integer "sport", default: 0
    t.integer "level", default: 0
    t.boolean "active", default: false
    t.integer "user_id", null: false
    t.integer "place_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["place_id"], name: "index_trainings_on_place_id"
    t.index ["user_id"], name: "index_trainings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "partners", "trainings"
  add_foreign_key "partners", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "rateds", "trainings"
  add_foreign_key "rateds", "users"
  add_foreign_key "trainings", "places"
  add_foreign_key "trainings", "users"
end
