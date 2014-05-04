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

ActiveRecord::Schema.define(version: 20140504010534) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "category_name"
    t.boolean  "deleted"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", force: true do |t|
    t.string   "company_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", force: true do |t|
    t.string   "department_name"
    t.boolean  "deleted"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_titles", force: true do |t|
    t.string   "job_title_name"
    t.boolean  "deleted"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trainees", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "badge_id"
    t.string   "employee_number"
    t.boolean  "deleted"
    t.integer  "company_id"
    t.integer  "category_id"
    t.integer  "department_id"
    t.integer  "job_title_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "home_phone"
    t.string   "fax"
    t.string   "address"
    t.string   "internal_address"
    t.string   "hire_date"
    t.string   "birth_date"
    t.string   "termination_date"
    t.string   "blood_type"
    t.string   "medical_notes"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "reset_password_token"
    t.string   "session_token"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
