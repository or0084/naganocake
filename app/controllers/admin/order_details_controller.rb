class Admin::OrderDetailsController < ApplicationController
  def index
    @orders = OrderDetail.page(params[:page])
  end

  def show
  end

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
