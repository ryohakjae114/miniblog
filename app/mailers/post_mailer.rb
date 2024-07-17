class PostMailer < ApplicationMailer
  def notice_liked_ranking
    @posts = Post.yesterday_liked_ranking_top_ten
    emails = User.pluck(:email)
    emails.delete('')
    mail(to: emails, subject: default_i18n_subject)
  end
end
