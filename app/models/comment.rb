class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: true
  has_many :child_comments, class_name: 'Comment', foreign_key: 'parent_comment_id', inverse_of: :parent_comment, dependent: :destroy
  belongs_to :parent_comment, class_name: 'Comment', inverse_of: :child_comments, optional: true

  validates :body, presence: true, length: { maximum: 140 }
end
