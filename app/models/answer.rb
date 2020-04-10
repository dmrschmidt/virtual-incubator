class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates_presence_of :user_id, :question_id, :text
end
