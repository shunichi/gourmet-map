FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { |u| u.password }
    name { Faker::Internet.user_name }

    factory :invalid_user do
      password_confirmation { |u| u.password + 'A' }
    end
  end
end
