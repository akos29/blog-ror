require 'rails_helper'
RSpec.describe 'users#show', type: :feature do
  describe 'users show' do
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

    scenario 'I can see who wrote the post', positive: true do
      expect(page).to have_content(@user1.name)
    end

    scenario 'I can see how many comments it has', positive: true do
      expect(page).to have_content("Comments: #{@post1.comments_count}")
    end

    scenario 'I should see the correct number of comments', negative: true do
      expect(page).to_not have_content("Comments: #{@post1.comments_count + 1}")
    end

    scenario 'I can see how many likes it has' do
      expect(page).to have_content("Likes: #{@post1.likes_count}")
    end

    scenario 'I should see the correct number of likes' do
      expect(page).to_not have_content("Likes: #{@post1.likes_count + 1}")
    end

    scenario 'I can see the post body', positive: true do
      expect(page).to have_content('Abebe text')
    end

    scenario 'I can see the correct post body', negative: true do
      expect(page).to_not have_content('Abebe textsome other text')
    end

    scenario 'I can see the username of each commentor', positive: true do
      expect(page).to have_content(@user1.name)
      expect(page).to have_content(@user2.name)
    end

    scenario 'I can see the comment each commentor left', positive: true do
      expect(page).to have_content('Hi there!')
      expect(page).to have_content('Nice to hear from you again')
    end

    scenario 'I should not see any other comments text', negative: true do
      expect(page).to_not have_content('some other comments')
    end
  end
end
