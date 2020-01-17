require 'rails_helper'

describe Product do
    context 'associations' do
        it { should have_many(:reviews) }
    end

    # context 'validations' do
    #     it { should validate_presence_of(:name) }
    #     it { should validate_presence_of(:cost) }
    #
    #     it { should validate_uniqueness_of(:name) }
    #
    #     it { should validate_length_of(:name).is_at_most(150) }
    #     it { should validate_length_of(:country_of_origin).is_at_most(150) }
    # end
end
