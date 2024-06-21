require 'rails_helper'

RSpec.describe 'Comments', type: :system do
  let!(:user) { create(:user) }
  let!(:post) { create(:post, body: '大局着眼 小局着手', user:) }
  let!(:comment) { create(:comment, body: 'Wryyyyy', user:) }

  before do
    sign_in user
  end

  it '投稿のコメントから、コメント詳細ページを閲覧できること' do
    visit post_path(post)
    click_on 'Wryyyyy'
    expect(page).to have_content('コメント詳細')
    expect(page).to have_content('Wryyyyy')
  end

  it 'コメントに対するコメントができること' do
    visit comment_path(comment)
    click_on 'コメント作成'
    fill_in 'コメント文',	with: 'グッバイジョジョ'
    click_on '登録する'
    expect(page).to have_content('登録しました')
    expect(page).to have_content('グッバイジョジョ')
  end
end
