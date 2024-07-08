# Preview all emails at http://localhost:3000/rails/mailers/user_mailer_mailer
class UserMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/user_mailer_mailer/commented
  def commented
    comment = Comment.first
    UserMailer.with(comment:).commented
  end
end
