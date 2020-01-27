require 'rails_helper'

describe 'the sign-in process' do
    it "begins a session" do
        User.create!({username: 'CapyTest', email: 'capytest@test.com', password: 'password'})
        visit '/'
        click_on 'Sign in'
        fill_in 'ident', :with => 'capytest@test.com'
        fill_in 'password', :with => 'password'
        page.click_on 'Sign me in!'
        expect(page).to have_content 'Welcome back, CapyTest!'
    end
    it "gives error when credentials are incorrect" do
        visit '/'
        click_on 'Sign in'
        fill_in 'ident', :with => 'test@test.com'
        fill_in 'password', :with => ''
        page.click_on 'Sign me in!'
        expect(page).to have_content 'There was a problem signing in. Please try again.'
    end
end
