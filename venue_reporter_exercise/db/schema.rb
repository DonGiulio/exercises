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

ActiveRecord::Schema.define(version: 20_150_521_121_444) do
  create_table 'payments', force: :cascade do |t|
    t.float    'amount'
    t.datetime 'created_at',  null: false
    t.datetime 'updated_at',  null: false
    t.integer  'user_tab_id'
    t.datetime 'date'
  end

  create_table 'tabs', force: :cascade do |t|
    t.integer  'venue_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_index 'tabs', ['venue_id'], name: 'index_tabs_on_venue_id'

  create_table 'user_tabs', force: :cascade do |t|
    t.integer  'tab_id'
    t.integer  'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_index 'user_tabs', ['tab_id'], name: 'index_user_tabs_on_tab_id'
  add_index 'user_tabs', ['user_id'], name: 'index_user_tabs_on_user_id'

  create_table 'users', force: :cascade do |t|
    t.string   'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'venues', force: :cascade do |t|
    t.string   'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
