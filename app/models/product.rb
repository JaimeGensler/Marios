class Product < ApplicationRecord
    has_many :reviews, dependent: :destroy

    scope :most_recent, -> { order(created_at: :desc).limit(3) }
    scope :by_country, -> (country_name_parameter) {
        where('country_of_origin ilike ?', "%#{country_name_parameter}%")
    }
    scope :most_tasks, -> {(
        select('products.id, COUNT(review.id) AS review_count')
        .joins(:reviews)
        .group('products.id')
        .order('review_count DESC')
        .take(1)
        .first
    )}
end
