class OrderDetail < ApplicationRecord
  belongs_to :order

  enum status: {
    入金待ち: 0,
    入金確認: 1,
    製作中: 2,
    発送準備中: 3,
    発送済み: 4
  }

  def with_tax_price
   (price * 1.1).floor
  end

end
