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

ActiveRecord::Schema[7.0].define(version: 2024_09_08_181259) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "absences", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "lesson_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_taken", default: false
    t.index ["lesson_id"], name: "index_absences_on_lesson_id"
    t.index ["user_id"], name: "index_absences_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "level"
    t.string "location"
    t.string "day"
    t.time "hour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "info"
    t.string "teacher"
    t.integer "minute"
  end

  create_table "lessons", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "occurs_on"
    t.string "location"
    t.index ["course_id"], name: "index_lessons_on_course_id"
  end

  create_table "places", force: :cascade do |t|
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "lesson_id"
    t.index ["lesson_id"], name: "index_places_on_lesson_id"
  end

  create_table "rattrapages", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "lesson_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_rattrapages_on_lesson_id"
    t.index ["user_id"], name: "index_rattrapages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "course_id"
    t.string "first_name"
    t.string "last_name"
    t.string "status"
    t.index ["course_id"], name: "index_users_on_course_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "absences", "lessons"
  add_foreign_key "absences", "users"
  add_foreign_key "lessons", "courses"
  add_foreign_key "places", "lessons"
  add_foreign_key "rattrapages", "lessons"
  add_foreign_key "rattrapages", "users"
  add_foreign_key "users", "courses"
end
