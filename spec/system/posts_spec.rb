require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  context '未ログイン時' do
    it '投稿作成にアクセスするとサインインページにリダイレクトすること' do
      visit new_post_path
      expect(page).to have_current_path new_user_session_path
    end
  end

  context 'ログイン時' do
    let!(:user) { create(:user) }

    before do
      sign_in user
    end

    it '投稿できること' do
      visit new_post_path
      fill_in '投稿文', with: '今日はいい天気だわな'
      expect do
        click_button '登録する'
      end.to change(Post, :count).by(1)
      expect(page).to have_content('新規登録しました')
      expect(page).to have_content('今日はいい天気だわな')
    end

    it '一覧できること' do
      create(:post, body: 'あいうえお')
      create(:post, body: 'かきくけこ')
      visit root_path
      expect(page).to have_content('あいうえお')
      expect(page.all('.post').count).to eq 2
    end
  end
end
