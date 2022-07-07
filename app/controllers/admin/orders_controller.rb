class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @orders = Order.page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    if@order.update(order_params)
      @order.status == "入金確認"
      @order_details.each do |order_detail|
        order_detail.making_status = 1
        order_detail.save
      end
    end
    redirect_to admin_orders_path
  end


  private


  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :address_option, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end

end
