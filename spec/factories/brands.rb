FactoryBot.define do
  factory :brand do
    name {"abc"}
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/soccer_ball.png'), 'image/png') }
  end
end
