# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  answer_choice_id :integer
#  user_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ApplicationRecord
  validates :answer_choice, :respondent, presence: true
  validate :respondent_already_answered?

  belongs_to :respondent,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :answer_choice

  has_one :question, through: :answer_choice

  def sibling_responses
    self.question.responses.where.not(id: self.id)

  end

  def respondent_already_answered?
    sibling_responses.exists?(user_id: self.user_id, answer_choice_id: self.answer_choice_id)
  end

  private

  def respondent_could_only_answer_once
    if respondent_already_answered?
      errors[:respondent_id] << 'cannot vote twice for question'
    end

end
