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

ActiveRecord::Schema.define(:version => 20100822140538) do

  create_table "activists", :force => true do |t|
    t.string   "forename"
    t.string   "surename"
    t.string   "street"
    t.string   "zipcode"
    t.string   "city"
    t.string   "email"
    t.boolean  "newsletter"
    t.datetime "created_at"
  end

  create_table "newsletters", :force => true do |t|
    t.string   "subject"
    t.text     "content"
    t.datetime "send_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "cached_slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "homepage",    :default => false
    t.boolean  "show_title",  :default => true
  end

  create_table "posts", :force => true do |t|
    t.string   "location"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "protest_mails", :force => true do |t|
    t.string   "subject"
    t.text     "body"
    t.integer  "activist_id"
    t.string   "token"
    t.datetime "send_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

end
