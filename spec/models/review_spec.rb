require 'rails_helper'

describe Review do
    context '(associations)' do
        it { should belong_to(:product) }
        it { should belong_to(:user) }
    end

    context '(validations)' do
        it { should validate_presence_of(:content_body) }
        it { should validate_presence_of(:rating) }

        it { should validate_length_of(:content_body).is_at_least(50) }
        it { should validate_length_of(:content_body).is_at_most(250) }

        it { should validate_numericality_of(:rating).only_integer }
        it { should validate_numericality_of(:rating).is_greater_than_or_equal_to(1) }
        it { should validate_numericality_of(:rating).is_less_than_or_equal_to(5) }
    end

    context '(helper methods)' do
        it '#author should return the username of the author' do
            product = Product.create!(name: 'Nduja', cost: 5.00, country_of_origin: 'Italy')
            user = User.create!(username: 'Jaime', email: 'test1', password: '12345')
            review = user.reviews.create!(product_id: product.id, content_body: "#{'a' * 50}", rating: 5)
            expect(review.author).to eq 'Jaime'
        end
    end
end
