class ChangeNameColumnofBand < ActiveRecord::Migration[5.0]
  def change
    change_column :bands, :name, :string, unique: true
    add_column :tracks, :ord, :integer
  end
end
