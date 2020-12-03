class ItemsController < ApplicationController
  before_action :authenticate_user! ,only: [:new, :create]
  before_action :find_item ,only: [:show, :edit, :update, :destroy]
  before_action :move_to_new_session ,only: :edit
  before_action :move_to_index ,only: [:edit, :destroy]

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end
  
  private
  
  def item_params
    params.require(:item).permit(:item_name, :item_description, :item_category_id, :item_status_id, :shipping_cost_id, :prefecture_id, :days_to_ship_id, :item_price, :image).merge(user_id: current_user.id)
  end
  
  def move_to_index
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end
  
  def move_to_new_session
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
  
  def find_item
    @item = Item.find(params[:id])
  end

end