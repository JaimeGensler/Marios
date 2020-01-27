require 'rails_helper'

describe 'The sign-out process' do
    it 'ends a session' do
        User.create!({username: 'CapyTest', email: 'capytest@test.com', password: 'password'})
        visit '/'
        click_on 'Sign in'
        fill_in 'ident', :with => 'capytest@test.com'
        fill_in 'password', :with => 'password'
        click_on 'Sign me in!'
        click_on 'Sign out'
        expect(page).to have_content 'Come back soon, CapyTest!'
    end
end
