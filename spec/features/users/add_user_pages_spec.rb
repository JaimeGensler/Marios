require 'rails_helper'

describe 'The register user process' do
    it 'adds a new user' do
        visit '/'
        click_link 'Register'
        fill_in 'user[username]', :with => 'CapyTest'
        fill_in 'user[email]', :with => 'capytest@test.com'
        fill_in 'user[password]', :with => 'password'
        fill_in 'user[password_confirmation]', :with => 'password'
        click_on 'Sign me up!'
        expect(page).to have_content 'You\'ve successfully signed up!'
        expect(page).to have_content 'CapyTest'
    end

    it 'returns an error when no user details are entered' do
        visit '/register'
        click_on 'Sign me up!'
        expect(page).to have_content 'There was a problem signing up.'
    end
end
