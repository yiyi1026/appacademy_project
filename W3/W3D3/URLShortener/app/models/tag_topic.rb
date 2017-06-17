class TagTopic < ApplicationRecord
  validates :topic, presence: true

  def popular_links
    shortened_urls
      .select('short_url, COUNT(shortened_urls.id)')
      .joins(:visits)
      .group(:short_url)
      .order('COUNT(*) DESC')
      .limit(5)
  end

  has_many :taggings,
    primary_key: :id,
    foreign_key: :tag_id,
    class_name: :Tagging

  has_many :shortened_urls,
    through: :taggings,
    source: :shortened_url

end
