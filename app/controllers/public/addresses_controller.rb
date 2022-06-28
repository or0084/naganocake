class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.all
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to public_addresses_path
  end

  def edit
  end


  private


  def address_params
    params.require(:address).permit(:name, :postal_code, :address, :customer_id)
  end
end
