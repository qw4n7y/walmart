require 'open-uri'

class ReviewsFetcher

  attr_accessor :product_id
  attr_accessor :reviews

  def initialize(product_id)
    @product_id = product_id
    @reviews = {}
  end

  def fetch
    page = 1
    done = false

    while !done
      uri = "https://www.walmart.com/reviews/product/#{@product_id}?limit=20&page=#{page}"
      html = Nokogiri::HTML(open(uri))

      review_elements = html.css(".customer-review-body")

      review_elements.each do |review_element|
        title = review_element.css(".customer-review-title").text
        message = review_element.css(".customer-review-text").text

        @reviews[ title ] = message
      end

      page = page + 1
      done = review_elements.empty?
    end
  end

end