class Post < ApplicationRecord
  validates :title,:author, presence: true
  # validates :subs, presence: true

  has_many :comments

  belongs_to :author,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User

  has_many :post_subs
  has_many :subs, through: :post_subs, source: :sub

  def top_level_comments
    self.comments.where(parent_comment_id:nil)
  end

end
