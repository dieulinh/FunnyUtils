require "nokogiri"
require "open-uri"

class GetListOfTopBooksService
  def self.call
    doc = get_html("https://it-ebooks.org/")
    get_elements(doc, "div.md-col-6").each do |element|
      name_element = get_element(element, "div.row.col-md-8 > p > a").text
      puts name_element
      # price_element = get_element(item, "div.price input")

      # next unless valid_dish?(price_element["value"].to_f)

      # item_number += 1
      # insert_or_update_dish(name_element.text, price_element["value"].to_f, item_number)
    end
  end
end