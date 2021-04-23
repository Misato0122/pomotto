FactoryBot.define do
  factory :pomodoro do
    association :user
    association :task
  end
end
