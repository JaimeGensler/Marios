require 'rails_helper'

describe Product do
    context '(associations)' do
        it { should have_many(:reviews) }
    end

    context '(validations)' do
        it { should validate_presence_of(:name) }
        it { should validate_presence_of(:cost) }
        it { should validate_presence_of(:country_of_origin) }
    end

    context '(callbacks)' do
        it 'titleizes the name of a product before save' do
            product = Product.create({name: 'nduja', cost: 5.00, country_of_origin: 'Italy'})
            expect(product.name).to(eq('Nduja'))
        end
    end
end
