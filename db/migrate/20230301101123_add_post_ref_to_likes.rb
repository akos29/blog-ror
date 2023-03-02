class AddPostRefToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :post, index: true, foreign_key: true, null: false, on_delete: :cascade
  end
end
