class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  has_one_attached :picture do |attachable|
    attachable.variant :thumb, resize_to_limit: [300, 300]
  end

  validates :body, presence: true, length: { maximum: 140 }
end
