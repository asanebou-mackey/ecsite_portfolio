require 'rails_helper'

RSpec.describe Brand, type: :model do
  let(:brand) { create(:brand) }

  describe "バリデーション" do
    it "ブランド名、ブランド画像がある場合に有効" do
      expect(brand).to be_valid
    end

    it "ブランド名が空欄の場合に無効" do
      brand = FactoryBot.build(:brand, name: "")
      expect(brand).to be_invalid
    end

    it "ブランド画像が空欄の場合に無効" do
      brand = FactoryBot.build(:brand, image: "")
      expect(brand).to be_invalid
    end
  end
end
