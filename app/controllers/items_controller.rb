class ItemsController < ApplicationController
  before_action :authenticate_user! ,only: [:new, :create]

  def index
    @items = Item.all.order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_description, :item_category_id, :item_status_id, :shipping_cost_id, :prefecture_id, :days_to_ship_id, :item_price, :image).merge(user_id: current_user.id)
  end

end