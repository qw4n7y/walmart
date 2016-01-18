class Product < ActiveRecord::Base

  validates :product_id, presence: true

  before_create :fetch_reviews

  has_many :reviews, autosave: true

  protected

  def fetch_reviews
    fetcher = ReviewsFetcher.new(product_id)
    fetcher.fetch

    fetcher.reviews.each do |title, message|
      reviews.build({title: title, message: message})
    end
  end

end
