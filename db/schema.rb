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

ActiveRecord::Schema.define(:version => 20120924170013) do

  create_table "connections", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "experiences", :force => true do |t|
    t.string   "company_name"
    t.string   "company_website"
    t.integer  "industry_id"
    t.string   "title"
    t.string   "location"
    t.string   "from_month"
    t.string   "to_month"
    t.integer  "from_year"
    t.integer  "to_year"
    t.boolean  "currently_work"
    t.text     "description"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "group_name"
    t.integer  "creator"
    t.text     "description"
    t.string   "group_type"
    t.text     "summary"
    t.string   "website"
    t.string   "group_owner_email"
    t.integer  "access"
    t.boolean  "display_in_directory"
    t.boolean  "allow_display_logo"
    t.boolean  "allo_invite_others"
    t.string   "language"
    t.boolean  "single_location"
    t.integer  "country_id"
    t.boolean  "check_agreement"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "postal_code"
    t.boolean  "open_status"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "invitations", :force => true do |t|
    t.integer  "from_user_id"
    t.integer  "to_user_id"
    t.text     "message"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "languages", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "skills", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_profile_skills", :force => true do |t|
    t.integer  "user_profile_id"
    t.integer  "skill_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "user_profiles", :force => true do |t|
    t.integer "country_id",        :null => false
    t.string  "postal_code",       :null => false
    t.integer "employment_status"
    t.string  "job_title",         :null => false
    t.boolean "self_employed"
    t.string  "company",           :null => false
    t.integer "industry"
    t.string  "email_assoc"
    t.integer "plan_id"
    t.integer "user_id",           :null => false
    t.string  "address_line_1"
    t.string  "address_line_2"
    t.string  "state"
    t.string  "city"
    t.date    "birthday"
    t.string  "marital_status"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
