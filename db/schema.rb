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

ActiveRecord::Schema.define(version: 20150624215559) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apiusers", force: :cascade do |t|
    t.string   "user_name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "image_url"
    t.string   "url"
    t.string   "uid"
    t.string   "provider"
    t.boolean  "is_provider"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "appointments", force: :cascade do |t|
    t.integer  "provider_id"
    t.integer  "user_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "location"
    t.boolean  "availability"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "summary"
    t.string   "event_id"
    t.string   "event_creator"
  end

  create_table "providerships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "provider_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tokens", force: :cascade do |t|
    t.string   "access_token"
    t.string   "refresh_token"
    t.datetime "expires_at"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "image_url"
    t.string   "url"
    t.string   "uid"
    t.string   "provider"
    t.boolean  "is_provider"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "token"
    t.string   "category"
    t.integer  "sign_ins"
  end

end
