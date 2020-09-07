# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def welcome_mail
    user = User.new(id: 10, firstname: "Thai", lastname: "Tran", email:"tathai2610@gmail.com", password: "123456")
    UserMailer.with(user: user).welcome_mail
  end
end
