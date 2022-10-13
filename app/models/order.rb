class Order < ApplicationRecord
  has_many :order_items
  before_save :set_sum
  def sum 
    if shipping_id.nil? || shipping_id == 1
     summ =  order_items.collect{|order_item| order_item.valid? ? order_item.unit_price.to_i*order_item.quantity.to_i : 0}.sum
    elsif shipping_id == 2
      summ = order_items.collect{|order_item| order_item.valid? ? order_item.unit_price.to_i*order_item.quantity.to_i : 0}.sum +3.to_i
    elsif shipping_id == 3
      summ = order_items.collect{|order_item| order_item.valid? ? order_item.unit_price.to_i*order_item.quantity.to_i : 0}.sum +4.to_i 
    elsif shipping_id == 4
      summ = order_items.collect{|order_item| order_item.valid? ? order_item.unit_price.to_i*order_item.quantity.to_i : 0}.sum +5.to_i
    else
      summ = order_items.collect{|order_item| order_item.valid? ? order_item.unit_price.to_i*order_item.quantity.to_i : 0}.sum +6.to_i
    end
    Voucher.all.each do |vou| 
      if voucher == vou.name 
        summ = (summ*(100-vou.per))/100
      end
    end
    return summ
  end
  def sum1
      order_items.collect{|order_item| order_item.valid? ? order_item.unit_price.to_i*order_item.quantity.to_i : 0}.sum
  end
  private
  def set_sum
      self[:sum] = sum 
  end
end