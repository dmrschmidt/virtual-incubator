class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.integer :user_id
      t.string :text

      t.timestamps
    end
  end
end
