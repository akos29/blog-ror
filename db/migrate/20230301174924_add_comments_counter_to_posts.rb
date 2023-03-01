class AddCommentsCounterToPosts < ActiveRecord::Migration[7.0]
  def change
    # add comment counter to posts
    add_column :posts, :comments_counter, :integer
  end
end
