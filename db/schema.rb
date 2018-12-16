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

ActiveRecord::Schema.define(version: 20160924145847) do

  create_table "add_users", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.string   "family"
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contents", force: :cascade do |t|
    t.integer  "userid"
    t.text     "post"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contexts", force: :cascade do |t|
    t.string   "name"
    t.string   "value_type"
    t.string   "location"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "contexts", ["name"], name: "index_contexts_on_name", unique: true

  create_table "journals", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "journals", ["name"], name: "index_journals_on_name", unique: true

  create_table "news", force: :cascade do |t|
    t.string   "body"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people_projects", id: false, force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "people_projects", ["project_id"], name: "index_people_projects_on_project_id"
  add_index "people_projects", ["user_id", "project_id"], name: "index_people_projects_on_user_id_and_project_id", unique: true
  add_index "people_projects", ["user_id"], name: "index_people_projects_on_user_id"

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.string   "goal"
    t.date     "start_date"
    t.date     "end_time"
    t.integer  "sponsor_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "projects", ["title"], name: "index_projects_on_title", unique: true

  create_table "publications", force: :cascade do |t|
    t.string   "title"
    t.integer  "year"
    t.integer  "page"
    t.integer  "volume"
    t.integer  "journal_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.integer  "pageend"
  end

  add_index "publications", ["journal_id"], name: "index_publications_on_journal_id"

  create_table "role_contexts", force: :cascade do |t|
    t.integer "role_id"
    t.integer "context_id"
  end

  add_index "role_contexts", ["role_id", "context_id"], name: "index_role_contexts_on_role_id_and_context_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "priority"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "show_in_ui"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "sponsors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sponsors", ["name"], name: "index_sponsors_on_name", unique: true

  create_table "user_contexts", id: false, force: :cascade do |t|
    t.string   "value"
    t.integer  "context_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_contexts", ["user_id", "context_id"], name: "index_user_contexts_on_user_id_and_context_id"

  create_table "user_publications", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "publication_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "user_publications", ["publication_id"], name: "index_user_publications_on_publication_id"
  add_index "user_publications", ["user_id", "publication_id"], name: "index_user_publications_on_user_id_and_publication_id", unique: true
  add_index "user_publications", ["user_id"], name: "index_user_publications_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "url"
    t.text     "bio"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
