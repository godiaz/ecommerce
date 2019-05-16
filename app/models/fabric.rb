class Fabric < ApplicationRecord
  has_many :shirt_fabrics
  has_many :shirts, through: :shirt_fabrics
end
