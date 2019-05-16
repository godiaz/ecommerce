class BasketItem < ApplicationRecord
  belongs_to :basket
  belongs_to :shirt

  monetize :price_cents
end
