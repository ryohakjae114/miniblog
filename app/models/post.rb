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
end
