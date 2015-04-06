require 'spec_helper'

module Txtblx
  feature 'visitor on homepage' do
    scenario 'sees text from textblock', :focus => true do
      create(:textblock, :published, key: 'homepage.welcome', text_html: 'Welcome to Dummy App')

      visit('/')

      expect(page).to have_content('Welcome to Dummy App')
    end
  end
end
