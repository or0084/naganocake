class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum making_status: {
    製作負荷: 0,
    製作待ち: 1,
    製作中: 2,
    製作完了: 3
  }

  def with_tax_price
   (price * 1.1).floor
  end

  def subtotal
    order_detail.with_tax_price * amount
  end

  def total
    order_detail.subtotal + order.shipping_cost
  end

end
