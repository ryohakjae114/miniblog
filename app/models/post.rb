class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  has_one_attached :picture do |attachable|
    attachable.variant :thumb, resize_to_fit: [300, 300]
    attachable.variant :eyecatch, resize_to_fit: [500, 500]
  end

  validates :body, presence: true, length: { maximum: 140 }
  validate :allowed_picture_content_type

  def self.yesterday_liked_ranking_top_ten
    yesterday_range = DateTime.new(2024, 7, 16, 0, 0, 0)..DateTime.new(2024, 7, 16, 23, 59, 59)
    select('posts.*',
           'count(likes.id) AS likes').left_joins(:likes).where(likes: { created_at: yesterday_range }).group('posts.id').order('likes DESC').limit(10)
  end

  def allowed_picture_content_type
    if picture.attached? && !picture.content_type.in?(%('image/heic image/jpeg image/png'))
      errors.add(:picture, I18n.t('activerecord.validates.user.picture.allowed_picture_content_type'))
    end
  end
end
