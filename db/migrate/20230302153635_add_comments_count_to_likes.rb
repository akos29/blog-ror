class AddCommentsCountToLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :likes_count, :integer
  end
end
