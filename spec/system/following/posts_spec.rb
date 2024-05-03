require 'rails_helper'

RSpec.describe 'Following::Posts', type: :system do
  let!(:user) { create(:user) }
  let(:friend) { create(:user, name: 'friend') }
  let(:enemy) { create(:user, name: 'enemy') }

  before do
    sign_in user
    create(:post, user: friend)
    create(:post, user: enemy)
  end

  it 'フォローしているユーザーのみのpost一覧を閲覧できる' do
    user.follow(friend)
    user.follow(enemy)
    visit following_posts_path
    expect(page).to have_css('.card', count: 2)
    user.unfollow(enemy)
    visit current_path
    expect(page).to have_css('.card', count: 1)
    expect(page).to have_content('friend')
  end
end
