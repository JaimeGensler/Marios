class Product < ApplicationRecord
    has_many :reviews, dependent: :destroy

    validates :name, presence: true
    validates :cost, presence: true
    validates :country_of_origin, presence: true

    scope :most_recent, -> { order(created_at: :desc).limit(3) }
    scope :by_country, -> (country_name_parameter) {
        where('country_of_origin ilike ?', "%#{country_name_parameter}%")
        .limit(3)
    }
    scope :most_reviews, -> {(
        select('products.id, products.name, products.cost, products.country_of_origin, COUNT(reviews.id) AS review_count')
        .joins(:reviews)
        .group('products.id')
        .order('review_count DESC')
        .limit(1)
        .first
    )}
    scope :random, -> { offset(rand(Product.count)).first }

    before_save(:titleize_product)

    private
    def titleize_product
        self.name = self.name.titleize
    end
end
