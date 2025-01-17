require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { create(:category) }

  describe "バリデーション" do
    it "カテゴリー名がある場合に有効" do
      expect(category).to be_valid
    end

    it "カテゴリー名が空欄の場合に無効" do
      category = FactoryBot.build(:category, name: "")
      expect(category).to be_invalid
    end
  end
end
