require 'open-uri'

class ReviewsFetcher

  attr_accessor :product_id
  attr_accessor :reviews

  def initialize(product_id)
    @product_id = product_id
    @reviews = {}
  end

  def fetch
    tmp = open("https://www.walmart.com/reviews/product/#{@product_id}")
    html = Nokogiri::HTML(tmp)

    html.css(".customer-review-body").each do |review_element|
      title = review_element.css(".customer-review-title").text
      message = review_element.css(".customer-review-text").text

      @reviews[ title ] = message
    end
  end

end