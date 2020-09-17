class UserMailer < ApplicationMailer
  default from: "nguyenducphu.19.6.1999@gmail.com"

  def welcome_mail
    @user = params[:user]
    mail(to: @user.email,
      subject: "Welcome #{@user.firstname}",
      body: "Congrats #{@user.firstname}! Welcome to NUS f**king world.")
  end

  def inactive_mail
    @user = params[:user]
    mail(to: @user.email,
      subject: "Inactive account #{@user.firstname}",
      body: "Sorry to inform that your account was set inactive at the moment.")
  end

  def delete_mail
    @user = params[:user]
    mail(to: @user.email,
      subject: "Account deleted",
      body: "Hey #{@user.firstname}! Sorry to annouce that your account is no longer remain")
  end
end
