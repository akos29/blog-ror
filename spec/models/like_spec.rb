require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  myPost = Post.create(author: user, title: 'Hello', text: 'This is my first post')

  subject { Like.new(post:myPost, author: user) }

  before { subject.save }

  it 'likes counter should be incremented' do
    expect(myPost.likes_count).to eq 2
  end
end