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

ActiveRecord::Schema[7.1].define(version: 2024_06_14_204956) do
  create_schema "video_games"

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_tokens", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.text "token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_api_tokens_on_user_id"
  end

  create_table "game", id: :integer, default: nil, force: :cascade do |t|
    t.integer "genre_id"
    t.string "game_name", limit: 200
  end

  create_table "game_platform", id: :integer, default: nil, force: :cascade do |t|
    t.integer "game_publisher_id"
    t.integer "platform_id"
    t.integer "release_year"
  end

  create_table "game_publisher", id: :integer, default: nil, force: :cascade do |t|
    t.integer "game_id"
    t.integer "publisher_id"
  end

  create_table "genre", id: :integer, default: nil, force: :cascade do |t|
    t.string "genre_name", limit: 50
  end

  create_table "platform", id: :integer, default: nil, force: :cascade do |t|
    t.string "platform_name", limit: 50
  end

  create_table "publisher", id: :integer, default: nil, force: :cascade do |t|
    t.string "publisher_name", limit: 100
  end

  create_table "region", id: :integer, default: nil, force: :cascade do |t|
    t.string "region_name", limit: 50
  end

  create_table "region_sales", id: false, force: :cascade do |t|
    t.integer "region_id"
    t.integer "game_platform_id"
    t.decimal "num_sales", precision: 5, scale: 2
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "api_tokens", "users"
  add_foreign_key "game", "genre", name: "fk_gm_gen"
  add_foreign_key "game_platform", "game_publisher", name: "fk_gpl_gp"
  add_foreign_key "game_platform", "platform", name: "fk_gpl_pla"
  add_foreign_key "game_publisher", "game", name: "fk_gpu_gam"
  add_foreign_key "game_publisher", "publisher", name: "fk_gpu_pub"
  add_foreign_key "region_sales", "game_platform", name: "fk_rs_gp"
  add_foreign_key "region_sales", "region", name: "fk_rs_reg"
end
