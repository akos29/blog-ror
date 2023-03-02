# == Schema Information
#
# Table name: posts
#
#  id               :bigint           not null, primary key
#  title            :string
#  text             :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  author_id        :bigint           not null
#  likes_counter    :integer
#  comments_counter :integer
#
class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', counter_cache: true
  has_many :comments
  has_many :likes

  # updates the posts counter for a user
  def update_posts_counter
    author.increment!(:posts_counter)
  end

  # returns the 5 most recent comments for a given post.
  def show_recent_comments
    comments.where(post_id: id).first(5)
  end
end
