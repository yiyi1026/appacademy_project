class CreateGardeners < ActiveRecord::Migration
  def change
    create_table :gardeners do |t|
      t.string :name
      t.integer :house_id
    end
  end
end
