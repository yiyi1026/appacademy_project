class Response < ApplicationRecord
  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User


  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice

  has_one :question,
    through: :answer_choice,
    source: :question

  def sibling_responses
    question.responses.where.not(id: self.id)

  end
  def respondent_already_answered?
    sibling_responses.exists?(user_id: self.id, answer_choice_id: self.answer_choice_id)
  end

  validate :

end
