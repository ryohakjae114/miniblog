require 'rails_helper'
require 'rake_helper'

RSpec.describe 'Likes', type: :system do
  let!(:hakjae) { create(:user, name: 'hakjae') }
  let!(:taji) { create(:user, name: 'taji') }
  let!(:post) { create(:post) }

  before do
    sign_in hakjae
  end

  it 'いいねできること' do
    visit root_path
    find_link('0件')
    expect do
      find('.not-like').click
    end.to change(hakjae.likes, :count).by(1)
    find_link('1件')
  end

  it 'いいねを解除できること' do
    create(:like, user: hakjae, post:)
    visit root_path
    find_link('1件')
    expect do
      find('.like').click
    end.to change(hakjae.likes, :count).by(-1)
    find_link('0件')
  end

  it '投稿をいいねした人を一覧できること' do
    create(:like, user: hakjae, post:)
    create(:like, user: taji, post:)
    visit root_path
    click_on '2件'
    expect(page).to have_content('いいねしたユーザ一覧(2人)')
    expect(page).to have_link('hakjae')
    expect(page).to have_link('taji')
  end
end
