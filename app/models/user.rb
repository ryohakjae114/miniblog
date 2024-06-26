class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  has_many :active_relationships, class_name: 'Relationship',
                                  foreign_key: 'follower_id',
                                  dependent: :destroy,
                                  inverse_of: :follower
  has_many :following, through: :active_relationships, source: :followed
  has_many :passive_relationships, class_name: 'Relationship',
                                   foreign_key: 'followed_id',
                                   dependent: :destroy,
                                   inverse_of: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true, length: { maximum: 20 }, uniqueness: true,
                   format: { with: /\A[a-zA-Z]+\z/, message: I18n.t('activerecord.validates.user.name.format') }
  validates :introduction, length: { maximum: 200 }
  validates :external_blog_url, length: { maximum: 2083 }

  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end

  def following?(followed_user)
    following.include?(followed_user)
  end

  def follow(following_user)
    following << following_user
  end

  def unfollow!(user)
    active_relationships.find_by(followed_id: user.id).destroy!
  end

  def like?(post)
    likes.exists?(post:)
  end

  def avatar_icon
    InitialAvatar.avatar_data_uri(self.name[0], size: 30, font_size: 10)
  end
end
