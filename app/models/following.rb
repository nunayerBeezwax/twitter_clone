class Following < ActiveRecord::Base
  belongs_to :user
  belongs_to :follower, :class_name => "User"

  validates :user_id, uniqueness: {scope: :follower_id}

  after_create :following_email

private
  def following_email
    UserMailer.following_email(self).deliver
  end
end
