class User < ActiveRecord::Base
  has_secure_password
  validates :name, :presence => true
  has_many :tweets

  after_create :send_welcome_message

private
  def send_welcome_message
    UserMailer.signup_confirmation(self)
  end

end
