require 'rails_helper'
describe 'posts#show', type: :feature do
  describe 'post show page' do
    before(:each) do
      @user1 = User.create!(name: 'Pepe', photo: 'https://pepe', bio: 'nobio', posts_counter: 0)
      @user2 = User.create!(name: 'Pótamo', photo: 'https://pótamo', bio: 'some', posts_counter: 0)
      @post1 = @user1.posts.create!(title: 'Pepe1 Post', text: 'Pepe1 text', comments_counter: 0,likes_counter: 1)
      @post2 = @user1.posts.create!(title: 'Pepe2 Post', text: 'Pepe2 text', comments_counter: 0,likes_counter: 0)
      @post3 = @user1.posts.create!(title: 'Pepe3 Post', text: 'Pepe3 text', comments_counter: 0,likes_counter: 0)
      @post4 = @user1.posts.create!(title: 'Pepe4 Post', text: 'Pepe4 text', comments_counter: 0,likes_counter: 0)
      @comment1 = @post1.comments.create!(text: 'Hi there!', author_id: @user2.id)
      @comment2 = @post1.comments.create!(text: 'Nice to hear from you again', author_id: @user1.id)
      visit(user_post_path(@user1, @post1))
    end

    scenario 'I can see the post's title' do
      expect(page).to have_content('Pepe1 Post')
    end

    scenario 'I can see who wrote the post' do
      expect(page).to have_content(@user1.name)
    end

    scenario 'I can see how many comments it has' do
      expect(page).to have_content("Comments: #{@post1.comments_counter}")
    end

    scenario 'I can see how many likes it has' do
      expect(page).to have_content("Likes: #{@post1.likes_counter}")
    end

    scenario 'I can see the post body' do
      expect(page).to have_content('Pepe1 text')
    end

    scenario 'I can see the username of each commentor' do
      expect(page).to have_content(@user1.name)
      expect(page).to have_content(@user2.name)
    end

    scenario 'I can see the comment each commentor left' do
      expect(page).to have_content('Hi there!')
      expect(page).to have_content('Nice to hear from you again')
    end
  end
end
