FactoryBot.define do
  factory :neighborhood do
    sequence(:name) { |n| "Neighborhood #{n}" }
    sequence(:city) { |n| "City #{n}" }
    sequence(:state) { |n| "State #{n}" }
  end
end
