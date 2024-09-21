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
  has_many :favorited_users, through: :favorites, source: :user
  
  scope :latest, -> { order(created_at: :desc) }
  scope :old, -> { order(created_at: :asc) }
  scope :expensive, -> {order(price: :desc)}
  scope :cheap, -> {order(price: :asc)}
  scope :most_favorited, -> { includes(:favorited_users).sort_by { |x| x.favorited_users.includes(:favorites).size }.reverse }

  def favorited_by(user)
    Favorite.find_by(user_id: user.id, item_id: id)
  end
end
