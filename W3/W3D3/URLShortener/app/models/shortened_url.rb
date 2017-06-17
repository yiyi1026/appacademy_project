class ShortenedUrl < ApplicationRecord
  validates :long_url, :short_url, :user_id, presence: true
  validates :short_url, uniqueness: true

  def self.random_code
    random_code = SecureRandom.urlsafe_base64
    if self.exists?(random_code)
      self.random_code
    else
      random_code
    end
  end

  def self.create_shortened_url(user, long_url)
    short_url = self.random_code
    ShortenedUrl.create!(long_url: long_url, short_url: short_url, user_id: user.id)
  end

  def submitter
    User.find_by(id: self.user_id)
  end

  def num_clicks
    visits.count
  end

  def num_uniques
    self.visitors.count
  end

  def num_recent_uniques
    visits
      .select(:visitor_id)
      .where({created_at: (10.minutes.ago..Time.now)})
      .distinct
      .count
  end

  has_many :visits,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: :Visit

  has_many :visitors,
    Proc.new { distinct },
    through: :visits,
    source: :user

  has_many :taggings,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: :Tagging

  has_many :tag_topics,
    through: :taggings,
    source: :tag_topic
end
