require 'rails_helper'

RSpec.describe 'Posts Index', type: :feature do
  describe 'Posts index page' do
    before(:each) do
      @user1 = User.create!(name: 'Abebe', photo: 'https://i.pravatar.cc/150?u=fake@pravatar.com',
                            bio: 'Teacher from Mexico.')
      @user2 = User.create!(name: 'Kebede', photo: 'https://i.pravatar.cc/150?u=fake@pravatar.com',
                            bio: 'Teacher from Mexico.')
      @post1 = @user1.posts.create!(title: 'Abebe1 Post', text: 'Abebe text')
      @post2 = @user1.posts.create!(title: 'Abebe2 Post', text: 'Abebe2 text')
      @post3 = @user1.posts.create!(title: 'Abebe3 Post', text: 'Abebe3 text')
      @post4 = @user1.posts.create!(title: 'Abebe4 Post', text: 'Abebe4 text')
      @comment1 = @post1.comments.create!(text: 'Hi there!', author_id: @user2.id)
      @comment2 = @post1.comments.create!(text: 'Nice to hear from you again', author_id: @user1.id)
      visit(user_posts_path(@user1))
    end
    scenario "I can see the user's profile picture", positive: true do
      expect(page).to have_xpath("//img[contains(@src,'https://i.pravatar.cc/150?u=fake@pravatar.com')]")
    end

    scenario "I can see the user's username", positive: true do
      expect(page).to have_content('Kebede')
    end

    scenario 'I can see the number of posts the user has written', positive: true do
      expect(page).to have_content('Number of posts: 8')
    end

    scenario "I can see a post's title", positive: true do
      expect(page).to have_content('Abebe1 Post')
    end

    scenario "I can see some of the post's body", positive: true do
      expect(page).to have_content('Abebe2 Post')
    end

    scenario 'I can see the first comments on a post', positive: true do
      expect(page).to have_content('Nice to hear from you again')
    end

    scenario 'I can see how many comments a post has', positive: true do
      expect(page).to have_content("Comments: #{@post1.comments_count}")
    end

    scenario 'I can see how many likes a post has', positive: true do
      expect(page).to have_content("Likes: #{@post1.likes_count}")
    end

    scenario "When I click on a post, it redirects me to that post's show page", positive: true do
      visit(user_post_path(@user1, @post1))
      expect(page).to have_current_path user_post_path(@user1, @post1)
    end
  end
end
