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
    let!(:post) { create(:post, body: '大局着眼 小局着手', user:) }

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
      create(:post, body: '日進月歩')
      visit root_path
      expect(page).to have_content('大局着眼 小局着手')
      expect(page.all('.post').count).to eq 2
    end

    it '投稿詳細ページからコメント一覧できること' do
      create(:comment, body: '役に立った', user:, post:)
      create(:comment, body: '役に立たなかった', user:, post:)
      visit root_path
      within('.post') do
        click_on '大局着眼 小局着手'
      end
      # 投稿に対するコメントの総数を表示する
      # 投稿に紐づいたcommentモデル作成
      # 投稿のコメント総数を格納するcounter_cacheが良さそう
      expect(page).to have_content('投稿詳細')
      # 　 コメント一覧画面を作成
      expect(page).to have_css('.comment'), count: 2
      expect(page).to have_content('役に立った')
      # コメント一覧を投稿作成が昇順に表示する
      expect(page).to have_content('役に立たなかった')
    end
  end
end
