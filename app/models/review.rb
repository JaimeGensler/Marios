class Review < ApplicationRecord
    belongs_to :product
    belongs_to :user

    validates :rating, presence: true
    validates :content_body, presence: true

    validates_numericality_of :rating, only_integer: true
    validates_numericality_of :rating, greater_than_or_equal_to: 1
    validates_numericality_of :rating, less_than_or_equal_to: 5

    validates_length_of :content_body, minimum: 50
    validates_length_of :content_body, maximum: 250

    def author
        self.user.username
    end
end
