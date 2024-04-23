require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    driven_by(:rack_test)
  end

  let!(:user) { create(:user, introduction: '', external_blog_url: '') }

  it 'ユーザプロフィール情報を変更できること' do
    sign_in user
    visit profile_user_path(user)
    fill_in 'プロフィール情報', with: 'りょはっちぇです'
    fill_in 'ブログURL', with: 'https://hakjae@example.com'
    click_button '更新する'
    expect(page).to have_content('公開情報を変更しました')
    expect(find_field('プロフィール情報').value).to eq 'りょはっちぇです'
    expect(find_field('ブログURL').value).to eq 'https://hakjae@example.com'
  end
end
