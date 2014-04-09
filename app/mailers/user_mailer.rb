class UserMailer < ActionMailer::Base
  default from: "welcome@garage.io"

  def welcome_email(user)
    @user = user
    @url = "http://garage.io/users/#{@user.id}/profile"
    mail(to: @user.email, subject: "Welcome to garage.io!!!!!!! <3 :)")
  end
end
