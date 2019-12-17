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

ActiveRecord::Schema.define(version: 20191213233015) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.date "event_date", null: false
    t.string "name", null: false
    t.string "descrption", null: false
    t.string "place", null: false
    t.bigint "populations_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["populations_id"], name: "index_activities_on_populations_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "description"
    t.bigint "rols_id"
    t.boolean "apply"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rols_id"], name: "index_permissions_on_rols_id"
  end

  create_table "permissions_rols", id: false, force: :cascade do |t|
    t.bigint "permission_id"
    t.bigint "rol_id", null: false
    t.bigint "rols_id"
    t.index ["permission_id"], name: "index_permissions_rols_on_permission_id"
    t.index ["rols_id"], name: "index_permissions_rols_on_rols_id"
  end

  create_table "permissions_users", id: false, force: :cascade do |t|
    t.bigint "permission_id"
    t.bigint "user_id"
    t.index ["permission_id"], name: "index_permissions_users_on_permission_id"
    t.index ["user_id"], name: "index_permissions_users_on_user_id"
  end

  create_table "populations", force: :cascade do |t|
    t.string "type_population"
    t.integer "age_init"
    t.integer "age_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rols", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "last_name", null: false
    t.date "date_birth", null: false
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.bigint "activities_id"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "rol_id"
    t.index ["activities_id"], name: "index_users_on_activities_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["rol_id"], name: "index_users_on_rol_id"
  end

  add_foreign_key "activities", "populations", column: "populations_id"
  add_foreign_key "permissions", "rols", column: "rols_id"
  add_foreign_key "permissions_rols", "permissions"
  add_foreign_key "permissions_rols", "rols", column: "rols_id"
  add_foreign_key "permissions_users", "permissions"
  add_foreign_key "permissions_users", "users"
  add_foreign_key "users", "activities", column: "activities_id"
  add_foreign_key "users", "rols"
end
