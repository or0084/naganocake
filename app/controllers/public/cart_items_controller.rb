class Public::CartItemsController < ApplicationController
  def index
    @total_price = CartItem.total_price
    @items = CartItem.item
  end

  def create

    @cart_item = CartItem.new(cart_item_params)
    binding.pry
    @cart_item.customer_id = current_customer.id

    @cart_item.save
    redirect_to public_cart_items_path
  end

  def update

  end

  def destroy

  end


  private


  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end

end
