class Admin::OrderDetailsController < ApplicationController

  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details
    if@order_detail.update(order_detail_params)

     @order_details.making_statuses == "製作中"
     @order.status = 2
     @order.save

     if@order_details.making_statuses == 3
     @order.status = 3
     @order.save
   end
    redirect_to admin_orders_path
  end
end



  private


  def order_detail_params
    params.require(:order_detail).permit(:making_status,)
  end
end
