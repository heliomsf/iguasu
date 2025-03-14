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

ActiveRecord::Schema[7.0].define(version: 2025_03_08_173457) do
  create_table "entries", force: :cascade do |t|
    t.text "pdfUrl", null: false
    t.text "ref", null: false
    t.text "author"
    t.text "recipient", null: false
    t.text "title"
    t.integer "placeId", null: false
    t.text "placeName"
    t.datetime "date1"
    t.datetime "date2"
    t.datetime "date3"
    t.text "document"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "places", force: :cascade do |t|
    t.text "name", null: false
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "entries", "places", column: "placeId", on_update: :cascade, on_delete: :restrict
end
