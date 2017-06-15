class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.integer :number

      t.timestamps
    end
  end
end
