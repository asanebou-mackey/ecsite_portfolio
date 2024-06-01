class Brand < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :image, presence: true

  has_many :items
end
