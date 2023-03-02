# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :bigint           not null
#
class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
end
