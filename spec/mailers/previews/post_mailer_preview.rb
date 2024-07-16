# Preview all emails at http://localhost:3000/rails/mailers/post_mailer
class PostMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/post_mailer/notice_liked_ranking
  def notice_liked_ranking
    PostMailer.notice_liked_ranking
  end

end
