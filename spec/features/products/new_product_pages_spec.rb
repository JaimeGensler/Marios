require 'rails_helper'

describe 'The new product process' do
    it 'creates a new product if the user is an admin', :signed_in_admin do
        visit '/products/new'
        fill_in 'product[name]', :with => 'Kimchi Fried Rice'
        fill_in 'product[description]', :with => 'This is a very tasty dish.'
        fill_in 'product[cost]', :with => '8.00'
        fill_in 'product[country_of_origin]', :with => 'Japan'
        click_on 'Create product!'
        expect(page).to have_content 'Kimchi Fried Rice'
    end
    it 'returns an error when content does not pass validations', :signed_in_admin do
        visit '/products/new'
        click_on 'Create product!'
        #no product name is given
        fill_in 'product[description]', :with => 'This is a very tasty dish.'
        fill_in 'product[cost]', :with => '8.00'
        fill_in 'product[country_of_origin]', :with => 'Japan'
        click_on 'Create product!'
        expect(page).to have_content "Please fix these errors:\nName can't be blank"
    end
    it 'is not accessible for normal users', :signed_in_user do
        visit '/products/new'
        expect(page).to have_content 'You aren\'t authorized to visit that page.'
        expect(page).to have_current_path '/'
    end
    it 'is not accessible for users that are not signed in' do
        visit '/products/new'
        expect(page).to have_content 'You aren\'t authorized to visit that page.'
        expect(page).to have_current_path '/'
    end
end
