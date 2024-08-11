class Mega645UpdateLotoNumber
  def initialize(loto_result)
    @loto_result = loto_result
  end

  def call
    return "Should be '#{Mega645InsertData::LOTO_TYPE}' type" unless loto_result.toto_type == Mega645InsertData::LOTO_TYPE

    6.times.each do |n|
      number = loto_result.try("num#{n + 1}".to_sym)
      loto_number = Loto45Number.find_or_create_by(number: number)
      day_of_month = loto_result.date&.day&.to_i

      attributes = {
        total_lt: number.total_lt + 1,
        total_jackpot_lt: loto_result.jackpot ? number.total_jackpot_lt&.to_i + 1 : number.total_jackpot_lt,
        total_lt_wed: Mega645InsertData::WEEKDAY_MAPPING["Wed"] == loto_result.weekday ? number.total_lt_wed&.to_i + 1 : number.total_lt_wed,
        total_lt_fri: Mega645InsertData::WEEKDAY_MAPPING["Fri"] == loto_result.weekday ? number.total_lt_fri&.to_i + 1 : number.total_lt_fri,
        total_lt_sun: Mega645InsertData::WEEKDAY_MAPPING["Sun"] == loto_result.weekday ? number.total_lt_sun&.to_i + 1 : number.total_lt_sun,
        total_lt_odd_day_of_month: day_of_month % 2 != 0 ? number.total_lt_odd_day_of_month&.to_i + 1 : number.total_lt_odd_day_of_month,
        total_lt_even_day_of_month: day_of_month % 2 == 0 ? number.total_lt_even_day_of_month&.to_i + 1 : number.total_lt_even_day_of_month
      }
      loto_number.update(attributes)
    end
  end

  private
  attr_reader :loto_result
end
