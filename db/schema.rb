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

ActiveRecord::Schema[7.0].define(version: 2023_03_03_020302) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "bets", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.integer "stake"
    t.integer "result", default: 0
    t.datetime "date_placed"
    t.datetime "date_settled"
    t.string "prize_pick_id", null: false
    t.jsonb "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "users_betting_book_id"
    t.index ["prize_pick_id"], name: "index_bets_on_prize_pick_id"
    t.index ["users_betting_book_id"], name: "index_bets_on_users_betting_book_id"
  end

  create_table "bets_transactions", force: :cascade do |t|
    t.bigint "bet_id"
    t.integer "prize_pick_id", null: false
    t.jsonb "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bet_id"], name: "index_bets_transactions_on_bet_id"
    t.index ["prize_pick_id"], name: "index_bets_transactions_on_prize_pick_id"
  end

  create_table "betting_books", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.boolean "enabled", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "first_name", default: ""
    t.string "last_name", default: ""
    t.text "bio", default: ""
    t.date "date_of_birth"
    t.string "github", default: ""
    t.string "twitter", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "username", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "uid"
    t.string "provider"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "balance", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "users_betting_books", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "betting_book_id", null: false
    t.string "email"
    t.string "password", default: ""
    t.integer "deposited_amount", default: 0, null: false
    t.integer "status", default: 0, null: false
    t.datetime "last_synced_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["betting_book_id"], name: "index_users_betting_books_on_betting_book_id"
    t.index ["user_id", "betting_book_id"], name: "index_users_betting_books_on_user_id_and_betting_book_id", unique: true
    t.index ["user_id"], name: "index_users_betting_books_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bets", "users_betting_books"
  add_foreign_key "bets_transactions", "bets"
  add_foreign_key "profiles", "users"
  add_foreign_key "users_betting_books", "betting_books"
  add_foreign_key "users_betting_books", "users"
end
