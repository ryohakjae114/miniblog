require 'rails_helper'

RSpec.describe 'Profiles', type: :system do
  before do
    driven_by(:rack_test)
  end

  let!(:user) { create(:user, introduction: '', external_blog_url: '') }

  it 'ユーザプロフィール情報を変更できること' do
    sign_in user
    visit edit_profile_path
    fill_in 'プロフィール情報', with: 'りょはっちぇです'
    fill_in 'ブログURL', with: 'https://hakjae@example.com'
    click_button '更新する'
    expect(page).to have_content('プロフィール情報を変更しました')
    expect(page).to have_content('りょはっちぇです')
    expect(page).to have_content('https://hakjae@example.com')
  end
end
