class CreateLoto55Numbers < ActiveRecord::Migration[7.2]
  def change
    create_table :loto55_numbers do |t|
      t.integer :number, index: true
      t.integer :total_lt, index: true
      t.integer :total_jackpot_lt, index: true
      t.integer :total_lt_tue, index: true
      t.integer :total_lt_thu, index: true
      t.integer :total_lt_sat, index: true
      t.integer :total_lt_odd_day_of_month, index: true
      t.integer :total_lt_even_day_of_month, index: true
    end
  end
end
