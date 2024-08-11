class LotoResult < ApplicationRecord
  # table_name "loto_results"

  after_create :update_loto_number

  def update_loto_number
    Mega645UpdateLotoNumber.new(self).call
  end
end
