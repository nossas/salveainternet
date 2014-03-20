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

ActiveRecord::Schema.define(version: 20140320230038) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authorizations", force: true do |t|
    t.string   "provider",          null: false
    t.string   "uid",               null: false
    t.string   "first_name",        null: false
    t.string   "last_name",         null: false
    t.string   "token",             null: false
    t.datetime "expires_at",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "facebook_post_id"
    t.boolean  "last_token_renew"
    t.datetime "loaded_friends_at"
  end

  create_table "friends", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "uid"
    t.string   "picture"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authorizations_friends", force: true do |t|
    t.integer "authorization_id"
    t.integer "friend_id"
    t.index ["authorization_id"], :name => "fk__authorizations_friends_authorization_id", :order => {"authorization_id" => :asc}
    t.index ["friend_id"], :name => "fk__authorizations_friends_friend_id", :order => {"friend_id" => :asc}
    t.foreign_key ["authorization_id"], "authorizations", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_authorizations_friends_authorization_id"
    t.foreign_key ["friend_id"], "friends", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_authorizations_friends_friend_id"
  end

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], :name => "delayed_jobs_priority", :order => {"priority" => :asc, "run_at" => :asc}
  end

  create_table "squeezes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",      null: false
    t.string   "ip"
    t.string   "first_name", null: false
    t.string   "last_name",  null: false
    t.string   "city"
  end

end
