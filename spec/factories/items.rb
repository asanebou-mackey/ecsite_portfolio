FactoryBot.define do
  factory :item do
    name {"テスト"}
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/soccer_ball.png'), 'image/png') }
    price {"100"}
    description {"abc"}
    size {"1"}
    color {"1"}
    association :category
    association :brand
  end
end
