class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.string :type
      t.integer :gardener_id
    end
  end
end
