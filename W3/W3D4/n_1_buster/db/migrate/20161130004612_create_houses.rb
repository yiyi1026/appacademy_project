class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :address
    end
  end
end
