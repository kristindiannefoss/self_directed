FactoryGirl.define do
  factory :task do
    description Faker::Hacker.say_something_smart
  end
end
