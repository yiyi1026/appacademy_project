class RenameType < ActiveRecord::Migration
  def change
    remove_column :plants, :type
    add_column :plants, :species, :string
  end
end
