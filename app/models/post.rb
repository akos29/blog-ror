class Post < ApplicationRecord
  after_save  :update_posts_counter
  
  belongs_to :author, class_name: 'User'
  has_many :comment
  has_many :like
  
  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
