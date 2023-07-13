class Post < ApplicationRecord
  after_save :update_post_counter

  private

  def update_post_counter
    author.increment!(:posts_counter)
  end
    
  belongs_to :author, class_name: 'User'
  has_many :comment
  has_many :like
end
