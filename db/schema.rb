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

ActiveRecord::Schema.define(version: 2023_01_02_214734) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auth_tokens", force: :cascade do |t|
    t.string "jwt_token", null: false
    t.integer "expiration_time", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "card_settings", force: :cascade do |t|
    t.bigint "user_preference_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_preference_id"], name: "index_card_settings_on_user_preference_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.bigint "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_categories_on_group_id"
  end

  create_table "category_budgets", force: :cascade do |t|
    t.string "month"
    t.float "budget"
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_category_budgets_on_category_id"
  end

  create_table "features", force: :cascade do |t|
    t.string "feature_name"
    t.boolean "activated"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "month_resumes", force: :cascade do |t|
    t.string "month"
    t.string "year"
    t.float "initial_budget"
    t.float "final_budget"
    t.float "percent_economy"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "permissions", force: :cascade do |t|
    t.string "action"
    t.date "experation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.text "description"
    t.float "amount"
    t.date "transaction_date"
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["category_id"], name: "index_transactions_on_category_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "user_preferences", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_preferences_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wallets", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.float "balance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_wallets_on_user_id"
  end

  add_foreign_key "card_settings", "user_preferences"
  add_foreign_key "categories", "groups"
  add_foreign_key "category_budgets", "categories"
  add_foreign_key "transactions", "categories"
  add_foreign_key "user_preferences", "users"
  add_foreign_key "wallets", "users"
end
