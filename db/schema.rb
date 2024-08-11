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

ActiveRecord::Schema[7.2].define(version: 2024_08_11_020420) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "loto45_numbers", force: :cascade do |t|
    t.integer "number"
    t.integer "total_lt"
    t.integer "total_jackpot_lt"
    t.integer "total_lt_wed"
    t.integer "total_lt_fri"
    t.integer "total_lt_sun"
    t.integer "total_lt_odd_day_of_month"
    t.integer "total_lt_even_day_of_month"
    t.index ["number"], name: "index_loto45_numbers_on_number"
    t.index ["total_jackpot_lt"], name: "index_loto45_numbers_on_total_jackpot_lt"
    t.index ["total_lt"], name: "index_loto45_numbers_on_total_lt"
    t.index ["total_lt_even_day_of_month"], name: "index_loto45_numbers_on_total_lt_even_day_of_month"
    t.index ["total_lt_fri"], name: "index_loto45_numbers_on_total_lt_fri"
    t.index ["total_lt_odd_day_of_month"], name: "index_loto45_numbers_on_total_lt_odd_day_of_month"
    t.index ["total_lt_sun"], name: "index_loto45_numbers_on_total_lt_sun"
    t.index ["total_lt_wed"], name: "index_loto45_numbers_on_total_lt_wed"
  end

  create_table "loto55_numbers", force: :cascade do |t|
    t.integer "number"
    t.integer "total_lt"
    t.integer "total_jackpot_lt"
    t.integer "total_lt_tue"
    t.integer "total_lt_thu"
    t.integer "total_lt_sat"
    t.integer "total_lt_odd_day_of_month"
    t.integer "total_lt_even_day_of_month"
    t.index ["number"], name: "index_loto55_numbers_on_number"
    t.index ["total_jackpot_lt"], name: "index_loto55_numbers_on_total_jackpot_lt"
    t.index ["total_lt"], name: "index_loto55_numbers_on_total_lt"
    t.index ["total_lt_even_day_of_month"], name: "index_loto55_numbers_on_total_lt_even_day_of_month"
    t.index ["total_lt_odd_day_of_month"], name: "index_loto55_numbers_on_total_lt_odd_day_of_month"
    t.index ["total_lt_sat"], name: "index_loto55_numbers_on_total_lt_sat"
    t.index ["total_lt_thu"], name: "index_loto55_numbers_on_total_lt_thu"
    t.index ["total_lt_tue"], name: "index_loto55_numbers_on_total_lt_tue"
  end

  create_table "loto_results", force: :cascade do |t|
    t.integer "num1"
    t.integer "num2"
    t.integer "num3"
    t.integer "num4"
    t.integer "num5"
    t.integer "num6"
    t.integer "num_add"
    t.integer "total_odd"
    t.integer "total_even"
    t.integer "toto_type"
    t.boolean "jackpot"
    t.boolean "jackpot1_price"
    t.integer "weekday"
    t.date "result_date"
    t.integer "step"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jackpot"], name: "index_loto_results_on_jackpot"
    t.index ["jackpot1_price"], name: "index_loto_results_on_jackpot1_price"
    t.index ["num1"], name: "index_loto_results_on_num1"
    t.index ["num2"], name: "index_loto_results_on_num2"
    t.index ["num3"], name: "index_loto_results_on_num3"
    t.index ["num4"], name: "index_loto_results_on_num4"
    t.index ["num5"], name: "index_loto_results_on_num5"
    t.index ["num6"], name: "index_loto_results_on_num6"
    t.index ["num_add"], name: "index_loto_results_on_num_add"
    t.index ["result_date"], name: "index_loto_results_on_result_date"
    t.index ["step"], name: "index_loto_results_on_step"
    t.index ["total_even"], name: "index_loto_results_on_total_even"
    t.index ["total_odd"], name: "index_loto_results_on_total_odd"
    t.index ["toto_type"], name: "index_loto_results_on_toto_type"
    t.index ["weekday"], name: "index_loto_results_on_weekday"
  end
end
