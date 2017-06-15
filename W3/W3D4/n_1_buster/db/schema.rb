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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161130182442) do

  create_table "albums", force: :cascade do |t|
    t.string   "title"
    t.integer  "artist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "artists", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "buses", force: :cascade do |t|
    t.string   "model"
    t.integer  "route_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "drivers", force: :cascade do |t|
    t.string   "name"
    t.integer  "bus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gardeners", force: :cascade do |t|
    t.string  "name"
    t.integer "house_id"
  end

  create_table "houses", force: :cascade do |t|
    t.string "address"
  end

  create_table "plants", force: :cascade do |t|
    t.integer "gardener_id"
    t.string  "species"
  end

  create_table "routes", force: :cascade do |t|
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seeds", force: :cascade do |t|
    t.integer "count"
    t.integer "plant_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.string   "title"
    t.integer  "album_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
