class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :item_images, dependent: :destroy
  has_one :item_purchase 
  accepts_nested_attributes_for :item_images, allow_destroy: true

  validates :category_id, :name, :text, :condition, :price, :rading_status, :shipping_charges, :days_until_delivery, :shipping_area, presence: true
end
