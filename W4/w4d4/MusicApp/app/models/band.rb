class Band < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :albums, dependent: :destroy
  has_many :tracks, through: :albums
end
