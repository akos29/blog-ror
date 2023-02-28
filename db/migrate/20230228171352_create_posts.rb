class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title, null :false
      t.text :text
      t.references :author_id, null: false, foreign_key :true
      t.timestamp :updated_at
      t.timestamp :created_at

      t.timestamps
    end
  end
end
