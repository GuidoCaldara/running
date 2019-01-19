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

ActiveRecord::Schema.define(version: 2019_01_14_110303) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "question_id"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "race_id"
    t.boolean "organisation", default: false
    t.string "description"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["race_id"], name: "index_photos_on_race_id"
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "race_id"
    t.text "text"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["race_id"], name: "index_questions_on_race_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "race_distances", force: :cascade do |t|
    t.string "distance_type"
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "race_types", force: :cascade do |t|
    t.string "typology"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "races", force: :cascade do |t|
    t.string "name"
    t.string "race_type"
    t.integer "distance_km"
    t.string "location"
    t.string "description"
    t.string "distance_type"
    t.string "website"
    t.string "subscription_link"
    t.string "season"
    t.float "latitude"
    t.integer "elevation"
    t.float "longitude"
    t.integer "price"
    t.date "date"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_races_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "race_id"
    t.text "text"
    t.string "title"
    t.integer "path_rate"
    t.integer "organisation_rate"
    t.integer "overall_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["race_id"], name: "index_reviews_on_race_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "facebook_picture_url"
    t.string "first_name"
    t.string "last_name"
    t.string "token"
    t.datetime "token_expiry"
    t.string "username"
    t.string "location"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "photos", "races"
  add_foreign_key "photos", "users"
  add_foreign_key "questions", "races"
  add_foreign_key "questions", "users"
  add_foreign_key "races", "users"
  add_foreign_key "reviews", "races"
  add_foreign_key "reviews", "users"
end
