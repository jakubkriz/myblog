class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :post_id, index: true

      t.timestamps null: false
    end
    add_foreign_key :users, :posts
  end
end
