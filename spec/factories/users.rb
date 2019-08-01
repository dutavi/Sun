# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "Test User #{n}" }
    sequence(:email) { |n| "test-#{n}@example.com" }
    password { "please123" }
    confirmed_at { Time.now }

    trait :admin do
      role { :admin }
    end

    trait :vip do
      role { :vip }
    end

    trait :user do
      role { :user }
    end
  end
end
