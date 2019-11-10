# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_09_135527) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "divers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "contact"
    t.string "address"
    t.string "secondary_contact"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "feeds", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["profile_id"], name: "index_feeds_on_profile_id"
    t.index ["user_id"], name: "index_feeds_on_user_id"
  end

  create_table "leases", force: :cascade do |t|
    t.string "location"
    t.string "latitude"
    t.string "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mortality_forms", force: :cascade do |t|
    t.date "date"
    t.integer "bird_strikes"
    t.integer "seal_strikes"
    t.integer "skinny"
    t.integer "deformities"
    t.integer "unknown"
    t.text "mort_comments"
    t.integer "shallow_rot"
    t.integer "deep_rot"
    t.integer "missing_weights"
    t.string "skin_burn"
    t.integer "fish_rub"
    t.integer "probe_cleaned"
    t.text "observations"
    t.bigint "pen_id", null: false
    t.bigint "lease_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lease_id"], name: "index_mortality_forms_on_lease_id"
    t.index ["pen_id"], name: "index_mortality_forms_on_pen_id"
  end

  create_table "pens", force: :cascade do |t|
    t.string "name"
    t.string "latitude"
    t.string "longitude"
    t.bigint "lease_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lease_id"], name: "index_pens_on_lease_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.string "attachment"
    t.bigint "feed_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.index ["feed_id"], name: "index_posts_on_feed_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "about_me"
    t.string "image"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "feeds", "profiles"
  add_foreign_key "feeds", "users"
  add_foreign_key "mortality_forms", "leases"
  add_foreign_key "mortality_forms", "pens"
  add_foreign_key "pens", "leases"
  add_foreign_key "posts", "feeds"
  add_foreign_key "posts", "users"
  add_foreign_key "profiles", "users"
end
