class ItemImage < ApplicationRecord
  belongs_to :items

  validates :image_url, presence: true
end
