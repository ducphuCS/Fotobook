class UserMailer < ApplicationMailer
  default from: "nguyenducphu.19.6.1999@gmail.com"
  # default from: 'notification@example.com'

  def welcome_mail
    @user = params[:user]
    mail(to: @user.email,
      subject: "Welcome #{@user.firstname}",
      body: "Congrats #{@user.firstname}! Welcome to NUS f**king world.")
  end
end
