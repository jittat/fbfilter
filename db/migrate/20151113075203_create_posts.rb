class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :url
      t.boolean :verified

      t.timestamps null: false
    end
    add_index :posts, :url, unique: true
  end
end
