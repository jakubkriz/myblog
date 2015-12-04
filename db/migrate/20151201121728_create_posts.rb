class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :author
      t.string :title
      t.text :body
      t.integer :user_id, index: true

      t.timestamps null: false
    end
  end
end
