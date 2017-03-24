FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "user#{n}@email.com" }
    password '12345678'
    password_confirmation '12345678'
  end

  factory :invalid_user, class: 'User' do
    email nil
    password nil
    password_confirmation nil
  end
end
