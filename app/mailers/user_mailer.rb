class UserMailer < ApplicationMailer

  
  def welcome_email
    @user = params[:user]
    @posts = posts_url

    mail(to: @user.email, subject: "Welcome!")
  end
end
