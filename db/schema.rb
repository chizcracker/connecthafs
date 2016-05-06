# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160506220202) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "groups", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_educations", force: :cascade do |t|
    t.date     "attended_from"
    t.date     "attended_to"
    t.string   "field"
    t.string   "grade"
    t.text     "activities"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.uuid     "user_id"
    t.uuid     "education_id"
  end

  add_index "user_educations", ["education_id"], name: "index_user_educations_on_education_id", using: :btree
  add_index "user_educations", ["user_id"], name: "index_user_educations_on_user_id", using: :btree

  create_table "user_works", force: :cascade do |t|
    t.string   "location"
    t.string   "team"
    t.string   "title"
    t.date     "work_start"
    t.date     "work_end"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.uuid     "user_id"
    t.uuid     "work_id"
  end

  add_index "user_works", ["user_id"], name: "index_user_works_on_user_id", using: :btree
  add_index "user_works", ["work_id"], name: "index_user_works_on_work_id", using: :btree

  create_table "users", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name"
    t.string   "phone_number"
    t.integer  "class_year"
    t.string   "address"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.datetime "verification_sent_at"
    t.datetime "verification_confirmed_at"
    t.datetime "account_confirmed_at"
    t.string   "email",                     default: "", null: false
    t.string   "encrypted_password",        default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",             default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",           default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  add_foreign_key "user_educations", "groups", column: "education_id"
  add_foreign_key "user_educations", "users"
  add_foreign_key "user_works", "groups", column: "work_id"
  add_foreign_key "user_works", "users"
end
