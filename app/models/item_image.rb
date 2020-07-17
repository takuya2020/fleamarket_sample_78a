class ItemImage < ApplicationRecord
  belongs_to :item

  validates :item_id, :item_url, presence: true
end
