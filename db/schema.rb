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

ActiveRecord::Schema.define(version: 20150606145930) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers_posts", id: false, force: :cascade do |t|
    t.integer "answer_id"
    t.integer "post_id"
  end

  add_index "answers_posts", ["answer_id"], name: "index_answers_posts_on_answer_id", using: :btree
  add_index "answers_posts", ["post_id"], name: "index_answers_posts_on_post_id", using: :btree

  create_table "boards", force: :cascade do |t|
    t.string  "name",        default: "",  null: false
    t.integer "pages_limit", default: 10
    t.integer "bumplimit",   default: 500
    t.string  "description", default: ""
    t.string  "terms",       default: ""
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",                       null: false
    t.text     "content",                          null: false
    t.boolean  "sage",             default: false
    t.boolean  "anon",             default: false
    t.integer  "thr_id",                           null: false
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
    t.string   "youtube_video"
  end

  create_table "thrs", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title",      null: false
    t.integer  "board_id",   null: false
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.integer  "status",                 default: 0,  null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
