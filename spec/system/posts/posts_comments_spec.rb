require 'rails_helper'

RSpec.describe 'Posts::Comments', type: :system do
  let!(:hakjae) { create(:user, name: 'hakjae') }
  let!(:taji) { create(:user, name: 'taji', email: 'taji@example.com') }
  let!(:post) { create(:post, body: '大局着眼 小局着手', user: taji) }

  before do
    sign_in hakjae
  end

  it '投稿にコメントができ、投稿主にメールを送信できること' do
    visit post_path(post)
    expect(ActionMailer::Base.deliveries.count).to eq 0
    click_on 'コメント作成'
    expect(page).to have_current_path new_post_comment_path(post)
    fill_in 'コメント',	with: 'Wryyyyyyy'
    click_on '登録する'
    expect(page).to have_content('新規登録しました')
    expect(page).to have_selector('.comment-body', match: :first), text: 'Wryyyyyyy'
    expect(ActionMailer::Base.deliveries.count).to eq 1
    mail = ActionMailer::Base.deliveries.last
    expect(mail.to.first).to eq 'taji@example.com'
    expect(mail.subject).to eq 'コメントが届きました'
    expect(mail.html_part.body).to have_link 'コメントを見る', href: "http://miniblog.test:3000#{post_path(post, anchor: Comment.last)}"
  end
end
