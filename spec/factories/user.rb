FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "テスト##{n}" }
    sequence(:address) { |n| "住所##{n}" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { 'password' }
  end
end
