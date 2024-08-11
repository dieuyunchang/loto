require "net/http"
require "uri"
require "open-uri"
require "nokogiri"

class Mega645DataFetcher
  BASE_URL = "https://xoso.com.vn/XSDienToan/GetMoreMega645"

  DAYS_OF_WEEK = {
    "Chủ Nhật" => "Sun",
    "Thứ Hai" => "Mon",
    "Thứ Ba" => "Tue",
    "Thứ Tư" => "Wed",
    "Thứ Năm" => "Thu",
    "Thứ Sáu" => "Fri",
    "Thứ Bảy" => "Sat",
    "Thứ 2" => "Mon",
    "Thứ 3" => "Tue",
    "Thứ 4" => "Wed",
    "Thứ 5" => "Thu",
    "Thứ 6" => "Fri",
    "Thứ 7" => "Sat"
  }

  def fetch_and_insert_data(updatable: false)
    page_index = 1

    loop do
      url = URI("#{BASE_URL}?pageIndex=#{page_index}")
      response = URI.open(url).read
      doc = Nokogiri::HTML(response, nil, "UTF-8")

      # Break if no content is found or if the page index reaches 3
      break if doc.css("a[title]").empty? || page_index == 3

      parsed_data = parse_response(doc)

      Mega645InsertData(parsed_data, updatable: updatable)

      sleep(5)
      page_index += 1
    end
  end

  private

  def parse_response(doc)
    data = []

    doc.css("a[title]").each do |element|
      date = element.css('header h2 a[title^="ngày"]').text.strip.split.last
      day_of_week = extract_day_of_week(element.css("header h2 a[title]:nth-child(1)").text.strip)
      step = element.css(".jackpot-item strong").text.gsub("#", "").to_i
      numbers = element.css(".jackpot-item .btn-results").map(&:text).map(&:to_i)
      jackpot = element.css(".jackpot-item table tbody tr:nth-child(1) td:nth-child(3)").text.strip.to_i
      price = element.css(".jackpot-item table tbody tr:nth-child(1) td:nth-child(4)").text.strip.gsub(/[^\d]/, "").to_i

      next if step.blank? || step.zero?

      data << {
        step: step,
        date: date,
        day_of_week: day_of_week,
        num1: numbers[0],
        num2: numbers[1],
        num3: numbers[2],
        num4: numbers[3],
        num5: numbers[4],
        num6: numbers[5],
        price: price,
        jackpot: jackpot
      }
    end

    data
  end

  def extract_day_of_week(date_string)
    match_data = date_string.match(/(Chủ Nhật|Thứ ([A-Z][a-z]|[1-7])+)/)
    return nil unless match_data # Ensure there's a match before accessing it
    vietnamese_day = match_data[0]
    DAYS_OF_WEEK[vietnamese_day]
  end
end
