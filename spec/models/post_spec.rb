require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(name: 'Kibre', photo: 'https://i.pravatar.cc/150?u=fake@pravatar.com', bio: 'Rails Developer')

  subject { Post.new(author: user, title: 'About Rais Rspec', text: 'Hello') }

  before { subject.save }

  it 'Title must not be blank' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'Title must not exceed 250 characters' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'Comments counter must be greater than or equal to 0' do
    subject.comments_count = -1
    expect(subject).to_not be_valid
  end

  it 'Likes counter must be greater than or equal to 0' do
    subject.likes_count = -1
    expect(subject).to_not be_valid
  end

  it 'is should show recent comments' do
    comment = Comment.create(post: subject, author: user, text: 'my comment')
    expect(comment.text).to eq('my comment')
  end

  it 'is should show recent comments through (show_recent_comments) ' do
    Comment.create(post: subject, author: user, text: 'my comment')
    expect(subject.show_recent_comments.length).to eq 1
  end
  it 'is should update post counter' do
    previous_count = user.posts_count
    subject.save
    expect(user.posts_count).to eq(previous_count + 1)
  end
end
