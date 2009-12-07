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

ActiveRecord::Schema.define(:version => 20091121230350) do

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.integer  "leader"
    t.string   "url"
    t.integer  "status"
    t.integer  "species_id"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "owners", :force => true do |t|
    t.string   "username",   :null => false
    t.string   "email",      :null => false
    t.string   "url",        :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at"
  end

  add_index "owners", ["email"], :name => "email", :unique => true
  add_index "owners", ["username"], :name => "username", :unique => true

  create_table "pets", :force => true do |t|
    t.string   "regid"
    t.string   "name"
    t.integer  "age"
    t.string   "gender"
    t.string   "url"
    t.integer  "dam_id"
    t.integer  "sire_id"
    t.string   "genetics"
    t.text     "notes"
    t.integer  "group_id"
    t.integer  "group_birth_id"
    t.integer  "species_id"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "species", :force => true do |t|
    t.string   "name"
    t.string   "plural"
    t.string   "group"
    t.string   "prefix"
    t.string   "stages"
    t.integer  "max_members"
    t.integer  "max_females"
    t.integer  "max_males"
    t.integer  "min_females"
    t.integer  "min_males"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stages", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
