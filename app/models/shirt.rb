class Shirt < ApplicationRecord
  has_many :shirt_fabrics
  has_many :basket_items
  has_many :fabrics, through: :shirt_fabrics

  monetize :price_cents
end
