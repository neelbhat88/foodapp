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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130216053610) do

  create_table "fridges", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "fridges_users", :id => false, :force => true do |t|
    t.integer "fridge_id"
    t.integer "user_id"
  end

  create_table "global_food_items", :force => true do |t|
    t.string   "name"
    t.string   "category"
    t.integer  "avgexpirationdays"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "user_food_items", :force => true do |t|
    t.integer  "global_food_item_id"
    t.integer  "fridge_id"
    t.date     "datebought"
    t.date     "usebydate"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "status",              :default => 0
    t.date     "removedate"
    t.decimal  "price"
    t.string   "name"
  end

  add_index "user_food_items", ["fridge_id"], :name => "index_user_food_items_on_user_id"
  add_index "user_food_items", ["global_food_item_id"], :name => "index_user_food_items_on_global_food_item_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
