

ActiveRecord::Schema[7.1].define(version: 2024_02_03_113100) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "school_classes", force: :cascade do |t|
    t.integer "number"
    t.string "letter"
    t.integer "students_count"
    t.bigint "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_school_classes_on_school_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "surname"
    t.bigint "school_id"
    t.bigint "school_class_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_class_id"], name: "index_students_on_school_class_id"
    t.index ["school_id"], name: "index_students_on_school_id"
  end

  add_foreign_key "school_classes", "schools"
  add_foreign_key "students", "school_classes"
  add_foreign_key "students", "schools"
end
