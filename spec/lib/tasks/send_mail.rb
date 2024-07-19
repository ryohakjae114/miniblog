require 'rails_helper'
require 'rake_helper'

RSpec.describe 'Tasks::SendMail' do
  subject(:task) { Rake.application['send_mail:notice_liked_ranking'] }

  let!(:hakjae) { create(:user, name: 'hakjae', email: 'hakjae@example.com') }
  let!(:taji) { create(:user, name: 'taji', email: 'taji@example.com') }
  let!(:uekkiesan) { create(:user, name: 'uekkiesan', email: 'uekkiesan@example.com') }

  it '前日のいいね数トップ10の記事を全ユーザにメール送信できること' do
    liked_sentences = %w[よろしく おはよう じゃあね 女の嫌は嫌じゃない スマイル マック食べる おやすみ 時計 レールカーテン お疲れ]
    yesterday_at = Time.current - 1.day

    liked_sentences.each do |sentence|
      post = create(:post, user: hakjae, body: sentence)
      hakjae.likes.create(post:, created_at: yesterday_at, updated_at: yesterday_at)
    end

    create(:post, user: hakjae, body: '絶対いいねしないでください')
    expect do
      task.invoke
    end.to change(ActionMailer::Base.deliveries, :count).by(1)
    mail = ActionMailer::Base.deliveries[0]
    expect(mail.to).to eq ['hakjae@example.com', 'taji@example.com', 'uekkiesan@example.com']
    liked_sentences.each do |sentence|
      expect(mail.body).to include sentence
    end
  end
end
