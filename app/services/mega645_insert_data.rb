class Mega645InsertData
  LOTO_TYPE = "mega645"
  WEEKDAY_MAPPING = {
    "Sun" => 1,
    "Mon" => 2,
    "Tue" => 3,
    "Wed" => 4,
    "Thu" => 5,
    "Fri" => 6,
    "Sat" => 7
  }

  def initialize(data, updatable: false)
    @data = data
    @updatable = updatable

    # example data structure
    # [
    #   {
    #     step: 1208,
    #     date: "07/06/2024",
    #     day_of_week: "Fri",
    #     num1: 15,
    #     num2: 19,
    #     num3: 24,
    #     num4: 25,
    #     num5: 27,
    #     num6: 39,
    #     price: 32584730500,
    #     jackpot: 0
    #   }
    # ]
  end

  def call
    data.each do |item|
      insert_result(item)
    end
  end

  private

  attr_reader :data, :updatable

  def insert_result(item)
    result = LotoResult.find_or_initialize_by(step: item[:step], toto_type: LOTO_TYPE)

    attributes = {
      num1: item[:num1],
      num2: item[:num2],
      num3: item[:num3],
      num4: item[:num4],
      num5: item[:num5],
      num6: item[:num6],
      num_add: item[:num_add],
      total_odd: total_odd(item),
      total_even: total_even(item),
      toto_type: LOTO_TYPE,
      jackpot: item[:jackpot]&.to_i.positive?,
      jackpot1_price: item[:price],
      weekday: WEEKDAY_MAPPING[item[:day_of_week]],
      result_date: item[:date],
      step: item[:step]
    }
    result.assign_attributes(attributes)
    result.save!
  end

  def total_odd(item)
    count = 0
    6.times.each do |n|
      number = item["num#{n + 1}".to_sym]
      count = count + 1 if number % 2 != 0
    end
    count
  end

  def total_even(item)
    count = 0
    6.times.each do |n|
      number = item["num#{n + 1}".to_sym]
      count = count + 1 if number % 2 == 0
    end
    count
  end
end
