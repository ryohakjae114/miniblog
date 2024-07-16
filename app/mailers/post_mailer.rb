class PostMailer < ApplicationMailer
  default from: 'noreply@example.com'

  def notice_liked_ranking
    @posts = Post.yesterday_liked_ranking_top_ten
    mail(to: User.pluck(:email).delete(''), subject: default_i18n_subject)
  end
end
