class CreateCats < ActiveRecord::Migration[5.0]
  def change
    create_table :cats do |t|
      t.date :birth_date, nulll: false
      t.string :color, null: false
      t.string :name, null: false
      t.string :sex, null: false
      t.text :description, null: false
      t.timestamps
    end
  end
end
