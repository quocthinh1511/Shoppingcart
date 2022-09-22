class CartItem < ApplicationRecord
    belongs_to :cart_session
    def sum(cart_items)
        cart_items.collect{|cart_item| cart_item.valid? ? cart_item.unit_price.to_i*cart_item.quantity.to_i : 0}.sum
    end
end
