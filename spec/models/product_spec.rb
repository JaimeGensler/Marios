require 'rails_helper'

describe Product do
    context '(associations)' do
        it { should have_many :reviews }
    end

    context '(validations)' do
        it { should validate_presence_of :name }
        it { should validate_presence_of :cost }
        it { should validate_presence_of :country_of_origin }
    end

    context '(callbacks)' do
        it 'titleizes the name of a product before save' do
            product = Product.create!(name: 'nduja', cost: 5.00, country_of_origin: 'Italy')
            expect(product.name).to eq 'Nduja'
        end
    end

    context '(scopes)' do
        it '.most_recent should return the 3 most recently added products' do
            p1 = Product.create!(name: 'Nduja', cost: 5.00, country_of_origin: 'Italy')
            p2 = Product.create!(name: 'Kimchi', cost: 5.00, country_of_origin: 'Japan')
            p3 = Product.create!(name: 'Salsa Verde', cost: 5.00, country_of_origin: 'Mexico')
            p4 = Product.create!(name: 'Ham', cost: 5.00, country_of_origin: 'Canada')
            expect(Product.most_recent).to eq [p4, p3, p2]
        end
        it '.by_country should return up to 3 products from a given country' do
            p1 = Product.create!(name: 'Wine', cost: 5.00, country_of_origin: 'Canada')
            p2 = Product.create!(name: 'Cheese', cost: 5.00, country_of_origin: 'Canada')
            p3 = Product.create!(name: 'Chocolate', cost: 5.00, country_of_origin: 'USA')
            p4 = Product.create!(name: 'Ham', cost: 5.00, country_of_origin: 'Canada')
            expect(Product.by_country('Canada')).to eq [p1, p2, p4]
        end
        it '.most_reviews should return the 3 most recently added products' do
            p1 = Product.create!(name: 'Nduja', cost: 5.00, country_of_origin: 'Italy')
            p1.reviews.create!(author: 'Jaime', content_body: "#{'a' * 50}", rating: 5)
            p2 = Product.create!(name: 'Kimchi', cost: 5.00, country_of_origin: 'Japan')
            expect(Product.most_reviews).to eq p1
        end
        it '.random will return a random product' do
            srand(12345)
            p1 = Product.create!(name: 'Nduja', cost: 5.00, country_of_origin: 'Italy')
            p2 = Product.create!(name: 'Kimchi', cost: 5.00, country_of_origin: 'Japan')
            p3 = Product.create!(name: 'Salsa Verde', cost: 5.00, country_of_origin: 'Mexico')
            expect(Product.random).to eq p3
        end
    end
end
