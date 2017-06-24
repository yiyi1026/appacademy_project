class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.string :album_name, null: false
      t.integer :band_id, null: false

      t.timestamps
    end
    add_index :albums, :band_id
  end
end
