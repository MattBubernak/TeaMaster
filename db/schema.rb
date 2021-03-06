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

ActiveRecord::Schema.define(version: 20170429184624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "data_fingerprint"
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type", using: :btree
  end

  create_table "ingredient_measurements", force: :cascade do |t|
    t.integer  "ingredient_id"
    t.integer  "recipe_id"
    t.integer  "count"
    t.string   "unit_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["ingredient_id"], name: "index_ingredient_measurements_on_ingredient_id", using: :btree
    t.index ["recipe_id"], name: "index_ingredient_measurements_on_recipe_id", using: :btree
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipe_reviews", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "user_id"
    t.integer  "rating"
    t.string   "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_recipe_reviews_on_recipe_id", using: :btree
    t.index ["user_id"], name: "index_recipe_reviews_on_user_id", using: :btree
  end

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "preperation_notes"
    t.string   "source_url"
    t.integer  "user_id"
    t.integer  "upvotes",           default: 0
    t.integer  "downvotes",         default: 0
  end

  create_table "steep_instructions", force: :cascade do |t|
    t.integer  "time"
    t.integer  "recipe_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "temperature"
    t.index ["recipe_id"], name: "index_steep_instructions_on_recipe_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "password_digest"
    t.string   "username"
    t.string   "persistence_token"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.boolean  "admin",              default: false
    t.integer  "favorite_recipe_id"
    t.string   "about"
    t.integer  "gender"
  end

  add_foreign_key "ingredient_measurements", "ingredients"
  add_foreign_key "ingredient_measurements", "recipes"
  add_foreign_key "recipe_reviews", "recipes"
  add_foreign_key "recipe_reviews", "users"
  add_foreign_key "steep_instructions", "recipes"
end
