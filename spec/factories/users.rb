FactoryBot.define do
  factory :user do
    sequence (:name) { Faker::Name.name }
    sequence (:email) { |n| "user_#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
    role { :general }
  end
end
