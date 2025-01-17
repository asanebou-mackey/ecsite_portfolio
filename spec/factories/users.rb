FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "tester#{n}@example.com" }
    password              {"111111"}
    password_confirmation {"111111"}
    name {"テスト"}
    number {"00000000000"}
    address {"東京都渋谷区0-0-000"}
    image {"abc"}
  end
end
