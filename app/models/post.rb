class Post < ApplicationRecord
  after_save  :update_posts_counter
  
  belongs_to :author, class_name: 'User'
  has_many :comment
  has_many :like
  
  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
