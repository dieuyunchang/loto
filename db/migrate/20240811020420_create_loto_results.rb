class CreateLotoResults < ActiveRecord::Migration[7.2]
  def change
    create_table :loto_results do |t|
      t.integer :num1, index: true
      t.integer :num2, index: true
      t.integer :num3, index: true
      t.integer :num4, index: true
      t.integer :num5, index: true
      t.integer :num6, index: true
      t.integer :num_add, index: true
      t.integer :total_odd, index: true
      t.integer :total_even, index: true
      t.integer :toto_type, index: true
      t.boolean :jackpot, index: true
      t.boolean :jackpot1_price, index: true

      t.integer :weekday, index: true  # 0 is sun, 1: mon,... 6:sat
      t.date :result_date, index: true
      t.integer :step, index: true

      t.timestamps
    end
  end
end
