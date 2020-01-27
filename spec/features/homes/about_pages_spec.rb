require 'rails_helper'

describe 'The \'About\' page' do
    it 'displays a random \'Bojack Horseman\' quote' do
        Faker::Config.random = Random.new(108)
        visit '/'
        click_on 'About'
        expect(page).to have_content 'The universe is a cruel, uncaring void. The key to being happy isn\'t a search for meaning. It\'s to just keep yourself busy with unimportant nonsense, and eventually, you\'ll be dead.'
    end
end
