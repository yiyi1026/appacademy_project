require 'action_view'
class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper
  COLORS = %w(brown black white)

  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: { in: COLORS,
    message: "This is not a valid color"}
  validates :sex, inclusion: { in: %w(M F),
    message: "This is not a valid sex"}

    has_many :cat_rental_requests,
      primary_key: :id,
      foreign_key: :cat_id,
      class_name: :CatRentalRequest,
      :dependent => :destroy

  def age
    time_ago_in_words(birth_date)
  end

end
