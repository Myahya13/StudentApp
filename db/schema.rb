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

ActiveRecord::Schema.define(version: 2023_10_09_153630) do

  create_table "answers", force: :cascade do |t|
    t.string "content"
    t.boolean "correct", default: false
    t.integer "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "attempted_questions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "exam_id", null: false
    t.integer "question_id", null: false
    t.integer "answer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["answer_id"], name: "index_attempted_questions_on_answer_id"
    t.index ["exam_id"], name: "index_attempted_questions_on_exam_id"
    t.index ["question_id"], name: "index_attempted_questions_on_question_id"
    t.index ["user_id"], name: "index_attempted_questions_on_user_id"
  end

  create_table "exams", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "marks"
    t.datetime "show_exam"
    t.boolean "status", default: false
    t.integer "subject_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subject_id"], name: "index_exams_on_subject_id"
    t.index ["user_id"], name: "index_exams_on_user_id"
  end

  create_table "models", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_models_on_email", unique: true
    t.index ["reset_password_token"], name: "index_models_on_reset_password_token", unique: true
  end

  create_table "questions", force: :cascade do |t|
    t.text "question_text"
    t.boolean "correct"
    t.integer "exam_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exam_id"], name: "index_questions_on_exam_id"
  end

  create_table "student_exams", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "exam_id", null: false
    t.boolean "completed", default: false
    t.integer "score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exam_id"], name: "index_student_exams_on_exam_id"
    t.index ["user_id"], name: "index_student_exams_on_user_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "role", default: 0
    t.string "profile_pictur"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "attempted_questions", "answers"
  add_foreign_key "attempted_questions", "exams"
  add_foreign_key "attempted_questions", "questions"
  add_foreign_key "attempted_questions", "users"
  add_foreign_key "exams", "subjects"
  add_foreign_key "exams", "users"
  add_foreign_key "questions", "exams"
  add_foreign_key "student_exams", "exams"
  add_foreign_key "student_exams", "users"
end
