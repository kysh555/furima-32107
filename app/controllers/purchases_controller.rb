class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :find_item, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index

    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    if @purchase_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.item_price,
        card: purchase_address_params[:token],
        currency: 'jpy'
      )
      @purchase_address.save
      redirect_to root_path
    else
      render 'purchases/index'
    end
  end

  private

  def find_item
    @item = Item.find(params[:item_id])
  end

  def purchase_address_params
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :city, :address, :building, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def move_to_index
    if current_user == @item.user || @item.purchase.present?
      redirect_to root_path
    end
  end

end
