FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "hakjae#{[*'a'..'z'][n - 1]}" }
    password { '1234512345' }
    password_confirmation { '1234512345' }
  end
end
