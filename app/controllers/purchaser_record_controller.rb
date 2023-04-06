class PurchaserRecordController < ApplicationController
   before_action :authenticate_user!, only: [:index,:create]
  before_action :set_item, only: [:index ,:create]
  before_action :prevent_url, only: [:index ,:create]

  def index
    @purchaser_address = PurchaserAddress.new
  end

  def new
   @purchaser_record = PurchaserRecord.new
  end

  
  def create
    @purchaser_address = PurchaserAddress.new(purchaser_record_params)
    if @purchaser_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchaser_record_params[:token],
        currency: 'jpy'
      )
      @purchaser_address.save
       redirect_to root_path 
    else
      render :index
    end
  end

  private

  def purchaser_record_params
    params.require(:purchaser_address).permit(:post_code, :prefecture_id, :city, :address, :building, :tel).merge(user_id: current_user.id,item_id: @item.id,token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def prevent_url
    if @item.user_id == current_user.id || @item.purchaser_record != nil
     redirect_to root_path
    end
  end


end
