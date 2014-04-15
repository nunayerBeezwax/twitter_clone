class UserMailer < ActionMailer::Base
  default from: "twitter_clone@example.com"


  def signup_confirmation(user)
    @user = user
    mail to: user.email, subject: "Sign Up Confirmation"
  end

  def notify(user)
    @user = user
    mail to: user.email, subject: "Someone Tweeted About You"
  end
end
