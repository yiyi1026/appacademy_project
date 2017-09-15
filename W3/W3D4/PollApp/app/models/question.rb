# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  text       :text             not null
#  poll_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
  validates :text, :poll_id, presence: true
  
  belongs_to :poll

  has_many :answer_choices

  has_many :responses,
    through: :answer_choices,
    source: :responses


  def results
    # self.responses.count

    # refactor
    self.answer_choices

  end
end
