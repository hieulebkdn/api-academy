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

ActiveRecord::Schema.define(version: 2018_12_26_171706) do

  create_table "accounts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "dob"
    t.boolean "gender"
    t.string "address"
    t.string "parent_name"
    t.string "parent_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "class_rooms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "course_id"
    t.index ["course_id"], name: "index_class_rooms_on_course_id"
  end

  create_table "class_rooms_timetables", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "class_room_id", null: false
    t.bigint "timetable_id", null: false
    t.index ["class_room_id", "timetable_id"], name: "index_class_rooms_timetables_on_class_room_id_and_timetable_id"
    t.index ["timetable_id", "class_room_id"], name: "index_class_rooms_timetables_on_timetable_id_and_class_room_id"
  end

  create_table "class_rooms_users", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "class_room_id", null: false
    t.boolean "is_teacher", default: false
    t.index ["class_room_id", "user_id"], name: "index_class_rooms_users_on_class_room_id_and_user_id"
    t.index ["user_id", "class_room_id"], name: "index_class_rooms_users_on_user_id_and_class_room_id"
  end

  create_table "courses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "fee", precision: 10, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "duration", null: false
  end

  create_table "timetables", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "weekday"
    t.string "start_time"
    t.string "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", null: false
    t.string "name", null: false
    t.string "phone", null: false
    t.string "role", default: "student", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.bigint "timetable_id"
    t.index ["timetable_id"], name: "index_users_on_timetable_id"
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "class_rooms", "courses"
end
