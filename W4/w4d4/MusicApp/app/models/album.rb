class Album < ApplicationRecord
  validates :album_name, :band_id, presence: true
  # validates :live, inclusion: { in: [true, false] }
  validates :album_name, uniqueness: { scope: :band_id }

  belongs_to :band
  has_many :tracks, dependent: :destroy
end
