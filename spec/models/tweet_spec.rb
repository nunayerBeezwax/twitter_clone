require 'spec_helper'

describe Tweet do
  it { should belong_to :user }

  it 'sends an email to a user if their handle is mentioned in a tweet' do
    user = FactoryGirl.create(:user)
    tweet = Tweet.new({user_id: 7, content: 'testuser'})
    expect(UserMailer).to receive(:notify).with(user, tweet)
    tweet.save
  end
end
