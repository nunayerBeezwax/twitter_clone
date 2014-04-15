class UserMailer < ActionMailer::Base
  default from: "twitter_clone@example.com"


  def signup_confirmation(user)
    @user = user
    mail to: user.email, subject: "Sign Up Confirmation"
  end

  def notify(user, tweet)
    @tweet = tweet
    @user = user
    mail to: user.email, subject: "Someone Tweeted About You"
  end

  def following_email(following)
    @follower = User.find_by_id(following[:follower_id])
    @followee = User.find_by_id(following[:user_id])
    mail to: @followee.email, subject: "Someone is Following You!"
  end
end
