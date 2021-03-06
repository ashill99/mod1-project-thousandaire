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

ActiveRecord::Schema.define(version: 2020_11_10_220915) do

  create_table "game_questions", force: :cascade do |t|
    t.integer "game_id"
    t.integer "question_id"
    t.string "correct_answer"
  end

  create_table "games", force: :cascade do |t|
    t.integer "user_id"
    t.boolean "lifeline_1"
    t.boolean "lifeline_2"
    t.boolean "lifeline_3"
    t.integer "score"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "value_of_question"
    t.string "difficulty"
    t.string "question"
    t.string "correct_answer"
    t.string "incorrect_answer_1"
    t.string "incorrect_answer_2"
    t.string "incorrect_answer_3"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
  end

end
