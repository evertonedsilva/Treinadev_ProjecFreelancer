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

ActiveRecord::Schema.define(version: 2021_10_12_005711) do

  create_table "areas", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "employers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_employers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_employers_on_reset_password_token", unique: true
  end

  create_table "freelancers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "lancer_info_id"
    t.index ["email"], name: "index_freelancers_on_email", unique: true
    t.index ["lancer_info_id"], name: "index_freelancers_on_lancer_info_id"
    t.index ["reset_password_token"], name: "index_freelancers_on_reset_password_token", unique: true
  end

  create_table "lancer_infos", force: :cascade do |t|
    t.string "name"
    t.string "social"
    t.date "birth"
    t.string "adress"
    t.string "city"
    t.string "formation"
    t.string "description"
    t.text "experiences"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "freelancers", "lancer_infos"
end
