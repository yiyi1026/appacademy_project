class RemovePostsColumns < ActiveRecord::Migration[5.0]
  def change
    remove_index :posts, :sub_id
    remove_column :posts, :sub_id
  end
end
