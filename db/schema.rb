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

ActiveRecord::Schema.define(version: 20151030074830) do

  create_table "users", force: true do |t|
    t.string   "usercd",                          null: false
    t.string   "email_for_index",                 null: false
    t.string   "email",                           null: false
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "name",                            null: false
    t.string   "imageid"
    t.boolean  "f_address",       default: true,  null: false
    t.string   "prefecturecd",                    null: false
    t.string   "city"
    t.boolean  "f_sex",           default: true,  null: false
    t.string   "sex",                             null: false
    t.boolean  "f_year",          default: true,  null: false
    t.boolean  "f_birthday",      default: true,  null: false
    t.datetime "birthday",                        null: false
    t.string   "blood"
    t.boolean  "f_origin_place",  default: true,  null: false
    t.string   "origin_place"
    t.boolean  "f_hobby",         default: true,  null: false
    t.string   "hobby1"
    t.string   "hobby2"
    t.string   "hobby3"
    t.string   "hobby4"
    t.string   "hobby5"
    t.boolean  "f_occupation",    default: true,  null: false
    t.string   "occupation"
    t.boolean  "f_genus",         default: true,  null: false
    t.string   "genus"
    t.string   "introduction"
    t.boolean  "admin",           default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email_for_index"], name: "index_users_on_email_for_index", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"
  add_index "users", ["usercd"], name: "index_users_on_usercd", unique: true

end
