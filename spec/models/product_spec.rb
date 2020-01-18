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
end
