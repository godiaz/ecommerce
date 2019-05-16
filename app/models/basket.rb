class Basket < ApplicationRecord
  belongs_to :user, required: false
  has_many :basket_items
  has_many :shirts, through: :basket_items
end
