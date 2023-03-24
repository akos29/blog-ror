# == Schema Information
#
# Table name: posts
#
#  id             :bigint           not null, primary key
#  comments_count :integer
#  likes_count    :integer
#  text           :text
#  title          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  author_id      :bigint           not null
#
# Indexes
#
#  index_posts_on_author_id  (author_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#
class Post < ApplicationRecord
  attribute :comments_count, :integer, default: 0
  attribute :likes_count, :integer, default: 0

  validates :title, presence: true, length: { in: 1..250 }
  validates :comments_count, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_count, comparison: { greater_than_or_equal_to: 0 }

  belongs_to :author, class_name: 'User', foreign_key: 'author_id', counter_cache: true
  has_many :comments
  has_many :likes

  after_save :update_posts_counter

  # returns the 5 most recent comments for a given post.
  def show_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  # updates the posts counter for a user
  private

  def update_posts_counter
    author.increment!(:posts_count)
  end
end
