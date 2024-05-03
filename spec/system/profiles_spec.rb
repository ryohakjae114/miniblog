require 'rails_helper'

RSpec.describe 'Profiles', type: :system do
  let!(:user) { create(:user, introduction: '', external_blog_url: '') }

  it 'ユーザプロフィール情報を変更できること' do
    sign_in user
    visit edit_profile_path
    fill_in '紹介文', with: 'りょはっちぇです'
    fill_in 'ブログURL', with: 'https://hakjae@example.com'
    click_button '更新する'
    expect(page).to have_content('更新しました')
    expect(page).to have_content('りょはっちぇです')
    expect(page).to have_content('https://hakjae@example.com')
  end
end
