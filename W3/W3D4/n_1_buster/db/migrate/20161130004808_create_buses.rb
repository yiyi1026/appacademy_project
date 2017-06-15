class CreateBuses < ActiveRecord::Migration
  def change
    create_table :buses do |t|
      t.string :model
      t.integer :route_id

      t.timestamps
    end
  end
end
