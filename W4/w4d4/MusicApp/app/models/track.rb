class Track < ApplicationRecord
  validates :album_id, :lyrics, :track_name, presence: true
  belongs_to :album
end
