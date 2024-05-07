require 'rails_helper'

RSpec.describe 'Relationships', type: :system do
  let!(:user) { create(:user) }
  let!(:friend) { create(:user) }

  before do
    sign_in user
    create(:post, user: friend)
  end

  it 'フォローできること' do
    visit root_path
    expect do
      click_link 'フォローする'
    end.to change(user.following, :count).by(1)
    expect(page).to have_content('フォロー中')
  end

  it 'フォローを外せること' do
    user.follow(friend)
    visit root_path
    expect do
      click_button 'フォロー中'
    end.to change(user.following, :count).by(-1)
    expect(page).to have_content('フォローする')
  end
end
