require 'rails_helper'
RSpec.describe 'users#show', type: :feature do
  describe 'users show' do
    before(:each) do
      @user1 = User.create!(name: 'Abebe', photo: 'https://i.pravatar.cc/150?u=fake@pravatar.com',
                            bio: 'Teacher from Mexico.')
      @user2 = User.create!(name: 'Kebede', photo: 'https://i.pravatar.cc/150?u=fake@pravatar.com',
                            bio: 'Teacher from Mexico.')
      @post1 = @user1.posts.create!(title: 'Abebe Post 1', text: 'Abebe text')
      @post2 = @user1.posts.create!(title: 'Abebe2 Post', text: 'Abebe2 text')
      @post3 = @user1.posts.create!(title: 'Abebe3 Post', text: 'Abebe3 text')
      @post4 = @user1.posts.create!(title: 'Abebe4 Post', text: 'Abebe4 text')
      @comment = @post1.comments.create!(text: 'Hi there!', author_id: @user2.id)
      visit(user_path(@user1))
    end

    scenario "I can see the user's profile picture", positive: true do
      expect(page).to have_xpath("//img[contains(@src,'https://i.pravatar.cc/150?u=fake@pravatar.com')]")
    end

    scenario "I can see the user's username", positive: true do
      expect(page).to have_content('Abebe')
    end

    scenario 'I can see the number of posts the user has written', positive: true do
      expect(page).to have_content('Number of Posts: 8')
    end

    scenario "I can see the user's bio", positive: true do
      expect(page).to have_content('Teacher from Mexico.')
    end

    scenario "I can see the user's first 3 posts", positive: true do
      expect(page).to have_content 'Abebe4 text'
      expect(page).to have_content 'Abebe2 text'
      expect(page).to have_content 'Abebe3 text'
    end

    scenario "I can see a button that lets me view all of a user's posts", positive: true do
      expect(page).to have_link('See all posts')
    end

    scenario "When I click to see all posts, it redirects me to the user's posts index page", positive: true do
      click_link 'See all posts'
      expect(page).to have_current_path("/users/#{@user1.id}/posts")
    end

    scenario "I shouldn't see the user's age", negative: true do
      expect(page).to_not have_content('Age')
    end

    scenario 'I should not see the number of posts the user has written other than the one created', negative: true do
      expect(page).to_not have_content('Number of Posts: 5')
    end

    scenario "I should not a bio other than the user's bio", negative: true do
      expect(page).to_not have_content('nobio')
    end

    scenario "I can see the user's first 3 posts", negative: true do
      expect(page).to_not have_content 'Abebe Post 1'
    end

    scenario "I cannot see a button that lets me like a user's posts", negative: true do
      expect(page).to_not have_link('Like')
    end

    scenario "When I click to see all posts, it should not redirects me to the user's index page", negative: true do
      click_link 'See all posts'
      expect(page).to_not have_current_path('/users')
    end
  end
end
