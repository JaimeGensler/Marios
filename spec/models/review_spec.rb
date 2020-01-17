require 'rails_helper'

describe Review do
    context 'associations' do
        it { should belong_to(:product) }
    end

    # context 'validations' do
    #     it { should validate_presence_of(:author) }
    #     it { should validate_presence_of(:content_body) }
    #
    #     it { should validate_length_of(:author).is_at_most(150) }
    #     it { should validate_length_of(:content_body).is_at_most(300) }
    #
    #     it do
    #         should validate_numericality_of(:rating).
    #         is_less_than_or_equal_to(5).
    #         is_greater_than_or_equal_to(1)
    #     end
    # end
end
