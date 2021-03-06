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

ActiveRecord::Schema.define(version: 2021_10_28_004718) do

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
    t.index ["email"], name: "index_freelancers_on_email", unique: true
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
    t.integer "area_id", null: false
    t.integer "freelancer_id", null: false
    t.index ["area_id"], name: "index_lancer_infos_on_area_id"
    t.index ["freelancer_id"], name: "index_lancer_infos_on_freelancer_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.decimal "value_hour"
    t.date "start_date"
    t.date "end_date"
    t.text "employer_feed"
    t.integer "squad_num"
    t.string "adress"
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 5
    t.integer "employer_id", null: false
    t.date "limit_proposal"
    t.integer "area_id"
    t.boolean "remote"
    t.index ["area_id"], name: "index_projects_on_area_id"
    t.index ["employer_id"], name: "index_projects_on_employer_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "project_id", null: false
    t.integer "freelancer_id", null: false
    t.integer "status", default: 5
    t.text "refused_justify"
    t.text "final_feed"
    t.text "message"
    t.date "expected_end"
    t.integer "claim_hour"
    t.integer "week_availability"
    t.date "submit_date"
    t.index ["freelancer_id"], name: "index_proposals_on_freelancer_id"
    t.index ["project_id"], name: "index_proposals_on_project_id"
  end

  add_foreign_key "lancer_infos", "areas"
  add_foreign_key "lancer_infos", "freelancers"
  add_foreign_key "projects", "areas"
  add_foreign_key "projects", "employers"
  add_foreign_key "proposals", "freelancers"
  add_foreign_key "proposals", "projects"
end
