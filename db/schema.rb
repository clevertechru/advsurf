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

ActiveRecord::Schema.define(:version => 20130615112428) do

  create_table "operator1s", :force => true do |t|
    t.integer  "operator_id"
    t.string   "file_name"
    t.float    "file_size"
    t.string   "file_md5"
    t.integer  "file_records"
    t.string   "file_comment"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "operator_newses", :force => true do |t|
    t.integer  "operator_id"
    t.string   "file_name"
    t.float    "file_size"
    t.string   "file_md5"
    t.integer  "file_records"
    t.string   "file_comment"
    t.text     "file_attach"
    t.text     "upload"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "upload_file_name"
    t.string   "upload_content_type"
    t.integer  "upload_file_size"
    t.datetime "upload_updated_at"
  end

  create_table "operator_volgobalts", :force => true do |t|
    t.integer  "operator_id"
    t.string   "file_name"
    t.float    "file_size"
    t.string   "file_md5"
    t.integer  "file_records"
    t.string   "file_comment"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "operators", :force => true do |t|
    t.string   "title"
    t.string   "comment"
    t.string   "site_link"
    t.integer  "rating"
    t.string   "controller_path"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "places", :force => true do |t|
    t.integer  "operator_id"
    t.string   "address"
    t.string   "address_orig"
    t.string   "side"
    t.string   "region"
    t.string   "gid"
    t.boolean  "illumination"
    t.float    "grp"
    t.float    "ots"
    t.string   "type"
    t.float    "price"
    t.boolean  "nds"
    t.string   "photo"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "year_current_1"
    t.integer  "year_current_2"
    t.integer  "year_current_3"
    t.integer  "year_current_4"
    t.integer  "year_current_5"
    t.integer  "year_current_6"
    t.integer  "year_current_7"
    t.integer  "year_current_8"
    t.integer  "year_current_9"
    t.integer  "year_current_10"
    t.integer  "year_current_11"
    t.integer  "year_current_12"
    t.integer  "year_next_1"
    t.integer  "year_next_2"
    t.integer  "year_next_3"
    t.integer  "year_next_4"
    t.integer  "year_next_5"
    t.integer  "year_next_6"
    t.integer  "year_next_7"
    t.integer  "year_next_8"
    t.integer  "year_next_9"
    t.integer  "year_next_10"
    t.integer  "year_next_11"
    t.integer  "year_next_12"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
