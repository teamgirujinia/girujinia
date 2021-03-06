# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170803135021) do

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.text "content"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_comments_on_project_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entries", force: :cascade do |t|
    t.integer "project_id", null: false
    t.integer "user_id", null: false
    t.integer "owner_id", default: 0, null: false
    t.integer "status", default: 0, null: false
    t.string "pairs", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_entries_on_project_id"
    t.index ["user_id"], name: "index_entries_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "project_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_likes_on_project_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "picks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "create_title"
    t.string "period"
    t.integer "capacity"
    t.text "content"
    t.string "work_method"
    t.string "communication"
    t.string "job_first"
    t.string "job_secound"
    t.string "job_third"
    t.integer "user_id"
    t.string "lang1"
    t.string "lang2"
    t.string "lang3"
    t.string "dev_type"
    t.string "tool"
    t.integer "pv", default: 0, null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "socialstyles", force: :cascade do |t|
    t.text "name"
    t.text "characteristic"
    t.text "celebrities"
    t.text "weakness"
    t.text "compatibility"
    t.text "relationship"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "profile", default: "", null: false
    t.string "socialstyle", default: "", null: false
    t.string "rank", default: "G", null: false
    t.string "facebook", default: "", null: false
    t.string "twitter", default: "", null: false
    t.string "qiita", default: "", null: false
    t.string "teratail", default: "", null: false
    t.string "git", default: "", null: false
    t.string "blog", default: "", null: false
    t.string "address", default: "", null: false
    t.string "age", default: "", null: false
    t.integer "experience_value", default: 0, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.text "self_introduction"
    t.string "language_used"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
    t.index ["user_name"], name: "index_users_on_user_name", unique: true
  end

end
