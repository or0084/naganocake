class Admin::OrderDetailsController < ApplicationController

  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details
    if@order_detail.update(order_detail_params)

     if@order_detail.making_status == "production"
     @order.status = 2
     @order.save

     elsif@order_details.count == @order_details.where(making_status:"production_completed").count
     @order.status = 3
     @order.save
     end
    end
    redirect_to admin_order_path(@order)
  end



  private


  def order_detail_params
    params.require(:order_detail).permit(:making_status,)
  end
end
