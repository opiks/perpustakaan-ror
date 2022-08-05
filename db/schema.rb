# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_08_05_075553) do
  create_table "book_categories", charset: "latin1", force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "genre_id", null: false
    t.timestamp "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", charset: "latin1", force: :cascade do |t|
    t.integer "location_id", null: false
    t.integer "type_id", null: false
    t.text "name", null: false
    t.text "description", null: false
    t.date "release_date", null: false
    t.integer "page_total", null: false
    t.text "publisher", null: false
    t.text "writer", null: false
    t.text "book_photo", null: false
    t.integer "book_total", null: false
    t.integer "book_total_remaining", null: false
    t.timestamp "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "currents", charset: "latin1", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.timestamp "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.timestamp "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", charset: "latin1", force: :cascade do |t|
    t.string "nik", null: false
    t.text "name", null: false
    t.string "email", null: false
    t.string "phone"
    t.text "place_birth"
    t.date "date_birth"
    t.string "blood_type"
    t.string "gender"
    t.string "religion"
    t.text "photo"
    t.text "photo_path"
    t.text "address"
    t.timestamp "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "unique_emails", unique: true
  end

  create_table "types", charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.timestamp "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "latin1", force: :cascade do |t|
    t.string "email", null: false
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
