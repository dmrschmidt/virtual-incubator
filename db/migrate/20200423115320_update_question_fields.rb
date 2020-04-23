class UpdateQuestionFields < ActiveRecord::Migration[6.0]
  def change
    rename_column :questions, :text, :current_challenges
    add_column :questions, :actions_taken, :text
    add_column :questions, :skills_needed, :string, array: true
  end
end
