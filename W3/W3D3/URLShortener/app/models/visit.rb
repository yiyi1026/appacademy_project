class Visit < ApplicationRecord
  validates :visitor_id, :shortened_url_id, presence: true

  def self.record_visit!(user, shortened_url)
    Visit.create!(visitor_id: user.id, shortened_url_id: shortened_url.id)
  end

  belongs_to :user,
    primary_key: :id,
    foreign_key: :visitor_id,
    class_name: :User

  belongs_to :shortened_url,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: :ShortenedUrl
end
