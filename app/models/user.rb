class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 },
                   format: { with: /\A[a-zA-Z]+\z/, message: '英文字のみが使えます。スペースも禁止です。' }
  validates :profile, length: { maximum: 200 }
  validates :external_blog_url, length: { maximum: 2083 }

  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end
end
