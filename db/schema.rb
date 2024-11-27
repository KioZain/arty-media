ActiveRecord::Schema[7.2].define(version: 2024_10_29_105403) do
  create_table "collections", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.boolean "public", default: false
  end

  create_table "collections_posts", id: false, force: :cascade do |t|
    t.integer "collection_id", null: false
    t.integer "post_id", null: false
    t.index ["collection_id", "post_id"], name: "index_collections_posts_on_collection_id_and_post_id"
    t.index ["post_id", "collection_id"], name: "index_collections_posts_on_post_id_and_collection_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.integer "post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "author"
    t.string "post_image"
    t.integer "user_id"
    t.boolean "public", default: false
    t.string "secret"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
end
