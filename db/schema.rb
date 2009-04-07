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

ActiveRecord::Schema.define(:version => 20090326120345) do

  create_table "activists", :force => true do |t|
    t.integer  "sex",        :limit => 1, :default => 0
    t.string   "title"
    t.string   "forename"
    t.string   "surename"
    t.string   "street"
    t.string   "zipcode"
    t.string   "city"
    t.string   "email"
    t.string   "job"
    t.boolean  "newsletter"
    t.datetime "created_at"
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

end
