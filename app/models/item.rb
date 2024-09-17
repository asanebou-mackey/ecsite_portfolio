class Item < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :image, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :size, presence: true
  validates :color, presence: true

  belongs_to :brand
  belongs_to :category
  has_many :carts
  has_many :order_details
  has_many :favorites

  def favorited_by(user)
    Favorite.find_by(user_id: user.id, item_id: id)
  end
end
