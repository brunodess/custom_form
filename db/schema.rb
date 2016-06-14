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

ActiveRecord::Schema.define(version: 20160614010757) do

  create_table "application_processes", force: :cascade do |t|
    t.string   "name"
    t.integer  "semester"
    t.integer  "year"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "form_template_id"
    t.integer  "letter_template_id"
    t.integer  "total_letters"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "application_processes", ["form_template_id"], name: "index_application_processes_on_form_template_id"
  add_index "application_processes", ["letter_template_id"], name: "index_application_processes_on_letter_template_id"

  create_table "form_field_inputs", force: :cascade do |t|
    t.integer  "student_application_id"
    t.integer  "form_field_id"
    t.string   "input"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "form_field_inputs", ["form_field_id"], name: "index_form_field_inputs_on_form_field_id"
  add_index "form_field_inputs", ["student_application_id"], name: "index_form_field_inputs_on_student_application_id"

  create_table "form_field_values", force: :cascade do |t|
    t.integer  "form_field_id"
    t.boolean  "is_default"
    t.string   "value"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "form_field_values", ["form_field_id"], name: "index_form_field_values_on_form_field_id"

  create_table "form_fields", force: :cascade do |t|
    t.string   "field_type"
    t.string   "name"
    t.integer  "form_template_id"
    t.boolean  "is_mandatory"
    t.string   "default"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.text     "description"
  end

  add_index "form_fields", ["form_template_id"], name: "index_form_fields_on_form_template_id"

  create_table "form_templates", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "is_letter"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "form_text_inputs", force: :cascade do |t|
    t.integer  "student_application_id"
    t.integer  "form_field_id"
    t.text     "input"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "form_text_inputs", ["form_field_id"], name: "index_form_text_inputs_on_form_field_id"
  add_index "form_text_inputs", ["student_application_id"], name: "index_form_text_inputs_on_student_application_id"

  create_table "letter_field_inputs", force: :cascade do |t|
    t.integer  "letter_request_id"
    t.integer  "form_field_id"
    t.string   "input"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "letter_field_inputs", ["form_field_id"], name: "index_letter_field_inputs_on_form_field_id"
  add_index "letter_field_inputs", ["letter_request_id"], name: "index_letter_field_inputs_on_letter_request_id"

  create_table "letter_requests", force: :cascade do |t|
    t.string   "professor_email"
    t.integer  "student_application_id"
    t.string   "access_code"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.boolean  "is_filled"
  end

  add_index "letter_requests", ["student_application_id"], name: "index_letter_requests_on_student_application_id"

  create_table "letter_text_inputs", force: :cascade do |t|
    t.integer  "letter_request_id"
    t.integer  "form_field_id"
    t.text     "input"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "letter_text_inputs", ["form_field_id"], name: "index_letter_text_inputs_on_form_field_id"
  add_index "letter_text_inputs", ["letter_request_id"], name: "index_letter_text_inputs_on_letter_request_id"

  create_table "student_applications", force: :cascade do |t|
    t.string   "student_name"
    t.integer  "application_process_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "student_applications", ["application_process_id"], name: "index_student_applications_on_application_process_id"

end
