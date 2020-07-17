class Category < ApplicationRecord
  has_many :items

  validates :path, :name, :ancestry, presence: true
end
