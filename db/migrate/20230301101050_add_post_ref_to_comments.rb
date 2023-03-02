class AddPostRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :post, index: true, foreign_key: true, null: false, on_delete: :cascade
  end
end
