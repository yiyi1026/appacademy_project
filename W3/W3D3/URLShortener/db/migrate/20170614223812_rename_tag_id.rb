class RenameTagId < ActiveRecord::Migration[5.0]
  def change
    rename_column :taggings, :topic_id, :tag_id
  end
end
