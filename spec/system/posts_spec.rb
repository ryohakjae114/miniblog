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

    it 'コメント一覧できること' do
      visit root_path
      within('.comment-count') do
        click_on '2件'
      end
      # 投稿に対するコメントの総数を表示する
      # 投稿に紐づいたcommentモデル作成
      # 投稿のコメント総数を格納するcounter_cacheが良さそう
      expect(page).to have_content('コメント一覧')
      # 　 コメント一覧画面を作成
      expect(page).to have_content('.comment'), count: 2
      expect(page).to have_content('2つ目のコメント')
      # コメント一覧を投稿作成が新しい順に表示する
      expect(page).to have_content('1つ目のコメント')
    end
  end
end
