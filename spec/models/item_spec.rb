require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) { create(:item) }

  describe "バリデーション" do
    it "アイテム名、アイテム画像、アイテム価格、アイテム説明、アイテムサイズ、アイテムカラーがある場合に有効" do
      expect(item).to be_valid
    end

    it "アイテム名が空欄の場合に無効" do
      item = FactoryBot.build(:item, name: "")
      expect(item).to be_invalid
    end

    it "アイテム画像が空欄の場合に無効" do
      item = FactoryBot.build(:item, image: "")
      expect(item).to be_invalid
    end

    it "アイテム価格が空欄の場合に無効" do
      item = FactoryBot.build(:item, price: "")
      expect(item).to be_invalid
    end

    it "アイテム説明が空欄の場合に無効" do
      item = FactoryBot.build(:item, description: "")
      expect(item).to be_invalid
    end

    it "アイテムサイズが空欄の場合に無効" do
      item = FactoryBot.build(:item, size: "")
      expect(item).to be_invalid
    end

    it "アイテムカラーが空欄の場合に無効" do
      item = FactoryBot.build(:item, color: "")
      expect(item).to be_invalid
    end
  end

  describe "並び替え機能" do
    before do
      @items = create_list(:item, 3)
      @items.first.update(created_at: 1.day.ago, price: 500)
      @items.second.update(price: 1000)

      # 各アイテムがお気に入りされるようにする
      create_list(:favorite, 5, item: @items.first)  # item1を5人がお気に入り
      create_list(:favorite, 3, item: @items.second) # item2を3人がお気に入り
      # @items.lastはお気に入りが0件とする
    end

    it "お気に入りの多い順に並び替えられるかどうか" do
      expect(Item.most_favorited).to eq([@items.first, @items.second, @items.last])
    end

    it "新着順に並び替えされるかどうか" do
      expect(Item.latest).to eq([@items.last, @items.second, @items.first])
    end

    it "古い順に並び替えされるかどうか" do
      expect(Item.old).to eq([@items.first, @items.second, @items.last])
    end

    it "価格が高い順に並び替えされるかどうか" do
      expect(Item.expensive).to eq([@items.second, @items.first, @items.last])
    end

    it "価格が低い順に並び替えされるかどうか" do
      expect(Item.cheap).to eq([@items.last, @items.first, @items.second])
    end
  end

  describe "#favorited_byメソッドのテスト" do
    let(:user) { create(:user) }
    let(:item) { create(:item) }

    context "ユーザーがお気に入りをしている場合" do
      before do
        create(:favorite, user: user, item: item)
      end

      it "trueを返す" do
        expect(item.favorited_by(user)).to be_truthy
      end
    end

    context "ユーザーがお気に入りをしていない場合" do
      it "falseを返す" do
        expect(item.favorited_by(user)).to be_falsey
      end
    end
  end
end
