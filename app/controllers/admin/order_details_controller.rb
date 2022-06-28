class Admin::OrderDetailsController < ApplicationController
  def index
    @orders = OrderDetail.page(params[:page])
  end

  def show
    @order = OrderDetail.find(params[:id])
    @orders = @order.item_id
  end

  def update
    @order = OrderDetail,find(params[:id])
    @order.update(order_detail_params)
    redirect_to admin_order_details_path
  end


  private


  def order_detail_params
    params.require(:order_detail).permit(:making_status, :order_status)
  end
end
