require 'rails_helper'

RSpec.describe 'Posts::Comments', type: :system do
  let!(:hakjae) { create(:user, name: 'hakjae') }
  let!(:post) { create(:post, user: hakjae) }

  before do
    sign_in hakjae
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

  it '投稿にコメントができること' do
    visit post_comments_path(post)
    # コメント作成画面を作成する
    click_on 'コメントする'
    fill_in '投稿文',	with: 'Wryyyyyyy'
    click_on 'コメントする'
    expect(page).to have_content('コメントしました')
    expect(page).to have_content('コメントしました')
    expect(all('.comment')[1].text).to eq('Wryyyyyyy')
  end
end
