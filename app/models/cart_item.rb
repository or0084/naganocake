class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer



  def subtotal
    item.with_tax_price * amount
  end

  def add_item(item_id:, amount:)
    item = item.find_by(item_id: item_id) || item.build(item_id: item_id)
    item.amount += amount.to_i
    item.save
  end

  def update_item(item_id:, amount:)
    item.find_by(item_id: item_id).update(amount: amount.to_i)
  end

  def delete_item(item_id:)
    item.find_by(item_id: item_id).destroy
  end

  def total_price
    item.sum("amount*price")
  end


end
