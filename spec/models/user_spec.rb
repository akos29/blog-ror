# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  bio                    :text
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  photo                  :string
#  posts_count            :integer
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  surname                :string
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Abebe', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

  before { subject.save }

  it 'name must not be blank' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts counter must be greater than or equal to 0' do
    subject.posts_count = -1
    expect(subject).to_not be_valid
  end

  it 'is should show recent comments' do
    post = Post.new(author: subject, title: 'About Rais Rspec', text: 'Hello')
    comment = Comment.create(post:, author: subject, text: 'my comment')
    expect(comment.text).to eq('my comment')
  end

  it 'is should show recent posts (show_recent_posts) ' do
    Post.create(author: subject, title: 'About Rais Rspec', text: 'Hello')
    expect(subject.show_recent_posts.length).to eq 1
  end
end
