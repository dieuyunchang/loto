class CreateLoto45Numbers < ActiveRecord::Migration[7.2]
  def change
    create_table :loto45_numbers do |t|
      t.integer :number, index: true
      t.integer :total_lt, index: true
      t.integer :total_jackpot_lt, index: true
      t.integer :total_lt_wed, index: true
      t.integer :total_lt_fri, index: true
      t.integer :total_lt_sun, index: true
      t.integer :total_lt_odd_day_of_month, index: true
      t.integer :total_lt_even_day_of_month, index: true
    end
  end
end
