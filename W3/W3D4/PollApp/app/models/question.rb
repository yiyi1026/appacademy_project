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
    # n + 1
    results = {}
    self.answer_choices.each do |an_ch|
      results[an_ch.text] = an_ch.responses.count
    end

    results

    # refactor 1
    #1. pre-fetch all the responses when you fetch the answer_choices(not only the account)

    # results = {}
    # self.answer_choices.includes(:responses).each do |an_ch|
    #   results[an_ch.text] = an_ch.responses.length
    # end
    # results

    # refactor 2


  end
end
