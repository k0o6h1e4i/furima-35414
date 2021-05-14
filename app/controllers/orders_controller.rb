class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action  :set_item, only: [:index, :create]
  before_action :require_item_user, only:[:index, :create]

  def index
    @buyer_address = BuyerAddress.new
  end

  def create
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
       pay_item
       @buyer_address.save
       redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:buyer_address).permit(:postal_code, :prefecture_id, :city, :street_address, :building_name, :telephone ).merge(user_id: current_user.id , token: params[:token], item_id: params[:item_id])
  end

  def set_item
  @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @item.price,  
      card: buyer_params[:token],   
      currency: 'jpy'                 
    )
  end

  def require_item_user
    if current_user.id == @item.user_id || @item.buyer.present?
      redirect_to root_path    
    end
  end

end
