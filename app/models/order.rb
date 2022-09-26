class Order < ApplicationRecord
  has_many :order_items
  before_save :set_sum
  def sum 
    if shipping_id.nil? || shipping_id == 1
      order_items.collect{|order_item| order_item.valid? ? order_item.unit_price.to_i*order_item.quantity.to_i : 0}.sum
    elsif shipping_id == 2
      order_items.collect{|order_item| order_item.valid? ? order_item.unit_price.to_i*order_item.quantity.to_i : 0}.sum +6
    elsif shipping_id == 3
      order_items.collect{|order_item| order_item.valid? ? order_item.unit_price.to_i*order_item.quantity.to_i : 0}.sum +4 
    elsif shipping_id == 4
      order_items.collect{|order_item| order_item.valid? ? order_item.unit_price.to_i*order_item.quantity.to_i : 0}.sum +3
    else
      order_items.collect{|order_item| order_item.valid? ? order_item.unit_price.to_i*order_item.quantity.to_i : 0}.sum +7
    end
  end
  private
  def set_sum
      self[:sum] = sum 
  end
end