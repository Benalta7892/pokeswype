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

ActiveRecord::Schema[7.1].define(version: 2024_03_06_191819) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "card_interests", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "card_id", null: false
    t.bigint "exchange_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_card_interests_on_card_id"
    t.index ["exchange_id"], name: "index_card_interests_on_exchange_id"
    t.index ["user_id"], name: "index_card_interests_on_user_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "price"
    t.string "serie"
    t.date "released_date"
    t.string "number"
    t.string "rarity"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.string "extension"
  end

  create_table "chatrooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exchanges", force: :cascade do |t|
    t.datetime "meeting_date"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.integer "status", default: 0
    t.bigint "dealer_id", null: false
    t.bigint "receiver_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dealer_id"], name: "index_exchanges_on_dealer_id"
    t.index ["receiver_id"], name: "index_exchanges_on_receiver_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.bigint "chatroom_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.bigint "user_id", null: false
    t.bigint "exchange_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exchange_id"], name: "index_reviews_on_exchange_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "user_cards", force: :cascade do |t|
    t.boolean "exchangeable"
    t.bigint "user_id", null: false
    t.bigint "card_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_user_cards_on_card_id"
    t.index ["user_id"], name: "index_user_cards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.integer "global_rating"
    t.string "avatar"
    t.string "nickname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "card_interests", "cards"
  add_foreign_key "card_interests", "exchanges"
  add_foreign_key "card_interests", "users"
  add_foreign_key "exchanges", "users", column: "dealer_id"
  add_foreign_key "exchanges", "users", column: "receiver_id"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
  add_foreign_key "reviews", "exchanges"
  add_foreign_key "reviews", "users"
  add_foreign_key "user_cards", "cards"
  add_foreign_key "user_cards", "users"
end
