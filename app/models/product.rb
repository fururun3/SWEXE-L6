class Product < ApplicationRecord
  has_many :cartitems, dependent: :destroy
end
