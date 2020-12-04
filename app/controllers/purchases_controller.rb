class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    @item = Item.find(purchase_address_params[:item_id])
    if @purchase_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.item_price,
        card: purchase_address_params[:token],
        currency: 'jpy'
      )
      @purchase_address.save
      redirect_to '/'
    else
      @item = Item.find(params[:item_id])
      render 'purchases/index'
    end
  end

  private

  def purchase_address_params
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :city, :address, :building, :phone_number).merge(item_id: params[:item_id]).merge(user_id: current_user.id).merge(token: params[:token])
  end

end
