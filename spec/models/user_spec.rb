require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Abebe', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts counter should be greater than or equal to 0' do
    subject.posts_count = -1
    expect(subject).to_not be_valid
  end

  it 'recent comments should be present' do
    post = Post.new(author: subject, title: 'About Rais Rspec', text: 'Hello')
    comment = Comment.create(post:, author: subject, text: 'my comment')
    expect(comment.text).to eq('my comment')
  end

  it 'is should show recent posts (show_recent_posts) ' do
    Post.create(author: subject, title: 'About Rails Rspec', text: 'Hello')
    expect(subject.show_recent_posts.length).to eq 1
  end
end
