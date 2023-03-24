# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :bigint           not null
#  post_id    :bigint           not null
#
# Indexes
#
#  index_likes_on_author_id  (author_id)
#  index_likes_on_post_id    (post_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#  fk_rails_...  (post_id => posts.id)
#
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
