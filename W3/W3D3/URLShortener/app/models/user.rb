class User < ActiveRecord::Base
  validates :email, uniqueness: true, presence: true

  def submitted_urls
    ShortenedUrl.where(user_id: self.id)
  end

  has_many :visits,
    primary_key: :id,
    foreign_key: :visitor_id,
    class_name: :Visit

  has_many :visited_urls,
    through: :visits,
    source: :shortened_url
end
