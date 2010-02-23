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

ActiveRecord::Schema.define(:version => 20100222194154) do

  create_table "meals", :force => true do |t|
    t.date     "eaten_on",    :null => false
    t.string   "description", :null => false
    t.integer  "kind",        :null => false
    t.integer  "kcal"
    t.integer  "fat"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "week_id"
  end

  add_index "meals", ["eaten_on"], :name => "index_meals_on_eaten_on"
  add_index "meals", ["kind"], :name => "index_meals_on_kind"

  create_table "readings", :force => true do |t|
    t.date     "taken_on"
    t.integer  "weight_in_grams"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "week_id"
  end

  create_table "weeks", :force => true do |t|
    t.date     "begins",        :null => false
    t.integer  "points_target"
    t.integer  "points_used"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
