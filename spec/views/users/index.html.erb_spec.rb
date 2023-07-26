require 'rails_helper'

RSpec.describe 'users#index', type: :feature do
  describe 'users index page' do
    before(:each) do
      @user1 = User.create!(name: 'Abebe', photo: 'https://i.pravatar.cc/150?u=fake@pravatar.com',
                            bio: 'Teacher from Mexico.')
      @user2 = User.create!(name: 'Kebede', photo: 'https://i.pravatar.cc/150?u=fake@pravatar.com',
                            bio: 'Teacher from Mexico.')
      visit root_path
    end

    scenario 'I can see the username of all other users.' do
      expect(page).to have_content('Abebe')
    end

    it 'I can see the profile picture for each user.' do
      expect(page).to have_xpath("//img[contains(@src,'https://i.pravatar.cc/150?u=fake@pravatar.com')]")
    end
    it 'I can see the number of posts each user has written.' do
      expect(page).to have_content('Number of Posts:')
    end

    it "When I click on a user, I am redirected to that user's show page" do
      visit(users_path(@user1.id))
      expect(page).to have_content('Abebe')
      expect(page).not_to have_content('Pótamo')
    end
  end
end
