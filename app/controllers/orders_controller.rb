class OrdersController < ApplicationController
  before_action  :set_item, only: [:index, :create]

  def index
    @buyer_address = BuyerAddress.new
  end

  def create
    @buyer_address = BuyerAddress.new(buyer_params)
    
    if @buyer_address.valid?
       @buyer_address.save
       redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:buyer_address).permit(:postal_code, :prefecture_id, :city, :street_address, :building_name, :telephone ).merge(user_id: current_user.id)
  end

  def set_item
  @item = Item.find(params[:item_id])
  end
end
