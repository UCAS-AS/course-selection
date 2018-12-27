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

ActiveRecord::Schema.define(version: 2018_12_23_201921) do

  create_table "admins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "ano"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "courses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "cno"
    t.string "title"
    t.integer "year"
    t.string "semester"
    t.integer "credit"
    t.integer "start_week"
    t.integer "end_week"
    t.integer "select_limit"
    t.integer "hours"
    t.string "week_time_classroom"
    t.string "course_type"
    t.text "brief"
    t.bigint "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cno"], name: "index_courses_on_cno", unique: true
    t.index ["department_id"], name: "index_courses_on_department_id"
  end

  create_table "departments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "dno"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dno"], name: "index_departments_on_dno", unique: true
  end

  create_table "select_relationships", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "student_id"
    t.string "course_id"
    t.boolean "is_degree_course", default: false
    t.integer "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_select_relationships_on_course_id"
    t.index ["student_id", "course_id"], name: "index_select_relationships_on_student_id_and_course_id", unique: true
    t.index ["student_id"], name: "index_select_relationships_on_student_id"
  end

  create_table "students", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "sno"
    t.string "name"
    t.string "email"
    t.string "gender"
    t.datetime "enrolled_date"
    t.datetime "birth_date"
    t.string "degree"
    t.string "major"
    t.string "phone"
    t.string "password_digest"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.string "remember_digest"
    t.boolean "email_activated", default: false
    t.string "email_activation_digest"
    t.datetime "email_activated_sent_at"
    t.bigint "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_students_on_department_id"
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["sno"], name: "index_students_on_sno", unique: true
  end

  create_table "teach_relationships", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "teacher_id"
    t.integer "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_teach_relationships_on_course_id"
    t.index ["teacher_id", "course_id"], name: "index_teach_relationships_on_teacher_id_and_course_id", unique: true
    t.index ["teacher_id"], name: "index_teach_relationships_on_teacher_id"
  end

  create_table "teachers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "tno"
    t.string "email"
    t.string "gender"
    t.string "phone"
    t.string "name"
    t.string "title"
    t.datetime "birth_date"
    t.string "password_digest"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.string "remember_digest"
    t.string "email_activation_digest"
    t.boolean "email_activated"
    t.datetime "email_activated_sent_at"
    t.bigint "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_teachers_on_department_id"
    t.index ["email"], name: "index_teachers_on_email", unique: true
    t.index ["tno"], name: "index_teachers_on_tno", unique: true
  end

end
