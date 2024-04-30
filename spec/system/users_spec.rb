require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let!(:user) { create(:user, introduction: 'ryohakjaeです', external_blog_url: 'https://hakjae@example.com') }

  it 'ユーザプロフィール情報を閲覧できること' do
    sign_in user
    visit user_path(user)
    expect(page).to have_content('ryohakjaeです')
    expect(page).to have_content('https://hakjae@example.com')
  end
end
