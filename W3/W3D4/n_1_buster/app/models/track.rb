class Track < ActiveRecord::Base
  belongs_to(
    :album,
    class_name: "Album",
    foreign_key: :album_id,
    primary_key: :id
  )

  def better_tracks_query
    album.includes()
  ends


end
end
