class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  def index
    @items = Item.all.order('created_at DESC')
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


  private

  def item_params
   params.require(:item).permit(:image, :product_name, :category_id, :price, :explanation, :condition_id, :delivery_charge_id, :delivery_day_id, :prefecture_id ).merge(user_id: current_user.id)
  end


end
