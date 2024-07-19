class Post < ApplicationRecord
  ALLOWED_ACCEPT_FILE_EXTENSIONS = %w[image/heic image/jpeg image/png image/jpg].freeze

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
    now = Time.current
    yesterday_range = now.yesterday.beginning_of_day...now.yesterday.end_of_day
    select('posts.*',
           'count(likes.id) AS likes').left_joins(:likes).where(likes: { created_at: yesterday_range }).group('posts.id').order('likes DESC').limit(10)
  end

  def allowed_picture_content_type
    if picture.attached? && !picture.content_type.in?(ALLOWED_ACCEPT_FILE_EXTENSIONS)
      errors.add(:picture, I18n.t('activerecord.validates.user.picture.allowed_picture_content_type'))
    end
  end
end
