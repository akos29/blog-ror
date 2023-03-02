# == Schema Information
#
# Table name: users
#
#  id            :bigint           not null, primary key
#  name          :string
#  bio           :text
#  photo         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  posts_counter :integer
#
class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  def show_recent_posts
    posts.where(author_id: id).first(3)
  end
end
