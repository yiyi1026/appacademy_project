# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  user_name  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates :user_name, uniqueness: true, presence: true

  has_many :responses

  has_many :authored_polls,
    foreign_key: :user_id,
    class_name: :Poll


    def not_duplicate_response
      
    end
end
