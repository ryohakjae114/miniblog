FactoryBot.define do
  factory :user do
    name { 'ryo' }
    password { '1234512345' }
    password_confirmation { '1234512345' }
  end
end
