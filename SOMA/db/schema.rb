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

ActiveRecord::Schema.define(version: 20141128100232) do

  create_table "courses", force: true do |t|
    t.integer  "doctor_id"
    t.string   "name"
    t.float    "workload",     limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "last_updates"
  end

  add_index "courses", ["doctor_id"], name: "index_courses_on_doctor_id", using: :btree

  create_table "courses_users", id: false, force: true do |t|
    t.integer "course_id"
    t.integer "student_id"
  end

  create_table "question_options", force: true do |t|
    t.string "option"
  end

  create_table "resources", force: true do |t|
    t.integer  "course_id"
    t.string   "type"
    t.string   "description"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.integer  "right_answer",          default: 0
    t.integer  "options_amount",        default: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "resources", ["course_id"], name: "index_resources_on_course_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "rg"
    t.string   "issuing_agency"
    t.string   "cpf"
    t.string   "name"
    t.string   "zip_code"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "email"
    t.string   "type"
    t.string   "login"
    t.string   "password_digest"
    t.boolean  "activated",       default: false
    t.boolean  "admin",           default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "activated_at"
    t.string   "street"
    t.string   "number"
    t.string   "complement"
    t.string   "district"
    t.string   "city"
    t.string   "state"
  end

end
