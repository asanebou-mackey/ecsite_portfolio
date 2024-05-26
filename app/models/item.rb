class Item < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :image, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :size, presence: true
  validates :color, presence: true
  validates :image, presence: true
  
  belongs_to :brand
  belongs_to :category
end
