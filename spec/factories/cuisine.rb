FactoryBot.define do

  factory :cuisine do
    sequence(:name) { |n| "Cuisine #{n}" }

    factory :cuisine_with_dishes do
      transient do
        dishes_count 1
      end

      after(:create) do |cuisine, evaluator|
        create_list(:dish, evaluator.dishes_count, cuisine: cuisine)
      end
    end
  end
end
