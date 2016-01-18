class Product < ActiveRecord::Base

  validates :product_id, presence: true
  validates :freetext, presence: true

  before_create :fetch_reviews

  has_many :reviews, autosave: true

  protected

  def fetch_reviews
    fetcher = ReviewsFetcher.new(product_id)
    fetcher.fetch

    fetcher.reviews.each do |title, message|
      next unless message.include?(freetext)
      reviews.build({title: title, message: message})
    end
  end

end
