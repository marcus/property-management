# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080906220248) do

  create_table "attachments", :force => true do |t|
    t.string   "attached_file_name"
    t.string   "attached_content_type"
    t.string   "attached_file_size"
    t.string   "name"
    t.text     "description"
    t.integer  "property_id",           :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",              :limit => 11
  end

  create_table "companies", :force => true do |t|
    t.string  "name"
    t.text    "description"
    t.string  "email"
    t.string  "logo_file_name"
    t.string  "logo_content_type"
    t.integer "logo_file_size",    :limit => 11
    t.boolean "active"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "property_id", :limit => 11
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.string   "event_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id",    :limit => 11
  end

  create_table "memberships", :force => true do |t|
    t.integer "user_id",      :limit => 11
    t.integer "context_id",   :limit => 11
    t.integer "role_id",      :limit => 11
    t.string  "context_type"
  end

  create_table "properties", :force => true do |t|
    t.integer  "company_id",  :limit => 11
    t.string   "name"
    t.text     "description"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",                    :default => true
  end

  create_table "property_photos", :force => true do |t|
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.string   "photo_file_size"
    t.string   "name"
    t.text     "description"
    t.boolean  "featured"
    t.integer  "property_id",        :limit => 11
    t.integer  "position",           :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.text     "permissions"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "context"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "firstname"
    t.string   "lastname"
    t.boolean  "admin",                                   :default => false
    t.boolean  "status",                                  :default => true
    t.string   "color"
  end

end
