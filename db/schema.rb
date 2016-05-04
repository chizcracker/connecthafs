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

ActiveRecord::Schema.define(version: 20160504062522) do

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
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.datetime "verification_sent_at"
    t.datetime "verification_confirmed_at"
    t.datetime "account_confirmed_at"
  end

  add_foreign_key "user_educations", "groups", column: "education_id"
  add_foreign_key "user_educations", "users"
  add_foreign_key "user_works", "groups", column: "work_id"
  add_foreign_key "user_works", "users"
end
