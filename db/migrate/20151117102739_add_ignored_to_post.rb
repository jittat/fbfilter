class AddIgnoredToPost < ActiveRecord::Migration
  def change
    add_column :posts, :ignored, :boolean
  end
end
