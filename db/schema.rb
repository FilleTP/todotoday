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

ActiveRecord::Schema[7.0].define(version: 2023_05_22_205631) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "invitations", force: :cascade do |t|
    t.bigint "inviter_id", null: false
    t.bigint "invitee_id", null: false
    t.bigint "task_list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token"
    t.index ["invitee_id"], name: "index_invitations_on_invitee_id"
    t.index ["inviter_id"], name: "index_invitations_on_inviter_id"
    t.index ["task_list_id"], name: "index_invitations_on_task_list_id"
  end

  create_table "levels", force: :cascade do |t|
    t.string "name"
    t.integer "min_points"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profile_task_lists", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "task_list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_profile_task_lists_on_profile_id"
    t.index ["task_list_id"], name: "index_profile_task_lists_on_task_list_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "nickname"
    t.integer "points", default: 0
    t.integer "streak"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "level_id"
    t.index ["level_id"], name: "index_profiles_on_level_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "task_categories", force: :cascade do |t|
    t.string "description"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "task_lists", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "completed", default: false
    t.integer "priority", default: 0
    t.integer "points", default: 10
    t.bigint "task_list_id", null: false
    t.bigint "task_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_category_id"], name: "index_tasks_on_task_category_id"
    t.index ["task_list_id"], name: "index_tasks_on_task_list_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "invitations", "profiles", column: "invitee_id"
  add_foreign_key "invitations", "profiles", column: "inviter_id"
  add_foreign_key "invitations", "task_lists"
  add_foreign_key "profile_task_lists", "profiles"
  add_foreign_key "profile_task_lists", "task_lists"
  add_foreign_key "profiles", "levels"
  add_foreign_key "profiles", "users"
  add_foreign_key "tasks", "task_categories"
  add_foreign_key "tasks", "task_lists"
end
