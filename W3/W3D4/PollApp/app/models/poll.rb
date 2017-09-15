# == Schema Information
#
# Table name: polls
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Poll < ApplicationRecord
  validates :title, :user_id, presence: true
  
  belongs_to :author,
    foreign_key: :user_id,
    class_name: :User

  has_many :questions

end
