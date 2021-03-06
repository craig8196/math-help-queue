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

ActiveRecord::Schema.define(version: 20131219193937) do

  create_table "courses", force: true do |t|
    t.string   "title",      null: false
    t.string   "discipline", null: false
    t.integer  "number",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses_users", id: false, force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "course_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "courses_users", ["user_id", "course_id"], name: "index_courses_users_on_user_id_and_course_id"

  create_table "privileges", force: true do |t|
    t.string   "privilege_type", null: false
    t.integer  "section",        null: false
    t.integer  "course_id",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "privileges_users", id: false, force: true do |t|
    t.integer  "user_id",      null: false
    t.integer  "privilege_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "privileges_users", ["user_id", "privilege_id"], name: "index_privileges_users_on_user_id_and_privilege_id"

  create_table "requests", force: true do |t|
    t.boolean  "active",     null: false
    t.string   "chapter",    null: false
    t.string   "problem",    null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",                           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "privilege_type", default: "student", null: false
  end

  create_table "users_courses", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "course_id"
  end

end
