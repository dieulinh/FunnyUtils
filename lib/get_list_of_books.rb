require "nokogiri"
require "open-uri"

class GetListOfTopBooks
  def self.call(url=nil)
    doc = get_html(url||"https://it-ebooks.org")
    get_elements(doc, "div.col-md-6").each do |book|
      puts get_element(book, "div.col-md-8 > p > a").text
    end
  end

  def self.get_html(url)
    Nokogiri::HTML(open(url))
  end

  def self.get_element(html, selector)
    html.at_css(selector)
  end

  def self.get_elements(html, selector)
    html.css(selector)
  end

end