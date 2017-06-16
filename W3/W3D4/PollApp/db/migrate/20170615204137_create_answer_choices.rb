class CreateAnswerChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :answer_choices do |t|
      t.text :text, null: false
      t.integer :question_id, null: false

      t.timestamps
    end
  end
end
