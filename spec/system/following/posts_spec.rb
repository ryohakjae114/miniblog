require 'rails_helper'

RSpec.describe 'Following::Posts', type: :system do
  let!(:user) { create(:user) }
  let(:hakjae) { create(:user, name: 'hakjae') }
  let(:taji) { create(:user, name: 'taji') }

  before do
    sign_in user
    create(:post, user: hakjae)
    create(:post, user: taji)
  end

  it 'フォローしているユーザーのみのpost一覧を閲覧できる' do
    user.follow(hakjae)
    user.follow(taji)
    visit following_posts_path
    expect(page).to have_css('.card', count: 2)
    expect(page).to have_content('hakjae')
    expect(page).to have_content('taji')
    user.unfollow(taji)
    visit current_path
    expect(page).to have_css('.card', count: 1)
    expect(page).to have_content('hakjae')
    expect(page).not_to have_content('taji')
  end
end
