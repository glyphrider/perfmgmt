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

ActiveRecord::Schema.define(version: 2019_02_21_183351) do

  create_table "meetings", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "time"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "author_id"
    t.integer "subject_id"
    t.integer "engagement_score"
    t.text "engagement_notes"
    t.integer "collaboration_score"
    t.text "collaboration_notes"
    t.integer "curiosity_score"
    t.text "curiosity_notes"
    t.integer "comfort_zone_score"
    t.text "comfort_zone_notes"
    t.integer "teaming_score"
    t.text "teaming_notes"
    t.integer "dissertation_score"
    t.text "dissertation_notes"
    t.integer "concepts_score"
    t.text "concepts_notes"
    t.integer "practices_score"
    t.text "practices_notes"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "supervisor_id"
    t.string "github_id"
    t.boolean "admin", default: false
  end

end
