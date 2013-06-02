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

ActiveRecord::Schema.define(:version => 20130602014729) do

  create_table "sponsors", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.decimal  "current_balance"
    t.date     "date_paid"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "postcode"
  end

  create_table "students", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "grade"
    t.string   "institute"
    t.string   "course"
    t.date     "dob"
    t.string   "sex"
    t.integer  "num_year"
    t.date     "program_start"
    t.date     "program_end"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "sponsor_id"
  end

end
