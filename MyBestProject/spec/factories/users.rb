FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }

    trait :premium do
      status { :premium }
    end

    trait :with_age do
      age { 18 }
    end

    factory :premium_user do
      status { :premium }
    end

    factory :with_age do
      age { 16 }
    end

    factory :premium_with_age do
      age { 18 }
      status { :premium }
    end
  end
end
