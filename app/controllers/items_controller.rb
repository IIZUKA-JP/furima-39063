class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :move_to_index, except: [:index, :show]
  before_action :prevent_url, only: [:edit]


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

  def show
  end

  def edit
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path 
    else
      render :edit
    end
  end

  def destroy
  if current_user.id == @item.user_id
    redirect_to root_path if @item.destroy
  else
    render :show
  end
end



  

  private

  def item_params
   params.require(:item).permit(:image, :product_name, :category_id, :price, :explanation, :condition_id, :delivery_charge_id, :delivery_day_id, :prefecture_id ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def prevent_url
    if  @item.purchaser_record != nil
     redirect_to root_path
    end
  end


end
