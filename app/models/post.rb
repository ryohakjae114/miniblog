class Post < ApplicationRecord
  validates :body, presence: true, length: { maximum: 140 }
end
