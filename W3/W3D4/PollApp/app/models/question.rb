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
    # 1-query way all SQL, aA solution
    # acs = AnswerChoice.find_by_sql([<<-SQL, id])
    #   SELECT
    #     answer_choices.text, COUNT(responses.id) AS num_responses
    #   FROM
    #     answer_choices
    #     LEFT OUTER JOIN responses
    #       ON answer_choices.id = responses.answer_choice_id
    #   WHERE
    #     answer_choices.question_id = ?
    #   GROUP BY
    #     answer_choices.id
    # SQL

    # acs.inject({}) do |results, ac|
    #   results[ac.text] = ac.num_responses; results
    # end

    # 1-query way w/ ActiveRecord
    # less efficient solutions are given above ^
    acs = self.answer_choices
              .select("answer_choices.text, COUNT(responses.id) AS num_responses")
              .joins(<<-SQL).group("answer_choices.id")
              LEFT OUTER JOIN responses
              ON answer_choices.id = responses.answer_choice_id
              SQL

    acs.inject({}) do |results, ac|
      results[ac.text] = ac.num_responses; results
    end

  end
end
