class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create, :edit, :update, :destroy ]
  
 def index
  # @items = Item.all
 end

 def new
  @item = Item.new
 end

 def create
  @item =Item.new(item_params)
  if @item.save
    redirect_to root_path
  else
    render :new
  end
 end



  private
  def item_params
    params.require(:item).permit(:title, :text, :price, :state_id, :category_id, :postage_id, :prefecture_id, :shipping_day_id, :image).merge(user_id: current_user.id)
  end
end
