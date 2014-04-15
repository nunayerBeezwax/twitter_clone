FactoryGirl.define do
  factory :user do
    name "testuser"
    email "user@email.com"
    password "testpassword"
    password_confirmation "testpassword"
    id "1"
  end
end
