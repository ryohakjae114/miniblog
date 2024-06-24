require 'rails_helper'

RSpec.describe 'Posts::Comments', type: :system do
  let!(:user) { create(:user) }
  let!(:post) { create(:post, body: '大局着眼 小局着手', user:) }

  before do
    sign_in user
  end

  it '投稿にコメントができること' do
    visit post_path(post)
    click_on 'コメント作成'
    expect(page).to have_content('コメント作成')
    fill_in 'コメント',	with: 'Wryyyyyyy'
    click_on '登録する'
    expect(page).to have_content('新規登録しました')
    expect(page).to have_selector('.comment-body', match: :first), text: 'Wryyyyyyy'
  end
end
