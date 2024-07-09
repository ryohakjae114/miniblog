require 'rails_helper'

RSpec.describe 'Posts::Comments', type: :system do
  let!(:hakjae) { create(:user, name: 'hakjae') }
  let!(:taji) { create(:user, name: 'taji', email: 'taji@example.com') }
  let!(:taji_post) { create(:post, body: '大局着眼 小局着手', user: taji) }
  let!(:hakjae_post) { create(:post, user: hakjae) }

  before do
    sign_in hakjae
  end

  it '投稿にコメントができ、投稿主にメールを送信できること' do
    visit post_path(taji_post)
    expect(ActionMailer::Base.deliveries.count).to eq 0
    click_on 'コメント作成'
    expect(page).to have_current_path new_post_comment_path(taji_post)
    fill_in 'コメント',	with: 'Wryyyyyyy'
    click_on '登録する'
    expect(page).to have_content('新規登録しました')
    expect(page).to have_selector('.comment-body', match: :first), text: 'Wryyyyyyy'
    expect(ActionMailer::Base.deliveries.count).to eq 1
    mail = ActionMailer::Base.deliveries.last
    expect(mail.to.first).to eq 'taji@example.com'
    expect(mail.subject).to eq 'コメントが届きました'
    expect(mail.html_part.body).to include "/posts/#{taji_post.id}##{Comment.last.id}"
  end

  it '自身の投稿にコメントした場合、メールは送信されないこと' do
    expect(ActionMailer::Base.deliveries.count).to eq 0
    create(:comment, post: hakjae_post, user: hakjae)
    expect(ActionMailer::Base.deliveries.count).to eq 0
  end
end
