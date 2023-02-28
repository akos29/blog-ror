class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.text :bio
      t.string :photo
      t.timestamps :updated_at
      t.timestamps :created_at
      t.integer :posts_counter

      t.timestamps
    end
  end
end
