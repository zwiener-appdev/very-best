FactoryBot.define do
  factory :venue do
    sequence(:name) { |n| "Venue #{n}" }
    sequence(:address) { |n| "Address #{n}" }
  end
end
