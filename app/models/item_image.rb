class ItemImage < ApplicationRecord
  belongs_to :items
  mount_uploader :image_url, ImageUploader

  validates :item_id, :image_url, presence: true
end
