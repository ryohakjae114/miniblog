class UserMailer < ApplicationMailer
  def commented
    @comment = params[:comment]
    mail(to: @comment.post.user.email, subject: default_i18n_subject)
  end
end
