# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_17_012701) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "floor_galleries", force: :cascade do |t|
    t.bigint "floor_id", null: false
    t.bigint "gallery_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["floor_id"], name: "index_floor_galleries_on_floor_id"
    t.index ["gallery_id"], name: "index_floor_galleries_on_gallery_id"
  end

  create_table "floors", force: :cascade do |t|
    t.integer "number"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "galleries", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "theme"
    t.string "description"
    t.integer "ham_id"
    t.index ["user_id"], name: "index_galleries_on_user_id"
  end

  create_table "gallery_paintings", force: :cascade do |t|
    t.bigint "gallery_id", null: false
    t.bigint "painting_id", null: false
    t.string "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gallery_id"], name: "index_gallery_paintings_on_gallery_id"
    t.index ["painting_id"], name: "index_gallery_paintings_on_painting_id"
  end

  create_table "paintings", force: :cascade do |t|
    t.string "blurb"
    t.string "artist"
    t.string "museum_location"
    t.string "period"
    t.string "image_location"
    t.string "style"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "portrait"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "floor_galleries", "floors"
  add_foreign_key "floor_galleries", "galleries"
  add_foreign_key "galleries", "users"
  add_foreign_key "gallery_paintings", "galleries"
  add_foreign_key "gallery_paintings", "paintings"
end
