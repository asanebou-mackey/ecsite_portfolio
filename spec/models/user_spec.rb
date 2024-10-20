require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe "バリデーション" do
    it 'Eメールとパスワードがある場合に有効' do
      expect(user).to be_valid
    end

    it 'Eメールが空欄の場合' do
      user = FactoryBot.build(:user, email: "")
      expect(user).to be_invalid
    end

    it 'パスワードが空欄の場合' do
      user = FactoryBot.build(:user, password: "")
      expect(user).to be_invalid
    end

    it '確認パスワードが空欄の場合' do
      user = FactoryBot.build(:user, password_confirmation: "")
      expect(user).to be_invalid
    end
  end
end
