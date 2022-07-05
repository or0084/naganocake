class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_orders_path
  end


  private


  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :address_option, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end

end
