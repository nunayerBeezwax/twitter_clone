class Tweet < ActiveRecord::Base
  belongs_to :user

  after_create :send_notification

  def send_notification
    handles = User.all.pluck(:name)
    handles.each do |h|
      if self.content.match(h)
        user = User.find_by_name(h)
        UserMailer.notify(user)
      end
    end
  end
end
