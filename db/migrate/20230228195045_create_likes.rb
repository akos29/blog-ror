class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :post_id, null: false, foreign_key :true
      t.references :author_id, null: false, foreign_key :true
      t.timestamp :updated_at
      t.timestamp :created_at

      t.timestamps
    end
  end
end
