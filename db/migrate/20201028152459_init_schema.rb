class InitSchema < ActiveRecord::Migration
  def up
    # These are extensions that must be enabled in order to support this database
    enable_extension "plpgsql"
    create_table "action_text_rich_texts" do |t|
      t.string "name", null: false
      t.text "body"
      t.string "record_type", null: false
      t.bigint "record_id", null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
    end
    create_table "active_storage_attachments" do |t|
      t.string "name", null: false
      t.string "record_type", null: false
      t.bigint "record_id", null: false
      t.bigint "blob_id", null: false
      t.datetime "created_at", null: false
      t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
      t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
    end
    create_table "active_storage_blobs" do |t|
      t.string "key", null: false
      t.string "filename", null: false
      t.string "content_type"
      t.text "metadata"
      t.bigint "byte_size", null: false
      t.string "checksum", null: false
      t.datetime "created_at", null: false
      t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
    end
    create_table "courses" do |t|
      t.string "title"
      t.text "content"
      t.string "matiere"
      t.string "level"
      t.string "author"
      t.string "slug"
      t.bigint "user_id", null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.bigint "material_id"
      t.index ["material_id"], name: "index_courses_on_material_id"
      t.index ["user_id"], name: "index_courses_on_user_id"
    end
    create_table "exercices" do |t|
      t.string "title"
      t.text "content_exercice"
      t.string "author"
      t.bigint "course_id"
      t.string "slug"
      t.bigint "user_id", null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.string "material"
      t.index ["user_id"], name: "index_exercices_on_user_id"
    end
    create_table "friendly_id_slugs" do |t|
      t.string "slug", null: false
      t.integer "sluggable_id", null: false
      t.string "sluggable_type", limit: 50
      t.string "scope"
      t.datetime "created_at"
      t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
      t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
      t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
    end
    create_table "materials" do |t|
      t.string "title"
      t.string "cycle"
      t.string "slug"
      t.bigint "user_id"
      t.bigint "course_id"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["course_id"], name: "index_materials_on_course_id"
      t.index ["user_id"], name: "index_materials_on_user_id"
    end
    create_table "schools" do |t|
      t.string "name"
      t.string "sigle"
      t.string "role"
      t.string "contact"
      t.string "school_address"
      t.string "city"
      t.string "code_school"
      t.string "code_secret"
      t.string "slug"
      t.bigint "user_id"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["user_id"], name: "index_schools_on_user_id"
    end
    create_table "users" do |t|
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.integer "sign_in_count", default: 0, null: false
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.inet "current_sign_in_ip"
      t.inet "last_sign_in_ip"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.string "username"
      t.string "city"
      t.string "school_name"
      t.string "level"
      t.string "contact"
      t.string "matricule"
      t.string "role"
      t.string "slug"
      t.string "school_code"
      t.string "punchline"
      t.index ["email"], name: "index_users_on_email", unique: true
      t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    end
    add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
    add_foreign_key "courses", "materials"
    add_foreign_key "courses", "users"
    add_foreign_key "exercices", "users"
    add_foreign_key "materials", "courses"
    add_foreign_key "materials", "users"
    add_foreign_key "schools", "users"
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "The initial migration is not revertable"
  end
end
