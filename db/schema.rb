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

ActiveRecord::Schema.define(version: 20160124034216) do

  create_table "artists", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.string   "profile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ecomments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ecomments", ["event_id"], name: "index_ecomments_on_event_id"
  add_index "ecomments", ["user_id", "event_id", "created_at"], name: "index_ecomments_on_user_id_and_event_id_and_created_at"
  add_index "ecomments", ["user_id"], name: "index_ecomments_on_user_id"

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "date"
    t.string   "address"
    t.string   "about"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.string   "thumbnail"
    t.string   "ytid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "location"
    t.string   "profile"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

  create_table "videos", force: :cascade do |t|
    t.string   "title"
    t.string   "thumbnail"
    t.string   "ytid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
