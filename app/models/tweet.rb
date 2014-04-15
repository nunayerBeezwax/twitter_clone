class Tweet < ActiveRecord::Base
  belongs_to :user

  after_create :send_notification

  def send_notification
    handles = User.all.pluck(:name)
    handles.each do |h|
      if self.content.include?(h)
        user = User.find_by_name(h)
        UserMailer.notify(user, self)
      end
    end
  end
end
