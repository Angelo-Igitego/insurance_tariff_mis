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

ActiveRecord::Schema[7.0].define(version: 2023_08_16_183657) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "consumables", force: :cascade do |t|
    t.string "form"
    t.string "unit_of_measurement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drugs", force: :cascade do |t|
    t.string "category"
    t.string "form"
    t.string "unit_of_measurement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "insurance_providers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "address"
    t.string "city"
    t.string "province_or_state"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lab_tests", force: :cascade do |t|
    t.string "category"
    t.string "unit_of_measurement"
    t.decimal "min_ref_value"
    t.decimal "max_ref_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medical_acts", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.boolean "available"
    t.string "productable_type"
    t.bigint "productable_id"
    t.string "unit_of_measurement"
    t.decimal "cost_price"
    t.decimal "selling_price"
    t.decimal "reimbursable_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["productable_id", "productable_type"], name: "index_products_on_productable_id_and_productable_type", unique: true
  end

end
