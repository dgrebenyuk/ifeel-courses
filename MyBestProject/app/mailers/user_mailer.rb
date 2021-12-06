class UserMailer < ApplicationMailer
  def welcome_user
    @user = User.find params[:user_id]
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
