require 'rails_helper'

RSpec.describe 'users#index', type: :feature do
  describe 'users index page' do
    before(:each) do
      User.create!(name: 'Abebe', photo: 'https://i.pravatar.cc/150?u=fake@pravatar.com',
                   bio: 'Teacher from Mexico.')
      User.create!(name: 'Kebede', photo: 'https://i.pravatar.cc/150?u=fake@pravatar.com',
                   bio: 'Teacher from Mexico.')
      visit root_path
      @user = User.first!
    end

    scenario 'I can see the username of all other users.' do
      expect(page).to have_content('Abebe')
      expect(page).to have_content('Kebede')
    end

    it 'I can see the profile picture for each user.' do
      expect(page).to have_xpath('')
      expect(page).to have_xpath("//img[contains(@src,'https://avatars.steamstatic.com/75bbbe287e759d46c539b54cc7c70e4acd14087c_full.jpg')]")
    end

    it 'I can see the number of posts each user has written.' do
      expect(page).to have_content('Number of posts: 2')
    end

    it "When I click on a user, I am redirected to that user's show page" do
      visit(users_path(@user.id))
      expect(page).to have_content('abebe')
      expect(page).not_to have_content('Pótamo')
    end
  end
end
