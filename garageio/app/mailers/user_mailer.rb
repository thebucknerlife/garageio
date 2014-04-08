class UserMailer < ActionMailer::Base
  default from: "welcome@buckner.co"

  def welcome_email(user)
    @user = user
    @url = "http://garageio.herokuapp.com/cars"
    mail(to: @user.email, subject: "Welcome to garage.io!")
  end
  
end
