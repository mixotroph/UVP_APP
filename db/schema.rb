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

ActiveRecord::Schema.define(version: 20150222152729) do

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "choreographies", force: true do |t|
    t.string   "title"
    t.string   "goal"
    t.string   "features"
    t.string   "example"
    t.text     "steps"
    t.text     "body"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "microposts", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "row_order"
    t.integer  "swimming_order"
    t.string   "title",          default: ""
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",             default: false
    t.string   "surname"
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "uvp_rows", force: true do |t|
    t.text     "lactivity",    default: ""
    t.integer  "micropost_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "row_order"
    t.integer  "uvp_order"
    t.text     "phase",        default: ""
    t.text     "sactivity",    default: ""
    t.text     "medium",       default: ""
    t.text     "zeit",         default: ""
    t.string   "titel",        default: ""
  end

  add_index "uvp_rows", ["micropost_id", "created_at"], name: "index_uvp_rows_on_micropost_id_and_created_at"

  create_table "uvps", force: true do |t|
    t.string   "title"
    t.text     "preface"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "abstract"
  end

  add_index "uvps", ["user_id", "created_at"], name: "index_uvps_on_user_id_and_created_at"

end
