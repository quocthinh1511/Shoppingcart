class CartSession < ApplicationRecord
    has_many :cart_items
    belongs_to :shop
    belongs_to :user
end
