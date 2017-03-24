FactoryGirl.define do

  factory :user do
    sequence(:email)        { |n| "user#{n}@email.com" }
    sequence(:name)         { |n| "user_name#{n}@" }
    sequence(:surname)      { |n| "user_surname#{n}" }
    sequence(:patronymic)   { |n| "user_patronymic#{n}" }
    sequence(:phone_number) { |n| "user_phone_number#{n}" }
    sequence(:city)         { |n| "user_city#{n}" }
    sequence(:address)      { |n| "user_address#{n}" }
    password '12345678'
    password_confirmation '12345678'
  end

  factory :invalid_user, class: 'User' do
    email nil
    name nil
    surname nil
    patronymic nil
    phone_number nil
    city nil
    address nil
    password nil
    password_confirmation nil
  end
end
