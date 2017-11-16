FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    password "password"
    sequence(:username) { |n| "person#{n}" }
  end
end
