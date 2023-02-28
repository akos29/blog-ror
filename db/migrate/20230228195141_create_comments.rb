class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :post_id, null: false, foreign_key :true
      t.references :author_id, null: false, foreign_key :true
      t.text :text
      t.timestamp :updated_at
      t.timestamp :created_at

      t.timestamps
    end
  end
end
