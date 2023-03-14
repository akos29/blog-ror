require 'rails_helper'
RSpec.describe 'users#show', type: :feature do
  describe 'users show' do
    before(:each) do
      @user1 = User.create!(name: 'Pepe', photo: 'https://pepe', bio: 'nobio', posts_counter: 0)
      @user2 = User.create!(name: 'Pótamo', photo: 'https://pótamo', bio: 'some', posts_counter: 0)
      @post1 = @user1.posts.create!(title: 'Pepe1 Post', text: 'Pepe1 text', comments_counter: 0,likes_counter: 0)
      @post2 = @user1.posts.create!(title: 'Pepe2 Post', text: 'Pepe2 text', comments_counter: 0,likes_counter: 0)
      @post3 = @user1.posts.create!(title: 'Pepe3 Post', text: 'Pepe3 text', comments_counter: 0,likes_counter: 0)
      @post4 = @user1.posts.create!(title: 'Pepe4 Post', text: 'Pepe4 text', comments_counter: 0,likes_counter: 0)
      @comment = @post1.comments.create!(text: 'Hi there!', author_id: @user2.id)
      visit(user_path(@user1))
    end

    scenario "I can see the user's profile picture" do
      expect(page).to have_xpath("//img[contains(@src,'https://pepe')]")
    end

    scenario "I can see the user's username" do
      expect(page).to have_content('Pepe')
    end

    scenario "I can see the number of posts the user has written" do
      expect(page).to have_content('Number of posts: 4')
    end

    scenario "I can see the user's bio" do
      expect(page).to have_content('nobio')
    end

    scenario "I can see the user's first 3 posts" do
      expect(page).to have_content 'Pepe4 text'
      expect(page).to have_content 'Pepe3 text'
      expect(page).to have_content 'Pepe2 text'
    end

    scenario "I can see a button that lets me view all of a user's posts" do
      expect(page).to have_link('See all posts') 
    end

    scenario "When I click to see all posts, it redirects me to the user's posts index page" do
      click_link 'See all posts'
      expect(page).to have_current_path("/users/#{@user1.id}/posts/")
    end
  end

  describe 'click detail' do
    before(:each) do
      @user = User.create!(name: 'Pepe', photo: 'https://pepe', bio: 'nobio', posts_counter: 0)
      @post = @user.posts.create!(title: 'Pepe1 Post', text: 'Pepe1 text', comments_counter: 0,likes_counter: 0)
      visit(user_path(@user))
    end

    scenario "When I click a user's post, it redirects me to that post's show page" do
      click_link 'Detail'
      expect(page).to have_current_path user_post_path(@user, @post)
    end
  end
end

