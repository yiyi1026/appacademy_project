class AddTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title
      t.integer :album_id

      t.timestamps
    end
  end
end
