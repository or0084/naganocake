class Public::CartItemsController < ApplicationController
  def index
    @total_price = CartItem.total_price
    @items = CartItem.item
  end

  def create
    if CartItem.add_item(cart_item_params[:item_id, :amount])
      flash[:notice] = 'カート内にアイテムが追加されました'
    else
      flash[:notice] = 'カート内アイテムの追加に失敗しました'
    end
  end

  def update
    if CartItem.update_item(cart_item_params[:item_id, :amount])
      flash[:notice] = 'カート内が更新されました'
    else
      flash[:notice] = 'カート内の更新に失敗しました'
    end
  end

  def destroy
    if CartItem.delete_item(cart_item_params[:item_id])
      flash[:notice] = 'カート内アイテムが削除されました'
    else
      flash[:notice] = 'カート内アイテムの削除に失敗しました'
    end
  end


  private


  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
