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

ActiveRecord::Schema.define(version: 20160612084931) do

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "site_url"
    t.datetime "started_at", null: false
    t.datetime "ended_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_companies_on_name", unique: true
  end

  create_table "contacts", force: :cascade do |t|
    t.string "label", null: false
    t.string "url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "value"
    t.index ["url"], name: "index_contacts_on_url", unique: true
  end

  create_table "pages", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "role"
    t.integer "company_id"
    t.index ["company_id"], name: "index_projects_on_company_id"
  end

  create_table "screenshots", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "project_id"
  end

  create_table "time_slots", force: :cascade do |t|
    t.date "started_at"
    t.date "ended_at"
    t.integer "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["project_id"], name: "index_time_slots_on_project_id"
  end

  create_table "tool_projects", force: :cascade do |t|
    t.integer "project_id"
    t.integer "tool_id"
    t.string "version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tool_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tools", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "tool_type_id"
    t.index ["tool_type_id"], name: "index_tools_on_tool_type_id"
  end

end
