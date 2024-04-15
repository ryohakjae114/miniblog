FactoryBot.define do
  factory :post do
    user
    body { '今日はいい天気だわな' }
  end
end
