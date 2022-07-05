class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.page(params[:page])
  end


  private


  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :address_option, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end

end
