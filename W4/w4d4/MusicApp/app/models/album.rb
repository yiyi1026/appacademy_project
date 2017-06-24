class Album < ApplicationRecord
  validates :album_name, :band_id, presence: true
  belongs_to :band
  has_many :tracks, dependent: :destroy
end
