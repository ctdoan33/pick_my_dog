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

ActiveRecord::Schema.define(version: 20171026185323) do

  create_table "dog_apis", force: :cascade do |t|
    t.string   "breed"
    t.string   "size"
    t.string   "weight"
    t.string   "height"
    t.string   "life_span"
    t.string   "aka"
    t.string   "group"
    t.string   "origin"
    t.string   "role"
    t.text     "facts"
    t.text     "behavior"
    t.text     "health_concerns"
    t.string   "activity"
    t.string   "grooming"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "dogs", force: :cascade do |t|
    t.string   "breed"
    t.string   "size"
    t.string   "weight"
    t.string   "energy_needs"
    t.string   "grooming_per_month"
    t.string   "pet_compatibility"
    t.string   "feed_cost_weekly"
    t.text     "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "surveys", force: :cascade do |t|
    t.string   "breed"
    t.string   "size"
    t.string   "weight"
    t.string   "height"
    t.string   "life_span"
    t.string   "aka"
    t.string   "group"
    t.string   "origin"
    t.string   "role"
    t.text     "facts"
    t.text     "behavior"
    t.text     "health_concerns"
    t.string   "activity"
    t.string   "grooming"
    t.boolean  "pic_available"
    t.string   "pic_name"
    t.boolean  "friendly"
    t.boolean  "novice"
    t.string   "shelter_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
