# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#  post_id    :bigint           not null
#
class Like < ApplicationRecord
  belongs_to :users
  belongs_to :posts
end
