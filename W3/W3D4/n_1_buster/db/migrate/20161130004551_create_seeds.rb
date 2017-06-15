class CreateSeeds < ActiveRecord::Migration
  def change
    create_table :seeds do |t|
      t.integer :count
      t.integer :plant_id
    end
  end
end
