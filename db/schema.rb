# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080516064148) do

  create_table "attachments", :force => true do |t|
    t.string   "attached_file_name"
    t.string   "attached_content_type"
    t.string   "attached_file_size"
    t.string   "name"
    t.text     "description"
    t.integer  "property_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "property_id"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.string   "event_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "memberships", :force => true do |t|
    t.integer "user_id"
    t.integer "context_id"
    t.integer "role_id"
    t.string  "context_type"
  end

  create_table "properties", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",      :default => true
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.text     "permissions"
    t.datetime "created_at"
    t.datetime "updated_at"
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
  end

end
