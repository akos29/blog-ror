require 'rails_helper'

RSpec.describe 'User Index', type: :feature do
  describe 'user index page' do
    it 'shows the right content', positive: true do
      visit users_path
      # sleep(2)
      expect(page).to have_content('Users List')
    end

    # it 'shows the right content', negative: true do
    #   visit about_index_path
    #   assert_selector 'h1', text: 'About Us'
    # end
  end
end
