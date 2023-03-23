# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :bigint           not null
#  post_id    :bigint           not null
#
# Indexes
#
#  index_comments_on_author_id  (author_id)
#  index_comments_on_post_id    (post_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#  fk_rails_...  (post_id => posts.id)
#
require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(name: 'Jane', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  post = Post.create(author: user, title: 'Hello', text: 'This is my first post')
  Comment.create(post:, author: user, text: 'this is where the comment text goes')

  it 'comments counter should be 1' do
    expect(post.comments_count).to eq 2
  end
end
