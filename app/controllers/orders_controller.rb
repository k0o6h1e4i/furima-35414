class OrdersController < ApplicationController
  before_action  :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @buyer_address = BuyerAddress.new
    if @item.buyer.present?
      redirect_to root_path
    end
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
    @item = Item.find(params[:item_id])
    params.require(:buyer_address).permit(:postal_code, :prefecture_id, :city, :street_address, :building_name, :telephone ).merge(user_id: current_user.id , token: params[:token], item_id: params[:item_id])
  end

  def set_item
  @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = "sk_test_d2948e1f8b324683037be981"  
    Payjp::Charge.create(
      amount: @item.price,  
      card: buyer_params[:token],   
      currency: 'jpy'                 
    )
  end

end
