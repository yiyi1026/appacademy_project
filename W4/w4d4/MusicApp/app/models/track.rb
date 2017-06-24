class Track < ApplicationRecord
  validates :album_id, :lyrics, :track_name, presence: true
  validates :ord, uniqueness: { scope: :album_id }
  # validates :bonus, inclusion: { in: [true, false] }

  belongs_to :album
  has_one :band, through: :album, source: :band
end
