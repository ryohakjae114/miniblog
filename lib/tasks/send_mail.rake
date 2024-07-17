namespace :send_mail do
  desc '前日のいいね記事トップ10のメールを全ユーザに送信する'
  task notice_liked_ranking: :environment do
    PostMailer.notice_liked_ranking.deliver_now
  end
end
