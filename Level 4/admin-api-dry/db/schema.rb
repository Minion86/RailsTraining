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

ActiveRecord::Schema.define(version: 2021_05_24_054551) do

  create_table "companies", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "employees", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.bigint "companies_id"
    t.bigint "project"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "country"
    t.bigint "role"
    t.datetime "deleted_at"
    t.index ["companies_id"], name: "index_employees_on_companies_id"
    t.index ["country"], name: "fk3_idx"
    t.index ["deleted_at"], name: "index_employees_on_deleted_at"
    t.index ["project"], name: "index_employees_on_tag_types_id"
    t.index ["role"], name: "fk4_idx"
  end

  create_table "tag_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "employees", "companies", column: "companies_id"
  add_foreign_key "employees", "tag_types", column: "country", name: "fk3"
  add_foreign_key "employees", "tag_types", column: "project", name: "fk2"
  add_foreign_key "employees", "tag_types", column: "role", name: "fk4"
end
