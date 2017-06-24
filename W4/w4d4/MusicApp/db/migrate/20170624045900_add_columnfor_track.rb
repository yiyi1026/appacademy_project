class AddColumnforTrack < ActiveRecord::Migration[5.0]
  def change
    add_column :tracks, :bonus, :boolean, default: false
  end
end
