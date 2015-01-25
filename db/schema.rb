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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20141102125337) do

  create_table "conversations", :force => true do |t|
    t.string   "subject",    :default => ""
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "endorsements", :force => true do |t|
    t.integer  "user_id"
    t.integer  "author_id"
    t.float    "rating",     :default => 0.0
    t.text     "content"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.string   "title"
  end

  create_table "insurance_claims", :force => true do |t|
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "claim_number"
    t.float    "cost"
    t.boolean  "closed"
    t.date     "closed_date"
    t.integer  "insurance_policy_id"
  end

  create_table "insurance_policies", :force => true do |t|
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "user_id"
    t.integer  "policy_number"
    t.float    "price"
    t.date     "start_date"
    t.date     "end_date"
  end

  create_table "kit_photos", :force => true do |t|
    t.integer "kit_id"
    t.string  "image"
    t.boolean "primary"
  end

  create_table "kit_ratings", :force => true do |t|
    t.integer  "kit_id"
    t.float    "rating"
    t.text     "content"
    t.integer  "author_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "kits", :force => true do |t|
    t.integer  "user_id"
    t.string   "category"
    t.string   "kind"
    t.string   "sub_kind"
    t.string   "title"
    t.float    "daily_price"
    t.float    "weekly_price"
    t.float    "monthly_price"
    t.string   "condition"
    t.text     "description"
    t.boolean  "insurance_required"
    t.string   "location"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "notifications", :force => true do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              :default => ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                :default => false
    t.datetime "updated_at",                              :null => false
    t.datetime "created_at",                              :null => false
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "notification_code"
    t.string   "attachment"
    t.boolean  "global",               :default => false
    t.datetime "expires"
  end

  add_index "notifications", ["conversation_id"], :name => "index_notifications_on_conversation_id"

  create_table "receipts", :force => true do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                                  :null => false
    t.boolean  "is_read",                       :default => false
    t.boolean  "trashed",                       :default => false
    t.boolean  "deleted",                       :default => false
    t.string   "mailbox_type",    :limit => 25
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  add_index "receipts", ["notification_id"], :name => "index_receipts_on_notification_id"

  create_table "rentals", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.integer  "renter_id"
    t.integer  "kit_id"
    t.date     "start_date"
    t.date     "end_date"
    t.float    "cost"
    t.boolean  "confirmed"
    t.string   "status"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name",             :default => ""
    t.string   "last_name",              :default => ""
    t.string   "user_name"
    t.text     "address"
    t.string   "postcode"
    t.text     "bio"
    t.text     "activities"
    t.text     "why_on"
    t.text     "philosophy"
    t.text     "where"
    t.float    "rating",                 :default => 0.0
    t.text     "last_3_endorsements"
    t.date     "insurance_end",          :default => '1970-01-01'
    t.text     "profile_picture"
    t.float    "replies_percentage",     :default => 0.0
    t.integer  "kitshare_points"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
    t.string   "email",                  :default => "",           :null => false
    t.string   "encrypted_password",     :default => "",           :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,            :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "role"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  add_foreign_key "notifications", "conversations", name: "notifications_on_conversation_id"

  add_foreign_key "receipts", "notifications", name: "receipts_on_notification_id"

end
