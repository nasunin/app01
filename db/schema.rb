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

ActiveRecord::Schema.define(version: 20151202030107) do

  create_table "alerts", force: true do |t|
    t.string   "usercd",         null: false
    t.string   "eventcd",        null: false
    t.string   "alertusercd",    null: false
    t.integer  "alertbranchnum", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "alerts", ["usercd", "alertusercd", "alertbranchnum"], name: "index_alerts_on_usercd_and_alertusercd_and_alertbranchnum", unique: true

  create_table "derived_usesrs", force: true do |t|
    t.string   "usercd",                         null: false
    t.integer  "branchnum",                      null: false
    t.string   "name",                           null: false
    t.string   "imageid"
    t.boolean  "f_address",      default: true
    t.string   "prefecturecd",                   null: false
    t.string   "city"
    t.boolean  "f_sex",          default: true
    t.string   "sex",                            null: false
    t.boolean  "f_year",         default: true
    t.boolean  "f_birthday",     default: true
    t.date     "birthday",                       null: false
    t.string   "blood"
    t.boolean  "f_origin_place", default: true
    t.string   "origin_place"
    t.boolean  "f_hobby",        default: true
    t.string   "hobby1"
    t.string   "hobby2"
    t.string   "hobby3"
    t.string   "hobby4"
    t.string   "hobby5"
    t.boolean  "f_occupation",   default: true
    t.string   "occupation"
    t.boolean  "f_genus",        default: true
    t.string   "genus"
    t.string   "introduction"
    t.boolean  "f_delete",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "derived_usesrs", ["usercd", "branchnum"], name: "index_derived_usesrs_on_usercd_and_branchnum", unique: true

  create_table "event_avatars", force: true do |t|
    t.string   "eventcd",                    null: false
    t.string   "usercd",                     null: false
    t.integer  "branchnum",                  null: false
    t.boolean  "f_delete",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_avatars", ["eventcd", "usercd"], name: "index_event_avatars_on_eventcd_and_usercd", unique: true

  create_table "event_comments", force: true do |t|
    t.string   "eventcd",                    null: false
    t.integer  "seq",                        null: false
    t.string   "comment"
    t.string   "usercd",                     null: false
    t.integer  "branchnum",                  null: false
    t.boolean  "f_delete",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_comments", ["eventcd", "seq"], name: "index_event_comments_on_eventcd_and_seq", unique: true

  create_table "event_types", force: true do |t|
    t.integer  "seq",        null: false
    t.string   "typenm"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_types", ["seq"], name: "index_event_types_on_seq", unique: true

  create_table "events", force: true do |t|
    t.string   "eventcd",      null: false
    t.string   "subject"
    t.string   "description"
    t.date     "limit_date",   null: false
    t.string   "key1"
    t.string   "key2"
    t.string   "key3"
    t.string   "key4"
    t.string   "key5"
    t.string   "usercd",       null: false
    t.integer  "branchnum",    null: false
    t.string   "imageid"
    t.date     "public_date",  null: false
    t.date     "end_date",     null: false
    t.string   "prefecturecd"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "typeno"
  end

  add_index "events", ["eventcd"], name: "index_events_on_eventcd", unique: true

  create_table "users", force: true do |t|
    t.string   "usercd",                          null: false
    t.string   "email_for_index",                 null: false
    t.string   "email",                           null: false
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "name",                            null: false
    t.string   "imageid"
    t.boolean  "f_address",       default: true
    t.string   "prefecturecd",                    null: false
    t.string   "city"
    t.boolean  "f_sex",           default: true
    t.string   "sex",                             null: false
    t.boolean  "f_year",          default: true
    t.boolean  "f_birthday",      default: true
    t.date     "birthday",                        null: false
    t.string   "blood"
    t.boolean  "f_origin_place",  default: true
    t.string   "origin_place"
    t.boolean  "f_hobby",         default: true
    t.string   "hobby1"
    t.string   "hobby2"
    t.string   "hobby3"
    t.string   "hobby4"
    t.string   "hobby5"
    t.boolean  "f_occupation",    default: true
    t.string   "occupation"
    t.boolean  "f_genus",         default: true
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
