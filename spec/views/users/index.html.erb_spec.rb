require 'rails_helper'

RSpec.describe 'users#index', type: :feature do
  describe 'users index page' do
    before(:each) do
      User.create!(name: 'Pepe', photo: 'https://pepe', bio: 'none', posts_counter: 0)
      User.create!(name: 'Pótamo', photo: 'https://pótamo', bio: 'some', posts_counter: 2)
      visit root_path
      @user = User.first!
    end

    scenario 'I can see the username of all other users.' do
      expect(page).to have_content('Pepe').and have_content('Pótamo')
    end

    scenario 'I can see the profile picture for each user.' do
      expect(page).to have_xpath("//img[contains(@src,'https://pepe')]")
      expect(page).to have_xpath("//img[contains(@src,'https://pótamo')]")
    end

    scenario 'I can see the number of posts each user has written.' do
      expect(page).to have_content('Number of posts: 2')
    end

    scenario "When I click on a user, I am redirected to that user's show page" do
      visit(user_path(@user.id))
      expect(page).to have_content('Pepe')
      expect(page).not_to have_content('Pótamo')
    end
  end
end