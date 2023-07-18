require 'rails_helper'

RSpec.describe 'about/index.html.erb', type: :system do
  describe 'user index page' do
    it 'shows the right content', negative: true do
      visit about_index_path
      expect(page).to_not have_content('Posts')
    end

    it 'shows the right content', positive: true do
      visit about_index_path
      assert_selector 'h1', text: 'About Us'
    end
  end
end
