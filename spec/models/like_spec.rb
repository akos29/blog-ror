require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  my_post = Post.create(author: user, title: 'Hello', text: 'This is my first post')

  subject { Like.new(post: my_post, author: user) }

  before { subject.save }

  it 'likes counter should be incremented' do
    expect(my_post.likes_count).to eq 2
  end
end
