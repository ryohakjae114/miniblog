require 'rails_helper'

RSpec.describe 'Posts::Comments', type: :system do
  it '投稿にコメントができること' do
    visit post_path(post)
    click_on 'コメントする'
    expect(page).to have_content('コメント作成')
    fill_in '投稿文',	with: 'Wryyyyyyy'
    click_on 'コメント投稿'
    expect(page).to have_content('コメントしました')
    expect(all('.comment')[1].text).to eq('Wryyyyyyy')
  end
end
