require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    driven_by(:rack_test)
  end

  let!(:user) { create(:user) }

  it 'ユーザ詳細ページにアクセスできること' do
    sign_in user
    visit user_path(user)
    expect(page).to have_content('ユーザプロフィール情報')
  end
end
