class AddUserRefToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :user, index: true, foreign_key: true, null: false, on_delete: :cascade
  end
end
