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

ActiveRecord::Schema.define(version: 2022_06_11_170639) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "ticket_identifier"
    t.bigint "organization_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_clients_on_organization_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "subdomain"
    t.integer "org_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "priorities", force: :cascade do |t|
    t.string "label"
    t.string "string"
    t.integer "sort_order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string "label"
    t.integer "sort_order"
    t.bigint "organization_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_statuses_on_organization_id"
  end

  create_table "team_user", force: :cascade do |t|
    t.integer "role"
    t.bigint "team_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_team_user_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "organization_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_teams_on_client_id"
    t.index ["organization_id"], name: "index_teams_on_organization_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "title"
    t.string "friendly_ticket_id"
    t.string "description"
    t.boolean "archived"
    t.bigint "organization_id", null: false
    t.bigint "client_id", null: false
    t.bigint "priority_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_tickets_on_client_id"
    t.index ["organization_id"], name: "index_tickets_on_organization_id"
    t.index ["priority_id"], name: "index_tickets_on_priority_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "tokens", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "value"
    t.datetime "expiry"
    t.string "ip"
    t.datetime "revocation_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_tokens_on_user_id"
  end

  create_table "user_roles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "password_digest"
    t.boolean "invitation_accepted", default: false
    t.string "invitation_token"
    t.datetime "invitation_expiration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "clients", "organizations"
  add_foreign_key "statuses", "organizations"
  add_foreign_key "team_user", "teams"
  add_foreign_key "teams", "clients"
  add_foreign_key "teams", "organizations"
  add_foreign_key "tickets", "clients"
  add_foreign_key "tickets", "organizations"
  add_foreign_key "tickets", "priorities"
  add_foreign_key "tickets", "users"
  add_foreign_key "tokens", "users"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
