class ItemsController < ApplicationController
 def index
  @items = Item.all
 end

 def new
  @item = Item.all
 end

 def create
  @item =Item.new
 end



  private
  def item_params
    params.require(:item).permit(:title, :text, :price, :state_id, :category_id, :postage_id, :prefecture_id, :shipping_day_id, :image).merge(user_id: current_user.id)
  end
end
