require 'rails_helper'

RSpec.describe 'Likes', type: :system do
  let!(:user) { create(:user) }
  let!(:post) { create(:post) }

  before do
    sign_in user
  end

  it 'いいねできること' do
    visit root_path
    find_link('0件')
    expect do
      find('.not-like').click
    end.to change(post.liked_users.where(id: user.id), :count).by(1)
    find_link('1件')
  end
end
